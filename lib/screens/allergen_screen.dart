import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/seed_nature_allergens.dart';
import '../models/allergen.dart';
import '../models/nature_allergen.dart';
import '../models/tracker.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'allergen_detail_screen.dart';

/// Allergen Programme. A top toggle switches between the **Food** allergen
/// programme (introduce + maintain) and the **Environmental** view (pollen /
/// dust-mite, region-aware, with symptom logging).
class AllergenScreen extends StatefulWidget {
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
  State<AllergenScreen> createState() => _AllergenScreenState();
}

class _AllergenScreenState extends State<AllergenScreen> {
  bool _environmental = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Allergen Programme')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.sm),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.softBlue,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: Row(
                children: [
                  _FilterTab(
                    label: 'Food',
                    selected: !_environmental,
                    onTap: () => setState(() => _environmental = false),
                  ),
                  _FilterTab(
                    label: '🌿 Environmental',
                    selected: _environmental,
                    onTap: () => setState(() => _environmental = true),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _environmental
                ? const _EnvironmentalView()
                : const _FoodProgrammeView(),
          ),
        ],
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterTab(
      {required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppColors.navy : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: selected ? Colors.white : AppColors.navy,
                  fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }
}

// ============================================================ Food programme
class _FoodProgrammeView extends StatelessWidget {
  const _FoodProgrammeView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final due = state.dueAllergens;
    return ListView(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.lg),
      children: [
        const _IntroPanel(),
        const SizedBox(height: AppSpacing.lg),
        if (due.isNotEmpty) ...[
          Text('Due now', style: Theme.of(context).textTheme.titleMedium),
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
                                fontSize: 12, color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          context.read<AppState>().logMaintenanceServe(a.id),
                      child: const Text('Served'),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.lg),
        ],
        Text('All allergens', style: Theme.of(context).textTheme.titleMedium),
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
                  'Reminders are a configurable aid grounded in cited guidance '
                  '— not a medical prescription. Discuss your baby\'s allergen '
                  'plan with your paediatrician.',
                  style: TextStyle(fontSize: 13, color: AppColors.navy),
                ),
              ),
            ],
          ),
        ),
      ],
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
          Text(
              '${state.allergensIntroducedCount} of ${state.allergens.length} introduced',
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

// ========================================================= Environmental view
class _EnvironmentalView extends StatelessWidget {
  const _EnvironmentalView();

  static const _catColor = {
    NatureCategory.tree: Color(0xFF3F9E6E),
    NatureCategory.grass: Color(0xFF6FAE4A),
    NatureCategory.weed: Color(0xFFC79A3A),
    NatureCategory.mite: Color(0xFF7C5CBF),
    NatureCategory.mould: Color(0xFF8A8F9C),
  };

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final profile = state.natureProfile;
    final month = DateTime.now().month;

    // Group allergens by category, preserving enum order.
    final byCat = <NatureCategory, List<NatureAllergen>>{};
    for (final a in profile.allergens) {
      byCat.putIfAbsent(a.category, () => []).add(a);
    }

    final highNow = profile.seasonal ? profile.activeIn(month) : <NatureAllergen>[];

    return ListView(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.xl),
      children: [
        // Region summary.
        InfoCard(
          color: AppColors.navy,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(profile.flag, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(profile.regionName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16)),
                ),
              ]),
              const SizedBox(height: 6),
              Text(profile.summary,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 13,
                      height: 1.45)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // "High this month" (seasonal only).
        if (profile.seasonal) ...[
          InfoCard(
            color: AppColors.amberSoft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Icon(Icons.trending_up, color: AppColors.amber, size: 20),
                  const SizedBox(width: 8),
                  Text('In the air now — ${DateFormat('MMMM').format(DateTime.now())}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, color: AppColors.navy)),
                ]),
                const SizedBox(height: AppSpacing.sm),
                if (highNow.isEmpty)
                  const Text('Little pollen about this month — a quieter time.',
                      style: TextStyle(color: AppColors.textSecondary, fontSize: 13))
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: highNow.take(8).map((a) {
                      final peak = a.peakInMonth(month);
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: peak ? AppColors.navy : Colors.white,
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                          border: Border.all(color: AppColors.navy.withValues(alpha: 0.2)),
                        ),
                        child: Text(
                          peak ? '${a.name} · peak' : a.name,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: peak ? Colors.white : AppColors.navy),
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],

        // Log symptoms.
        _LogSymptomsButton(),
        if (state.symptomEntries.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          _RecentSymptoms(entries: state.symptomEntries.take(3).toList()),
        ],
        const SizedBox(height: AppSpacing.lg),

        // Calendar / allergen list by category.
        Text(profile.seasonal ? 'Seasonal calendar' : 'What\'s around all year',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        ...byCat.entries.map((e) => _CategoryBlock(
              category: e.key,
              color: _catColor[e.key]!,
              allergens: e.value,
              seasonal: profile.seasonal,
              currentMonth: month,
            )),
        const SizedBox(height: AppSpacing.md),

        // Reduce exposure.
        _TipsCard(title: 'Reduce exposure', tips: profile.exposureTips),
        const SizedBox(height: AppSpacing.md),

        // Symptoms & when to see a doctor.
        const _SymptomInfoCard(),
        const SizedBox(height: AppSpacing.md),

        // Source + caveat + disclaimer.
        InfoCard(
          color: AppColors.softBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Source: ${profile.sourceBody}',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy)),
              if (profile.caveat.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(profile.caveat,
                    style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        height: 1.4)),
              ],
              const SizedBox(height: 6),
              const Text(
                'Typical seasons only — real windows shift with weather. This '
                'is general information, not medical advice; check the live '
                'official forecast and speak to your doctor about your child.',
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textSecondary,
                    height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryBlock extends StatelessWidget {
  final NatureCategory category;
  final Color color;
  final List<NatureAllergen> allergens;
  final bool seasonal;
  final int currentMonth;
  const _CategoryBlock({
    required this.category,
    required this.color,
    required this.allergens,
    required this.seasonal,
    required this.currentMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InfoCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text(category.label,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, color: AppColors.navy)),
            ]),
            const SizedBox(height: AppSpacing.sm),
            ...allergens.map((a) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(a.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: AppColors.navy)),
                          ),
                          if (a.yearRound)
                            const Text('Year-round',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textMuted)),
                        ],
                      ),
                      if (seasonal && !a.yearRound) ...[
                        const SizedBox(height: 4),
                        _MonthStrip(
                            allergen: a, color: color, currentMonth: currentMonth),
                      ],
                      if (a.note.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Text(a.note,
                            style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.textSecondary,
                                height: 1.35)),
                      ],
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

/// A compact 12-cell month strip: active = tinted, peak = solid, current = ring.
class _MonthStrip extends StatelessWidget {
  final NatureAllergen allergen;
  final Color color;
  final int currentMonth;
  const _MonthStrip(
      {required this.allergen, required this.color, required this.currentMonth});

  static const _labels = ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(12, (i) {
        final m = i + 1;
        final active = allergen.activeInMonth(m);
        final peak = allergen.peakInMonth(m);
        final isNow = m == currentMonth;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 18,
            decoration: BoxDecoration(
              color: peak
                  ? color
                  : active
                      ? color.withValues(alpha: 0.25)
                      : const Color(0xFFF0F2F6),
              borderRadius: BorderRadius.circular(4),
              border: isNow
                  ? Border.all(color: AppColors.navy, width: 1.5)
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(_labels[i],
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: peak
                        ? Colors.white
                        : active
                            ? color
                            : AppColors.textMuted)),
          ),
        );
      }),
    );
  }
}

class _TipsCard extends StatelessWidget {
  final String title;
  final List<String> tips;
  const _TipsCard({required this.title, required this.tips});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.spa, size: 18, color: AppColors.success),
            const SizedBox(width: 8),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.w800, color: AppColors.navy)),
          ]),
          const SizedBox(height: AppSpacing.sm),
          ...tips.map((t) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, color: AppColors.navy)),
                    Expanded(
                      child: Text(t,
                          style: const TextStyle(fontSize: 13, height: 1.4)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _SymptomInfoCard extends StatelessWidget {
  const _SymptomInfoCard();

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      color: const Color(0xFFF3EFFA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: const [
            Icon(Icons.air, size: 18, color: Color(0xFF7C5CBF)),
            SizedBox(width: 8),
            Text('Signs & when to get help',
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: AppColors.navy)),
          ]),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Allergic rhinitis (hay fever) in toddlers can look like a runny or '
            'blocked nose, sneezing, itchy or watery eyes, and a cough — often '
            'without a fever, and worse at certain times of year or after time '
            'outdoors or in dusty rooms. It usually develops after a couple of '
            'seasons of exposure, so it\'s more a toddler-and-up concern.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            'See a doctor if symptoms disturb sleep, feeding, or play, keep '
            'coming back, or you\'re unsure. Seek urgent help for any wheeze or '
            'difficulty breathing.',
            style: TextStyle(
                fontSize: 13, height: 1.45, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _LogSymptomsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: 'Log symptoms today',
      icon: Icons.add,
      onPressed: () => _openSheet(context),
    );
  }

  void _openSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const _SymptomSheet(),
    );
  }
}

class _SymptomSheet extends StatefulWidget {
  const _SymptomSheet();

  @override
  State<_SymptomSheet> createState() => _SymptomSheetState();
}

class _SymptomSheetState extends State<_SymptomSheet> {
  final Set<String> _selected = {};
  ReactionSeverity _severity = ReactionSeverity.mild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.disabledPill,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Log symptoms',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: kEnvSymptoms.map((s) {
              final on = _selected.contains(s);
              return FilterChip(
                label: Text(s),
                selected: on,
                onSelected: (_) => setState(() =>
                    on ? _selected.remove(s) : _selected.add(s)),
                selectedColor: AppColors.navy,
                backgroundColor: AppColors.softBlue,
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                    color: on ? Colors.white : AppColors.navy,
                    fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.pill)),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text('How bad?',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: _SevChip(
                    label: 'Mild',
                    color: AppColors.amber,
                    selected: _severity == ReactionSeverity.mild,
                    onTap: () =>
                        setState(() => _severity = ReactionSeverity.mild)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _SevChip(
                    label: 'Significant',
                    color: AppColors.danger,
                    selected: _severity == ReactionSeverity.significant,
                    onTap: () => setState(
                        () => _severity = ReactionSeverity.significant)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(
            label: 'Save to tracker',
            onPressed: _selected.isEmpty
                ? null
                : () async {
                    await context.read<AppState>().logEnvironmentalSymptoms(
                          _selected.toList(),
                          severity: _severity,
                        );
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppColors.navy,
                          content: Text('Symptoms saved to the tracker.'),
                        ),
                      );
                    }
                  },
          ),
        ],
      ),
    );
  }
}

class _SevChip extends StatelessWidget {
  final String label;
  final Color color;
  final bool selected;
  final VoidCallback onTap;
  const _SevChip(
      {required this.label,
      required this.color,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? color : color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(AppRadius.chip),
        ),
        child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: selected ? Colors.white : color,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class _RecentSymptoms extends StatelessWidget {
  final List<TrackerEntry> entries;
  const _RecentSymptoms({required this.entries});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent symptom logs',
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: AppColors.navy)),
          const SizedBox(height: AppSpacing.sm),
          ...entries.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    const Icon(Icons.air, size: 16, color: Color(0xFF7C5CBF)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(e.details,
                          style: const TextStyle(fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(DateFormat('d MMM').format(e.date),
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.textMuted)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
