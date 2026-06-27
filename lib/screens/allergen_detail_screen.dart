import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/allergen.dart';
import '../models/tracker.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'allergen_screen.dart';
import 'food_detail_screen.dart';

/// Allergen detail (§7.2–7.3): introduction guide, status, serve log,
/// interval control, reaction/emergency guidance, serving-idea links.
class AllergenDetailScreen extends StatelessWidget {
  final String allergenId;
  const AllergenDetailScreen({super.key, required this.allergenId});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final allergen = state.allergenById(allergenId);
    if (allergen == null) {
      return const Scaffold(body: Center(child: Text('Not found')));
    }
    final status = state.allergenStatus(allergenId);
    final color = AllergenScreen.stateColor(status.state);

    return Scaffold(
      appBar: AppBar(title: Text(allergen.name)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Row(
            children: [
              StatusChip(label: status.state.label, color: color),
              const Spacer(),
              if (status.lastServedDate != null)
                Text(
                  'Last served ${DateFormat('d MMM').format(status.lastServedDate!)}',
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary),
                ),
            ],
          ),
          if (status.state == AllergenState.maintaining &&
              status.nextDueDate != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              status.isOverdue
                  ? 'Overdue — serve again to keep tolerance'
                  : 'Next serve due ${DateFormat('d MMM').format(status.nextDueDate!)}',
              style: TextStyle(
                  color: status.isOverdue ? AppColors.danger : AppColors.success,
                  fontWeight: FontWeight.w700),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),

          // Introduction guide.
          Text('How to introduce',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(allergen.introductionGuide,
              style: const TextStyle(height: 1.55, fontSize: 15)),
          const SizedBox(height: AppSpacing.lg),

          // Escalating introduction series, or maintenance once tolerated.
          if (status.state == AllergenState.maintaining) ...[
            _MaintenanceCard(allergenId: allergenId, status: status),
            const SizedBox(height: AppSpacing.lg),
          ] else ...[
            _IntroSeriesCard(allergenId: allergenId, status: status),
            const SizedBox(height: AppSpacing.lg),
          ],

          // Maintenance basis.
          if (allergen.maintenanceServingNote.isNotEmpty) ...[
            InfoCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.repeat, color: AppColors.navy),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Maintenance',
                            style: TextStyle(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 2),
                        Text(allergen.maintenanceServingNote,
                            style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                height: 1.4)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],

          // Serving ideas.
          if (allergen.servingIdeaFoodIds.isNotEmpty) ...[
            Text('Easy ways to serve',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: allergen.servingIdeaFoodIds
                  .map((id) => state.foodById(id))
                  .where((f) => f != null)
                  .map((f) => ActionChip(
                        label: Text(f!.name),
                        backgroundColor: AppColors.softBlue,
                        labelStyle: const TextStyle(
                            color: AppColors.navy,
                            fontWeight: FontWeight.w600),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => FoodDetailScreen(foodId: f.id),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],

          // Reaction / emergency guidance.
          InfoCard(
            color: const Color(0xFFFCEBEA),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.warning_amber_rounded, color: AppColors.danger),
                    SizedBox(width: 8),
                    Text('What a reaction looks like',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.danger)),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(allergen.reactionGuidance,
                    style: const TextStyle(height: 1.5, fontSize: 14)),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'This is general information, not medical advice. If in '
                  'doubt, seek emergency help immediately.',
                  style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

/// The escalating 3-serving introduction series (the central allergen flow).
/// Serve increasing amounts over three sittings, watching ~2 hours each; three
/// clean servings → tolerated (maintaining). A reaction pauses and flags it.
class _IntroSeriesCard extends StatelessWidget {
  final String allergenId;
  final AllergenStatus status;
  const _IntroSeriesCard({required this.allergenId, required this.status});

  @override
  Widget build(BuildContext context) {
    final reacted = status.state == AllergenState.reactionNoted;
    final nextStep =
        (status.introStep + 1).clamp(1, AllergenStatus.introServingsTarget);
    return InfoCard(
      color: reacted ? const Color(0xFFFCEBEA) : AppColors.softBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(reacted ? 'Reaction noted' : 'Introduction series',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          // Progress dots for the 3 servings.
          Row(
            children: List.generate(AllergenStatus.introServingsTarget, (i) {
              final done = i < status.introStep;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: done ? AppColors.success : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: done
                                ? AppColors.success
                                : AppColors.disabledPill,
                            width: 2),
                      ),
                      child: done
                          ? const Icon(Icons.check,
                              size: 14, color: Colors.white)
                          : Center(
                              child: Text('${i + 1}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textSecondary))),
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: AppSpacing.md),
          if (reacted) ...[
            const Text(
              'A reaction was recorded. The series is paused. Discuss next steps '
              'with your doctor before serving this allergen again. When advised '
              'it\'s safe, you can resume below.',
              style: TextStyle(fontSize: 13, color: AppColors.navy, height: 1.4),
            ),
          ] else ...[
            Text('Next: serving $nextStep of ${AllergenStatus.introServingsTarget}',
                style: const TextStyle(
                    fontWeight: FontWeight.w800, color: AppColors.navy)),
            const SizedBox(height: 4),
            Text(AllergenStatus.introAmountFor(nextStep),
                style: const TextStyle(
                    fontSize: 13, color: AppColors.textSecondary, height: 1.4)),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'Serve earlier in the day and watch for about two hours.',
              style: TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          PrimaryButton(
            label: reacted ? 'Resume — served & tolerated' : 'Served & tolerated',
            icon: Icons.check,
            onPressed: () {
              context.read<AppState>().recordIntroServing(allergenId);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: AppColors.navy,
                content: Text('Serving recorded'),
              ));
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          Center(
            child: TextButton.icon(
              icon: const Icon(Icons.warning_amber_rounded,
                  size: 18, color: AppColors.danger),
              label: const Text('Baby had a reaction',
                  style: TextStyle(color: AppColors.danger)),
              onPressed: () => _reactionSheet(context, allergenId),
            ),
          ),
        ],
      ),
    );
  }

  void _reactionSheet(BuildContext context, String id) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('What did you see?',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.md),
              _OutcomeButton(
                label: 'Mild reaction',
                color: AppColors.amber,
                onTap: () {
                  Navigator.pop(sheetCtx);
                  _record(context, id, ReactionSeverity.mild);
                },
              ),
              const SizedBox(height: 8),
              _OutcomeButton(
                label: 'Significant reaction',
                color: AppColors.danger,
                onTap: () {
                  Navigator.pop(sheetCtx);
                  _record(context, id, ReactionSeverity.significant);
                },
              ),
              const SizedBox(height: AppSpacing.md),
              const Text(
                'For severe or fast-spreading symptoms (trouble breathing; '
                'swelling of lips, tongue, or throat; repeated vomiting; '
                'lethargy), seek emergency help immediately.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _record(BuildContext context, String id, ReactionSeverity outcome) {
    context.read<AppState>().recordAllergenReaction(id, outcome: outcome);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.navy,
      content: Text('Recorded: ${outcome.label}'),
    ));
  }
}

/// Shown once an allergen is tolerated — keep it in regular rotation.
class _MaintenanceCard extends StatelessWidget {
  final String allergenId;
  final AllergenStatus status;
  const _MaintenanceCard({required this.allergenId, required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InfoCard(
          color: const Color(0xFFEAF5EE),
          child: Row(
            children: [
              const Icon(Icons.verified, color: AppColors.success),
              const SizedBox(width: AppSpacing.md),
              const Expanded(
                child: Text(
                  'Tolerated — keep it in rotation to maintain tolerance.',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: AppColors.navy),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        PrimaryButton(
          label: 'Served today',
          icon: Icons.check,
          onPressed: () =>
              context.read<AppState>().logMaintenanceServe(allergenId),
        ),
        const SizedBox(height: AppSpacing.md),
        _IntervalControl(status: status),
      ],
    );
  }
}

class _OutcomeButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _OutcomeButton(
      {required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppRadius.chip),
        ),
        child: Text(label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 13)),
      ),
    );
  }
}

class _IntervalControl extends StatelessWidget {
  final AllergenStatus status;
  const _IntervalControl({required this.status});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Reminder cadence',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Text(_describe(status.maintenanceIntervalDays),
                  style: const TextStyle(color: AppColors.textSecondary)),
            ],
          ),
          Slider(
            value: status.maintenanceIntervalDays.toDouble().clamp(1, 7),
            min: 1,
            max: 7,
            divisions: 6,
            activeColor: AppColors.navy,
            label: '${status.maintenanceIntervalDays} days',
            onChanged: (v) => context
                .read<AppState>()
                .setAllergenInterval(status.allergenId, v.round()),
          ),
        ],
      ),
    );
  }

  String _describe(int days) {
    final perWeek = (7 / days);
    return 'every $days days · ~${perWeek.toStringAsFixed(perWeek == perWeek.roundToDouble() ? 0 : 1)}×/week';
  }
}
