import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/settings_screen.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';

/// Dark navy baby header (§5): avatar, name, age, calendar/settings affordance.
class BabyHeader extends StatelessWidget {
  final String? overrideTitle;
  const BabyHeader({super.key, this.overrideTitle});

  @override
  Widget build(BuildContext context) {
    final baby = context.watch<AppState>().baby;
    final initial =
        (baby?.name.isNotEmpty ?? false) ? baby!.name[0].toUpperCase() : '🍼';
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overrideTitle ?? baby?.name ?? 'Your baby',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
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
}
