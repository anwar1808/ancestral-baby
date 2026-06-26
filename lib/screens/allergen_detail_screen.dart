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

          // Record outcome.
          InfoCard(
            color: AppColors.softBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Record an introduction',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                const Text(
                  'Start small, serve earlier in the day, and watch for about '
                  'two hours.',
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: _OutcomeButton(
                        label: 'Tolerated',
                        color: AppColors.success,
                        onTap: () => _record(
                            context, allergenId, ReactionSeverity.none),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _OutcomeButton(
                        label: 'Mild',
                        color: AppColors.amber,
                        onTap: () => _record(
                            context, allergenId, ReactionSeverity.mild),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _OutcomeButton(
                        label: 'Significant',
                        color: AppColors.danger,
                        onTap: () => _record(
                            context, allergenId, ReactionSeverity.significant),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          if (status.state == AllergenState.maintaining ||
              status.state == AllergenState.introducing) ...[
            PrimaryButton(
              label: 'Served today',
              icon: Icons.check,
              onPressed: () =>
                  context.read<AppState>().logMaintenanceServe(allergenId),
            ),
            const SizedBox(height: AppSpacing.md),
            _IntervalControl(status: status),
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

  void _record(BuildContext context, String id, ReactionSeverity outcome) {
    context.read<AppState>().recordAllergenOutcome(id, outcome: outcome);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.navy,
      content: Text('Recorded: ${outcome.label}'),
    ));
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
