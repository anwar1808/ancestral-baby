import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/export_service.dart';
import '../models/tracker.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// Tracker (§5, §9): log foods/meals/reactions/notes, history, and export.
class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final entries = state.trackerEntries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracker'),
        actions: [
          IconButton(
            tooltip: 'Export',
            icon: const Icon(Icons.ios_share, color: AppColors.navy),
            onPressed: () => _showExportSheet(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        onPressed: () => _addNote(context),
        icon: const Icon(Icons.edit_note),
        label: const Text('Add note'),
      ),
      body: entries.isEmpty
          ? const _Empty()
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: entries.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (_, i) => _EntryTile(entry: entries[i]),
            ),
    );
  }

  void _showExportSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Export data',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Share a paediatrician-ready summary of foods tried, allergen '
                'progress, and reactions.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.lg),
              ListTile(
                leading: const Icon(Icons.picture_as_pdf, color: AppColors.navy),
                title: const Text('PDF summary'),
                onTap: () async {
                  Navigator.pop(sheetCtx);
                  await ExportService().exportPdf(context.read<AppState>());
                },
              ),
              ListTile(
                leading: const Icon(Icons.table_chart, color: AppColors.navy),
                title: const Text('CSV (tracker + allergen history)'),
                onTap: () async {
                  Navigator.pop(sheetCtx);
                  await ExportService().exportCsv(context.read<AppState>());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addNote(BuildContext context) async {
    final controller = TextEditingController();
    final text = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add a note'),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 3,
          decoration: const InputDecoration(hintText: 'What happened today?'),
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
    if (text != null && text.isNotEmpty && context.mounted) {
      final state = context.read<AppState>();
      await state.addTrackerEntry(TrackerEntry(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        babyId: state.baby!.id,
        type: TrackerType.note,
        date: DateTime.now(),
        details: text,
      ));
    }
  }
}

class _EntryTile extends StatelessWidget {
  final TrackerEntry entry;
  const _EntryTile({required this.entry});

  IconData get _icon {
    switch (entry.type) {
      case TrackerType.food:
        return Icons.restaurant;
      case TrackerType.meal:
        return Icons.lunch_dining;
      case TrackerType.reaction:
        return Icons.shield_outlined;
      case TrackerType.note:
        return Icons.edit_note;
    }
  }

  Color get _color {
    if (entry.reactionSeverity == ReactionSeverity.significant) {
      return AppColors.danger;
    }
    if (entry.reactionSeverity == ReactionSeverity.mild) return AppColors.amber;
    if (entry.type == TrackerType.reaction) return AppColors.success;
    return AppColors.navy;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(entry.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.danger,
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) =>
          context.read<AppState>().deleteTrackerEntry(entry.id),
      child: InfoCard(
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppRadius.chip),
              ),
              child: Icon(_icon, color: _color, size: 20),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.details,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                  Text(DateFormat('EEE d MMM, h:mm a').format(entry.date),
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textMuted)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today_outlined,
                size: 48, color: AppColors.textMuted),
            SizedBox(height: AppSpacing.md),
            Text('Nothing logged yet',
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: AppColors.navy)),
            SizedBox(height: 4),
            Text(
              'Mark foods as tried and record allergen introductions — they\'ll '
              'show up here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
