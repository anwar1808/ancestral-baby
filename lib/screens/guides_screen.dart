import 'package:flutter/material.dart';

import '../data/seed_guides.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'guidelines_screen.dart';

/// Guides (§5): browsable how-tos grouped by section, each a card with a
/// thumbnail + read-time. Original content.
class GuidesScreen extends StatefulWidget {
  const GuidesScreen({super.key});

  @override
  State<GuidesScreen> createState() => _GuidesScreenState();
}

class _GuidesScreenState extends State<GuidesScreen> {
  String _audience = 'Babies';

  @override
  Widget build(BuildContext context) {
    final sections = <String, List<Guide>>{};
    for (final g in kSeedGuides.where((g) => g.audience == _audience)) {
      sections.putIfAbsent(g.section, () => []).add(g);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text('Guides'), automaticallyImplyLeading: false),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          InfoCard(
            color: AppColors.navy,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const GuidelinesScreen())),
            child: Row(
              children: const [
                Icon(Icons.public, color: AppColors.butter),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Compare guidelines by country',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.white)),
                      SizedBox(height: 2),
                      Text('Anglo-West · Scandinavia · Asia · Europe · WHO',
                          style: TextStyle(
                              fontSize: 13, color: Color(0xFFB9C2D6))),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.softBlue,
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Row(
              children: ['Babies', 'Toddlers'].map((a) {
                final selected = _audience == a;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _audience = a),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.navy : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
                      child: Text(a,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: selected ? Colors.white : AppColors.navy,
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          ...sections.entries.expand((e) {
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
        }),
        ],
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
