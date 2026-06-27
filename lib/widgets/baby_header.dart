import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/baby.dart';
import '../screens/onboarding_screen.dart';
import '../screens/settings_screen.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';

/// Dark navy baby header (§5): avatar, name, age. Tapping the name opens the
/// baby switcher (multiple baby profiles). The tune icon opens settings.
class BabyHeader extends StatelessWidget {
  const BabyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final baby = state.baby;
    final initial =
        (baby?.name.isNotEmpty ?? false) ? baby!.name[0].toUpperCase() : '🍼';
    final multiple = state.babies.length > 1;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.xl),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(AppRadius.card),
                onTap: () => _showSwitcher(context, state),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColors.softBlue,
                      child: Text(initial,
                          style: const TextStyle(
                              color: AppColors.navy,
                              fontWeight: FontWeight.w800,
                              fontSize: 18)),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  baby?.name ?? 'Your baby',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18),
                                ),
                              ),
                              const Icon(Icons.expand_more,
                                  color: Colors.white, size: 20),
                            ],
                          ),
                          Text(
                            baby?.ageLabel ?? '',
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (multiple) const SizedBox(width: AppSpacing.sm),
            IconButton(
              icon: const Icon(Icons.tune, color: Colors.white),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSwitcher(BuildContext context, AppState state) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Text('Babies',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: AppColors.navy)),
            ),
            ...state.babies.map((b) => _BabyTile(
                  baby: b,
                  selected: b.id == state.baby?.id,
                  onTap: () {
                    Navigator.pop(sheetCtx);
                    state.switchBaby(b.id);
                  },
                )),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.softBlue,
                child: Icon(Icons.add, color: AppColors.navy),
              ),
              title: const Text('Add a baby',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              onTap: () {
                Navigator.pop(sheetCtx);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const OnboardingScreen(additional: true)));
              },
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
  }
}

class _BabyTile extends StatelessWidget {
  final Baby baby;
  final bool selected;
  final VoidCallback onTap;
  const _BabyTile(
      {required this.baby, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: selected ? AppColors.navy : AppColors.softBlue,
        child: Text(
          baby.name.isNotEmpty ? baby.name[0].toUpperCase() : '🍼',
          style: TextStyle(
              color: selected ? Colors.white : AppColors.navy,
              fontWeight: FontWeight.w800),
        ),
      ),
      title: Text(baby.name,
          style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(baby.ageLabel),
      trailing: selected
          ? const Icon(Icons.check_circle, color: AppColors.success)
          : null,
      onTap: onTap,
    );
  }
}
