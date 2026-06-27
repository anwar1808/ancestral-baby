/// Skill-progression curriculum for the "100 Foods Plan" (§5). Structure mirrors
/// the staged skill journey (first foods → allergens → texture skills), but all
/// copy is original and the food groupings map to this app's own catalog.
///
/// Progress for a skill is the share of its foods marked tried; completing a
/// skill awards its badge. Each skill suggests catalog foods to introduce and
/// (for relevant skills) points to the Meals tab — including the Ancestral
/// filter — for ideas.
library;

class Skill {
  final String id;
  final String title;
  final String level; // "Start here", "1.0", "2.0"
  final String focus; // short one-liner
  final String description; // original guidance
  final List<String> foodIds; // catalog foods that build this skill
  final bool linksAllergens; // ties into the Allergen Programme
  final int order;

  const Skill({
    required this.id,
    required this.title,
    required this.level,
    required this.focus,
    required this.description,
    this.foodIds = const [],
    this.linksAllergens = false,
    required this.order,
  });
}

const List<Skill> kSeedSkills = [
  Skill(
    id: 'first_foods',
    title: 'First Foods',
    level: 'Start here',
    focus: 'Soft, simple foods to begin with.',
    description:
        'Begin with a handful of soft, easy-to-eat foods. Offer one new food at '
        'a time so you can watch how your baby responds, and let them explore '
        'texture and taste at their own pace. There is no perfect first food — '
        'pick a few from below and build from there.',
    foodIds: [
      'avocado',
      'banana',
      'sweet_potato',
      'broccoli',
      'carrot',
      'butternut_squash',
      'pear',
    ],
    order: 1,
  ),
  Skill(
    id: 'introduce_allergens',
    title: 'Introduce Allergens',
    level: '1.0',
    focus: 'Bring in the common allergens, early and often.',
    description:
        'Once your baby is comfortable with a few first foods, start offering '
        'the common allergens — early, regular exposure is linked to lower rates '
        'of some food allergies. Introduce one allergen at a time using the '
        'Allergen Programme, which walks you through a staged introduction and '
        'helps keep each tolerated allergen in rotation.',
    foodIds: [
      'egg',
      'peanut_butter',
      'yoghurt',
      'tofu',
      'salmon',
      'tahini',
      'bread',
    ],
    linksAllergens: true,
    order: 2,
  ),
  Skill(
    id: 'scoop_mash',
    title: 'Scoop & Mash',
    level: '1.0',
    focus: 'Thicker textures your baby can scoop and self-feed.',
    description:
        'Move from smooth purées to thicker, scoopable textures. Mashes and '
        'soft, lumpy foods help your baby practise loading a spoon and managing '
        'a little more texture in the mouth. Pre-load a spoon and let them grab '
        'it, or let them dig in with their hands.',
    foodIds: ['oats', 'lentil', 'black_bean', 'chickpea', 'green_pea'],
    order: 3,
  ),
  Skill(
    id: 'dip_and_bite',
    title: 'Dip & Bite',
    level: '1.0',
    focus: 'Soft strips and dips for biting practice.',
    description:
        'Offer soft strips and finger foods alongside dips. Biting off a piece '
        'and moving it around the mouth is a big skill — expect plenty of '
        'gagging as your baby learns (gagging is normal and protective). Keep '
        'pieces soft and appropriately sized for the age.',
    foodIds: ['mango', 'cheese', 'apple', 'spinach'],
    order: 4,
  ),
  Skill(
    id: 'big_flavors',
    title: 'Big Flavors',
    level: '1.0',
    focus: 'Herbs, spices, and variety beyond bland.',
    description:
        'Babies don\'t need bland food. Introducing a range of flavours — herbs, '
        'mild spices, and naturally tasty foods — early can help build an '
        'adventurous eater. Skip added salt and sugar, but feel free to cook '
        'with aromatics and gentle spice.',
    foodIds: ['salmon', 'shrimp', 'chickpea', 'lentil'],
    order: 5,
  ),
  Skill(
    id: 'chewing',
    title: 'Chewing',
    level: '1.0',
    focus: 'Soft, chewable pieces and mixed textures.',
    description:
        'As your baby gets more confident, offer soft pieces that need a bit of '
        'chewing and meals that mix textures. Tender cooked meats, soft-cooked '
        'grains, and grated or well-cooked harder foods are great for building '
        'chewing and tongue control.',
    foodIds: ['chicken', 'beef', 'pasta', 'rice', 'quinoa'],
    order: 6,
  ),
];
