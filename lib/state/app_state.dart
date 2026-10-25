import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../data/notification_service.dart';
import '../data/repository.dart';
import '../data/seed_allergens.dart';
import '../data/seed_bands_extra.dart';
import '../data/seed_foods.dart';
import '../data/seed_nature_allergens.dart';
import '../data/seed_recipes.dart';
import '../data/seed_recipes_ancestral.dart';
import '../data/seed_recipes_toddler.dart';
import '../data/seed_skills.dart';
import '../data/sync_repository.dart';
import '../models/allergen.dart';
import '../models/baby.dart';
import '../models/custom_food.dart';
import '../models/food.dart';
import '../models/meal_plan.dart';
import '../models/media.dart';
import '../models/nature_allergen.dart';
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
  /// Catalogue foods with the extra 12 mo+ to 3 yr+ serving bands merged in.
  final List<Food> foods = List.unmodifiable([
    for (final f in kSeedFoods)
      kExtraBands.containsKey(f.id) ? f.withExtraBands(kExtraBands[f.id]!) : f
  ]);
  final List<Allergen> allergens = List.unmodifiable(kSeedAllergens);
  final List<Skill> skills = List.unmodifiable(kSeedSkills);

  // O(1) id indexes over the immutable catalogs (built once on first use).
  late final Map<String, Food> _foodIndex = {for (final f in foods) f.id: f};
  late final Map<String, Allergen> _allergenIndex = {
    for (final a in allergens) a.id: a
  };
  late final Map<String, Skill> _skillIndex = {for (final s in skills) s.id: s};

  // Mutable state.
  Baby? baby;
  List<Baby> babies = [];
  AppSettings settings = const AppSettings();
  Map<String, FoodState> _foodStates = {};
  Map<String, AllergenStatus> _allergenStatuses = {};
  List<TrackerEntry> trackerEntries = [];
  List<Milestone> milestones = [];
  List<CustomFood> customFoods = [];
  List<PlannedMeal> mealPlan = [];

  bool _loading = true;
  bool get loading => _loading;

  // ---- Lookups ----------------------------------------------------------
  Food? foodById(String id) => _foodIndex[id];

  Allergen? allergenById(String id) => _allergenIndex[id];

  FoodState foodState(String foodId) =>
      _foodStates[foodId] ?? FoodState(foodId: foodId);

  bool isFavourite(String foodId) => foodState(foodId).favourite;
  bool isTried(String foodId) => foodState(foodId).tried;
  bool isTryLater(String foodId) => foodState(foodId).tryLater;

  /// Catalog foods flagged as favourite / try-later (for the Tracker tabs).
  List<Food> get favouriteFoods =>
      foods.where((f) => isFavourite(f.id)).toList();
  List<Food> get tryLaterFoods => foods.where((f) => isTryLater(f.id)).toList();

  // ---- Environmental ("nature") allergens -------------------------------
  /// The environmental-allergen profile for the user's region, falling back to
  /// the temperate (UK) profile for any unmapped region.
  NatureProfile get natureProfile {
    final region = settings.region;
    for (final p in kNatureProfiles) {
      if (p.regionCodes.contains(region)) return p;
    }
    return kNatureProfiles.first;
  }

  /// Environmental-symptom log entries (hay-fever / dust-mite), newest first.
  List<TrackerEntry> get symptomEntries =>
      trackerEntries.where((e) => e.type == TrackerType.symptom).toList();
  List<TrackerEntry> get reactionEntries => trackerEntries
      .where((e) => e.type == TrackerType.reaction && e.reactionSeverity != null
          && e.reactionSeverity != ReactionSeverity.none)
      .toList();

  // ---- Skills (100 Foods Plan) -----------------------------------------
  Skill? skillById(String id) => _skillIndex[id];

  int skillTriedCount(Skill s) => s.foodIds.where(isTried).length;

  double skillProgress(Skill s) =>
      s.foodIds.isEmpty ? 0 : skillTriedCount(s) / s.foodIds.length;

  bool skillComplete(Skill s) =>
      s.foodIds.isNotEmpty && skillTriedCount(s) == s.foodIds.length;

  /// Overall plan progress: share of all skill foods tried.
  double get planProgress {
    final all = <String>{for (final s in skills) ...s.foodIds};
    if (all.isEmpty) return 0;
    return all.where(isTried).length / all.length;
  }

  Future<void> _checkSkillBadges() async {
    for (final s in skills) {
      if (skillComplete(s)) await awardSkillBadge(s.id);
    }
  }

  // ---- Age gating + "recommended next" (docs/ancestral_canon_v1.md §4) ---
  /// Corrected age in months; 6 when no baby is set so the catalogue is
  /// browsable in previews.
  int get babyAgeMonths => baby?.correctedAgeInMonths ?? 6;

  /// Stage label used by recipes and the planner for the baby's age.
  String get babyStage {
    final m = babyAgeMonths;
    if (m >= 24) return '24 mo+';
    if (m >= 18) return '18 mo+';
    if (m >= 12) return '12 mo+';
    if (m >= 9) return '9 mo+';
    return '6 mo+';
  }

  /// Stages open by readiness, not age (teardown v3): every stage is open
  /// except one the canon gates by age (Grains, Starches & Legumes at 24).
  bool skillOpen(Skill s) => !s.ageGated || babyAgeMonths >= s.fromMonths;

  // ---- This week's foods (per-stage picker, teardown v3) ----------------
  Set<String> _picks = {};
  String get _picksKey => 'picks_${baby?.id ?? 'local'}';

  /// Foods the parent picked to introduce, still untried, in stage order.
  List<Food> get pickedFoods => [
        for (final s in skills)
          for (final id in s.foodIds)
            if (_picks.contains(id) && !isTried(id)) ?foodById(id)
      ];

  bool isPicked(String foodId) => _picks.contains(foodId);

  /// Untried picks that belong to [s].
  int pickedCountIn(Skill s) =>
      s.foodIds.where((id) => _picks.contains(id) && !isTried(id)).length;

  /// Pick or unpick a food. Returns false when the stage's weekly pick is
  /// already full.
  Future<bool> togglePick(Skill s, String foodId) async {
    if (_picks.contains(foodId)) {
      _picks.remove(foodId);
    } else {
      if (pickedCountIn(s) >= s.weeklyPick) return false;
      final f = foodById(foodId);
      if (f == null || !foodOpenForAge(f)) return false;
      _picks.add(foodId);
    }
    await repo.setKv(_picksKey, _picks.join(','));
    notifyListeners();
    return true;
  }

  /// Pre-fill a stage's picks with its first untried, eligible foods (the
  /// "recommended, already checked" default).
  Future<void> suggestPicks(Skill s) async {
    for (final id in s.foodIds) {
      if (pickedCountIn(s) >= s.weeklyPick) break;
      final f = foodById(id);
      if (f == null || isTried(id) || _picks.contains(id)) continue;
      if (!foodOpenForAge(f) || _allergenBlocked(f)) continue;
      if (id == 'liver' && !liverDueNow) continue;
      _picks.add(id);
    }
    await repo.setKv(_picksKey, _picks.join(','));
    notifyListeners();
  }

  // ---- Already-tried intake (cohesiveness check v2 item 7) -------------
  /// Record foods and allergens the baby had before using the app. Foods are
  /// marked tried without journal entries; allergens move to maintenance so
  /// rotation reminders start. Milestones are awarded quietly.
  Future<void> recordAlreadyTried(
      {Set<String> foodIds = const {}, Set<String> allergenIds = const {}}) async {
    if (baby == null) return;
    final when = DateTime.now();
    // An allergen already in the diet implies its single serving food was
    // eaten too (egg, peanut butter, tofu ...); dairy has two, so it is left.
    final all = {...foodIds};
    for (final a in allergenIds) {
      final ideas = allergenById(a)?.servingIdeaFoodIds ?? const [];
      if (ideas.length == 1) all.add(ideas.first);
    }
    for (final id in all) {
      if (!isTried(id)) await repo.setTried(baby!.id, id, true, when);
    }
    _foodStates = await repo.getFoodStates(baby!.id);
    for (final a in allergenIds) {
      final st = allergenStatus(a);
      if (st.state == AllergenState.reactionNoted) continue;
      st.state = AllergenState.maintaining;
      st.introStep = AllergenStatus.introServingsTarget;
      st.firstIntroducedDate ??= when;
      st.lastServedDate ??= when;
      await repo.saveAllergenStatus(st);
    }
    _allergenStatuses = await repo.getAllergenStatuses(baby!.id);
    _picks.removeWhere(isTried);
    await repo.setKv(_picksKey, _picks.join(','));
    await _checkFoodMilestones();
    await _checkSkillBadges();
    await _checkAllergenMilestones();
    consumeJustEarnedMilestone();
    await refreshReminders();
    notifyListeners();
  }

  /// The first open skill that still has untried foods, in curriculum order.
  Skill? get currentSkill {
    for (final s in skills) {
      if (skillOpen(s) && !skillComplete(s)) return s;
    }
    return null;
  }

  /// Plan progress counts only the skills open at this age, so a nine-month-
  /// old is not held at 80% by a stage that starts at two.
  double get planProgressForAge {
    final all = <String>{
      for (final s in skills)
        if (skillOpen(s)) ...s.foodIds
    };
    if (all.isEmpty) return 0;
    return all.where(isTried).length / all.length;
  }

  /// Safety floor plus the ancestral delay: can this food be recommended now?
  bool foodOpenForAge(Food f) => f.effectiveFromMonths <= babyAgeMonths;

  /// Last time liver was logged as tried or in a meal, if ever.
  DateTime? get lastLiverDate {
    DateTime? last;
    for (final e in trackerEntries) {
      final isLiver = e.foodId == 'liver' ||
          (e.type == TrackerType.meal &&
              e.details.toLowerCase().contains('liver'));
      if (isLiver && (last == null || e.date.isAfter(last))) last = e.date;
    }
    return last;
  }

  /// Liver is recommended at most about once a week (vitamin A).
  bool get liverDueNow {
    final last = lastLiverDate;
    return last == null || DateTime.now().difference(last).inDays >= 7;
  }

  /// Allergens the baby must not be nudged towards: a noted reaction, or a
  /// known allergy flagged at onboarding.
  bool _allergenBlocked(Food f) {
    final a = f.allergenId;
    if (a == null) return false;
    if (allergenStatus(a).state == AllergenState.reactionNoted) return true;
    return baby?.allergies.contains(a) ?? false;
  }

  /// Food that continues an allergen series currently being introduced.
  Food? get activeAllergenSeriesFood {
    for (final st in _allergenStatuses.values) {
      if (st.state != AllergenState.introducing) continue;
      final a = allergenById(st.allergenId);
      if (a == null) continue;
      for (final id in a.servingIdeaFoodIds) {
        final f = foodById(id);
        if (f != null && foodOpenForAge(f)) return f;
      }
    }
    return null;
  }

  static const _fatAndFermented = {
    'avocado', 'butter', 'ghee', 'bone_marrow', 'kefir', 'yoghurt', 'cheese',
    'cottage_cheese', 'ricotta', 'cream_cheese', 'whole_milk',
    'fermented_brine', 'coconut',
  };
  static const _lowSugarFruit = {
    'blueberry', 'raspberry', 'blackberry', 'strawberry', 'tomato',
  };

  /// Canon tier: 0 animal food, 1 fat or fermented dairy, 2 non-starchy
  /// vegetable, 3 low-sugar fruit, 4 the rest, 5 delayed starches and grains.
  int _canonTier(Food f) {
    if (f.isDelayedByApproach) return 5;
    if (_fatAndFermented.contains(f.id)) return 1;
    switch (f.category) {
      case 'Meat & Poultry':
      case 'Fish & Seafood':
      case 'Egg':
        return 0;
      case 'Dairy':
        return 1;
      case 'Vegetable':
        return 2;
      case 'Fruit':
        return _lowSugarFruit.contains(f.id) ? 3 : 4;
      default:
        return 4;
    }
  }

  bool _flaggedIronOrFat(Food f) => f.nutritionFlags.any((n) {
        final l = n.toLowerCase();
        return l.contains('iron') || l.contains('fat');
      });

  /// Untried foods we would offer next, best first. Order: the food that
  /// continues an active allergen series; then this week's picked foods; then
  /// the current skill's foods in
  /// curriculum order; then the rest of the catalogue by canon tier, Try
  /// Later first, iron-rich or fat-rich first. Liver only when due.
  List<Food> recommendedNext({int limit = 5}) {
    if (babyAgeMonths < 6) return const [];
    bool eligible(Food f) =>
        !isTried(f.id) &&
        foodOpenForAge(f) &&
        !_allergenBlocked(f) &&
        (f.id != 'liver' || liverDueNow);

    final out = <Food>[];
    final seen = <String>{};
    void add(Food? f) {
      if (f == null || seen.contains(f.id) || !eligible(f)) return;
      seen.add(f.id);
      out.add(f);
    }

    add(activeAllergenSeriesFood);
    for (final f in pickedFoods) {
      add(f);
    }
    final cur = currentSkill;
    if (cur != null) {
      for (final id in cur.foodIds) {
        add(foodById(id));
      }
    }
    final rest = foods.where((f) => !seen.contains(f.id) && eligible(f)).toList();
    final index = {for (var i = 0; i < foods.length; i++) foods[i].id: i};
    int key(Food f) =>
        _canonTier(f) * 1000000 +
        (isTryLater(f.id) ? 0 : 100000) +
        (_flaggedIronOrFat(f) ? 0 : 10000) +
        index[f.id]!;
    rest.sort((a, b) => key(a).compareTo(key(b)));
    for (final f in rest) {
      add(f);
      if (out.length >= limit) break;
    }
    return out.length > limit ? out.sublist(0, limit) : out;
  }

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
    babies = await repo.getBabies();
    // Resolve the active baby: stored selection if still present, else first.
    baby = babies.where((b) => b.id == settings.activeBabyId).cast<Baby?>().firstWhere(
          (b) => true,
          orElse: () => babies.isNotEmpty ? babies.first : null,
        );
    if (baby != null) {
      await _loadBabyData(baby!.id);
    }
    _loading = false;
    notifyListeners();
    // Refresh reminders against current data. Never let a notification
    // failure block the first frame (v1.4.0 launch-hang fix).
    try {
      await refreshReminders();
    } catch (e) {
      debugPrint('refreshReminders failed: $e');
    }
  }

  /// Load all per-baby data for [babyId] into memory.
  Future<void> _loadBabyData(String babyId) async {
    _foodStates = await repo.getFoodStates(babyId);
    _allergenStatuses = await repo.getAllergenStatuses(babyId);
    trackerEntries = await repo.getTrackerEntries(babyId);
    milestones = await repo.getMilestones(babyId);
    customFoods = await repo.getCustomFoods(babyId);
    mealPlan = await repo.getMealPlan(babyId, currentWeekKey);
    final raw = await repo.getKv('picks_$babyId') ?? '';
    _picks = raw.split(',').where((x) => x.isNotEmpty).toSet();
  }

  /// Switch the active baby and reload its data.
  Future<void> switchBaby(String babyId) async {
    final target = babies.where((b) => b.id == babyId).cast<Baby?>().firstWhere(
        (b) => true,
        orElse: () => null);
    if (target == null || target.id == baby?.id) return;
    baby = target;
    await _loadBabyData(target.id);
    settings = settings.copyWith(activeBabyId: target.id, region: target.region);
    await repo.saveSettings(settings);
    notifyListeners();
    await refreshReminders();
  }

  // ---- Onboarding / baby management ------------------------------------
  Future<void> completeOnboarding({
    required String name,
    required DateTime birthDate,
    required bool preemie,
    required bool eczema,
    required List<String> allergies,
    required String region,
  }) async {
    final b = await _createBaby(
      name: name,
      birthDate: birthDate,
      preemie: preemie,
      eczema: eczema,
      allergies: allergies,
      region: region,
    );
    settings = settings.copyWith(
        onboardingComplete: true, region: region, activeBabyId: b.id);
    await repo.saveSettings(settings);
    notifyListeners();
  }

  /// Add an additional baby (after onboarding) and switch to it.
  Future<void> addBaby({
    required String name,
    required DateTime birthDate,
    required bool preemie,
    required bool eczema,
    required List<String> allergies,
    required String region,
  }) async {
    final b = await _createBaby(
      name: name,
      birthDate: birthDate,
      preemie: preemie,
      eczema: eczema,
      allergies: allergies,
      region: region,
    );
    settings = settings.copyWith(activeBabyId: b.id, region: b.region);
    await repo.saveSettings(settings);
    notifyListeners();
    await refreshReminders();
  }

  Future<Baby> _createBaby({
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
    babies = await repo.getBabies();
    baby = b;
    await _loadBabyData(b.id);
    return b;
  }

  Future<void> deleteBaby(String babyId) async {
    await repo.deleteBaby(babyId);
    babies = await repo.getBabies();
    if (baby?.id == babyId) {
      baby = babies.isNotEmpty ? babies.first : null;
      if (baby != null) await _loadBabyData(baby!.id);
      settings = settings.copyWith(
          activeBabyId: baby?.id, region: baby?.region);
      await repo.saveSettings(settings);
    }
    notifyListeners();
    await refreshReminders();
  }

  /// Update an existing baby's details (name, birth date, flags, region).
  Future<void> updateBaby(Baby b) async {
    await repo.saveBaby(b);
    babies = await repo.getBabies();
    if (b.id == baby?.id) {
      baby = b;
      // Region can affect guideline display + default cadence; persist it.
      if (b.id == baby?.id) {
        settings = settings.copyWith(region: b.region);
        await repo.saveSettings(settings);
      }
    }
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
      await _checkSkillBadges();
    } else if (!tried && wasTried) {
      // Remove the auto-logged "Tried X" entries so re-marking doesn't duplicate.
      for (final e in trackerEntries
          .where((e) => e.type == TrackerType.food && e.foodId == foodId)
          .toList()) {
        await repo.deleteTrackerEntry(e.id);
      }
      trackerEntries = await repo.getTrackerEntries(baby!.id);
    }
    notifyListeners();
  }

  Future<void> setHeroMediaOverride(String foodId, String? uri) async {
    if (baby == null) return;
    await repo.setHeroMediaOverride(baby!.id, foodId, uri);
    _foodStates = await repo.getFoodStates(baby!.id);
    notifyListeners();
  }

  Future<void> toggleTryLater(String foodId) async {
    if (baby == null) return;
    final next = !isTryLater(foodId);
    await repo.setTryLater(baby!.id, foodId, next);
    _foodStates = await repo.getFoodStates(baby!.id);
    notifyListeners();
  }

  // ---- Recipes + weekly meal plan ---------------------------------------
  static const _stageOrder = ['6 mo+', '9 mo+', '12 mo+', '18 mo+', '24 mo+'];
  static int _stageIndex(String s) => _stageOrder.indexOf(s);

  /// Every recipe in the app: the ancestral library plus the original set.
  final List<Recipe> recipes =
      List.unmodifiable([...kAncestralRecipes, ...kToddlerRecipes, ...kSeedRecipes]);
  late final Map<String, Recipe> _recipeIndex = {
    for (final r in recipes) r.id: r
  };
  Recipe? recipeById(String id) => _recipeIndex[id];

  /// Recipes our approach would cook now: ancestral, at or below the stage.
  List<Recipe> get recipesForStage {
    final idx = _stageIndex(babyStage);
    return recipes
        .where((r) =>
            r.ancestral &&
            _stageIndex(r.stage) >= 0 &&
            _stageIndex(r.stage) <= idx)
        .toList();
  }

  /// Common allergens a recipe contains, by catalogue flags.
  List<String> recipeAllergens(Recipe r) {
    final out = <String>{};
    for (final id in r.foodIds) {
      final f = foodById(id);
      if (f != null && f.isCommonAllergen && f.allergenId != null) {
        out.add(allergenById(f.allergenId!)?.name ?? f.allergenId!);
      }
    }
    return out.toList();
  }

  /// ISO-8601 week key, e.g. 2026-W44. Weeks start on Monday. Day arithmetic
  /// is done in UTC so a clock change inside the week cannot shift the count.
  static String weekKeyFor(DateTime d) {
    final date = DateTime.utc(d.year, d.month, d.day);
    final thursday = date.add(Duration(days: 4 - date.weekday));
    final jan1 = DateTime.utc(thursday.year, 1, 1);
    final week = (thursday.difference(jan1).inDays ~/ 7) + 1;
    return '${thursday.year}-W${week.toString().padLeft(2, '0')}';
  }

  static DateTime mondayOf(DateTime d) {
    final m = DateTime.utc(d.year, d.month, d.day)
        .subtract(Duration(days: d.weekday - 1));
    return DateTime(m.year, m.month, m.day);
  }

  String get currentWeekKey => weekKeyFor(DateTime.now());

  bool _recipeHasLiver(Recipe r) =>
      r.foodIds.contains('liver') || r.title.toLowerCase().contains('liver');

  List<Recipe> _slotPool(String slot) {
    final pool = recipesForStage;
    final type = (slot == 'lunch' || slot == 'dinner') ? 'main' : slot;
    var list = pool
        .where((r) => (r.mealType.isEmpty ? 'main' : r.mealType) == type)
        .toList();
    if (list.isEmpty) list = pool.where((r) => r.mealType != 'base').toList();
    return list;
  }

  /// Make-ahead bases (stock, ferment) for the stage.
  List<Recipe> get weekBases =>
      recipesForStage.where((r) => r.mealType == 'base').toList();

  /// How much a recipe moves the plan forward: foods in the recommended-next
  /// list count most, other untried catalogue foods a little.
  int _recipeScore(Recipe r, Set<String> nextIds) {
    var s = 0;
    for (final id in r.foodIds) {
      if (nextIds.contains(id)) {
        s += 3;
      } else if (!isTried(id) && foodById(id) != null) {
        s += 1;
      }
    }
    return s;
  }

  /// Meal slots a day by age (cohesiveness check v2 item 2), following NHS
  /// Best Start in Life: once a day to start, building to three meals, no
  /// snacks before one, then up to two snacks (we plan one).
  List<String> get slotsForAge {
    final m = babyAgeMonths;
    if (m < 7) return const ['lunch'];
    if (m < 9) return const ['breakfast', 'lunch'];
    if (m < 12) return const ['breakfast', 'lunch', 'dinner'];
    return PlannedMeal.slots;
  }

  /// Build (or rebuild) this week's plan: slots a day by age, recipes for the
  /// baby's stage, spread evenly, favouring foods that are next in the plan.
  /// Liver appears at most once a week and only when it is due.
  Future<void> generateWeekPlan({bool regenerate = false}) async {
    if (baby == null) return;
    final weekKey = currentWeekKey;
    final rng = Random(Object.hash(baby!.id, weekKey,
        regenerate ? DateTime.now().millisecondsSinceEpoch : 0));
    final nextIds = recommendedNext(limit: 12).map((f) => f.id).toSet();
    final usage = <String, int>{};
    var liverUsed = !liverDueNow;
    final out = <PlannedMeal>[];
    for (var day = 0; day < 7; day++) {
      final usedToday = <String>{};
      for (final slot in slotsForAge) {
        final cands = _slotPool(slot)
            .where((r) =>
                !usedToday.contains(r.id) && !(liverUsed && _recipeHasLiver(r)))
            .toList();
        if (cands.isEmpty) continue;
        cands.sort((a, b) {
          final ua = usage[a.id] ?? 0, ub = usage[b.id] ?? 0;
          if (ua != ub) return ua.compareTo(ub);
          return _recipeScore(b, nextIds).compareTo(_recipeScore(a, nextIds));
        });
        final top = cands.take(3).toList();
        final pick = top[rng.nextInt(top.length)];
        if (_recipeHasLiver(pick)) liverUsed = true;
        usage[pick.id] = (usage[pick.id] ?? 0) + 1;
        usedToday.add(pick.id);
        out.add(PlannedMeal(
          babyId: baby!.id,
          weekKey: weekKey,
          day: day,
          slot: slot,
          recipeId: pick.id,
        ));
      }
    }
    await repo.replaceMealPlan(baby!.id, weekKey, out);
    mealPlan = out;
    notifyListeners();
  }

  /// Replace one planned meal with the least-used alternative for its slot.
  Future<void> swapPlannedMeal(PlannedMeal m) async {
    final usedToday =
        mealPlan.where((x) => x.day == m.day).map((x) => x.recipeId).toSet();
    final liverPlanned = mealPlan.any((x) {
      final r = recipeById(x.recipeId);
      return r != null && _recipeHasLiver(r) && x.recipeId != m.recipeId;
    });
    final usage = <String, int>{};
    for (final x in mealPlan) {
      usage[x.recipeId] = (usage[x.recipeId] ?? 0) + 1;
    }
    final cands = _slotPool(m.slot)
        .where((r) =>
            !usedToday.contains(r.id) &&
            !((liverPlanned || !liverDueNow) && _recipeHasLiver(r)))
        .toList();
    if (cands.isEmpty) return;
    cands.sort((a, b) => (usage[a.id] ?? 0).compareTo(usage[b.id] ?? 0));
    final updated = m.copyWith(recipeId: cands.first.id, cooked: false);
    await repo.savePlannedMeal(updated);
    mealPlan = [
      for (final x in mealPlan)
        (x.day == m.day && x.slot == m.slot) ? updated : x
    ];
    notifyListeners();
  }

  /// Tick a planned meal as cooked. The first tick logs the meal and marks
  /// its foods tried; unticking leaves the journal alone.
  Future<void> setPlannedMealCooked(PlannedMeal m, bool cooked) async {
    final updated = m.copyWith(cooked: cooked);
    await repo.savePlannedMeal(updated);
    mealPlan = [
      for (final x in mealPlan)
        (x.day == m.day && x.slot == m.slot) ? updated : x
    ];
    notifyListeners();
    if (cooked && !m.cooked) {
      final r = recipeById(m.recipeId);
      await logMeal(r?.title ?? m.recipeId, foodIds: r?.foodIds ?? const []);
    }
  }

  /// Log a meal in the journal; any catalogue foods in it are marked tried.
  Future<void> logMeal(String title,
      {List<String> foodIds = const [], DateTime? when}) async {
    if (baby == null) return;
    await addTrackerEntry(TrackerEntry(
      id: _uuid.v4(),
      babyId: baby!.id,
      type: TrackerType.meal,
      date: when ?? DateTime.now(),
      details: title,
    ));
    for (final id in foodIds) {
      if (!isTried(id) && foodById(id) != null) await markTried(id);
    }
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
    // No celebration UI on this path — clear the flag so it can't surface a
    // stale "milestone unlocked" later on the food-detail screen.
    consumeJustEarnedMilestone();
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

  /// Log an environmental-allergy symptom entry (hay-fever / dust-mite).
  Future<void> logEnvironmentalSymptoms(
    List<String> symptoms, {
    ReactionSeverity severity = ReactionSeverity.mild,
    DateTime? when,
  }) async {
    if (baby == null || symptoms.isEmpty) return;
    await addTrackerEntry(TrackerEntry(
      id: _uuid.v4(),
      babyId: baby!.id,
      type: TrackerType.symptom,
      date: when ?? DateTime.now(),
      details: symptoms.join(', '),
      reactionSeverity: severity,
    ));
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
    // No celebration UI on the allergen path — clear so it can't leak later.
    consumeJustEarnedMilestone();
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
  /// Only offered for allergens in the maintaining state.
  Future<void> logMaintenanceServe(String allergenId,
      {DateTime? when}) async {
    if (baby == null) return;
    final date = when ?? DateTime.now();
    final status = allergenStatus(allergenId);
    status.lastServedDate = date;
    status.state = AllergenState.maintaining;
    status.introStep = AllergenStatus.introServingsTarget;
    status.serveStreak += 1;
    status.firstIntroducedDate ??= date;
    await repo.saveAllergenStatus(status);
    _allergenStatuses = await repo.getAllergenStatuses(baby!.id);
    final allergen = allergenById(allergenId);
    await addTrackerEntry(TrackerEntry(
      id: _uuid.v4(),
      babyId: baby!.id,
      type: TrackerType.food,
      allergenId: allergenId,
      date: date,
      details: '${allergen?.name ?? allergenId}: maintenance serve',
    ));
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
  // Food types: 1 / 5 / 10 — the catalog spans exactly 10 food groups, so the
  // top rung is reachable (try a food from every group).
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
