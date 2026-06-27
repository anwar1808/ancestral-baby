import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/photo_service.dart';
import '../models/custom_food.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// Detail/edit for a user-added (off-catalog) food. Add or replace its photo
/// at any time, or remove it. No serve guidance / rotation — it's a simple
/// "we tried this" record.
class CustomFoodScreen extends StatelessWidget {
  final String customFoodId;
  const CustomFoodScreen({super.key, required this.customFoodId});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final food = state.customFoods
        .where((f) => f.id == customFoodId)
        .cast<CustomFood?>()
        .firstWhere((f) => true, orElse: () => null);
    if (food == null) {
      return const Scaffold(body: Center(child: Text('Food not found')));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        actions: [
          IconButton(
            tooltip: 'Delete',
            icon: const Icon(Icons.delete_outline, color: AppColors.danger),
            onPressed: () => _confirmDelete(context, food),
          ),
        ],
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () => _photoSheet(context, food),
            child: SizedBox(
              height: 240,
              width: double.infinity,
              child: food.photoPath != null && File(food.photoPath!).existsSync()
                  ? Image.file(File(food.photoPath!), fit: BoxFit.cover)
                  : const _PhotoPlaceholder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food.name,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.sm),
                if (food.category != null)
                  _MetaRow(label: 'Food group', value: food.category!),
                _MetaRow(
                    label: 'Tried',
                    value: food.triedDate == null
                        ? 'Yes'
                        : DateFormat('d MMM yyyy').format(food.triedDate!)),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
                  label: food.photoPath == null ? 'Add a photo' : 'Change photo',
                  icon: Icons.photo_camera_outlined,
                  onPressed: () => _photoSheet(context, food),
                ),
                const SizedBox(height: AppSpacing.md),
                const Text(
                  'This is a food you added yourself, so there\'s no cut-and-serve '
                  'guide for it. Always follow safe-serving basics for your baby\'s '
                  'age.',
                  style: TextStyle(
                      fontSize: 13, color: AppColors.textSecondary, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _photoSheet(BuildContext context, CustomFood food) {
    final state = context.read<AppState>();
    showModalBottomSheet(
      context: context,
      builder: (sheetCtx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from gallery'),
              onTap: () async {
                Navigator.pop(sheetCtx);
                final path = await PhotoService.instance.pick(ImageSource.gallery);
                if (path != null) await state.setCustomFoodPhoto(food.id, path);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Take a photo'),
              onTap: () async {
                Navigator.pop(sheetCtx);
                final path = await PhotoService.instance.pick(ImageSource.camera);
                if (path != null) await state.setCustomFoodPhoto(food.id, path);
              },
            ),
            if (food.photoPath != null)
              ListTile(
                leading: const Icon(Icons.delete_outline,
                    color: AppColors.danger),
                title: const Text('Remove photo'),
                onTap: () {
                  Navigator.pop(sheetCtx);
                  state.setCustomFoodPhoto(food.id, null);
                },
              ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, CustomFood food) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: Text('Remove ${food.name}?'),
        content: const Text('This removes it from your tried foods.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogCtx);
              context.read<AppState>().deleteCustomFood(food.id);
              Navigator.of(context).pop();
            },
            child: const Text('Remove',
                style: TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}

class _PhotoPlaceholder extends StatelessWidget {
  const _PhotoPlaceholder();
  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.butter, AppColors.softBlue],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add_a_photo_outlined, size: 40, color: AppColors.navy),
            SizedBox(height: 8),
            Text('Tap to add a photo',
                style: TextStyle(color: AppColors.navy, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
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
            width: 120,
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
