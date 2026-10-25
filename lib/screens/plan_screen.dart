import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/seed_skills.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'already_tried_screen.dart';
import 'skill_detail_screen.dart';

/// The "100 Foods Plan": thirteen readiness stages plus the grains stage at
/// two. Stages are open by readiness, not age (teardown v3); a pill shows
/// the suggested start age where the baby is younger, and the grains stage
/// stays locked until 24 months (decision A). Structure mirrors a staged
/// plan; content is original.
class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final pct = (state.planProgressForAge * 100).round();
    return Scaffold(
      appBar: AppBar(title: const Text('100 Foods Plan')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          InfoCard(
            color: AppColors.navy,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$pct% of the plan explored',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18)),
                const SizedBox(height: AppSpacing.sm),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                  child: LinearProgressIndicator(
                    value: state.planProgressForAge,
                    minHeight: 8,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    valueColor:
                        const AlwaysStoppedAnimation(AppColors.butter),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'Start with First Foods, then Introduce Allergens. After that, '
                  'pick any 1.0 stage that suits your baby, and move to 2.0 and '
                  '3.0 when they are ready. Animal foods and fats first; grains '
                  'and starches from around two.',
                  style: TextStyle(color: Color(0xFFD7DEEC), fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          InfoCard(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const AlreadyTriedScreen())),
            child: const Row(
              children: [
                Icon(Icons.playlist_add_check, color: AppColors.navy),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    'Already started solids? Mark the foods and allergens your '
                    'baby has had, so the plan starts in the right place.',
                    style: TextStyle(fontSize: 13, height: 1.4),
                  ),
                ),
                Icon(Icons.chevron_right, color: AppColors.textMuted),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ...state.skills.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: _SkillCard(skill: s),
              )),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final Skill skill;
  const _SkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final progress = state.skillProgress(skill);
    final done = state.skillComplete(skill);
    final open = state.skillOpen(skill);
    final pct = (progress * 100).round();
    return InfoCard(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SkillDetailScreen(skillId: skill.id))),
      child: Row(
        children: [
          SizedBox(
            width: 52,
            height: 52,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 52,
                  height: 52,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 5,
                    backgroundColor: AppColors.softBlue,
                    valueColor: AlwaysStoppedAnimation(
                        done ? AppColors.success : AppColors.navy),
                  ),
                ),
                done
                    ? const Icon(Icons.check, color: AppColors.success, size: 20)
                    : Text('$pct%',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: AppColors.navy)),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(skill.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors.navy,
                              fontSize: 16)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.softBlue,
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
                      child: Text(skill.level,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.navy)),
                    ),
                    if (!open || skill.fromMonths > state.babyAgeMonths) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.butter,
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                        ),
                        child: Text(
                            open
                                ? 'about ${skill.fromMonths} mo'
                                : 'from ${skill.fromMonths} mo',
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppColors.navy)),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(skill.focus,
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
