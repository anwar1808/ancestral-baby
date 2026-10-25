/// One planned meal: a recipe in a slot on a day of an ISO week (§ planner).
/// Slots are 'breakfast', 'lunch', 'dinner', 'snack'. Day 0 is Monday.
class PlannedMeal {
  final String babyId;
  final String weekKey; // e.g. 2026-W44
  final int day; // 0..6, Monday first
  final String slot;
  final String recipeId;
  final bool cooked;

  const PlannedMeal({
    required this.babyId,
    required this.weekKey,
    required this.day,
    required this.slot,
    required this.recipeId,
    this.cooked = false,
  });

  PlannedMeal copyWith({String? recipeId, bool? cooked}) => PlannedMeal(
        babyId: babyId,
        weekKey: weekKey,
        day: day,
        slot: slot,
        recipeId: recipeId ?? this.recipeId,
        cooked: cooked ?? this.cooked,
      );

  Map<String, dynamic> toMap() => {
        'babyId': babyId,
        'weekKey': weekKey,
        'day': day,
        'slot': slot,
        'recipeId': recipeId,
        'cooked': cooked ? 1 : 0,
      };

  factory PlannedMeal.fromMap(Map<String, dynamic> m) => PlannedMeal(
        babyId: m['babyId'] as String,
        weekKey: m['weekKey'] as String,
        day: m['day'] as int,
        slot: m['slot'] as String,
        recipeId: m['recipeId'] as String,
        cooked: (m['cooked'] as int? ?? 0) == 1,
      );

  static const slots = ['breakfast', 'lunch', 'dinner', 'snack'];
  static const dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
}
