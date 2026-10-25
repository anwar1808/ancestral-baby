import 'package:ancestral_baby/state/app_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ISO week key', () {
    test('1 Jan 2026 (Thursday) is 2026-W01', () {
      expect(AppState.weekKeyFor(DateTime(2026, 1, 1)), '2026-W01');
    });
    test('1 Jan 2027 (Friday) belongs to 2026-W53', () {
      expect(AppState.weekKeyFor(DateTime(2027, 1, 1)), '2026-W53');
    });
    test('25 Oct 2026 (Sunday) is 2026-W43 and Monday is 19 Oct', () {
      expect(AppState.weekKeyFor(DateTime(2026, 10, 25)), '2026-W43');
      expect(AppState.mondayOf(DateTime(2026, 10, 25)), DateTime(2026, 10, 19));
    });
  });

  group('Recommended next (no baby: age treated as 6 months, nothing tried)', () {
    final state = AppState();

    test('follows the First Foods order from the canon', () {
      final ids = state.recommendedNext(limit: 5).map((f) => f.id).toList();
      expect(ids, ['meat_stock', 'fermented_brine', 'beef', 'egg', 'avocado']);
    });

    test('liver is offered when it has never been logged', () {
      final ids = state.recommendedNext(limit: 12).map((f) => f.id);
      expect(ids, contains('liver'));
    });

    test('never recommends a food delayed by the approach at six months', () {
      final delayed = state
          .recommendedNext(limit: 200)
          .where((f) => f.isDelayedByApproach)
          .map((f) => f.id);
      expect(delayed, isEmpty);
    });

    test('after the current stage, meats come before fats, veg, then fruit',
        () {
      final ids = state.recommendedNext(limit: 200).map((f) => f.id).toList();
      int at(String id) => ids.indexOf(id);
      expect(at('chicken'), greaterThan(at('lamb'))); // after First Foods
      expect(at('pork'), lessThan(at('ghee'))); // animal before fat
      expect(at('ghee'), lessThan(at('cauliflower'))); // fat before veg
      expect(at('cauliflower'), lessThan(at('blueberry'))); // veg before fruit
      expect(at('blueberry'), lessThan(at('apple'))); // low-sugar fruit first
    });

    test('readiness model: every stage open at 6 months except grains', () {
      for (final s in state.skills) {
        expect(state.skillOpen(s), s.id != 'grains_starches_legumes',
            reason: s.id);
      }
      expect(state.currentSkill?.id, 'first_foods');
      expect(state.skills.length, 14);
    });

    test('every catalogue food sits in exactly one stage', () {
      final seen = <String, String>{};
      for (final s in state.skills) {
        for (final id in s.foodIds) {
          expect(seen.containsKey(id), isFalse,
              reason: '$id in ${seen[id]} and ${s.id}');
          seen[id] = s.id;
          expect(state.foodById(id), isNotNull, reason: id);
        }
      }
      expect(seen.length, state.foods.length);
    });

    test('v1.3.0 stage ids survive so earned badges still resolve', () {
      for (final id in [
        'first_foods', 'introduce_allergens', 'scoop_mash', 'dip_and_bite',
        'big_flavors', 'chewing', 'grains_starches_legumes'
      ]) {
        expect(state.skillById(id), isNotNull, reason: id);
      }
    });

    test('one meal a day at six months', () {
      expect(state.slotsForAge, ['lunch']);
    });

    test('extra serving bands are merged onto the catalogue', () {
      final bands = state
          .foodById('strawberry')!
          .howToServeByAge
          .map((b) => b.ageBand)
          .toList();
      expect(bands, contains('12 mo+'));
      expect(state.foodById('grape')!.howToServeByAge.map((b) => b.ageBand),
          contains('3 yr+'));
    });

    test('bread and tofu carry the allergen-exposure note and are not delayed',
        () {
      for (final id in ['bread', 'tofu']) {
        final f = state.foodById(id)!;
        expect(f.approachNote, isNotNull);
        expect(f.isDelayedByApproach, isFalse);
      }
    });

    test('toddler recipes use real foods and the 18 and 24 month stages', () {
      final toddler = state.recipes.where((r) => r.id.startsWith('rt_'));
      expect(toddler.where((r) => r.stage == '18 mo+').length, 16);
      expect(toddler.where((r) => r.stage == '24 mo+').length, 12);
      for (final r in toddler) {
        for (final id in r.foodIds) {
          expect(state.foodById(id), isNotNull, reason: '${r.id}: $id');
        }
        if (r.stage == '18 mo+') {
          expect(r.foodIds.where((id) => state.foodById(id)!.isDelayedByApproach),
              isEmpty,
              reason: r.id);
        }
      }
    });

    test('recipe pool for 6 mo+ is the ancestral library plus June extras',
        () {
      final pool = state.recipesForStage;
      expect(pool.where((r) => r.id.startsWith('ra_')).length, 16);
      expect(pool.every((r) => r.ancestral && r.stage == '6 mo+'), isTrue);
      expect(pool.where((r) => r.mealType == 'base').length, 1);
      // Decision A: nothing in the pool uses a delayed food.
      final delayed = pool.where((r) => r.foodIds
          .any((id) => state.foodById(id)?.isDelayedByApproach ?? false));
      expect(delayed, isEmpty);
    });
  });
}
