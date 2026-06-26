import 'package:flutter/material.dart';

import '../data/seed_guides.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// Guides (§5): browsable how-tos grouped by section, each a card with a
/// thumbnail + read-time. Original content.
class GuidesScreen extends StatelessWidget {
  const GuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = <String, List<Guide>>{};
    for (final g in kSeedGuides) {
      sections.putIfAbsent(g.section, () => []).add(g);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text('Guides'), automaticallyImplyLeading: false),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: sections.entries.expand((e) {
          return [
            Padding(
              padding: const EdgeInsets.only(
                  top: AppSpacing.sm, bottom: AppSpacing.md),
              child: Text(e.key,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            ...e.value.map((g) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: InfoCard(
                    padding: EdgeInsets.zero,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => _GuideDetail(guide: g))),
                    child: Row(
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [AppColors.softBlue, AppColors.butter]),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(AppRadius.card)),
                          ),
                          child: Icon(_iconFor(g.section),
                              color: AppColors.navy.withValues(alpha: 0.5)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(g.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.navy)),
                                const SizedBox(height: 2),
                                Text('${g.readMinutes} min read',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textMuted)),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: AppSpacing.md),
                          child: Icon(Icons.chevron_right,
                              color: AppColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                )),
          ];
        }).toList(),
      ),
    );
  }

  IconData _iconFor(String section) {
    switch (section) {
      case 'Safety':
        return Icons.health_and_safety_outlined;
      case 'Feeding':
        return Icons.restaurant_menu;
      default:
        return Icons.lightbulb_outline;
    }
  }
}

class _GuideDetail extends StatelessWidget {
  final Guide guide;
  const _GuideDetail({required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(guide.section)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(guide.title,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text('${guide.readMinutes} min read',
              style: const TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: AppSpacing.lg),
          Text(guide.body,
              style: const TextStyle(height: 1.6, fontSize: 15)),
          const SizedBox(height: AppSpacing.xl),
          const Text(
            'General information, not medical advice. Discuss your baby\'s diet '
            'with your paediatrician or health visitor.',
            style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
