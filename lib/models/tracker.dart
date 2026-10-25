/// A tracker log entry (§8) — food tried, meal, reaction, note, or an
/// environmental-allergy symptom entry (hay-fever / dust-mite symptoms).
enum TrackerType { food, meal, reaction, note, symptom }

enum ReactionSeverity { none, mild, significant }

extension ReactionSeverityLabel on ReactionSeverity {
  String get label {
    switch (this) {
      case ReactionSeverity.none:
        return 'Tolerated';
      case ReactionSeverity.mild:
        return 'Mild reaction';
      case ReactionSeverity.significant:
        return 'Significant reaction';
    }
  }
}

class TrackerEntry {
  final String id;
  final String babyId;
  final TrackerType type;
  final String? foodId;
  final String? allergenId;
  final DateTime date;
  final String details;
  final ReactionSeverity? reactionSeverity;

  const TrackerEntry({
    required this.id,
    required this.babyId,
    required this.type,
    this.foodId,
    this.allergenId,
    required this.date,
    this.details = '',
    this.reactionSeverity,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'babyId': babyId,
        'type': type.name,
        'foodId': foodId,
        'allergenId': allergenId,
        'date': date.toIso8601String(),
        'details': details,
        'reactionSeverity': reactionSeverity?.name,
      };

  factory TrackerEntry.fromMap(Map<String, dynamic> m) => TrackerEntry(
        id: m['id'] as String,
        babyId: m['babyId'] as String,
        type: TrackerType.values
            .firstWhere((t) => t.name == m['type'], orElse: () => TrackerType.note),
        foodId: m['foodId'] as String?,
        allergenId: m['allergenId'] as String?,
        date: DateTime.parse(m['date'] as String),
        details: m['details'] as String? ?? '',
        reactionSeverity: m['reactionSeverity'] == null
            ? null
            : ReactionSeverity.values.firstWhere(
                (r) => r.name == m['reactionSeverity'],
                orElse: () => ReactionSeverity.none,
              ),
      );
}

/// A celebrated milestone (§5 Progress).
class Milestone {
  final String id;
  final String babyId;
  final String kind; // e.g. "first_food", "10_foods", "first_allergen"
  final DateTime achievedDate;

  const Milestone({
    required this.id,
    required this.babyId,
    required this.kind,
    required this.achievedDate,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'babyId': babyId,
        'kind': kind,
        'achievedDate': achievedDate.toIso8601String(),
      };

  factory Milestone.fromMap(Map<String, dynamic> m) => Milestone(
        id: m['id'] as String,
        babyId: m['babyId'] as String,
        kind: m['kind'] as String,
        achievedDate: DateTime.parse(m['achievedDate'] as String),
      );
}
