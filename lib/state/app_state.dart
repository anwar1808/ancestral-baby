import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../data/notification_service.dart';
import '../data/repository.dart';
import '../data/seed_allergens.dart';
import '../data/seed_foods.dart';
import '../data/sync_repository.dart';
import '../models/allergen.dart';
import '../models/baby.dart';
import '../models/custom_food.dart';
import '../models/food.dart';
import '../models/media.dart';
import '../models/settings.dart';
import '../models/tracker.dart';

/// Central app state (§2 provider). Local-first; holds the seeded food and
/// allergen catalogs plus mutable per-baby data, and owns the maintenance
/// reminder engine (§7.3).
class AppState extends ChangeNotifier {
  final Repository repo;
  final SyncRepository sync;
  final _uuid = const Uuid();

  AppState({Repository? repository, SyncRepository? syncRepository})
      : repo = repository ?? Repository(),
        sync = syncRepository ?? LocalOnlySync();

  // Catalogs (seeded original content).
  final List<Food> foods = List.unmodifiable(kSeedFoods);
  final List<Allergen> allergens = List.unmodifiable(kSeedAllergens);

  // Mutable state.
  Baby? baby;
  AppSettings settings = const AppSettings();
  Map<String, FoodState> _foodStates = {};
  Map<String, AllergenStatus> _allergenStatuses = {};
  List<TrackerEntry> trackerEntries = [];
  List<Milestone> milestones = [];
  List<CustomFood> customFoods = [];

  bool _loading = true;
  bool get loading => _loading;

  // ---- Lookups ----------------------------------------------------------
  Food? foodById(String id) {
    for (final f in foods) {
      if (f.id == id) return f;
    }
    return null;
  }

  Allergen? allergenById(String id) {
    for (final a in allergens) {
      if (a.id == id) return a;
    }
    return null;
  }

  FoodState foodState(String foodId) =>
      _foodStates[foodId] ?? FoodState(foodId: foodId);

  bool isFavourite(String foodId) => foodState(foodId).favourite;
  bool isTried(String foodId) => foodState(foodId).tried;

  /// Resolve a food's hero media, honouring a user override (§6).
  AppMedia heroMediaFor(Food food) {
    final override = foodState(food.id).heroMediaOverride;
    if (override != null && override.isNotEmpty) {
      return AppMedia(uri: override);
    }
    return food.heroMedia;
  }

  AllergenStatus allergenStatus(String allergenId) =>
      _allergenStatuses[allergenId] ??
      AllergenStatus(
        babyId: baby?.id ?? 'local',
        allergenId: allergenId,
        maintenanceIntervalDays: settings.defaultMaintenanceInterval,
      );

  int get triedCount =>
      _foodStates.values.where((s) => s.tried).length +
      customFoods.where((f) => f.tried).length;

  int get allergensIntroducedCount => _allergenStatuses.values
      .where((s) => s.state != AllergenState.notIntroduced)
      .length;

  // ---- Lifecycle --------------------------------------------------------
  Future<void> load() async {
    _loading = true;
    notifyListeners();
    settings = await repo.getSettings();
    baby = await repo.getBaby();
    if (baby != null) {
      _foodStates = await repo.getFoodStates(baby!.id);
      _allergenStatuses = await repo.getAllergenStatuses(baby!.id);
      trackerEntries = await repo.getTrackerEntries(baby!.id);
      milestones = await repo.getMilestones(baby!.id);
      customFoods = await repo.getCustomFoods(baby!.id);
    }
    _loading = false;
    notifyListeners();
    // Refresh reminders against current data.
    await refreshReminders();
  }

  // ---- Onboarding -------------------------------------------------------
  Future<void> completeOnboarding({
    required String name,
    required DateTime birthDate,
    required bool preemie,
    required bool eczema,
    required List<String> allergies,
    required String region,
  }) async {
    final b = Baby(
      id: _uuid.v4(),
      name: name,
      birthDate: birthDate,
      bornBefore37w: preemie,
      eczemaFlag: eczema,
      allergies: allergies,
      region: region,
    );
    await repo.saveBaby(b);
    baby = b;
    settings = settings.copyWith(onboardingComplete: true, region: region);
    await repo.saveSettings(settings);
    notifyListeners();
  }

  Future<void> updateBaby(Baby b) async {
    await repo.saveBaby(b);
    baby = b;
    notifyListeners();
  }

  Future<void> acceptDisclaimer() async {
    settings = settings.copyWith(disclaimerAccepted: true);
    await repo.saveSettings(settings);
    notifyListeners();
  }

  Future<void> updateSettings(AppSettings s) async {
    settings = s;
    await repo.saveSettings(s);
    notifyListeners();
    await refreshReminders();
  }

  // ---- Food actions -----------------------------------------------------
  Future<void> toggleFavourite(String foodId) async {
    if (baby == null) return;
    final next = !isFavourite(foodId);
    await repo.setFavourite(baby!.id, foodId, next);
    _foodStates = await repo.getFoodStates(baby!.id);
    notifyListeners();
  }

  Future<void> markTried(String foodId, {bool tried = true}) async {
    if (baby == null) return;
    final wasTried = isTried(foodId);
    await repo.setTried(baby!.id, foodId, tried, DateTime.now());
    _foodStates = await repo.getFoodStates(baby!.id);
    if (tried && !wasTried) {
      final food = foodById(foodId);
      await addTrackerEntry(TrackerEntry(
        id: _uuid.v4(),
        babyId: baby!.id,
        type: TrackerType.food,
        foodId: foodId,
        date: DateTime.now(),
        details: 'Tried ${food?.name ?? foodId}',
      ));
      await _checkFoodMilestones();
    }
    notifyListeners();
  }

  Future<void> setHeroMediaOverride(String foodId, String? uri) async {
    if (baby == null) return;
    await repo.setHeroMediaOverride(baby!.id, foodId, uri);
    _foodStates = await repo.getFoodStates(baby!.id);
    notifyListeners();
  }

  // ---- Custom foods (user-added, off-catalog) ---------------------------
  /// Create a custom tried-food. Returns the new food's id so the caller can
  /// immediately offer to attach a photo.
  Future<String?> addCustomFood(String name,
      {String? category, DateTime? when}) async {
    if (baby == null) return null;
    final f = CustomFood(
      id: _uuid.v4(),
      babyId: baby!.id,
      name: name.trim(),
      category: (category?.trim().isEmpty ?? true) ? null : category!.trim(),
      tried: true,
      triedDate: when ?? DateTime.now(),
      createdDate: DateTime.now(),
    );
    await repo.saveCustomFood(f);
    customFoods = await repo.getCustomFoods(baby!.id);
    await addTrackerEntry(TrackerEntry(
      id: _uuid.v4(),
      babyId: baby!.id,
      type: TrackerType.food,
      date: f.triedDate ?? DateTime.now(),
      details: 'Tried ${f.name}',
    ));
    await _checkFoodMilestones();
    notifyListeners();
    return f.id;
  }

  Future<void> updateCustomFood(CustomFood f) async {
    if (baby == null) return;
    await repo.saveCustomFood(f);
    customFoods = await repo.getCustomFoods(baby!.id);
    notifyListeners();
  }

  Future<void> setCustomFoodPhoto(String id, String? path) async {
    final f = customFoods.firstWhere((c) => c.id == id,
        orElse: () => CustomFood(
            id: id, babyId: baby?.id ?? 'local', name: '', createdDate: DateTime.now()));
    if (f.name.isEmpty) return;
    f.photoPath = path;
    await updateCustomFood(f);
  }

  Future<void> deleteCustomFood(String id) async {
    if (baby == null) return;
    await repo.deleteCustomFood(id);
    customFoods = await repo.getCustomFoods(baby!.id);
    notifyListeners();
  }

  // ---- Tracker ----------------------------------------------------------
  Future<void> addTrackerEntry(TrackerEntry e) async {
    await repo.addTrackerEntry(e);
    trackerEntries = await repo.getTrackerEntries(baby!.id);
    notifyListeners();
  }

  Future<void> deleteTrackerEntry(String id) async {
    await repo.deleteTrackerEntry(id);
    trackerEntries = await repo.getTrackerEntries(baby!.id);
    notifyListeners();
  }

  // ---- Allergen programme (§7) -----------------------------------------
  /// Record one tolerated serving of the escalating introduction series.
  /// Three clean, increasing servings (watching ~2 hours each) move an allergen
  /// from notIntroduced → introducing → maintaining (tolerated, kept in
  /// rotation). Mirrors staged early-introduction guidance.
  Future<void> recordIntroServing(String allergenId, {DateTime? when}) async {
    if (baby == null) return;
    final date = when ?? DateTime.now();
    final status = allergenStatus(allergenId);
    status.lastServedDate = date;
    status.firstIntroducedDate ??= date;
    final servedStep = (status.introStep + 1).clamp(1, AllergenStatus.introServingsTarget);
    status.introStep = servedStep;

    if (status.introStep >= AllergenStatus.introServingsTarget) {
      status.state = AllergenState.maintaining;
      status.serveStreak += 1;
    } else {
      status.state = AllergenState.introducing;
    }
    await repo.saveAllergenStatus(status);
    _allergenStatuses = await repo.getAllergenStatuses(baby!.id);

    final allergen = allergenById(allergenId);
    await addTrackerEntry(TrackerEntry(
      id: _uuid.v4(),
      babyId: baby!.id,
      type: TrackerType.reaction,
      allergenId: allergenId,
      date: date,
      details:
          '${allergen?.name ?? allergenId}: serving $servedStep of ${AllergenStatus.introServingsTarget} — tolerated',
      reactionSeverity: ReactionSeverity.none,
    ));
    await _checkAllergenMilestones();
    await refreshReminders();
    notifyListeners();
  }

  /// Record a reaction during introduction. Pauses the series and flags it; the
  /// app never gives a diagnosis — it points the user to medical guidance.
  Future<void> recordAllergenReaction(
    String allergenId, {
    required ReactionSeverity outcome,
    DateTime? when,
  }) async {
    if (baby == null || outcome == ReactionSeverity.none) return;
    final date = when ?? DateTime.now();
    final status = allergenStatus(allergenId);
    status.lastServedDate = date;
    status.firstIntroducedDate ??= date;
    status.state = AllergenState.reactionNoted;
    status.serveStreak = 0;
    await repo.saveAllergenStatus(status);
    _allergenStatuses = await repo.getAllergenStatuses(baby!.id);

    final allergen = allergenById(allergenId);
    await addTrackerEntry(TrackerEntry(
      id: _uuid.v4(),
      babyId: baby!.id,
      type: TrackerType.reaction,
      allergenId: allergenId,
      date: date,
      details: '${allergen?.name ?? allergenId}: ${outcome.label}',
      reactionSeverity: outcome,
    ));
    await refreshReminders();
    notifyListeners();
  }

  /// Log a maintenance serve ("served today") for an already-tolerated allergen.
  Future<void> logMaintenanceServe(String allergenId,
      {DateTime? when}) async {
    if (baby == null) return;
    final date = when ?? DateTime.now();
    final status = allergenStatus(allergenId);
    status.lastServedDate = date;
    if (status.state == AllergenState.reactionNoted) {
      // Re-serving after a noted reaction resumes the introduction series.
      status.state = AllergenState.introducing;
    } else {
      status.state = AllergenState.maintaining;
      status.introStep = AllergenStatus.introServingsTarget;
    }
    status.serveStreak += 1;
    status.firstIntroducedDate ??= date;
    await repo.saveAllergenStatus(status);
    _allergenStatuses = await repo.getAllergenStatuses(baby!.id);
    await refreshReminders();
    notifyListeners();
  }

  Future<void> setAllergenInterval(String allergenId, int days) async {
    final status = allergenStatus(allergenId);
    status.maintenanceIntervalDays = days;
    await repo.saveAllergenStatus(status);
    _allergenStatuses = await repo.getAllergenStatuses(baby!.id);
    await refreshReminders();
    notifyListeners();
  }

  /// Allergens that are due or overdue for a maintenance serve.
  List<AllergenStatus> get dueAllergens {
    final now = DateTime.now();
    return _allergenStatuses.values.where((s) {
      if (s.state != AllergenState.maintaining) return false;
      final due = s.nextDueDate;
      return due != null && !now.isBefore(due);
    }).toList();
  }

  // ---- Reminder engine (§7.3) ------------------------------------------
  Future<void> refreshReminders() async {
    final notif = NotificationService.instance;
    if (!settings.notificationsEnabled || baby == null) {
      await notif.cancelAll();
      return;
    }
    await notif.cancelAll();
    int i = 1;
    for (final status in _allergenStatuses.values) {
      if (status.state != AllergenState.maintaining) continue;
      final due = status.nextDueDate;
      if (due == null) continue;
      final allergen = allergenById(status.allergenId);
      await notif.scheduleMaintenanceReminder(
        id: i++,
        title: 'Keep ${allergen?.name ?? 'an allergen'} in rotation',
        body:
            'Time to serve ${allergen?.name ?? 'this allergen'} again to keep '
            '${baby!.name}\'s tolerance.',
        dueDate: due,
        time: settings.reminderTime,
      );
    }
  }

  // ---- Milestones / badges (taxonomy mirrors Solid Starts) -------------
  /// Distinct food categories ("food types") among tried foods.
  int get triedCategoryCount {
    final cats = <String>{};
    _foodStates.forEach((id, st) {
      if (st.tried) {
        final f = foodById(id);
        if (f != null) cats.add(f.category);
      }
    });
    for (final cf in customFoods) {
      if (cf.tried && (cf.category?.isNotEmpty ?? false)) cats.add(cf.category!);
    }
    return cats.length;
  }

  // Foods: 1 / 10 / 25 / 50 / 100.
  static const _foodTiers = <int, String>{
    1: 'first_food',
    10: 'ten_foods',
    25: 'twenty_five_foods',
    50: 'fifty_foods',
    100: 'hundred_foods',
  };
  // Food types: 1 / 5 / 10.
  static const _foodTypeTiers = <int, String>{
    1: 'first_food_type',
    5: 'five_food_types',
    10: 'ten_food_types',
  };
  // Allergens: 1 / 5 / 11.
  static const _allergenTiers = <int, String>{
    1: 'first_allergen',
    5: 'five_allergens',
    11: 'eleven_allergens',
  };

  Future<void> _awardTiers(Map<int, String> tiers, int count) async {
    for (final entry in tiers.entries) {
      if (count >= entry.key && !_hasMilestone(entry.value)) {
        await _award(entry.value);
      }
    }
  }

  Future<void> _checkFoodMilestones() async {
    await _awardTiers(_foodTiers, triedCount);
    await _awardTiers(_foodTypeTiers, triedCategoryCount);
  }

  Future<void> _checkAllergenMilestones() async {
    await _awardTiers(_allergenTiers, allergensIntroducedCount);
  }

  /// Award a skill-completion badge (wired up by the skill engine, Phase 3).
  Future<void> awardSkillBadge(String skillId) async {
    final kind = 'skill_$skillId';
    if (!_hasMilestone(kind)) await _award(kind);
  }

  bool _hasMilestone(String kind) => milestones.any((m) => m.kind == kind);

  String? _justEarnedMilestone;
  String? consumeJustEarnedMilestone() {
    final m = _justEarnedMilestone;
    _justEarnedMilestone = null;
    return m;
  }

  Future<void> _award(String kind) async {
    await repo.addMilestone(Milestone(
      id: _uuid.v4(),
      babyId: baby!.id,
      kind: kind,
      achievedDate: DateTime.now(),
    ));
    milestones = await repo.getMilestones(baby!.id);
    _justEarnedMilestone = kind;
  }
}
