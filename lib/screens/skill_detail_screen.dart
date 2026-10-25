import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'allergen_screen.dart';
import 'food_detail_screen.dart';

/// One stage in the 100 Foods Plan: guidance, progress, "This week's foods"
/// (pick up to the stage's weekly number; picks lead Next up and the planner),
/// and the foods that build it. Finishing the stage earns its badge.
class SkillDetailScreen extends StatelessWidget {
  final String skillId;
  const SkillDetailScreen({super.key, required this.skillId});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final skill = state.skillById(skillId);
    if (skill == null) {
      return const Scaffold(body: Center(child: Text('Stage not found')));
    }
    final done = state.skillComplete(skill);
    final pct = (state.skillProgress(skill) * 100).round();
    final open = state.skillOpen(skill);

    return Scaffold(
      appBar: AppBar(title: Text(skill.title)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColors.softBlue,
                    borderRadius: BorderRadius.circular(AppRadius.pill)),
                child: Text(skill.level,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: AppColors.navy)),
              ),
              const Spacer(),
              if (done)
                const Row(
                  children: [
                    Icon(Icons.verified, color: AppColors.success, size: 18),
                    SizedBox(width: 4),
                    Text('Complete',
                        style: TextStyle(
                            color: AppColors.success,
                            fontWeight: FontWeight.w700)),
                  ],
                )
              else
                Text('$pct%',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, color: AppColors.navy)),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: state.skillProgress(skill),
              minHeight: 8,
              backgroundColor: AppColors.softBlue,
              valueColor: AlwaysStoppedAnimation(
                  done ? AppColors.success : AppColors.navy),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(skill.description,
              style: const TextStyle(height: 1.55, fontSize: 15)),
          const SizedBox(height: AppSpacing.lg),

          if (open && !done) ...[
            _WeeklyPickHeader(skillId: skill.id),
            const SizedBox(height: AppSpacing.lg),
          ] else if (!open) ...[
            InfoCard(
              color: AppColors.softBlue,
              child: Row(
                children: [
                  const Icon(Icons.schedule, color: AppColors.navy),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      'In our approach this stage opens at ${skill.fromMonths} '
                      'months. Browse it now; you can pick foods from it then.',
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.navy, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],

          if (skill.linksAllergens) ...[
            InfoCard(
              color: AppColors.amberSoft,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const AllergenScreen())),
              child: Row(
                children: const [
                  Icon(Icons.shield_outlined, color: AppColors.amber),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      'Use the Allergen Programme to introduce these safely, one '
                      'at a time, then keep them in rotation.',
                      style: TextStyle(fontSize: 13, color: AppColors.navy),
                    ),
                  ),
                  Icon(Icons.chevron_right, color: AppColors.navy),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],

          Text('Foods in this stage',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ...skill.foodIds.map((id) {
            final food = state.foodById(id);
            if (food == null) return const SizedBox.shrink();
            final tried = state.isTried(id);
            final picked = state.isPicked(id);
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: InfoCard(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => FoodDetailScreen(foodId: id))),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: tried ? AppColors.success : AppColors.softBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        tried ? Icons.check : Icons.restaurant,
                        size: 18,
                        color: tried ? Colors.white : AppColors.navy,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(food.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.navy,
                                  decoration: tried
                                      ? TextDecoration.lineThrough
                                      : null)),
                          if (food.whyFirst != null && !tried) ...[
                            const SizedBox(height: 2),
                            Text(food.whyFirst!,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                    height: 1.35)),
                          ],
                          if (!food.isDelayedByApproach &&
                              !state.foodOpenForAge(food)) ...[
                            const SizedBox(height: 2),
                            Text('Safe from ${food.minAgeMonths} months.',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textMuted,
                                    fontStyle: FontStyle.italic)),
                          ],
                          if (food.isDelayedByApproach) ...[
                            const SizedBox(height: 2),
                            Text(
                                'Our approach: from ${food.effectiveFromMonths} '
                                'months. Mainstream: from ${food.minAgeMonths}.',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textMuted,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ],
                      ),
                    ),
                    if (open && !tried && state.foodOpenForAge(food))
                      IconButton(
                        tooltip: picked
                            ? 'Remove from this week'
                            : 'Add to this week',
                        icon: Icon(
                            picked
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: picked ? AppColors.success : AppColors.navy),
                        onPressed: () async {
                          final ok = await state.togglePick(skill, id);
                          if (!ok && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'This week already has ${skill.weeklyPick} '
                                    'from this stage. Untick one first.')));
                          }
                        },
                      )
                    else
                      const Icon(Icons.chevron_right,
                          color: AppColors.textMuted),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.md),
          const Text(
            'Open a food to see how to serve it by age, then mark it tried. '
            'Need meal ideas? The Meals tab has combos — including the Ancestral '
            'filter for nutrient-dense swaps.',
            style: TextStyle(
                fontSize: 13, color: AppColors.textSecondary, height: 1.4),
          ),
        ],
      ),
    );
  }
}

/// "This week's foods" for one stage: how many are picked out of the weekly
/// number, and a one-tap suggestion that pre-ticks the recommended foods.
class _WeeklyPickHeader extends StatelessWidget {
  final String skillId;
  const _WeeklyPickHeader({required this.skillId});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final skill = state.skillById(skillId)!;
    final n = state.pickedCountIn(skill);
    final target = skill.weeklyPick;
    final what = target == 1 ? 'one food' : '$target foods';
    return InfoCard(
      color: AppColors.butter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("This week's foods",
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            n == 0
                ? 'Choose $what to introduce this week. Tick them below, or '
                    'let us suggest. You choose more once these are tried.'
                : '$n of $target picked. They lead Next up on Home and the '
                    'weekly meal plan.',
            style: const TextStyle(fontSize: 13, height: 1.4),
          ),
          if (n < target) ...[
            const SizedBox(height: AppSpacing.sm),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => state.suggestPicks(skill),
                icon: const Icon(Icons.auto_awesome, size: 18),
                label: Text(n == 0 ? 'Suggest $what' : 'Fill the rest'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
