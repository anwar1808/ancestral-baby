import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal_plan.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'recipe_detail_screen.dart';

/// "This week": a seven-day plan of ancestral recipes for the baby's stage.
/// Generated on demand, stored per ISO week, swappable per slot; ticking a
/// meal as cooked logs it and marks its foods tried.
class WeekPlanView extends StatelessWidget {
  const WeekPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final plan = state.mealPlan;
    final monday = AppState.mondayOf(DateTime.now());
    final today = DateTime.now().weekday - 1;
    final name = state.baby?.name ?? 'baby';

    if (state.baby == null) {
      return const Center(child: Text('Add a baby to plan a week.'));
    }
    if (state.babyAgeMonths < 6) {
      return const Padding(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Text(
          'The planner starts at six months. Until then, milk is the meal.',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textSecondary, height: 1.4),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.xl),
      children: [
        InfoCard(
          color: AppColors.navy,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.isEmpty
                    ? 'Plan $name\'s week'
                    : 'Week of ${_dateLabel(monday)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                plan.isEmpty
                    ? 'Four meals a day from the ${state.babyStage} ancestral '
                        'recipes, spread across the week and tilted towards '
                        'the foods that are next in the plan. Swap anything.'
                    : 'Stage ${state.babyStage}. Tap a meal to cook it, the '
                        'arrows to swap it, the circle when it is done.',
                style: const TextStyle(
                    color: Color(0xFFD7DEEC), fontSize: 13, height: 1.4),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: plan.isEmpty ? 'Plan this week' : 'Shuffle week',
                      onPressed: () => context
                          .read<AppState>()
                          .generateWeekPlan(regenerate: plan.isNotEmpty),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (plan.isNotEmpty) ...[
          for (var day = 0; day < 7; day++)
            _DayCard(
              day: day,
              date: monday.add(Duration(days: day)),
              isToday: day == today,
              meals: plan.where((m) => m.day == day).toList(),
            ),
          if (state.weekBases.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text('Make ahead', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            ...state.weekBases.map((r) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: InfoCard(
                    color: AppColors.butter,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => RecipeDetailScreen(recipe: r))),
                    child: Row(
                      children: [
                        const Icon(Icons.soup_kitchen_outlined,
                            color: AppColors.navy),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(r.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.navy)),
                              Text(r.summary,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary)),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right,
                            color: AppColors.textMuted),
                      ],
                    ),
                  ),
                )),
          ],
          const SizedBox(height: AppSpacing.md),
          const Text(
            'Portions are a guide; let appetite lead and keep milk as the main '
            'food in the first year. General information, not medical advice.',
            style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: AppColors.textMuted,
                height: 1.4),
          ),
        ],
      ],
    );
  }

  static String _dateLabel(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${d.day} ${months[d.month - 1]}';
  }
}

class _DayCard extends StatelessWidget {
  final int day;
  final DateTime date;
  final bool isToday;
  final List<PlannedMeal> meals;
  const _DayCard({
    required this.day,
    required this.date,
    required this.isToday,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final ordered = [
      for (final slot in PlannedMeal.slots)
        ...meals.where((m) => m.slot == slot)
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InfoCard(
        color: isToday ? AppColors.softBlue : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(PlannedMeal.dayNames[day],
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: AppColors.navy)),
                const SizedBox(width: 8),
                Text('${date.day}',
                    style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w700)),
                if (isToday) ...[
                  const Spacer(),
                  const StatusChip(label: 'Today', color: AppColors.navy),
                ],
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            ...ordered.map((m) {
              final r = state.recipeById(m.recipeId);
              if (r == null) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context
                          .read<AppState>()
                          .setPlannedMealCooked(m, !m.cooked),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: m.cooked ? AppColors.success : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: m.cooked
                                  ? AppColors.success
                                  : AppColors.disabledPill),
                        ),
                        child: m.cooked
                            ? const Icon(Icons.check,
                                size: 16, color: Colors.white)
                            : null,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => RecipeDetailScreen(recipe: r))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_slotLabel(m.slot),
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textMuted,
                                    letterSpacing: 0.4)),
                            Text(r.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.navy,
                                    decoration: m.cooked
                                        ? TextDecoration.lineThrough
                                        : null)),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: 'Swap',
                      icon: const Icon(Icons.swap_horiz,
                          color: AppColors.textSecondary),
                      onPressed: () =>
                          context.read<AppState>().swapPlannedMeal(m),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  static String _slotLabel(String slot) {
    switch (slot) {
      case 'breakfast':
        return 'BREAKFAST';
      case 'lunch':
        return 'LUNCH';
      case 'dinner':
        return 'DINNER';
      default:
        return 'SNACK';
    }
  }
}
