/// Environmental / inhalant ("nature") allergens — pollen, dust mite, mould —
/// which cause allergic rhinitis (hay fever), distinct from the food-allergen
/// programme. Region-aware: temperate regions get a seasonal pollen calendar;
/// tropical regions (Singapore) get a year-round dust-mite / mould view.
enum NatureCategory { tree, grass, weed, mite, mould }

extension NatureCategoryLabel on NatureCategory {
  String get label {
    switch (this) {
      case NatureCategory.tree:
        return 'Trees';
      case NatureCategory.grass:
        return 'Grass';
      case NatureCategory.weed:
        return 'Weeds';
      case NatureCategory.mite:
        return 'Dust mite';
      case NatureCategory.mould:
        return 'Mould';
    }
  }
}

/// One pollen taxon or perennial allergen within a region's profile.
class NatureAllergen {
  final String name;
  final NatureCategory category;

  /// Months (1–12) the allergen is typically in the air. Empty ⇒ year-round.
  final List<int> activeMonths;

  /// The subset of [activeMonths] that are peak. Empty ⇒ no distinct peak.
  final List<int> peakMonths;

  /// Perennial (no season) — e.g. house dust mite in the tropics.
  final bool yearRound;

  /// Short note: prevalence, allergenic strength, or exposure detail.
  final String note;

  const NatureAllergen({
    required this.name,
    required this.category,
    this.activeMonths = const [],
    this.peakMonths = const [],
    this.yearRound = false,
    this.note = '',
  });

  bool activeInMonth(int month) => yearRound || activeMonths.contains(month);
  bool peakInMonth(int month) => peakMonths.contains(month);
}

/// A region's environmental-allergen picture.
class NatureProfile {
  final String regionName;
  final String flag;

  /// Which app region codes (UK/US/EU/FR/SG) map to this profile.
  final List<String> regionCodes;

  /// Seasonal (pollen calendar) vs perennial (year-round mite/mould).
  final bool seasonal;

  final String summary;
  final List<NatureAllergen> allergens;

  /// Practical reduce-exposure guidance for this region.
  final List<String> exposureTips;

  /// The authoritative body/source this profile is drawn from.
  final String sourceBody;

  /// Any honesty caveat to surface (e.g. figures interpolated / unverified).
  final String caveat;

  const NatureProfile({
    required this.regionName,
    required this.flag,
    required this.regionCodes,
    required this.seasonal,
    required this.summary,
    required this.allergens,
    required this.exposureTips,
    required this.sourceBody,
    this.caveat = '',
  });

  /// Allergens active in [month], most-relevant (peaking) first.
  List<NatureAllergen> activeIn(int month) {
    final active = allergens.where((a) => a.activeInMonth(month)).toList();
    active.sort((a, b) {
      final ap = a.peakInMonth(month) ? 0 : 1;
      final bp = b.peakInMonth(month) ? 0 : 1;
      return ap.compareTo(bp);
    });
    return active;
  }
}
