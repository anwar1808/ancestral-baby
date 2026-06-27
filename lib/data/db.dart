import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

/// Local-first SQLite store (§2, §8). On-device source of truth; fully
/// functional offline. The food/allergen *catalogs* are seeded original
/// content held in Dart; this DB holds mutable per-baby state plus per-food
/// user flags (favourite / tried) and optional media overrides.
class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  Database? _db;

  Future<Database> get database async {
    _db ??= await _open();
    return _db!;
  }

  Future<Database> _open() async {
    final dir = await getDatabasesPath();
    final path = p.join(dir, 'ancestral_baby.db');
    return openDatabase(
      path,
      version: 3,
      onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
      onCreate: _create,
      onUpgrade: _upgrade,
    );
  }

  /// Schema migrations.
  /// v2: escalating allergen intro step + custom foods.
  /// v3: "try later" flag on food_state.
  Future<void> _upgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
          'ALTER TABLE allergen_status ADD COLUMN introStep INTEGER DEFAULT 0');
      await db.execute(_customFoodTable);
    }
    if (oldVersion < 3) {
      await db.execute(
          'ALTER TABLE food_state ADD COLUMN tryLater INTEGER DEFAULT 0');
    }
  }

  static const _customFoodTable = '''
      CREATE TABLE custom_food (
        id TEXT PRIMARY KEY,
        babyId TEXT NOT NULL,
        name TEXT NOT NULL,
        category TEXT,
        photoPath TEXT,
        tried INTEGER DEFAULT 1,
        triedDate TEXT,
        createdDate TEXT NOT NULL
      )''';

  Future<void> _create(Database db, int version) async {
    await db.execute('''
      CREATE TABLE baby (
        id TEXT PRIMARY KEY,
        householdId TEXT,
        name TEXT NOT NULL,
        birthDate TEXT NOT NULL,
        bornBefore37w INTEGER DEFAULT 0,
        eczemaFlag INTEGER DEFAULT 0,
        allergies TEXT DEFAULT '',
        region TEXT DEFAULT 'UK'
      )''');

    // Per-food user state + media override (keeps the food catalog in code,
    // while honouring the user-replaceable media slot, §6).
    await db.execute('''
      CREATE TABLE food_state (
        babyId TEXT NOT NULL,
        foodId TEXT NOT NULL,
        favourite INTEGER DEFAULT 0,
        tried INTEGER DEFAULT 0,
        triedDate TEXT,
        heroMediaOverride TEXT,
        tryLater INTEGER DEFAULT 0,
        PRIMARY KEY (babyId, foodId)
      )''');

    await db.execute('''
      CREATE TABLE allergen_status (
        babyId TEXT NOT NULL,
        allergenId TEXT NOT NULL,
        state TEXT DEFAULT 'notIntroduced',
        firstIntroducedDate TEXT,
        lastServedDate TEXT,
        maintenanceIntervalDays INTEGER DEFAULT 3,
        serveStreak INTEGER DEFAULT 0,
        introStep INTEGER DEFAULT 0,
        PRIMARY KEY (babyId, allergenId)
      )''');

    await db.execute(_customFoodTable);

    await db.execute('''
      CREATE TABLE tracker_entry (
        id TEXT PRIMARY KEY,
        babyId TEXT NOT NULL,
        type TEXT NOT NULL,
        foodId TEXT,
        allergenId TEXT,
        date TEXT NOT NULL,
        details TEXT DEFAULT '',
        reactionSeverity TEXT
      )''');

    await db.execute('''
      CREATE TABLE milestone (
        id TEXT PRIMARY KEY,
        babyId TEXT NOT NULL,
        kind TEXT NOT NULL,
        achievedDate TEXT NOT NULL
      )''');

    await db.execute('''
      CREATE TABLE settings (
        key TEXT PRIMARY KEY,
        value TEXT
      )''');
  }

  Future<void> close() async {
    await _db?.close();
    _db = null;
  }
}
