import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/seed_meals.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'food_detail_screen.dart';

/// Meals (§5): age-appropriate meal ideas grouped by stage; each links to its
/// component foods. Original copy.
class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final byStage = <String, List<MealIdea>>{};
    for (final m in kSeedMeals) {
      byStage.putIfAbsent(m.stage, () => []).add(m);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text('Meals'), automaticallyImplyLeading: false),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: byStage.entries.expand((e) {
          return [
            Padding(
              padding: const EdgeInsets.only(
                  top: AppSpacing.sm, bottom: AppSpacing.md),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.softBlue,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                    child: Text(e.key,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.navy)),
                  ),
                ],
              ),
            ),
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
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: m.foodIds
                              .map((id) =>
                                  context.read<AppState>().foodById(id))
                              .where((f) => f != null)
                              .map((f) => ActionChip(
                                    avatar: const Icon(Icons.restaurant,
                                        size: 16, color: AppColors.navy),
                                    label: Text(f!.name),
                                    backgroundColor: AppColors.softBlue,
                                    labelStyle: const TextStyle(
                                        color: AppColors.navy,
                                        fontWeight: FontWeight.w600),
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            FoodDetailScreen(foodId: f.id),
                                      ),
                                    ),
                                  ))
                              .toList(),
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
}
