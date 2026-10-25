import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../data/photo_service.dart';
import '../models/custom_food.dart';
import '../models/food.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import '../widgets/food_card.dart';
import 'custom_food_screen.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final state = context.read<AppState>();
      if (!state.settings.foodNoticeSeen) _maybeShowNotice(state);
    });
  }

  void _maybeShowNotice(AppState state) {
    state.updateSettings(state.settings.copyWith(foodNoticeSeen: true));
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

  /// User-added foods (hidden when the Favourites filter is on, since they have
  /// no favourite state).
  List<CustomFood> _filteredCustom(AppState state) {
    if (_favouritesOnly) return const [];
    return state.customFoods.where((f) {
      if (_category != 'All' && f.category != _category) return false;
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return f.name.toLowerCase().contains(q) ||
          (f.category?.toLowerCase().contains(q) ?? false);
    }).toList();
  }

  /// Add a write-in food, then offer to attach a photo (skippable — add later).
  Future<void> _addCustomFood(BuildContext context, AppState state) async {
    final nameController = TextEditingController();
    String? category;
    final cats = _categories(state.foods).where((c) => c != 'All').toList();

    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogCtx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          title: const Text('Add a food'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add any food your baby tried that isn\'t already in the app.',
                  style:
                      TextStyle(fontSize: 13, color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSpacing.md),
                TextField(
                  controller: nameController,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  decoration:
                      const InputDecoration(hintText: 'Food name (e.g. Zebra)'),
                ),
                const SizedBox(height: AppSpacing.md),
                const Text('Food group (optional)',
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w700)),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: cats.map((c) {
                    final selected = category == c;
                    return ChoiceChip(
                      label: Text(c),
                      selected: selected,
                      onSelected: (_) =>
                          setLocal(() => category = selected ? null : c),
                      selectedColor: AppColors.navy,
                      backgroundColor: AppColors.softBlue,
                      labelStyle: TextStyle(
                          color: selected ? Colors.white : AppColors.navy,
                          fontWeight: FontWeight.w600),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.pill)),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dialogCtx, false),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () => Navigator.pop(dialogCtx, true),
                child: const Text('Add')),
          ],
        ),
      ),
    );

    if (saved != true || nameController.text.trim().isEmpty) return;
    if (!context.mounted) return;
    final name = nameController.text.trim();
    final id = await state.addCustomFood(name, category: category);
    if (id == null || !context.mounted) return;
    await _offerPhoto(context, state, id, name);
  }

  /// Offer a photo right after adding; "Later" leaves it for the food's page.
  Future<void> _offerPhoto(
      BuildContext context, AppState state, String id, String name) async {
    await showModalBottomSheet(
      context: context,
      builder: (sheetCtx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text('Add a photo of $name?',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from gallery'),
              onTap: () async {
                Navigator.pop(sheetCtx);
                final path =
                    await PhotoService.instance.pick(ImageSource.gallery);
                if (path != null) await state.setCustomFoodPhoto(id, path);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Take a photo'),
              onTap: () async {
                Navigator.pop(sheetCtx);
                final path =
                    await PhotoService.instance.pick(ImageSource.camera);
                if (path != null) await state.setCustomFoodPhoto(id, path);
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Later'),
              subtitle:
                  const Text('You can add a photo from the food\'s page anytime'),
              onTap: () => Navigator.pop(sheetCtx),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final foods = _filtered(state);
    final custom = _filteredCustom(state);
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add a food'),
        onPressed: () => _addCustomFood(context, state),
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
            child: (foods.isEmpty && custom.isEmpty)
                ? const Center(
                    child: Text('No foods match your search.',
                        style: TextStyle(color: AppColors.textMuted)))
                : GridView.builder(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.lg,
                        AppSpacing.lg, AppSpacing.lg, 96),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSpacing.md,
                      crossAxisSpacing: AppSpacing.md,
                      childAspectRatio: 0.82,
                    ),
                    itemCount: foods.length + custom.length,
                    itemBuilder: (_, i) {
                      if (i < foods.length) {
                        final food = foods[i];
                        return FoodCard(
                          food: food,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  FoodDetailScreen(foodId: food.id),
                            ),
                          ),
                        );
                      }
                      final cf = custom[i - foods.length];
                      return _CustomFoodCard(
                        food: cf,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                CustomFoodScreen(customFoodId: cf.id),
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

/// Grid card for a user-added food: their photo (or a placeholder) + a "Yours"
/// tag and a tried tick.
class _CustomFoodCard extends StatelessWidget {
  final CustomFood food;
  final VoidCallback onTap;
  const _CustomFoodCard({required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final hasPhoto =
        food.photoPath != null && File(food.photoPath!).existsSync();
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    child: hasPhoto
                        ? Image.file(File(food.photoPath!), fit: BoxFit.cover)
                        : const _MiniPlaceholder(),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      boxShadow: AppShadows.soft,
                    ),
                    child: const Text('Yours',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: AppColors.navy)),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: AppColors.success, shape: BoxShape.circle),
                    child: const Icon(Icons.check, size: 14, color: Colors.white),
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
          Text(food.category ?? 'Your food',
              style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
        ],
      ),
    );
  }
}

class _MiniPlaceholder extends StatelessWidget {
  const _MiniPlaceholder();
  @override
  Widget build(BuildContext context) => const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.butter, AppColors.softBlue],
          ),
        ),
        child: Center(
            child: Icon(Icons.restaurant, size: 32, color: AppColors.navy)),
      );
}
