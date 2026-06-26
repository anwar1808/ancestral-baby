import 'package:sqflite/sqflite.dart';

import '../models/allergen.dart';
import '../models/baby.dart';
import '../models/settings.dart';
import '../models/tracker.dart';
import 'db.dart';

/// Per-food user flags (favourite / tried) + optional hero media override.
class FoodState {
  final String foodId;
  final bool favourite;
  final bool tried;
  final DateTime? triedDate;
  final String? heroMediaOverride;

  const FoodState({
    required this.foodId,
    this.favourite = false,
    this.tried = false,
    this.triedDate,
    this.heroMediaOverride,
  });
}

/// Data-access layer over the local SQLite store. All writes are local-first
/// (§2); a future Supabase sync reconciles in the background.
class Repository {
  final AppDatabase _adb = AppDatabase.instance;

  Future<Database> get _db async => _adb.database;

  // ---- Baby -------------------------------------------------------------
  Future<Baby?> getBaby() async {
    final db = await _db;
    final rows = await db.query('baby', limit: 1);
    if (rows.isEmpty) return null;
    return Baby.fromMap(rows.first);
  }

  Future<void> saveBaby(Baby baby) async {
    final db = await _db;
    await db.insert('baby', baby.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // ---- Food state -------------------------------------------------------
  Future<Map<String, FoodState>> getFoodStates(String babyId) async {
    final db = await _db;
    final rows =
        await db.query('food_state', where: 'babyId = ?', whereArgs: [babyId]);
    return {
      for (final r in rows)
        r['foodId'] as String: FoodState(
          foodId: r['foodId'] as String,
          favourite: (r['favourite'] as int? ?? 0) == 1,
          tried: (r['tried'] as int? ?? 0) == 1,
          triedDate: r['triedDate'] == null
              ? null
              : DateTime.tryParse(r['triedDate'] as String),
          heroMediaOverride: r['heroMediaOverride'] as String?,
        )
    };
  }

  Future<void> _upsertFoodState(
      String babyId, String foodId, Map<String, Object?> values) async {
    final db = await _db;
    final existing = await db.query('food_state',
        where: 'babyId = ? AND foodId = ?', whereArgs: [babyId, foodId]);
    if (existing.isEmpty) {
      await db.insert('food_state', {
        'babyId': babyId,
        'foodId': foodId,
        ...values,
      });
    } else {
      await db.update('food_state', values,
          where: 'babyId = ? AND foodId = ?', whereArgs: [babyId, foodId]);
    }
  }

  Future<void> setFavourite(String babyId, String foodId, bool fav) =>
      _upsertFoodState(babyId, foodId, {'favourite': fav ? 1 : 0});

  Future<void> setTried(
      String babyId, String foodId, bool tried, DateTime? when) {
    return _upsertFoodState(babyId, foodId, {
      'tried': tried ? 1 : 0,
      'triedDate': tried ? (when ?? DateTime.now()).toIso8601String() : null,
    });
  }

  Future<void> setHeroMediaOverride(
          String babyId, String foodId, String? uri) =>
      _upsertFoodState(babyId, foodId, {'heroMediaOverride': uri});

  // ---- Allergen status --------------------------------------------------
  Future<Map<String, AllergenStatus>> getAllergenStatuses(
      String babyId) async {
    final db = await _db;
    final rows = await db
        .query('allergen_status', where: 'babyId = ?', whereArgs: [babyId]);
    return {
      for (final r in rows)
        r['allergenId'] as String: AllergenStatus.fromMap(r)
    };
  }

  Future<void> saveAllergenStatus(AllergenStatus status) async {
    final db = await _db;
    await db.insert('allergen_status', status.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // ---- Tracker ----------------------------------------------------------
  Future<List<TrackerEntry>> getTrackerEntries(String babyId) async {
    final db = await _db;
    final rows = await db.query('tracker_entry',
        where: 'babyId = ?', whereArgs: [babyId], orderBy: 'date DESC');
    return rows.map(TrackerEntry.fromMap).toList();
  }

  Future<void> addTrackerEntry(TrackerEntry e) async {
    final db = await _db;
    await db.insert('tracker_entry', e.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteTrackerEntry(String id) async {
    final db = await _db;
    await db.delete('tracker_entry', where: 'id = ?', whereArgs: [id]);
  }

  // ---- Milestones -------------------------------------------------------
  Future<List<Milestone>> getMilestones(String babyId) async {
    final db = await _db;
    final rows = await db.query('milestone',
        where: 'babyId = ?', whereArgs: [babyId], orderBy: 'achievedDate DESC');
    return rows.map(Milestone.fromMap).toList();
  }

  Future<void> addMilestone(Milestone m) async {
    final db = await _db;
    await db.insert('milestone', m.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // ---- Settings ---------------------------------------------------------
  Future<AppSettings> getSettings() async {
    final db = await _db;
    final rows = await db.query('settings');
    final map = {for (final r in rows) r['key'] as String: r['value'] as String};
    return AppSettings.fromMap(map);
  }

  Future<void> saveSettings(AppSettings s) async {
    final db = await _db;
    final batch = db.batch();
    s.toMap().forEach((k, v) {
      batch.insert('settings', {'key': k, 'value': v},
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
    await batch.commit(noResult: true);
  }
}
