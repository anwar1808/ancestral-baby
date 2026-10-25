import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/seed_ancestral_meals.dart';
import '../data/seed_meals.dart';
import '../data/seed_recipes.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'food_detail_screen.dart';
import 'recipe_detail_screen.dart';
import 'week_plan_view.dart';

/// Meals: a weekly plan for the baby's stage, the recipe library filtered by
/// stage and grouped by meal type, and quick meal ideas. The Ideas filter
/// names the mainstream combos alongside the ancestral alternatives (inspired
/// by Kate Pope / @wildnutritionist).
class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  int _mode = 0; // 0 = This week, 1 = Recipes, 2 = Ideas
  bool _ancestral = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Meals'), automaticallyImplyLeading: false),
      body: Column(
        children: [
          // Recipes / Ideas switcher.
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
                    label: 'This week',
                    selected: _mode == 0,
                    onTap: () => setState(() => _mode = 0),
                  ),
                  _FilterTab(
                    label: 'Recipes',
                    selected: _mode == 1,
                    onTap: () => setState(() => _mode = 1),
                  ),
                  _FilterTab(
                    label: 'Ideas',
                    selected: _mode == 2,
                    onTap: () => setState(() => _mode = 2),
                  ),
                ],
              ),
            ),
          ),
          // In Ideas mode, the Mainstream / Ancestral filter.
          if (_mode == 2)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.sm),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.softBlue,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: Row(
                  children: [
                    _FilterTab(
                      label: 'Mainstream',
                      selected: !_ancestral,
                      onTap: () => setState(() => _ancestral = false),
                    ),
                    _FilterTab(
                      label: '🦴 Ancestral',
                      selected: _ancestral,
                      onTap: () => setState(() => _ancestral = true),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: switch (_mode) {
              0 => const WeekPlanView(),
              1 => const _RecipesView(),
              _ => _ancestral ? const _AncestralList() : const _StandardList(),
            },
          ),
        ],
      ),
    );
  }
}

/// Recipe library: a stage filter (defaults to the baby's stage, earlier
/// stages stay available), ancestral recipes grouped by meal type, then the
/// other collections. Tapping a recipe opens its ingredients and method.
class _RecipesView extends StatefulWidget {
  const _RecipesView();

  @override
  State<_RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<_RecipesView> {
  static const _stages = ['6 mo+', '9 mo+', '12 mo+', '24 mo+'];
  String? _stage; // null = the baby's stage until the user picks

  static const _typeOrder = ['breakfast', 'main', 'snack', 'base', ''];
  static const _typeLabels = {
    'breakfast': 'Breakfast',
    'main': 'Mains',
    'snack': 'Snacks and sides',
    'base': 'Stocks and ferments',
    '': 'More',
  };

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final stage = _stage ?? state.babyStage;
    final showAll = stage == 'All';
    final inStage = state.recipes.where((r) => showAll || r.stage == stage);

    final ancestral = <String, List<Recipe>>{};
    final other = <String, List<Recipe>>{};
    for (final r in inStage) {
      if (r.ancestral) {
        ancestral.putIfAbsent(r.mealType, () => []).add(r);
      } else {
        other.putIfAbsent(r.collection, () => []).add(r);
      }
    }

    Widget header(String text) => Padding(
          padding:
              const EdgeInsets.only(top: AppSpacing.sm, bottom: AppSpacing.md),
          child: Text(text, style: Theme.of(context).textTheme.titleMedium),
        );

    return ListView(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.lg),
      children: [
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final s in ['All', ..._stages])
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(s),
                    selected: stage == s,
                    onSelected: (_) => setState(() => _stage = s),
                    selectedColor: AppColors.navy,
                    labelStyle: TextStyle(
                        color: stage == s ? Colors.white : AppColors.navy,
                        fontWeight: FontWeight.w700),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: AppColors.disabledPill),
                  ),
                ),
            ],
          ),
        ),
        if (!showAll && stage == '24 mo+')
          const Padding(
            padding: EdgeInsets.only(top: AppSpacing.md),
            child: Text(
              'Grains, starches, and legumes join the table from around two in '
              'our approach. Mainstream guidance includes them from six months.',
              style: TextStyle(
                  fontSize: 12, color: AppColors.textSecondary, height: 1.4),
            ),
          ),
        for (final t in _typeOrder)
          if (ancestral[t]?.isNotEmpty ?? false) ...[
            header('${_typeLabels[t]!} · Ancestral'),
            ...ancestral[t]!.map((r) => _RecipeRow(recipe: r)),
          ],
        for (final e in other.entries) ...[
          header(e.key),
          ...e.value.map((r) => _RecipeRow(recipe: r)),
        ],
        if (ancestral.isEmpty && other.isEmpty)
          const Padding(
            padding: EdgeInsets.all(AppSpacing.xl),
            child: Text('No recipes for this stage yet.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary)),
          ),
      ],
    );
  }
}

class _RecipeRow extends StatelessWidget {
  final Recipe recipe;
  const _RecipeRow({required this.recipe});

  @override
  Widget build(BuildContext context) {
    final r = recipe;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InfoCard(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => RecipeDetailScreen(recipe: r))),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: r.ancestral ? AppColors.butter : AppColors.softBlue,
                borderRadius: BorderRadius.circular(AppRadius.chip),
              ),
              child: Icon(r.ancestral ? Icons.spa : Icons.restaurant_menu,
                  color: AppColors.navy),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, color: AppColors.navy)),
                  const SizedBox(height: 2),
                  Text('${r.stage} · ${r.summary}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textMuted),
          ],
        ),
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

class _StandardList extends StatelessWidget {
  const _StandardList();

  @override
  Widget build(BuildContext context) {
    final byStage = <String, List<MealIdea>>{};
    for (final m in kSeedMeals) {
      byStage.putIfAbsent(m.stage, () => []).add(m);
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.lg),
      children: byStage.entries.expand((e) {
        return [
          _StageChip(label: e.key),
          ...e.value.map((m) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: InfoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(m.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: AppColors.navy)),
                      const SizedBox(height: 4),
                      Text(m.description,
                          style: const TextStyle(
                              color: AppColors.textSecondary, height: 1.4)),
                      const SizedBox(height: AppSpacing.md),
                      _FoodChips(foodIds: m.foodIds),
                    ],
                  ),
                ),
              )),
        ];
      }).toList(),
    );
  }
}

class _AncestralList extends StatelessWidget {
  const _AncestralList();

  @override
  Widget build(BuildContext context) {
    final byStage = <String, List<AncestralMeal>>{};
    for (final m in kAncestralMeals) {
      byStage.putIfAbsent(m.stage, () => []).add(m);
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.lg),
      children: [
        const _AncestralBanner(),
        const SizedBox(height: AppSpacing.md),
        ...byStage.entries.expand((e) {
          return [
            _StageChip(label: e.key),
            ...e.value.map((m) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: InfoCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.butter,
                            borderRadius:
                                BorderRadius.circular(AppRadius.pill),
                          ),
                          child: Text('Instead of: ${m.insteadOf}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.navy)),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(m.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: AppColors.navy)),
                        const SizedBox(height: 4),
                        Text(m.description,
                            style: const TextStyle(
                                color: AppColors.textSecondary, height: 1.4)),
                        const SizedBox(height: AppSpacing.md),
                        _FoodChips(
                            foodIds: m.foodIds, extras: m.ancestralExtras),
                        const SizedBox(height: AppSpacing.sm),
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF5EE),
                            borderRadius: BorderRadius.circular(AppRadius.chip),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.eco,
                                  size: 18, color: AppColors.success),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(m.why,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.navy,
                                        height: 1.4)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ];
        }),
      ],
    );
  }
}

class _AncestralBanner extends StatelessWidget {
  const _AncestralBanner();

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      color: AppColors.navy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.spa, color: AppColors.butter),
              SizedBox(width: 8),
              Expanded(
                child: Text('The ancestral approach',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Nutrient-dense, gut-health-first alternatives inspired by Kate '
            'Pope (@wildnutritionist). Her sequence starts with meat stock, '
            'then fermented foods, vegetables, and organ meats — with egg yolk '
            'introduced before the whites. Fruits are kept to lower-sugar, '
            'keto-friendly options; vegetables stay, but starchy staples '
            '(potato, sweet potato, yam, grains) are swapped out.',
            style: TextStyle(color: Color(0xFFD7DEEC), height: 1.45, fontSize: 13),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppRadius.chip),
            ),
            child: const Text(
              'This is an alternative philosophy that differs from the '
              'mainstream NHS / AAP / WHO guidance the rest of the app follows '
              '— those bodies recommend a diverse diet that includes fruit, '
              'veg, and grains. It is general information, not medical advice. '
              'Cook meats and egg thoroughly and use pasteurised dairy. Liver '
              'is very high in vitamin A — most guidance suggests no more than '
              'about once a week. Keep no honey before 12 months, introduce one '
              'new food at a time, and discuss your approach with your '
              'paediatrician.',
              style: TextStyle(
                  color: Color(0xFFD7DEEC), fontSize: 12, height: 1.45),
            ),
          ),
        ],
      ),
    );
  }
}

class _StageChip extends StatelessWidget {
  final String label;
  const _StageChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm, bottom: AppSpacing.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.softBlue,
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w800, color: AppColors.navy)),
          ),
        ],
      ),
    );
  }
}

/// Chips for a meal's ingredients: tappable chips for foods in the database,
/// plus optional plain chips for ancestral extras not in the database.
class _FoodChips extends StatelessWidget {
  final List<String> foodIds;
  final List<String> extras;
  const _FoodChips({required this.foodIds, this.extras = const []});

  @override
  Widget build(BuildContext context) {
    final state = context.read<AppState>();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final food in foodIds.map(state.foodById))
          if (food != null)
            ActionChip(
              avatar: const Icon(Icons.restaurant,
                  size: 16, color: AppColors.navy),
              label: Text(food.name),
              backgroundColor: AppColors.softBlue,
              labelStyle: const TextStyle(
                  color: AppColors.navy, fontWeight: FontWeight.w600),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FoodDetailScreen(foodId: food.id),
                ),
              ),
            ),
        for (final label in extras)
          Chip(
            avatar: const Icon(Icons.spa, size: 16, color: AppColors.success),
            label: Text(label),
            backgroundColor: const Color(0xFFEAF5EE),
            labelStyle: const TextStyle(
                color: AppColors.navy, fontWeight: FontWeight.w600),
          ),
      ],
    );
  }
}
