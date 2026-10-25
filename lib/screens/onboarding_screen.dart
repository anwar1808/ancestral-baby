import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/seed_guidelines.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// Lightweight onboarding (§5). No paywall, no auth wall.
/// name → birth date (+preemie) → optional eczema/allergy flags → region.
class OnboardingScreen extends StatefulWidget {
  /// When true, this is adding an extra baby (after first onboarding) rather
  /// than the first-run flow — it saves via addBaby and pops when done.
  final bool additional;
  const OnboardingScreen({super.key, this.additional = false});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;

  final _nameController = TextEditingController();
  DateTime? _birthDate;
  bool _preemie = false;
  bool _eczema = false;
  final Set<String> _allergies = {};
  String _region = 'UK';

  // The first-run flow ends with a short "Our approach" page; adding a
  // second baby skips it.
  int get _steps => widget.additional ? 4 : 5;

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _next() {
    if (_page < _steps - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 280), curve: Curves.easeOut);
    } else {
      _finish();
    }
  }

  bool get _canAdvance {
    switch (_page) {
      case 0:
        return _nameController.text.trim().isNotEmpty;
      case 1:
        return _birthDate != null;
      default:
        return true;
    }
  }

  Future<void> _finish() async {
    final state = context.read<AppState>();
    if (widget.additional) {
      await state.addBaby(
        name: _nameController.text.trim(),
        birthDate: _birthDate!,
        preemie: _preemie,
        eczema: _eczema,
        allergies: _allergies.toList(),
        region: _region,
      );
      if (mounted) Navigator.of(context).pop();
    } else {
      await state.completeOnboarding(
        name: _nameController.text.trim(),
        birthDate: _birthDate!,
        preemie: _preemie,
        eczema: _eczema,
        allergies: _allergies.toList(),
        region: _region,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  if (_page > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.navy),
                      onPressed: () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut),
                    )
                  else if (widget.additional)
                    IconButton(
                      icon: const Icon(Icons.close, color: AppColors.navy),
                      onPressed: () => Navigator.of(context).maybePop(),
                    )
                  else
                    const SizedBox(width: 48),
                  Expanded(
                    child: ProgressDashes(total: _steps, current: _page),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _page = i),
                children: [
                  _NameStep(controller: _nameController, onChanged: () => setState(() {})),
                  _BirthStep(
                    birthDate: _birthDate,
                    preemie: _preemie,
                    onPickDate: (d) => setState(() => _birthDate = d),
                    onPreemie: (v) => setState(() => _preemie = v),
                  ),
                  _FlagsStep(
                    eczema: _eczema,
                    allergies: _allergies,
                    onEczema: (v) => setState(() => _eczema = v),
                    onToggleAllergy: (a) => setState(() {
                      _allergies.contains(a)
                          ? _allergies.remove(a)
                          : _allergies.add(a);
                    }),
                  ),
                  _RegionStep(
                    region: _region,
                    onRegion: (r) => setState(() => _region = r),
                  ),
                  if (!widget.additional) const _ApproachStep(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: PrimaryButton(
                label: _page == _steps - 1 ? 'Start exploring' : 'Continue',
                onPressed: _canAdvance ? _next : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepScaffold extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  const _StepScaffold({required this.title, this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text(title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center),
          if (subtitle != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(subtitle!,
                style: const TextStyle(color: AppColors.textSecondary),
                textAlign: TextAlign.center),
          ],
          const SizedBox(height: AppSpacing.xl),
          child,
        ],
      ),
    );
  }
}

class _NameStep extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChanged;
  const _NameStep({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _StepScaffold(
      title: 'What\'s your baby\'s name?',
      subtitle: 'We\'ll personalise guidance and reminders for them.',
      child: TextField(
        controller: controller,
        onChanged: (_) => onChanged(),
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(hintText: 'Baby\'s name'),
      ),
    );
  }
}

class _BirthStep extends StatelessWidget {
  final DateTime? birthDate;
  final bool preemie;
  final ValueChanged<DateTime> onPickDate;
  final ValueChanged<bool> onPreemie;
  const _BirthStep({
    required this.birthDate,
    required this.preemie,
    required this.onPickDate,
    required this.onPreemie,
  });

  @override
  Widget build(BuildContext context) {
    return _StepScaffold(
      title: 'When were they born?',
      subtitle: 'This sets their age and the right guidance for each stage.',
      child: Column(
        children: [
          QuestionBubble(
            child: GestureDetector(
              onTap: () async {
                final now = DateTime.now();
                final picked = await showDatePicker(
                  context: context,
                  initialDate: birthDate ?? now,
                  firstDate: DateTime(now.year - 4),
                  lastDate: now,
                );
                if (picked != null) onPickDate(picked);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    birthDate == null
                        ? 'Tap to choose birth date'
                        : DateFormat('d MMMM yyyy').format(birthDate!),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SwitchListTile.adaptive(
            value: preemie,
            onChanged: onPreemie,
            activeTrackColor: AppColors.navy,
            contentPadding: EdgeInsets.zero,
            title: const Text('Born before 37 weeks'),
            subtitle: const Text(
                'We\'ll use corrected age for readiness guidance.',
                style: TextStyle(fontSize: 13)),
          ),
        ],
      ),
    );
  }
}

class _FlagsStep extends StatelessWidget {
  final bool eczema;
  final Set<String> allergies;
  final ValueChanged<bool> onEczema;
  final ValueChanged<String> onToggleAllergy;
  const _FlagsStep({
    required this.eczema,
    required this.allergies,
    required this.onEczema,
    required this.onToggleAllergy,
  });

  static const _commonAllergens = [
    'Peanut', 'Egg', 'Cow\'s milk', 'Tree nuts', 'Soy', 'Wheat', 'Sesame',
    'Fish', 'Shellfish',
  ];

  @override
  Widget build(BuildContext context) {
    return _StepScaffold(
      title: 'Anything we should know?',
      subtitle:
          'Optional. Severe eczema or a known egg allergy can mean earlier '
          'allergen introduction — we\'ll flag it.',
      child: Column(
        children: [
          SwitchListTile.adaptive(
            value: eczema,
            onChanged: onEczema,
            activeTrackColor: AppColors.navy,
            contentPadding: EdgeInsets.zero,
            title: const Text('Baby has eczema'),
          ),
          const SizedBox(height: AppSpacing.md),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Known or suspected allergies',
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _commonAllergens.map((a) {
              final selected = allergies.contains(a);
              return ChoiceChip(
                label: Text(a),
                selected: selected,
                onSelected: (_) => onToggleAllergy(a),
                selectedColor: AppColors.navy,
                labelStyle: TextStyle(
                    color: selected ? Colors.white : AppColors.navy,
                    fontWeight: FontWeight.w600),
                backgroundColor: AppColors.softBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.pill)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _RegionStep extends StatelessWidget {
  final String region;
  final ValueChanged<String> onRegion;
  const _RegionStep({required this.region, required this.onRegion});

  @override
  Widget build(BuildContext context) {
    // All comparable regions except the global WHO entry.
    final regions = kRegions.where((r) => r.group != 'Global').toList();
    return _StepScaffold(
      title: 'Where are you?',
      subtitle: 'Allergen lists and guidance vary by region.',
      child: Column(
        children: regions.map((r) {
          final selected = region == r.code;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: InfoCard(
              color: selected ? AppColors.softBlue : Colors.white,
              onTap: () => onRegion(r.code),
              child: Row(
                children: [
                  Icon(
                    selected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: AppColors.navy,
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Text(r.flag, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(r.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.w700)),
                        Text(r.bodies,
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.textMuted)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Decision C (25 Oct 2026): say what the app's point of view is before the
/// first screen, with the mainstream position named alongside it.
class _ApproachStep extends StatelessWidget {
  const _ApproachStep();

  @override
  Widget build(BuildContext context) {
    const items = [
      (
        Icons.set_meal_outlined,
        'Animal foods and fats first',
        'Meat in its stock, egg yolk, oily fish, a little liver about once a '
            'week, then butter and fermented dairy. These carry the iron and '
            'fat a six-month-old needs most. Soft vegetables come alongside.',
      ),
      (
        Icons.grass_outlined,
        'Grains, starches, and legumes from around two',
        'Mainstream guidance includes them from six months. We wait, and we '
            'say so wherever the two differ, so you can choose.',
      ),
      (
        Icons.shield_outlined,
        'Safety guidance always wins',
        'Choking shapes, allergen introduction, no honey, no added salt or '
            'sugar, no unpasteurised dairy: NHS, SACN, BSACI, AAP, and WHO '
            'guidance sits under everything here, and nothing in our approach '
            'goes below it.',
      ),
    ];
    return _StepScaffold(
      title: 'Our approach',
      subtitle: 'Inspired by the ancestral feeding work of Kate Pope. General '
          'information, not medical advice.',
      child: Column(
        children: items
            .map((it) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: InfoCard(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(it.$1, color: AppColors.navy),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(it.$2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.navy)),
                              const SizedBox(height: 4),
                              Text(it.$3,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.textSecondary,
                                      height: 1.4)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
