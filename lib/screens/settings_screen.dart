import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/export_service.dart';
import '../data/notification_service.dart';
import '../data/sync_repository.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final s = state.settings;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          // Sharing / backup (§3).
          InfoCard(
            color: AppColors.softBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.people_outline, color: AppColors.navy),
                    SizedBox(width: 8),
                    Text('Share with a partner',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.navy)),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'Ancestral Baby works fully offline with no account. To back up '
                  'or share the same baby with a partner, sign in — '
                  'passwordless, no password to remember.',
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSpacing.md),
                PrimaryButton(
                  label: 'Set up sharing',
                  icon: Icons.cloud_outlined,
                  onPressed: () => _shareFlow(context, state),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _SectionLabel('Baby'),
          InfoCard(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.cake_outlined, color: AppColors.navy),
                  title: Text(state.baby?.name ?? 'Baby'),
                  subtitle: Text(state.baby?.ageLabel ?? ''),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _SectionLabel('Reminders'),
          InfoCard(
            child: Column(
              children: [
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: s.notificationsEnabled,
                  activeTrackColor: AppColors.navy,
                  title: const Text('Allergen maintenance reminders'),
                  subtitle: const Text(
                      'Get nudged to keep introduced allergens in rotation'),
                  onChanged: (v) async {
                    if (v) await NotificationService.instance.requestPermissions();
                    await context
                        .read<AppState>()
                        .updateSettings(s.copyWith(notificationsEnabled: v));
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading:
                      const Icon(Icons.schedule, color: AppColors.navy),
                  title: const Text('Reminder time'),
                  trailing: Text(s.reminderTime.format(context),
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                  onTap: () async {
                    final picked = await showTimePicker(
                        context: context, initialTime: s.reminderTime);
                    if (picked != null && context.mounted) {
                      await context
                          .read<AppState>()
                          .updateSettings(s.copyWith(reminderTime: picked));
                    }
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.repeat, color: AppColors.navy),
                  title: const Text('Default cadence'),
                  subtitle: Text(
                      'every ${s.defaultMaintenanceInterval} days (~${(7 / s.defaultMaintenanceInterval).toStringAsFixed(1)}×/week)'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _pickCadence(context, state),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _SectionLabel('Data'),
          InfoCard(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.ios_share, color: AppColors.navy),
                  title: const Text('Export data'),
                  subtitle: const Text('Paediatrician-ready PDF or CSV'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _export(context, state),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _SectionLabel('About'),
          InfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Ancestral Baby',
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: AppColors.navy)),
                SizedBox(height: 4),
                Text(
                  'Free and ad-free. Ancestral Baby is not a medical app and does '
                  'not replace your child\'s healthcare team. Food and allergen '
                  'guidance is general information grounded in public-health '
                  'sources (WHO, NHS Start4Life, SACN, NIAID, AAP, HPB). Always '
                  'discuss your baby\'s diet and any reactions with your '
                  'paediatrician.',
                  style: TextStyle(
                      fontSize: 12, color: AppColors.textSecondary, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Future<void> _export(BuildContext context, AppState state) async {
    await showModalBottomSheet(
      context: context,
      builder: (sheetCtx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.picture_as_pdf),
              title: const Text('PDF summary'),
              onTap: () {
                Navigator.pop(sheetCtx);
                ExportService().exportPdf(state);
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text('CSV'),
              onTap: () {
                Navigator.pop(sheetCtx);
                ExportService().exportCsv(state);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickCadence(BuildContext context, AppState state) async {
    final s = state.settings;
    final picked = await showModalBottomSheet<int>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [3, 4, 7]
              .map((d) => ListTile(
                    title: Text(
                        'every $d days (~${(7 / d).toStringAsFixed(1)}×/week)'),
                    onTap: () => Navigator.pop(context, d),
                  ))
              .toList(),
        ),
      ),
    );
    if (picked != null && context.mounted) {
      await context
          .read<AppState>()
          .updateSettings(s.copyWith(defaultMaintenanceInterval: picked));
    }
  }

  Future<void> _shareFlow(BuildContext context, AppState state) async {
    // Passwordless sign-in is not wired in this offline build; surface the
    // honest message from the SyncRepository (§3).
    try {
      await state.sync.signInWithGoogle();
    } on SyncUnavailable catch (e) {
      if (!context.mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Sharing'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK')),
          ],
        ),
      );
    }
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm, left: 4),
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: AppColors.textMuted)),
    );
  }
}
