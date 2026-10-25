import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/allergen.dart';
import '../models/food.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// Already-tried intake (cohesiveness check v2 item 7). A baby who started
/// solids before the app should not begin at zero: tick the foods and the
/// allergens they have already had. Foods are marked tried without journal
/// entries; allergens move to rotation so reminders start.
class AlreadyTriedScreen extends StatefulWidget {
  const AlreadyTriedScreen({super.key});

  @override
  State<AlreadyTriedScreen> createState() => _AlreadyTriedScreenState();
}

class _AlreadyTriedScreenState extends State<AlreadyTriedScreen> {
  final Set<String> _foods = {};
  final Set<String> _allergens = {};
  bool _saving = false;

  Future<void> _save(AppState state) async {
    setState(() => _saving = true);
    await state.recordAlreadyTried(foodIds: _foods, allergenIds: _allergens);
    if (!mounted) return;
    final n = _foods.length, a = _allergens.length;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Saved $n ${n == 1 ? 'food' : 'foods'}'
            '${a > 0 ? ' and $a ${a == 1 ? 'allergen' : 'allergens'}' : ''}.')));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final name = state.baby?.name ?? 'your baby';
    final untried = state.foods.where((f) => !state.isTried(f.id)).toList();
    final byCat = <String, List<Food>>{};
    for (final f in untried) {
      byCat.putIfAbsent(f.category, () => []).add(f);
    }
    final openAllergens = state.allergens.where((a) {
      final st = state.allergenStatus(a.id).state;
      return st == AllergenState.notIntroduced ||
          st == AllergenState.introducing;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Foods already tried')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Tick everything $name has already eaten, so Next up, the plan, '
            'and the weekly meals start in the right place. You can change any '
            'food later from its page.',
            style: const TextStyle(height: 1.45),
          ),
          if (openAllergens.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            Text('Allergens already in the diet',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            const Text(
              'Only tick an allergen your baby has eaten a few times without a '
              'reaction. It moves straight to keeping it in rotation.',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: openAllergens.map((a) {
                final sel = _allergens.contains(a.id);
                return FilterChip(
                  label: Text(a.name),
                  selected: sel,
                  onSelected: (_) => setState(() =>
                      sel ? _allergens.remove(a.id) : _allergens.add(a.id)),
                );
              }).toList(),
            ),
          ],
          ...byCat.entries.expand((e) => [
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: Text(e.key,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    TextButton(
                      onPressed: () => setState(() {
                        final ids = e.value.map((f) => f.id);
                        if (ids.every(_foods.contains)) {
                          _foods.removeAll(ids);
                        } else {
                          _foods.addAll(ids);
                        }
                      }),
                      child: const Text('All'),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: e.value.map((f) {
                    final sel = _foods.contains(f.id);
                    return FilterChip(
                      label: Text(f.name),
                      selected: sel,
                      onSelected: (_) => setState(
                          () => sel ? _foods.remove(f.id) : _foods.add(f.id)),
                    );
                  }).toList(),
                ),
              ]),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.md),
          child: PrimaryButton(
            label: _foods.isEmpty && _allergens.isEmpty
                ? 'Nothing to save yet'
                : 'Save ${_foods.length + _allergens.length} ticked',
            onPressed: (_foods.isEmpty && _allergens.isEmpty) || _saving
                ? null
                : () => _save(state),
          ),
        ),
      ),
    );
  }
}
