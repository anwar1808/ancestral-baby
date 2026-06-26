/// The baby profile (§8). One per household in v1.
class Baby {
  final String id;
  final String householdId;
  String name;
  DateTime birthDate;
  bool bornBefore37w;
  bool eczemaFlag;
  List<String> allergies; // known/suspected allergies flagged at onboarding
  String region; // US / UK / EU / SG ...

  Baby({
    required this.id,
    this.householdId = 'local',
    required this.name,
    required this.birthDate,
    this.bornBefore37w = false,
    this.eczemaFlag = false,
    this.allergies = const [],
    this.region = 'UK',
  });

  /// Chronological age in months (whole months).
  int get ageInMonths {
    final now = DateTime.now();
    int months =
        (now.year - birthDate.year) * 12 + (now.month - birthDate.month);
    if (now.day < birthDate.day) months -= 1;
    return months < 0 ? 0 : months;
  }

  /// Corrected age for preemies (§5 onboarding): subtract weeks early.
  int get correctedAgeInMonths {
    if (!bornBefore37w) return ageInMonths;
    // Correct by a conservative ~4 weeks (1 month) until ~24 months.
    final corrected = ageInMonths - 1;
    if (ageInMonths > 24) return ageInMonths;
    return corrected < 0 ? 0 : corrected;
  }

  String get ageLabel {
    final m = ageInMonths;
    if (m < 1) return 'Newborn';
    if (m == 1) return '1 month';
    if (m < 24) return '$m months';
    final years = m ~/ 12;
    return years == 1 ? '1 year' : '$years years';
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'householdId': householdId,
        'name': name,
        'birthDate': birthDate.toIso8601String(),
        'bornBefore37w': bornBefore37w ? 1 : 0,
        'eczemaFlag': eczemaFlag ? 1 : 0,
        'allergies': allergies.join(','),
        'region': region,
      };

  factory Baby.fromMap(Map<String, dynamic> m) => Baby(
        id: m['id'] as String,
        householdId: m['householdId'] as String? ?? 'local',
        name: m['name'] as String,
        birthDate: DateTime.parse(m['birthDate'] as String),
        bornBefore37w: (m['bornBefore37w'] as int? ?? 0) == 1,
        eczemaFlag: (m['eczemaFlag'] as int? ?? 0) == 1,
        allergies: (m['allergies'] as String? ?? '')
            .split(',')
            .where((s) => s.isNotEmpty)
            .toList(),
        region: m['region'] as String? ?? 'UK',
      );
}
