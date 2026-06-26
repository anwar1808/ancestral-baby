import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import '../widgets/food_card.dart';
import 'food_detail_screen.dart';

/// First Foods Database grid (§6). 2-column photo cards, search + category
/// filter, one-time age-safety notice.
class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  String _query = '';
  String _category = 'All';
  bool _favouritesOnly = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowNotice());
  }

  void _maybeShowNotice() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.disabledPill,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Important',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'Some foods aren\'t safe until your baby reaches a certain age. '
              'You\'re responsible for following the age guidance provided for '
              'each food.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, height: 1.4),
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'Got it',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _categories(List<Food> foods) {
    final set = {'All', ...foods.map((f) => f.category)};
    return set.toList();
  }

  List<Food> _filtered(AppState state) {
    return state.foods.where((f) {
      if (_category != 'All' && f.category != _category) return false;
      if (_favouritesOnly && !state.isFavourite(f.id)) return false;
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return f.name.toLowerCase().contains(q) ||
          f.category.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final foods = _filtered(state);
    final categories = _categories(state.foods);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foods'),
        automaticallyImplyLeading: Navigator.canPop(context),
        actions: [
          IconButton(
            tooltip: 'Favourites',
            icon: Icon(_favouritesOnly ? Icons.favorite : Icons.favorite_border,
                color: _favouritesOnly ? AppColors.danger : AppColors.navy),
            onPressed: () =>
                setState(() => _favouritesOnly = !_favouritesOnly),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.sm),
            child: TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: const InputDecoration(
                hintText: 'Food name',
                prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
              ),
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final c = categories[i];
                final selected = c == _category;
                return ChoiceChip(
                  label: Text(c),
                  selected: selected,
                  onSelected: (_) => setState(() => _category = c),
                  selectedColor: AppColors.navy,
                  backgroundColor: AppColors.softBlue,
                  labelStyle: TextStyle(
                      color: selected ? Colors.white : AppColors.navy,
                      fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.pill)),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: foods.isEmpty
                ? const Center(
                    child: Text('No foods match your search.',
                        style: TextStyle(color: AppColors.textMuted)))
                : GridView.builder(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSpacing.md,
                      crossAxisSpacing: AppSpacing.md,
                      childAspectRatio: 0.82,
                    ),
                    itemCount: foods.length,
                    itemBuilder: (_, i) {
                      final food = foods[i];
                      return FoodCard(
                        food: food,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => FoodDetailScreen(foodId: food.id),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
