import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/allergen.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// Progress / Milestones (§5): foods tried, meals, allergens introduced,
/// milestones, with a small celebration on key milestones.
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const _milestoneLabels = {
    'first_food': 'First food tried 🥄',
    'ten_foods': '10 foods tried 🌱',
    'twenty_five_foods': '25 foods tried 🍎',
    'fifty_foods': '50 foods tried 🥦',
    'hundred_foods': '100 foods tried 🎉',
    'first_allergen': 'First allergen introduced 🛡️',
    'all_allergens': 'All allergens introduced ⭐',
  };

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final tried = state.triedCount;
    final total = state.foods.length;
    final maintaining = state.allergens
        .where((a) => state.allergenStatus(a.id).state ==
            AllergenState.maintaining)
        .length;

    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Row(
            children: [
              Expanded(
                  child: _Stat(
                      value: '$tried',
                      label: 'Foods tried',
                      color: AppColors.success)),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                  child: _Stat(
                      value: '${state.allergensIntroducedCount}',
                      label: 'Allergens introduced',
                      color: AppColors.amber)),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                  child: _Stat(
                      value: '$maintaining',
                      label: 'Maintaining',
                      color: AppColors.navy)),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          Text('Foods explored', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          InfoCard(
            child: Column(
              children: [
                SizedBox(
                  height: 140,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 38,
                      sections: [
                        PieChartSectionData(
                          value: tried.toDouble(),
                          color: AppColors.success,
                          title: '$tried',
                          radius: 28,
                          titleStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                        PieChartSectionData(
                          value: (total - tried).toDouble(),
                          color: AppColors.softBlue,
                          title: '',
                          radius: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text('$tried of $total foods in the database',
                    style: const TextStyle(color: AppColors.textSecondary)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text('Milestones', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          if (state.milestones.isEmpty)
            const InfoCard(
              child: Text(
                'No milestones yet. Mark your baby\'s first food as tried to '
                'unlock the first one!',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            )
          else
            ...state.milestones.map((m) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: InfoCard(
                    color: AppColors.butter,
                    child: Row(
                      children: [
                        const Icon(Icons.emoji_events, color: AppColors.navy),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            _milestoneLabels[m.kind] ?? m.kind,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: AppColors.navy),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _Stat(
      {required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.lg, horizontal: AppSpacing.sm),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.w800, color: color)),
          const SizedBox(height: 4),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 11, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
