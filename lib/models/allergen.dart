/// A common infant allergen and its programme content (§7).
class Allergen {
  final String id;
  final String name;

  /// Which regional regulatory sets list it, e.g. ["US-9", "UK-14", "EU-14"].
  final List<String> regionSets;
  final String introductionGuide;
  final String reactionGuidance;

  /// Foods that are easy vehicles for this allergen (links into Foods).
  final List<String> servingIdeaFoodIds;

  /// Approx grams of allergen protein per maintenance serving (reference only).
  final String maintenanceServingNote;

  const Allergen({
    required this.id,
    required this.name,
    this.regionSets = const [],
    this.introductionGuide = '',
    this.reactionGuidance = '',
    this.servingIdeaFoodIds = const [],
    this.maintenanceServingNote = '',
  });
}

/// Per-baby progress for one allergen (§7.3 status model).
enum AllergenState { notIntroduced, introducing, maintaining, reactionNoted }

extension AllergenStateLabel on AllergenState {
  String get label {
    switch (this) {
      case AllergenState.notIntroduced:
        return 'Not started';
      case AllergenState.introducing:
        return 'Introducing';
      case AllergenState.maintaining:
        return 'Maintaining';
      case AllergenState.reactionNoted:
        return 'Reaction noted';
    }
  }

  String get dbValue => name;

  static AllergenState fromDb(String? v) => AllergenState.values.firstWhere(
        (s) => s.name == v,
        orElse: () => AllergenState.notIntroduced,
      );
}

class AllergenStatus {
  final String babyId;
  final String allergenId;
  AllergenState state;
  DateTime? firstIntroducedDate;
  DateTime? lastServedDate;
  int maintenanceIntervalDays; // default ~3–4 → ~2×/week
  int serveStreak;

  AllergenStatus({
    required this.babyId,
    required this.allergenId,
    this.state = AllergenState.notIntroduced,
    this.firstIntroducedDate,
    this.lastServedDate,
    this.maintenanceIntervalDays = 3,
    this.serveStreak = 0,
  });

  /// When the next maintenance serve is due (null if not maintaining yet).
  DateTime? get nextDueDate {
    if (state != AllergenState.maintaining || lastServedDate == null) {
      return null;
    }
    return lastServedDate!.add(Duration(days: maintenanceIntervalDays));
  }

  bool get isOverdue {
    final due = nextDueDate;
    if (due == null) return false;
    return DateTime.now().isAfter(due);
  }

  Map<String, dynamic> toMap() => {
        'babyId': babyId,
        'allergenId': allergenId,
        'state': state.name,
        'firstIntroducedDate': firstIntroducedDate?.toIso8601String(),
        'lastServedDate': lastServedDate?.toIso8601String(),
        'maintenanceIntervalDays': maintenanceIntervalDays,
        'serveStreak': serveStreak,
      };

  factory AllergenStatus.fromMap(Map<String, dynamic> m) => AllergenStatus(
        babyId: m['babyId'] as String,
        allergenId: m['allergenId'] as String,
        state: AllergenStateLabel.fromDb(m['state'] as String?),
        firstIntroducedDate: _date(m['firstIntroducedDate']),
        lastServedDate: _date(m['lastServedDate']),
        maintenanceIntervalDays: m['maintenanceIntervalDays'] as int? ?? 3,
        serveStreak: m['serveStreak'] as int? ?? 0,
      );

  static DateTime? _date(Object? v) =>
      v == null ? null : DateTime.tryParse(v as String);
}
