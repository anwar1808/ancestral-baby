import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/baby_header.dart';
import '../widgets/common.dart';
import 'allergen_screen.dart';
import 'food_detail_screen.dart';
import 'guides_screen.dart';
import 'plan_screen.dart';
import 'progress_screen.dart';
import 'readiness_quiz_screen.dart';
import 'tracker_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final due = state.dueAllergens.length;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const BabyHeader(),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: 'First Foods',
                  trailing: Row(
                    children: [
                      const Icon(Icons.eco, color: AppColors.success, size: 18),
                      const SizedBox(width: 4),
                      Text('${state.triedCount} foods',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    _QuickAction(
                      icon: Icons.assignment_outlined,
                      label: 'Plan',
                      onTap: () => _go(context, const PlanScreen()),
                    ),
                    _QuickAction(
                      icon: Icons.calendar_today_outlined,
                      label: 'Track',
                      onTap: () => _go(context, const TrackerScreen()),
                    ),
                    _QuickAction(
                      icon: Icons.insights_outlined,
                      label: 'Progress',
                      onTap: () => _go(context, const ProgressScreen()),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xl),
                if (due > 0) ...[
                  _AllergenDueBanner(count: due),
                  const SizedBox(height: AppSpacing.lg),
                ],
                if (state.recommendedNext(limit: 1).isNotEmpty) ...[
                  _NextFoodsCard(
                      onPlan: () => _go(context, const PlanScreen())),
                  const SizedBox(height: AppSpacing.xl),
                ] else ...[
                  _PlanHero(onTap: () => _go(context, const PlanScreen())),
                  const SizedBox(height: AppSpacing.xl),
                ],
                _AllergenCard(onTap: () => _go(context, const AllergenScreen())),
                const SizedBox(height: AppSpacing.xl),
                const SectionHeader(title: 'For You'),
                const SizedBox(height: AppSpacing.md),
                _ForYouRow(onQuiz: () => _go(context, const ReadinessQuizScreen())),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _go(BuildContext context, Widget screen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => screen));
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickAction(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.softBlue,
                borderRadius: BorderRadius.circular(AppRadius.card),
              ),
              child: Icon(icon, color: AppColors.navy),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: AppColors.navy)),
          ],
        ),
      ),
    );
  }
}

class _PlanHero extends StatelessWidget {
  final VoidCallback onTap;
  const _PlanHero({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.butter, AppColors.coral],
                ),
              ),
              child: Center(
                child: Icon(Icons.child_care,
                    size: 64, color: AppColors.navy.withValues(alpha: 0.4)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Build baby\'s first foods plan',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'Introduce your first foods with clear cut-and-serve '
                  'guidance at every stage.',
                  style: TextStyle(color: AppColors.textSecondary, height: 1.4),
                ),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(label: 'Start your first foods plan', onPressed: onTap),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AllergenCard extends StatelessWidget {
  final VoidCallback onTap;
  const _AllergenCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      onTap: onTap,
      color: AppColors.amberSoft,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.chip),
            ),
            child: const Icon(Icons.shield_outlined, color: AppColors.amber),
          ),
          const SizedBox(width: AppSpacing.md),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Allergen Programme',
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: AppColors.navy)),
                SizedBox(height: 2),
                Text('Introduce safely, then keep them in rotation.',
                    style: TextStyle(
                        color: AppColors.textSecondary, fontSize: 13)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.navy),
        ],
      ),
    );
  }
}

class _AllergenDueBanner extends StatelessWidget {
  final int count;
  const _AllergenDueBanner({required this.count});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      color: AppColors.navy,
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const AllergenScreen())),
      child: Row(
        children: [
          const Icon(Icons.notifications_active, color: AppColors.butter),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              count == 1
                  ? '1 allergen is due for a maintenance serve'
                  : '$count allergens are due for a maintenance serve',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }
}

class _ForYouRow extends StatelessWidget {
  final VoidCallback onQuiz;
  const _ForYouRow({required this.onQuiz});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _ForYouCard(
            title: 'Is your baby ready for solids?',
            subtitle: 'Take the 4-question readiness quiz',
            colors: const [AppColors.softBlue, AppColors.butter],
            icon: Icons.checklist,
            onTap: onQuiz,
          ),
          _ForYouCard(
            title: 'Starting solids safely',
            subtitle: 'Gagging vs choking, and how to reduce risk',
            colors: const [AppColors.butter, AppColors.coral],
            icon: Icons.health_and_safety_outlined,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const GuidesScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _ForYouCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Color> colors;
  final IconData icon;
  final VoidCallback onTap;
  const _ForYouCard({
    required this.title,
    required this.subtitle,
    required this.colors,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.navy),
            const Spacer(),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.navy,
                    fontSize: 15)),
            const SizedBox(height: 4),
            Text(subtitle,
                style: TextStyle(
                    color: AppColors.navy.withValues(alpha: 0.7),
                    fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

/// "Next up" — the first few untried foods our approach would offer now
/// (AppState.recommendedNext: active allergen series first, then the current
/// stage in order, then the canon tiers). Tap a food to see how to serve it.
class _NextFoodsCard extends StatelessWidget {
  final VoidCallback onPlan;
  const _NextFoodsCard({required this.onPlan});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final next = state.recommendedNext(limit: 4);
    final stage = state.currentSkill;
    final name = state.baby?.name ?? 'baby';
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Next up for $name',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              TextButton(onPressed: onPlan, child: const Text('Plan')),
            ],
          ),
          if (stage != null)
            Text('Stage: ${stage.title}',
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 13)),
          const SizedBox(height: AppSpacing.md),
          ...next.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => FoodDetailScreen(foodId: f.id))),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                            color: AppColors.softBlue, shape: BoxShape.circle),
                        child: const Icon(Icons.restaurant,
                            size: 18, color: AppColors.navy),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(f.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.navy)),
                            if (f.whyFirst != null)
                              Text(f.whyFirst!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                      height: 1.3)),
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
      ),
    );
  }
}
