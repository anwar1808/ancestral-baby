import 'media.dart';

/// One serving-guidance band for a food (§6 "How to Serve" by age).
class ServingBand {
  /// e.g. "6 mo+", "9 mo+", "12 mo+", "18 mo+", or "4 mo+ (higher-risk)".
  final String ageBand;
  final String howToCut;
  final String portion;
  final String texture;
  final String safetyNote;
  final AppMedia media;

  const ServingBand({
    required this.ageBand,
    required this.howToCut,
    this.portion = '',
    this.texture = '',
    this.safetyNote = '',
    this.media = AppMedia.empty,
  });
}

class Food {
  final String id;
  final String name;
  final String category; // Fruit / Grain / Protein / Veg / Dairy ...
  final AppMedia heroMedia;
  final bool isCommonAllergen;

  /// e.g. "peanut", "egg" — links a food to an allergen record where relevant.
  final String? allergenId;
  final List<String> nutritionFlags; // e.g. ["Iron-rich"]
  final int minAgeMonths;
  final String chokingRisk; // Low / Moderate / High + how-prep-reduces text

  // content_blocks
  final String introduction;
  final List<ServingBand> howToServeByAge;
  final String choking;
  final String allergens;
  final String faq;
  final String tips;

  final List<String> sourceCitations;

  /// The app's own (ancestral) recommended starting age when it differs from
  /// the mainstream [minAgeMonths]. Null means "same as mainstream".
  /// Decision A (25 Oct 2026): grains, starches, and legumes wait until 24.
  final int? ancestralFromMonths;

  /// One line shown on First Foods cards: why this food leads in our approach.
  final String? whyFirst;

  /// Extra line under "Our approach" on the card (for example the allergen-
  /// exposure exception for bread and tofu, cohesiveness check v2 item 1).
  final String? approachNote;

  const Food({
    required this.id,
    required this.name,
    required this.category,
    required this.heroMedia,
    this.isCommonAllergen = false,
    this.allergenId,
    this.nutritionFlags = const [],
    required this.minAgeMonths,
    this.chokingRisk = 'Low',
    this.introduction = '',
    this.howToServeByAge = const [],
    this.choking = '',
    this.allergens = '',
    this.faq = '',
    this.tips = '',
    this.sourceCitations = const [],
    this.ancestralFromMonths,
    this.whyFirst,
    this.approachNote,
  });

  String get ageLabel =>
      minAgeMonths <= 0 ? 'From birth' : '$minAgeMonths months';

  /// Age the app recommends from: the ancestral layer when set, else mainstream.
  /// Copy with [extra] serving bands appended (seed_bands_extra.dart).
  Food withExtraBands(List<ServingBand> extra) => Food(
        id: id,
        name: name,
        category: category,
        heroMedia: heroMedia,
        isCommonAllergen: isCommonAllergen,
        allergenId: allergenId,
        nutritionFlags: nutritionFlags,
        minAgeMonths: minAgeMonths,
        chokingRisk: chokingRisk,
        introduction: introduction,
        howToServeByAge: [...howToServeByAge, ...extra],
        choking: choking,
        allergens: allergens,
        faq: faq,
        tips: tips,
        sourceCitations: sourceCitations,
        ancestralFromMonths: ancestralFromMonths,
        whyFirst: whyFirst,
        approachNote: approachNote,
      );

  int get effectiveFromMonths => ancestralFromMonths ?? minAgeMonths;

  /// True when our approach delays this food beyond mainstream guidance.
  bool get isDelayedByApproach =>
      ancestralFromMonths != null && ancestralFromMonths! > minAgeMonths;

  String get approachAgeLabel => '$effectiveFromMonths months';
}
