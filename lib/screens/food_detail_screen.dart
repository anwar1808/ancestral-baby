import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import '../widgets/media_view.dart';
import 'allergen_detail_screen.dart';

/// Food card detail (§6). Hero media + allergen badge, metadata rows, segmented
/// tabs, and the central "How to Serve" by-age-band guidance.
class FoodDetailScreen extends StatefulWidget {
  final String foodId;
  const FoodDetailScreen({super.key, required this.foodId});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _tab = 0;

  static const _tabs = [
    'Introduction',
    'How to Serve',
    'Choking',
    'Allergens',
    'FAQ',
    'Tips',
  ];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final food = state.foodById(widget.foodId);
    if (food == null) {
      return const Scaffold(body: Center(child: Text('Food not found')));
    }
    final tried = state.isTried(food.id);
    final fav = state.isFavourite(food.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        actions: [
          IconButton(
            icon: Icon(fav ? Icons.favorite : Icons.favorite_border,
                color: fav ? AppColors.danger : AppColors.navy),
            onPressed: () => context.read<AppState>().toggleFavourite(food.id),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: AppColors.navy),
            onSelected: (v) {
              if (v == 'media') _setMedia(context, food);
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'media',
                child: Text('Set photo / video'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              MediaView(
                media: state.heroMediaFor(food),
                height: 240,
              ),
              if (food.isCommonAllergen)
                const Positioned(top: 12, left: 12, child: AllergenBadge()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food.name,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.md),
                _MetaRow(label: 'Age', value: food.ageLabel),
                _MetaRow(
                    label: 'Common allergen',
                    value: food.isCommonAllergen ? 'Yes' : 'No'),
                if (food.nutritionFlags.isNotEmpty)
                  _MetaRow(
                      label: 'Nutrition',
                      value: food.nutritionFlags.join(', ')),
                _MetaRow(label: 'Choking risk', value: food.chokingRisk),
                const SizedBox(height: AppSpacing.lg),
                // Segmented pill tabs.
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(_tabs.length, (i) {
                    final selected = i == _tab;
                    return GestureDetector(
                      onTap: () => setState(() => _tab = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 9),
                        decoration: BoxDecoration(
                          color:
                              selected ? AppColors.navy : Colors.white,
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                          border: Border.all(
                              color: selected
                                  ? AppColors.navy
                                  : AppColors.disabledPill),
                        ),
                        child: Text(_tabs[i],
                            style: TextStyle(
                                color: selected
                                    ? Colors.white
                                    : AppColors.navy,
                                fontWeight: FontWeight.w700,
                                fontSize: 13)),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: AppSpacing.xl),
                _TabContent(food: food, tab: _tab),
                if (food.sourceCitations.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xl),
                  Text('Sources: ${food.sourceCitations.join(' · ')}',
                      style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textMuted,
                          fontStyle: FontStyle.italic)),
                ],
                const SizedBox(height: 96),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.lg),
        child: SafeArea(
          top: false,
          child: PrimaryButton(
            label: tried ? 'Tried ✓  ·  Tap to undo' : 'Mark as tried',
            icon: tried ? null : Icons.add,
            onPressed: () async {
              await context
                  .read<AppState>()
                  .markTried(food.id, tried: !tried);
              if (!tried && context.mounted) {
                _celebrate(context);
              }
            },
          ),
        ),
      ),
    );
  }

  void _celebrate(BuildContext context) {
    final earned = context.read<AppState>().consumeJustEarnedMilestone();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.navy,
      content: Text(earned != null
          ? '🎉 Milestone unlocked! Added to the tracker.'
          : 'Added to the tracker.'),
    ));
  }

  Future<void> _setMedia(BuildContext context, Food food) async {
    final controller = TextEditingController(
        text: context.read<AppState>().heroMediaFor(food).uri);
    final result = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Set photo / video'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Paste an image path, a video file path, or a YouTube/Vimeo '
              'link. The app detects the type automatically.',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'URL or file path'),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, controller.text.trim()),
              child: const Text('Save')),
        ],
      ),
    );
    if (result != null && context.mounted) {
      await context
          .read<AppState>()
          .setHeroMediaOverride(food.id, result.isEmpty ? null : result);
    }
  }
}

class _MetaRow extends StatelessWidget {
  final String label;
  final String value;
  const _MetaRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(label,
                style: const TextStyle(color: AppColors.textSecondary)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: AppColors.navy)),
          ),
        ],
      ),
    );
  }
}

class _TabContent extends StatelessWidget {
  final Food food;
  final int tab;
  const _TabContent({required this.food, required this.tab});

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case 0:
        return _Prose(text: food.introduction);
      case 1:
        return _HowToServe(food: food);
      case 2:
        return _Prose(text: food.choking);
      case 3:
        return _AllergensTab(food: food);
      case 4:
        return _Prose(text: food.faq);
      case 5:
        return _Prose(text: food.tips);
      default:
        return const SizedBox.shrink();
    }
  }
}

class _Prose extends StatelessWidget {
  final String text;
  const _Prose({required this.text});

  @override
  Widget build(BuildContext context) {
    if (text.trim().isEmpty) {
      return const Text('More guidance coming soon.',
          style: TextStyle(color: AppColors.textMuted));
    }
    return Text(text,
        style: const TextStyle(
            height: 1.55, fontSize: 15, color: AppColors.textPrimary));
  }
}

class _HowToServe extends StatelessWidget {
  final Food food;
  const _HowToServe({required this.food});

  @override
  Widget build(BuildContext context) {
    if (food.howToServeByAge.isEmpty) {
      return const Text('Serving guidance coming soon.',
          style: TextStyle(color: AppColors.textMuted));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: food.howToServeByAge.map((band) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: InfoCard(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!band.media.isEmpty)
                  MediaView(
                    media: band.media,
                    height: 160,
                    radius: const BorderRadius.vertical(
                        top: Radius.circular(AppRadius.card)),
                  ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.softBlue,
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                        ),
                        child: Text(band.ageBand,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: AppColors.navy)),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      if (band.howToCut.isNotEmpty)
                        _ServeLine(label: 'Prep', value: band.howToCut),
                      if (band.portion.isNotEmpty)
                        _ServeLine(label: 'Portion', value: band.portion),
                      if (band.texture.isNotEmpty)
                        _ServeLine(label: 'Texture', value: band.texture),
                      if (band.safetyNote.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.sm),
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: AppColors.amberSoft,
                            borderRadius: BorderRadius.circular(AppRadius.chip),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.info_outline,
                                  size: 18, color: AppColors.amber),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(band.safetyNote,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.navy,
                                        height: 1.4)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ServeLine extends StatelessWidget {
  final String label;
  final String value;
  const _ServeLine({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            child: Text(label,
                style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 13)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(height: 1.45, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class _AllergensTab extends StatelessWidget {
  final Food food;
  const _AllergensTab({required this.food});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final allergen =
        food.allergenId == null ? null : state.allergenById(food.allergenId!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Prose(text: food.allergens.isNotEmpty
            ? food.allergens
            : (food.isCommonAllergen
                ? 'This is a common allergen.'
                : 'Not a common allergen.')),
        if (allergen != null) ...[
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(
            label: 'Open the ${allergen.name} programme',
            icon: Icons.shield_outlined,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => AllergenDetailScreen(allergenId: allergen.id),
            )),
          ),
        ],
      ],
    );
  }
}
