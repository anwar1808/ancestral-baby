/// Skill-progression curriculum for the "100 Foods Plan" (§5). The staged shape
/// (first foods → allergens → texture skills, tiers 1.0 and 2.0) is borrowed;
/// the food choices follow docs/ancestral_canon_v1.md: animal foods and fats
/// first, grains, starches, and legumes from 24 months (decision A).
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

  /// Age (months, corrected for preemies) from which this skill is open.
  final int fromMonths;

  const Skill({
    required this.id,
    required this.title,
    required this.level,
    required this.focus,
    required this.description,
    this.foodIds = const [],
    this.linksAllergens = false,
    required this.order,
    this.fromMonths = 6,
  });
}

const List<Skill> kSeedSkills = [
  Skill(
    id: 'first_foods',
    title: 'First Foods',
    level: 'Start here',
    focus: 'Meat in its stock, egg yolk, fats, and the first soft vegetables.',
    description:
        'Our approach starts with the foods that carry the most iron and fat in '
        'the softest forms: slow-cooked meat and a spoon of its stock, hard-cooked '
        'egg yolk, avocado, oily fish, a little liver about once a week, then '
        'butter and fermented dairy. Soft non-starchy vegetables come alongside. '
        'Offer one new food at a time and watch how your baby responds.\n\n'
        'Mainstream guidance (NHS, AAP, WHO) is happy with vegetables or fruit as '
        'first foods and asks for iron-rich foods from six months; this order '
        'simply puts the iron first.',
    foodIds: [
      'meat_stock',
      'beef',
      'egg',
      'avocado',
      'lamb',
      'salmon',
      'liver',
      'courgette',
      'broccoli',
      'butter',
      'kefir',
      'fermented_brine',
    ],
    order: 1,
  ),
  Skill(
    id: 'introduce_allergens',
    title: 'Introduce Allergens',
    level: '1.0',
    focus: 'The common allergens, early and often, one at a time.',
    description:
        'Once a few first foods are going well, start the common allergens. The '
        'allergy trials point to early, regular exposure, so this is one place '
        'where our approach and the mainstream agree completely. Wheat and soy '
        'appear here as allergen exposures in small amounts even though grains '
        'and legumes as foods wait until two in our approach.\n\n'
        'Use the Allergen Programme: it walks each allergen through a staged '
        'introduction and keeps tolerated ones in rotation.',
    foodIds: [
      'egg',
      'yoghurt',
      'peanut_butter',
      'tahini',
      'bread',
      'tofu',
      'salmon',
      'shrimp',
      'almond_butter',
      'celery',
    ],
    linksAllergens: true,
    order: 2,
  ),
  Skill(
    id: 'scoop_mash',
    title: 'Scoop & Mash',
    level: '1.0',
    focus: 'Thick, buttery mashes your baby can load onto a spoon.',
    description:
        'Move from smooth spoonfuls to thicker textures. Vegetables mashed with '
        'butter or ghee, soft cheeses, and flaked oily fish give practice at '
        'loading a spoon and handling lumps. Pre-load a spoon and let them grab '
        'it, or let them dig in with their hands.',
    foodIds: [
      'cauliflower',
      'pumpkin',
      'cottage_cheese',
      'ricotta',
      'sardine',
      'mackerel',
      'ghee',
    ],
    order: 3,
  ),
  Skill(
    id: 'dip_and_bite',
    title: 'Dip & Bite',
    level: '1.0',
    focus: 'Soft strips and dips for biting practice.',
    description:
        'Offer soft, finger-length strips alongside a dip such as avocado, soft '
        'cheese, or yoghurt. Biting off a piece and moving it around the mouth '
        'is a big skill, and gagging while learning it is normal and protective. '
        'Keep pieces soft and sized for the age.',
    foodIds: [
      'green_bean',
      'cucumber',
      'bell_pepper',
      'asparagus',
      'cheese',
      'cream_cheese',
    ],
    order: 4,
  ),
  Skill(
    id: 'big_flavors',
    title: 'Big Flavors',
    level: '2.0',
    focus: 'Herbs, spices, and stronger-tasting foods.',
    description:
        'Babies do not need bland food. Darker meats, mushrooms, tomato, bitter '
        'greens, and gentle spice cooked in fat build an adventurous eater. Skip '
        'salt and sugar; cook with garlic, herbs, and mild spices freely.',
    foodIds: ['duck', 'turkey', 'mushroom', 'tomato', 'kale', 'bone_marrow'],
    order: 5,
    fromMonths: 9,
  ),
  Skill(
    id: 'chewing',
    title: 'Chewing',
    level: '2.0',
    focus: 'Soft pieces that need real chewing, and mixed textures.',
    description:
        'As confidence grows, offer tender meats in small pieces and vegetables '
        'with a little more bite, and meals that mix textures on one plate. '
        'Chewing and tongue control are what make the move to family food safe.',
    foodIds: [
      'chicken',
      'pork',
      'cod',
      'beetroot',
      'brussels_sprout',
      'cabbage',
      'turnip',
      'fish_roe',
    ],
    order: 6,
    fromMonths: 9,
  ),
  Skill(
    id: 'grains_starches_legumes',
    title: 'Grains, Starches & Legumes',
    level: '2.0',
    focus: 'From around two, in our approach.',
    description:
        'Our approach waits on grains, starchy roots, and legumes until around '
        'two, by which time a toddler has had eighteen months of animal foods, '
        'fats, and vegetables. Mainstream guidance includes starchy foods from '
        'six months, and babies thrive on either path when iron and energy are '
        'covered; this is the one place our path and the mainstream clearly '
        'part ways. Everything here stays browsable earlier, with its mainstream '
        'age shown alongside ours.',
    foodIds: [
      'oats',
      'rice',
      'quinoa',
      'potato',
      'sweet_potato',
      'lentil',
      'chickpea',
      'black_bean',
      'pasta',
      'corn',
    ],
    order: 7,
    fromMonths: 24,
  ),
];
