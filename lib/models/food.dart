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

  Map<String, dynamic> toMap() => {
        'ageBand': ageBand,
        'howToCut': howToCut,
        'portion': portion,
        'texture': texture,
        'safetyNote': safetyNote,
        'media': media.toMap(),
      };

  factory ServingBand.fromMap(Map<String, dynamic> m) => ServingBand(
        ageBand: m['ageBand'] as String,
        howToCut: m['howToCut'] as String? ?? '',
        portion: m['portion'] as String? ?? '',
        texture: m['texture'] as String? ?? '',
        safetyNote: m['safetyNote'] as String? ?? '',
        media: m['media'] != null
            ? AppMedia.fromMap(Map<String, dynamic>.from(m['media']))
            : AppMedia.empty,
      );
}

class Food {
  final String id;
  final String name;
  final String slug;
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

  const Food({
    required this.id,
    required this.name,
    required this.slug,
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
  });

  String get ageLabel =>
      minAgeMonths <= 0 ? 'From birth' : '$minAgeMonths months';
}
