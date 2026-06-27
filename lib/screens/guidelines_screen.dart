import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/seed_guidelines.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// Compare dietary guidelines across regions (SG vs UK vs US etc.).
/// Topic-first: pick a question, see each region's guidance stacked, with the
/// user's onboarding region pinned and highlighted.
class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRegion = context.watch<AppState>().settings.region;
    return Scaffold(
      appBar: AppBar(title: const Text('Compare guidelines')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          InfoCard(
            color: AppColors.softBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.public, color: AppColors.navy),
                    SizedBox(width: 8),
                    Text('How countries differ',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.navy)),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Pick a question to see how guidance compares across regions — '
                  'Europe, the Americas, Asia-Pacific, and the WHO. Your region '
                  '(${regionByCode(userRegion).flag} ${regionByCode(userRegion).name}) '
                  'is highlighted.',
                  style: const TextStyle(
                      fontSize: 13, color: AppColors.textSecondary, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ...kGuidelineTopics.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: InfoCard(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => GuidelineTopicScreen(topic: t),
                  )),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.navy)),
                            const SizedBox(height: 2),
                            Text(t.question,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textSecondary)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: AppColors.textMuted),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Plain-language summaries for orientation, not verbatim guidance and '
            'not medical advice. Guidelines change — always check the current '
            'primary source and your own healthcare team.',
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

class GuidelineTopicScreen extends StatelessWidget {
  final GuidelineTopic topic;
  const GuidelineTopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    final userRegion = context.watch<AppState>().settings.region;
    return Scaffold(
      appBar: AppBar(title: Text(topic.title)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(topic.question,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.lg),
          // Where they agree.
          InfoCard(
            color: AppColors.butter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.handshake_outlined, color: AppColors.navy),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Where they agree',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors.navy)),
                      const SizedBox(height: 4),
                      Text(topic.consensus,
                          style: const TextStyle(height: 1.45, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('By region', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ...kRegionGroups.expand((group) {
            final regions = kRegions
                .where((r) =>
                    r.group == group && topic.byRegion[r.code] != null)
                .toList();
            if (regions.isEmpty) return <Widget>[];
            return [
              Padding(
                padding: const EdgeInsets.only(
                    top: AppSpacing.sm, bottom: AppSpacing.sm),
                child: Text(group.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: AppColors.textMuted)),
              ),
              ...regions.map((r) {
                final body = topic.byRegion[r.code]!;
                final isUser = r.code == userRegion;
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: Container(
                decoration: BoxDecoration(
                  color: isUser ? AppColors.softBlue : Colors.white,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  border: Border.all(
                      color: isUser ? AppColors.navy : AppColors.hairline,
                      width: isUser ? 1.5 : 1),
                ),
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(r.flag, style: const TextStyle(fontSize: 20)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(r.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.navy)),
                        ),
                        if (isUser)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.navy,
                              borderRadius: BorderRadius.circular(AppRadius.pill),
                            ),
                            child: const Text('You',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700)),
                          ),
                      ],
                    ),
                    Text(r.bodies,
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.textMuted)),
                    const SizedBox(height: AppSpacing.sm),
                    Text(body,
                        style: const TextStyle(height: 1.5, fontSize: 14)),
                  ],
                ),
              ),
                );
              }),
            ];
          }),
          if (topic.sources.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text('Sources: ${topic.sources.join(' · ')}',
                style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textMuted)),
          ],
          const SizedBox(height: AppSpacing.md),
          const Text(
            'Summarised for comparison, not quoted verbatim, and not medical '
            'advice. Verify against the current primary source.',
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
