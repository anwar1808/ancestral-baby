import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/seed_guidelines.dart';
import '../models/baby.dart';
import '../state/app_state.dart';
import '../theme/tokens.dart';
import '../widgets/common.dart';

/// Edit an existing baby's profile (name, birth date, preemie/eczema flags,
/// known allergies, and region). Region options cover every region the
/// guidelines compare (excluding the global WHO entry).
class EditBabyScreen extends StatefulWidget {
  const EditBabyScreen({super.key});

  @override
  State<EditBabyScreen> createState() => _EditBabyScreenState();
}

class _EditBabyScreenState extends State<EditBabyScreen> {
  static const _commonAllergens = [
    'Peanut', 'Egg', 'Cow\'s milk', 'Tree nuts', 'Soy', 'Wheat', 'Sesame',
    'Fish', 'Shellfish',
  ];

  late final TextEditingController _nameController;
  late DateTime _birthDate;
  late bool _preemie;
  late bool _eczema;
  late Set<String> _allergies;
  late String _region;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    final b = context.read<AppState>().baby;
    _nameController = TextEditingController(text: b?.name ?? '');
    _birthDate = b?.birthDate ?? DateTime.now();
    _preemie = b?.bornBefore37w ?? false;
    _eczema = b?.eczemaFlag ?? false;
    _allergies = {...?b?.allergies};
    _region = b?.region ?? 'UK';
    _ready = b != null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final state = context.read<AppState>();
    final current = state.baby;
    if (current == null) return;
    final updated = Baby(
      id: current.id,
      householdId: current.householdId,
      name: _nameController.text.trim(),
      birthDate: _birthDate,
      bornBefore37w: _preemie,
      eczemaFlag: _eczema,
      allergies: _allergies.toList(),
      region: _region,
    );
    await state.updateBaby(updated);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const Scaffold(body: Center(child: Text('No baby selected')));
    }
    final regions = kRegions.where((r) => r.group != 'Global').toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Edit baby')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const Text('Name',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(hintText: 'Baby\'s name'),
          ),
          const SizedBox(height: AppSpacing.lg),

          const Text('Birth date',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.sm),
          InfoCard(
            color: AppColors.softBlue,
            onTap: () async {
              final now = DateTime.now();
              final picked = await showDatePicker(
                context: context,
                initialDate: _birthDate,
                firstDate: DateTime(now.year - 6),
                lastDate: now,
              );
              if (picked != null) setState(() => _birthDate = picked);
            },
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 18, color: AppColors.navy),
                const SizedBox(width: AppSpacing.md),
                Text(DateFormat('d MMMM yyyy').format(_birthDate),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: AppColors.navy)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SwitchListTile.adaptive(
            value: _preemie,
            onChanged: (v) => setState(() => _preemie = v),
            activeTrackColor: AppColors.navy,
            contentPadding: EdgeInsets.zero,
            title: const Text('Born before 37 weeks'),
            subtitle: const Text('Uses corrected age for readiness guidance.',
                style: TextStyle(fontSize: 13)),
          ),
          SwitchListTile.adaptive(
            value: _eczema,
            onChanged: (v) => setState(() => _eczema = v),
            activeTrackColor: AppColors.navy,
            contentPadding: EdgeInsets.zero,
            title: const Text('Baby has eczema'),
          ),
          const SizedBox(height: AppSpacing.lg),

          const Text('Known or suspected allergies',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _commonAllergens.map((a) {
              final selected = _allergies.contains(a);
              return ChoiceChip(
                label: Text(a),
                selected: selected,
                onSelected: (_) => setState(() {
                  selected ? _allergies.remove(a) : _allergies.add(a);
                }),
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
          const SizedBox(height: AppSpacing.lg),

          const Text('Region',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: regions.map((r) {
              final selected = _region == r.code;
              return ChoiceChip(
                label: Text('${r.flag} ${r.name}'),
                selected: selected,
                onSelected: (_) => setState(() => _region = r.code),
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
          const SizedBox(height: AppSpacing.xl),
          PrimaryButton(
            label: 'Save changes',
            onPressed:
                _nameController.text.trim().isEmpty ? null : _save,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
