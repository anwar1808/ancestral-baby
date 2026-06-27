import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/export_service.dart';
import '../models/food.dart';
import '../models/tracker.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';
import 'food_detail_screen.dart';

/// Tracker (§5, §9): calendar log plus Favorites, Reactions, and Try-Later
/// tabs (mirrors Solid Starts), with our paediatrician-ready PDF/CSV export.
class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  int _tab = 0;
  static const _tabs = ['Calendar', 'Favorites', 'Reactions', 'Try Later'];

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: _tab == 0
          ? FloatingActionButton.extended(
              backgroundColor: AppColors.navy,
              foregroundColor: Colors.white,
              onPressed: () => _newLog(context),
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            )
          : null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.sm),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(_tabs.length, (i) {
                final selected = i == _tab;
                return ChoiceChip(
                  label: Text(_tabs[i]),
                  selected: selected,
                  onSelected: (_) => setState(() => _tab = i),
                  selectedColor: AppColors.navy,
                  backgroundColor: AppColors.softBlue,
                  labelStyle: TextStyle(
                      color: selected ? Colors.white : AppColors.navy,
                      fontWeight: FontWeight.w700),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.pill)),
                );
              }),
            ),
          ),
          Expanded(child: _body()),
        ],
      ),
    );
  }

  Widget _body() {
    switch (_tab) {
      case 1:
        return const _FavouritesView();
      case 2:
        return const _ReactionsView();
      case 3:
        return const _TryLaterView();
      default:
        return const _CalendarView();
    }
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
                leading:
                    const Icon(Icons.picture_as_pdf, color: AppColors.navy),
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

  void _newLog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (sheetCtx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Text('New log',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: AppColors.navy)),
            ),
            ListTile(
              leading: const Icon(Icons.lunch_dining, color: AppColors.navy),
              title: const Text('Meal'),
              onTap: () {
                Navigator.pop(sheetCtx);
                _textLog(context, TrackerType.meal, 'What meal did you serve?');
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_note, color: AppColors.navy),
              title: const Text('Note'),
              onTap: () {
                Navigator.pop(sheetCtx);
                _textLog(context, TrackerType.note, 'What happened today?');
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.warning_amber_rounded, color: AppColors.danger),
              title: const Text('Reaction'),
              onTap: () {
                Navigator.pop(sheetCtx);
                _reactionLog(context);
              },
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
  }

  Future<void> _textLog(
      BuildContext context, TrackerType type, String hint) async {
    final controller = TextEditingController();
    final text = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(type == TrackerType.meal ? 'Add a meal' : 'Add a note'),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 3,
          decoration: InputDecoration(hintText: hint),
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
        type: type,
        date: DateTime.now(),
        details: text,
      ));
    }
  }

  Future<void> _reactionLog(BuildContext context) async {
    final state = context.read<AppState>();
    final allergen = await showModalBottomSheet<String>(
      context: context,
      builder: (sheetCtx) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Text('Which allergen?',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            ),
            ...state.allergens.map((a) => ListTile(
                  title: Text(a.name),
                  onTap: () => Navigator.pop(sheetCtx, a.id),
                )),
          ],
        ),
      ),
    );
    if (allergen == null || !context.mounted) return;
    final severity = await showModalBottomSheet<ReactionSeverity>(
      context: context,
      builder: (sheetCtx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                title: const Text('Mild reaction'),
                onTap: () => Navigator.pop(sheetCtx, ReactionSeverity.mild)),
            ListTile(
                title: const Text('Significant reaction'),
                onTap: () =>
                    Navigator.pop(sheetCtx, ReactionSeverity.significant)),
          ],
        ),
      ),
    );
    if (severity == null || !context.mounted) return;
    await state.recordAllergenReaction(allergen, outcome: severity);
  }
}

// ---- Calendar view --------------------------------------------------------
class _CalendarView extends StatefulWidget {
  const _CalendarView();
  @override
  State<_CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<_CalendarView> {
  DateTime _month = DateTime(2000); // replaced in initState via first build
  DateTime? _selected;
  bool _init = false;

  static Color colorFor(TrackerEntry e) {
    switch (e.type) {
      case TrackerType.food:
        return const Color(0xFF4A79E0);
      case TrackerType.meal:
        return AppColors.success;
      case TrackerType.reaction:
        return AppColors.danger;
      case TrackerType.note:
        return AppColors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    if (!_init) {
      // Anchor to "now" once (Date is fine inside build on device).
      final now = DateTime.now();
      _month = DateTime(now.year, now.month);
      _selected = DateTime(now.year, now.month, now.day);
      _init = true;
    }
    final entries = state.trackerEntries;
    final byDay = <String, List<TrackerEntry>>{};
    for (final e in entries) {
      byDay.putIfAbsent(_key(e.date), () => []).add(e);
    }
    final dayEntries =
        _selected == null ? <TrackerEntry>[] : (byDay[_key(_selected!)] ?? []);

    return ListView(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, 0, AppSpacing.lg, 96),
      children: [
        _monthHeader(),
        const SizedBox(height: AppSpacing.sm),
        _grid(byDay),
        const SizedBox(height: AppSpacing.sm),
        const _Legend(),
        const SizedBox(height: AppSpacing.lg),
        Text(
          _selected == null
              ? 'Select a day'
              : DateFormat('EEEE d MMMM').format(_selected!),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        if (dayEntries.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
            child: Text('No logs for this day. Tap + to add one.',
                style: TextStyle(color: AppColors.textMuted)),
          )
        else
          ...dayEntries.map((e) => _EntryTile(entry: e)),
      ],
    );
  }

  String _key(DateTime d) => '${d.year}-${d.month}-${d.day}';

  Widget _monthHeader() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.navy,
          borderRadius: BorderRadius.circular(AppRadius.card)),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.white),
            onPressed: () => setState(
                () => _month = DateTime(_month.year, _month.month - 1)),
          ),
          Text(DateFormat('MMMM yyyy').format(_month).toUpperCase(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w800)),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.white),
            onPressed: () => setState(
                () => _month = DateTime(_month.year, _month.month + 1)),
          ),
        ],
      ),
    );
  }

  Widget _grid(Map<String, List<TrackerEntry>> byDay) {
    final first = DateTime(_month.year, _month.month, 1);
    final daysInMonth = DateTime(_month.year, _month.month + 1, 0).day;
    final leading = first.weekday % 7; // Sun=0
    final cells = <Widget>[];
    const labels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    for (final l in labels) {
      cells.add(Center(
          child: Text(l,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textMuted))));
    }
    for (var i = 0; i < leading; i++) {
      cells.add(const SizedBox.shrink());
    }
    for (var d = 1; d <= daysInMonth; d++) {
      final date = DateTime(_month.year, _month.month, d);
      final dayEntries = byDay[_key(date)] ?? [];
      final types = dayEntries.map((e) => e.type).toSet();
      final selected = _selected != null && _key(_selected!) == _key(date);
      cells.add(GestureDetector(
        onTap: () => setState(() => _selected = date),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: selected ? AppColors.navy : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$d',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : AppColors.navy)),
              SizedBox(
                height: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: types
                      .take(4)
                      .map((t) => Container(
                            width: 4,
                            height: 4,
                            margin: const EdgeInsets.symmetric(horizontal: 0.5),
                            decoration: BoxDecoration(
                                color: colorFor(TrackerEntry(
                                    id: '',
                                    babyId: '',
                                    type: t,
                                    date: date)),
                                shape: BoxShape.circle),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.82,
      children: cells,
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend();
  @override
  Widget build(BuildContext context) {
    Widget dot(Color c, String l) => Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: c, shape: BoxShape.circle)),
          const SizedBox(width: 4),
          Text(l, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        ]);
    return Wrap(
      spacing: 14,
      runSpacing: 6,
      children: [
        dot(const Color(0xFF4A79E0), 'Foods'),
        dot(AppColors.success, 'Meals'),
        dot(AppColors.danger, 'Reactions'),
        dot(AppColors.amber, 'Notes'),
      ],
    );
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

  @override
  Widget build(BuildContext context) {
    final color = _CalendarViewState.colorFor(entry);
    return Dismissible(
      key: ValueKey(entry.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.lg),
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        decoration: BoxDecoration(
            color: AppColors.danger,
            borderRadius: BorderRadius.circular(AppRadius.card)),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) =>
          context.read<AppState>().deleteTrackerEntry(entry.id),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
        child: InfoCard(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(AppRadius.chip)),
                child: Icon(_icon, color: color, size: 20),
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
      ),
    );
  }
}

// ---- Favourites / Reactions / Try-Later views -----------------------------
class _FavouritesView extends StatelessWidget {
  const _FavouritesView();
  @override
  Widget build(BuildContext context) {
    final foods = context.watch<AppState>().favouriteFoods;
    return _FoodList(
      foods: foods,
      emptyIcon: Icons.favorite_border,
      emptyText: 'No favourites yet. Tap the heart on a food to save it here.',
    );
  }
}

class _TryLaterView extends StatelessWidget {
  const _TryLaterView();
  @override
  Widget build(BuildContext context) {
    final foods = context.watch<AppState>().tryLaterFoods;
    return _FoodList(
      foods: foods,
      emptyIcon: Icons.schedule,
      emptyText: 'Nothing saved to try later. Use "Try later" on a food.',
    );
  }
}

class _FoodList extends StatelessWidget {
  final List<Food> foods;
  final IconData emptyIcon;
  final String emptyText;
  const _FoodList(
      {required this.foods, required this.emptyIcon, required this.emptyText});

  @override
  Widget build(BuildContext context) {
    if (foods.isEmpty) return _Empty(icon: emptyIcon, text: emptyText);
    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: foods.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
      itemBuilder: (_, i) {
        final f = foods[i];
        return InfoCard(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => FoodDetailScreen(foodId: f.id))),
          child: Row(
            children: [
              const Icon(Icons.restaurant, color: AppColors.navy),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(f.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: AppColors.navy)),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        );
      },
    );
  }
}

class _ReactionsView extends StatelessWidget {
  const _ReactionsView();
  @override
  Widget build(BuildContext context) {
    final reactions = context.watch<AppState>().reactionEntries;
    if (reactions.isEmpty) {
      return const _Empty(
          icon: Icons.shield_outlined,
          text: 'No reactions logged. That\'s good news.');
    }
    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: reactions.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
      itemBuilder: (_, i) {
        final e = reactions[i];
        final severe = e.reactionSeverity == ReactionSeverity.significant;
        return InfoCard(
          color: severe ? const Color(0xFFFCEBEA) : AppColors.amberSoft,
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded,
                  color: severe ? AppColors.danger : AppColors.amber),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.details,
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text(DateFormat('EEE d MMM, h:mm a').format(e.date),
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textMuted)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Empty extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Empty({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: AppColors.textMuted),
            const SizedBox(height: AppSpacing.md),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
