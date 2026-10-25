import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/seed_recipes.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import 'food_detail_screen.dart';

/// A single recipe: ingredients, method, and links to the catalog foods it uses.
class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final state = context.read<AppState>();
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Row(
            children: [
              _Pill(text: recipe.stage),
              const SizedBox(width: 8),
              _Pill(text: recipe.collection),
              if (recipe.ancestral) ...[
                const SizedBox(width: 8),
                _Pill(text: '🦴 Ancestral', color: AppColors.butter),
              ],
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(recipe.summary,
              style: const TextStyle(
                  fontSize: 15, color: AppColors.textSecondary, height: 1.4)),
          const SizedBox(height: AppSpacing.lg),
          Text('Ingredients', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ...recipe.ingredients.map((i) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  ',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    Expanded(
                        child: Text(i,
                            style: const TextStyle(fontSize: 15, height: 1.4))),
                  ],
                ),
              )),
          const SizedBox(height: AppSpacing.lg),
          Text('Method', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ...recipe.steps.asMap().entries.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: AppColors.softBlue, shape: BoxShape.circle),
                      child: Text('${e.key + 1}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: AppColors.navy)),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                        child: Text(e.value,
                            style: const TextStyle(fontSize: 15, height: 1.45))),
                  ],
                ),
              )),
          if (recipe.foodIds.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            Text('Foods in this recipe',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: recipe.foodIds.map((id) {
                final food = state.foodById(id);
                if (food == null) return const SizedBox.shrink();
                return ActionChip(
                  avatar: const Icon(Icons.restaurant,
                      size: 16, color: AppColors.navy),
                  label: Text(food.name),
                  backgroundColor: AppColors.softBlue,
                  labelStyle: const TextStyle(
                      color: AppColors.navy, fontWeight: FontWeight.w600),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => FoodDetailScreen(foodId: id))),
                );
              }).toList(),
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          const Text(
            'General information, not medical advice. Always follow safe-serving '
            'basics for your baby\'s age, and introduce one new food at a time.',
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

class _Pill extends StatelessWidget {
  final String text;
  final Color? color;
  const _Pill({required this.text, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: color ?? AppColors.softBlue,
          borderRadius: BorderRadius.circular(AppRadius.pill)),
      child: Text(text,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.navy)),
    );
  }
}
