/// A user-added food that isn't in the curated catalog (e.g. an exotic food the
/// family tried). Recorded as a simple "we tried this" entry — no serve
/// guidance and no rotation, unlike allergens. An optional photo can be added
/// at creation or later.
class CustomFood {
  final String id;
  final String babyId;
  String name;

  /// Optional food group (so it can count toward food-type badges).
  String? category;

  /// Local file path to a user-picked photo (nullable; placeholder shown if absent).
  String? photoPath;

  bool tried;
  DateTime? triedDate;
  final DateTime createdDate;

  CustomFood({
    required this.id,
    required this.babyId,
    required this.name,
    this.category,
    this.photoPath,
    this.tried = true,
    this.triedDate,
    required this.createdDate,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'babyId': babyId,
        'name': name,
        'category': category,
        'photoPath': photoPath,
        'tried': tried ? 1 : 0,
        'triedDate': triedDate?.toIso8601String(),
        'createdDate': createdDate.toIso8601String(),
      };

  factory CustomFood.fromMap(Map<String, dynamic> m) => CustomFood(
        id: m['id'] as String,
        babyId: m['babyId'] as String,
        name: m['name'] as String,
        category: m['category'] as String?,
        photoPath: m['photoPath'] as String?,
        tried: (m['tried'] as int? ?? 1) == 1,
        triedDate: m['triedDate'] == null
            ? null
            : DateTime.tryParse(m['triedDate'] as String),
        createdDate:
            DateTime.tryParse(m['createdDate'] as String? ?? '') ??
                DateTime.fromMillisecondsSinceEpoch(0),
      );
}
