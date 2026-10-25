import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'allergen_screen.dart';
import 'food_detail_screen.dart';

/// One skill in the 100 Foods Plan: guidance, progress, and the foods that
/// build it. Marking foods tried (from a food's page) fills progress; finishing
/// the skill earns its badge.
class SkillDetailScreen extends StatelessWidget {
  final String skillId;
  const SkillDetailScreen({super.key, required this.skillId});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final skill = state.skillById(skillId);
    if (skill == null) {
      return const Scaffold(body: Center(child: Text('Skill not found')));
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

          if (!open) ...[
            InfoCard(
              color: AppColors.softBlue,
              child: Row(
                children: [
                  const Icon(Icons.schedule, color: AppColors.navy),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      'In our approach this stage opens at ${skill.fromMonths} '
                      'months. Browse it now; it will count towards the plan '
                      'from then.',
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

          Text('Foods for this skill',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ...skill.foodIds.map((id) {
            final food = state.foodById(id);
            if (food == null) return const SizedBox.shrink();
            final tried = state.isTried(id);
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
                    const Icon(Icons.chevron_right, color: AppColors.textMuted),
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
