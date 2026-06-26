import 'dart:io';

import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../models/allergen.dart';
import '../models/tracker.dart';
import '../state/app_state.dart';

/// CSV + PDF export via the platform share sheet (§9). Paediatrician-ready.
class ExportService {
  final _dateFmt = DateFormat('yyyy-MM-dd HH:mm');
  final _dayFmt = DateFormat('d MMM yyyy');

  Future<void> exportCsv(AppState state) async {
    final baby = state.baby;
    final rows = <List<String>>[
      ['Baby', baby?.name ?? '', 'Age', baby?.ageLabel ?? ''],
      [],
      ['TRACKER LOG'],
      ['Date', 'Type', 'Detail', 'Reaction'],
      ...state.trackerEntries.map((e) => [
            _dateFmt.format(e.date),
            e.type.name,
            e.details,
            e.reactionSeverity?.label ?? '',
          ]),
      [],
      ['ALLERGEN STATUS'],
      ['Allergen', 'Status', 'First introduced', 'Last served', 'Cadence (days)', 'Serve streak'],
      ...state.allergens.map((a) {
        final s = state.allergenStatus(a.id);
        return [
          a.name,
          s.state.label,
          s.firstIntroducedDate == null
              ? ''
              : _dayFmt.format(s.firstIntroducedDate!),
          s.lastServedDate == null ? '' : _dayFmt.format(s.lastServedDate!),
          '${s.maintenanceIntervalDays}',
          '${s.serveStreak}',
        ];
      }),
    ];
    final csv = const ListToCsvConverter().convert(rows);
    final file = await _writeTemp('baby_solids_export.csv', csv);
    await Share.shareXFiles([XFile(file.path)],
        text: 'Baby Solids export — ${baby?.name ?? ''}');
  }

  Future<void> exportPdf(AppState state) async {
    final baby = state.baby;
    final doc = pw.Document();
    final triedFoods = state.foods.where((f) => state.isTried(f.id)).toList();

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (ctx) => [
          pw.Header(
            level: 0,
            child: pw.Text('Baby Solids — Summary',
                style: pw.TextStyle(
                    fontSize: 22, fontWeight: pw.FontWeight.bold)),
          ),
          pw.Text('${baby?.name ?? 'Baby'} · ${baby?.ageLabel ?? ''}'),
          pw.Text('Generated ${_dayFmt.format(DateTime.now())}',
              style: const pw.TextStyle(color: PdfColors.grey600, fontSize: 10)),
          pw.SizedBox(height: 16),

          pw.Text('Foods tried (${triedFoods.length})',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 6),
          if (triedFoods.isEmpty)
            pw.Text('None yet.')
          else
            pw.Wrap(
              spacing: 6,
              runSpacing: 4,
              children: triedFoods
                  .map((f) => pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: pw.BoxDecoration(
                          color: PdfColors.grey200,
                          borderRadius: pw.BorderRadius.circular(4),
                        ),
                        child: pw.Text(f.name,
                            style: const pw.TextStyle(fontSize: 10)),
                      ))
                  .toList(),
            ),
          pw.SizedBox(height: 16),

          pw.Text('Allergen introduction & maintenance',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 6),
          pw.TableHelper.fromTextArray(
            headers: ['Allergen', 'Status', 'First', 'Last served', 'Streak'],
            cellStyle: const pw.TextStyle(fontSize: 10),
            headerStyle: pw.TextStyle(
                fontSize: 10, fontWeight: pw.FontWeight.bold),
            headerDecoration:
                const pw.BoxDecoration(color: PdfColors.grey300),
            data: state.allergens.map((a) {
              final s = state.allergenStatus(a.id);
              return [
                a.name,
                s.state.label,
                s.firstIntroducedDate == null
                    ? '—'
                    : _dayFmt.format(s.firstIntroducedDate!),
                s.lastServedDate == null
                    ? '—'
                    : _dayFmt.format(s.lastServedDate!),
                '${s.serveStreak}',
              ];
            }).toList(),
          ),
          pw.SizedBox(height: 16),

          pw.Text('Reactions logged',
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 6),
          ...state.trackerEntries
              .where((e) => e.type == TrackerType.reaction)
              .map((e) => pw.Bullet(
                  text: '${_dayFmt.format(e.date)} — ${e.details}',
                  style: const pw.TextStyle(fontSize: 10))),
          if (!state.trackerEntries
              .any((e) => e.type == TrackerType.reaction))
            pw.Text('None logged.', style: const pw.TextStyle(fontSize: 10)),

          pw.SizedBox(height: 24),
          pw.Divider(),
          pw.Text(
            'Baby Solids is not a medical app and does not replace your '
            'child\'s healthcare team. This summary is for discussion with '
            'your paediatrician.',
            style: pw.TextStyle(
                fontSize: 9, color: PdfColors.grey600, fontStyle: pw.FontStyle.italic),
          ),
        ],
      ),
    );

    final bytes = await doc.save();
    final file = await _writeTempBytes('baby_solids_summary.pdf', bytes);
    await Share.shareXFiles([XFile(file.path)],
        text: 'Baby Solids summary — ${baby?.name ?? ''}');
  }

  Future<File> _writeTemp(String name, String content) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$name');
    return file.writeAsString(content);
  }

  Future<File> _writeTempBytes(String name, List<int> bytes) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$name');
    return file.writeAsBytes(bytes);
  }
}
