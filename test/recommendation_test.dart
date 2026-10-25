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
      expect(ids, ['meat_stock', 'beef', 'egg', 'avocado', 'lamb']);
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

    test('stage gating: grains skill opens at 24 months, First Foods at 6', () {
      final grains = state.skillById('grains_starches_legumes')!;
      final first = state.skillById('first_foods')!;
      expect(state.skillOpen(first), isTrue);
      expect(state.skillOpen(grains), isFalse);
      expect(state.currentSkill?.id, 'first_foods');
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
