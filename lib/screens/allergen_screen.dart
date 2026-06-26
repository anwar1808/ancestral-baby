import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/allergen.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'allergen_detail_screen.dart';

/// Allergen Programme dashboard (§7.4): grid of allergens with status chips and
/// due-soon / overdue highlighting.
class AllergenScreen extends StatelessWidget {
  const AllergenScreen({super.key});

  static Color stateColor(AllergenState s) {
    switch (s) {
      case AllergenState.notIntroduced:
        return AppColors.textMuted;
      case AllergenState.introducing:
        return AppColors.amber;
      case AllergenState.maintaining:
        return AppColors.success;
      case AllergenState.reactionNoted:
        return AppColors.danger;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final due = state.dueAllergens;
    return Scaffold(
      appBar: AppBar(title: const Text('Allergen Programme')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const _IntroPanel(),
          const SizedBox(height: AppSpacing.lg),
          if (due.isNotEmpty) ...[
            Text('Due now',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            ...due.map((s) {
              final a = state.allergenById(s.allergenId)!;
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: InfoCard(
                  color: AppColors.amberSoft,
                  child: Row(
                    children: [
                      const Icon(Icons.notifications_active,
                          color: AppColors.amber),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(a.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.navy)),
                            Text(
                              'Due ${s.nextDueDate == null ? '' : DateFormat('d MMM').format(s.nextDueDate!)} · keep tolerance going',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => context
                            .read<AppState>()
                            .logMaintenanceServe(a.id),
                        child: const Text('Served'),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: AppSpacing.lg),
          ],
          Text('All allergens',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.25,
            children: state.allergens.map((a) {
              final status = state.allergenStatus(a.id);
              return _AllergenTile(allergen: a, status: status);
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          InfoCard(
            color: AppColors.softBlue,
            child: Row(
              children: const [
                Icon(Icons.info_outline, color: AppColors.navy),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    'Reminders are a configurable aid grounded in cited '
                    'guidance — not a medical prescription. Discuss your '
                    'baby\'s allergen plan with your paediatrician.',
                    style: TextStyle(fontSize: 13, color: AppColors.navy),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroPanel extends StatelessWidget {
  const _IntroPanel();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return InfoCard(
      color: AppColors.navy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${state.allergensIntroducedCount} of ${state.allergens.length} introduced',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18)),
          const SizedBox(height: 6),
          Text(
            'Introduce one allergen at a time from around 6 months, then keep '
            'each tolerated allergen in regular rotation to maintain tolerance.',
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 13,
                height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _AllergenTile extends StatelessWidget {
  final Allergen allergen;
  final AllergenStatus status;
  const _AllergenTile({required this.allergen, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = AllergenScreen.stateColor(status.state);
    return InfoCard(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => AllergenDetailScreen(allergenId: allergen.id),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(allergen.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w800, color: AppColors.navy)),
          const Spacer(),
          StatusChip(label: status.state.label, color: color),
          if (status.state == AllergenState.maintaining &&
              status.serveStreak > 0) ...[
            const SizedBox(height: 4),
            Text('🔥 ${status.serveStreak} serves',
                style: const TextStyle(
                    fontSize: 12, color: AppColors.textSecondary)),
          ],
        ],
      ),
    );
  }
}
