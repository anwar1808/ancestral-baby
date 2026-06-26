import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import 'common.dart';
import 'media_view.dart';

/// 2-column food grid card (§6): image, name, category, allergen badge,
/// favourite heart, and a "tried" tick.
class FoodCard extends StatelessWidget {
  final Food food;
  final VoidCallback onTap;
  const FoodCard({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final fav = state.isFavourite(food.id);
    final tried = state.isTried(food.id);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: MediaView(
                    media: state.heroMediaFor(food),
                    radius: BorderRadius.circular(AppRadius.card),
                  ),
                ),
                if (food.isCommonAllergen)
                  const Positioned(
                    top: 8,
                    left: 8,
                    child: AllergenBadge(),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => context.read<AppState>().toggleFavourite(food.id),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: AppShadows.soft,
                      ),
                      child: Icon(
                        fav ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: fav ? AppColors.danger : AppColors.navy,
                      ),
                    ),
                  ),
                ),
                if (tried)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.check,
                          size: 14, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(food.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w800, color: AppColors.navy)),
          Text(food.category,
              style: const TextStyle(
                  color: AppColors.textMuted, fontSize: 13)),
        ],
      ),
    );
  }
}
