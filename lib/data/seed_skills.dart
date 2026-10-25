/// The "100 Foods Plan" (§5), reshaped after teardown v3 to the readiness
/// model: thirteen stages, all open from about six months, moved through as
/// the baby is ready rather than by age. Each stage shows a suggested start
/// age. The only age-gated stage is Grains, Starches & Legumes (decision A,
/// docs/ancestral_canon_v1.md). Food choices follow the canon: animal foods
/// and fats first. Stage ids from v1.3.0 are kept so earned badges survive.
///
/// Progress for a stage is the share of its foods marked tried; completing a
/// stage awards its badge. Parents pick up to [Skill.weeklyPick] foods a week
/// ("This week's foods"), which lead the Next up list and the planner.
library;

class Skill {
  final String id;
  final String title;
  final String level; // "Start here", "1.0", "2.0", "3.0", "2 years"
  final String focus; // short one-liner
  final String description; // original guidance
  final List<String> foodIds; // catalogue foods that build this stage
  final bool linksAllergens; // ties into the Allergen Programme
  final int order;

  /// Suggested start age in months (corrected for preemies). Shown as a
  /// pill; it does not lock the stage unless [ageGated] is true.
  final int fromMonths;

  /// True only where the canon delays the foods themselves (grains stage).
  final bool ageGated;

  /// How many foods to pick for "This week's foods" in this stage.
  final int weeklyPick;

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
    this.ageGated = false,
    this.weeklyPick = 4,
  });
}

const List<Skill> kSeedSkills = [
  Skill(
    id: 'first_foods',
    title: 'First Foods',
    level: 'Start here',
    focus:
        'Meat in its stock, a first taste of ferment, egg, fats, and the first soft vegetables.',
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
      'fermented_brine',
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
    ],
    order: 1,
    fromMonths: 6,
  ),
  Skill(
    id: 'introduce_allergens',
    title: 'Introduce Allergens',
    level: 'Start here',
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
      'yoghurt',
      'peanut_butter',
      'tahini',
      'bread',
      'tofu',
      'shrimp',
      'almond_butter',
      'cashew_butter',
      'celery',
    ],
    linksAllergens: true,
    order: 2,
    fromMonths: 6,
    weeklyPick: 1,
  ),
  Skill(
    id: 'scoop_mash',
    title: 'Scoop & Mash 1.0',
    level: '1.0',
    focus: 'Thick, buttery mashes to scoop with hands and spoons.',
    description:
        'Move from smooth spoonfuls to thicker textures. Vegetables mashed with '
        'butter or ghee, soft cheeses, and flaked oily fish give practice at '
        'loading a spoon and handling lumps. Pre-load a spoon and let them grab '
        'it, or let them dig in with their hands.',
    foodIds: [
      'butternut_squash',
      'pumpkin',
      'cauliflower',
      'ricotta',
      'cottage_cheese',
      'sardine',
    ],
    order: 3,
    fromMonths: 6,
  ),
  Skill(
    id: 'dip_and_bite',
    title: 'Dip & Bite 1.0',
    level: '1.0',
    focus: 'Soft strips and dips for first biting practice.',
    description:
        'Offer soft, finger-length strips alongside a dip such as avocado, soft '
        'cheese, or yoghurt. Biting off a piece and moving it around the mouth '
        'is a big skill, and gagging while learning it is normal and protective. '
        'Keep pieces soft and sized for the age.',
    foodIds: [
      'cream_cheese',
      'green_bean',
      'asparagus',
      'bell_pepper',
      'cucumber',
      'cheese',
      'mango',
    ],
    order: 4,
    fromMonths: 6,
  ),
  Skill(
    id: 'big_flavors',
    title: 'Big Flavors 1.0',
    level: '1.0',
    focus: 'Stronger meats, greens, and sharp fruit to wake up the senses.',
    description:
        'Babies do not need bland food. Darker meats, mushrooms, tomato, bitter '
        'greens, and gentle spice cooked in fat build an adventurous eater. Skip '
        'salt and sugar; cook with garlic, herbs, and mild spices freely.',
    foodIds: [
      'duck',
      'mushroom',
      'tomato',
      'kale',
      'spinach',
      'mackerel',
      'raspberry',
      'blackberry',
    ],
    order: 5,
    fromMonths: 7,
  ),
  Skill(
    id: 'chewing',
    title: 'Chewing 1.0',
    level: '1.0',
    focus: 'Soft, nourishing foods to practise chewing in a low-risk way.',
    description:
        'As confidence grows, offer tender meats in small pieces and vegetables '
        'with a little more bite, and meals that mix textures on one plate. '
        'Chewing and tongue control are what make the move to family food safe.',
    foodIds: [
      'chicken',
      'cod',
      'haddock',
      'beetroot',
      'carrot',
      'cabbage',
      'turnip',
      'pear',
    ],
    order: 6,
    fromMonths: 7,
  ),
  Skill(
    id: 'scoop_mash_2',
    title: 'Scoop & Mash 2.0',
    level: '2.0',
    focus: 'Richer fats and new textures to scoop.',
    description:
        'Richer textures to scoop: mashes loosened with ghee or bone '
        'marrow, flaked tuna, thicker yoghurt-style dairy, and coconut. '
        'Offer a loaded spoon and let your baby take it, or let them scoop '
        'with their hands. Lumps are fine now, as long as they squash '
        'easily between your fingers.',
    foodIds: ['ghee', 'bone_marrow', 'whole_milk', 'tuna', 'coconut'],
    order: 7,
    fromMonths: 8,
  ),
  Skill(
    id: 'dip_bite_2',
    title: 'Dip & Bite 2.0',
    level: '2.0',
    focus: 'Firmer strips that gently challenge.',
    description:
        'Firmer strips that ask for a real bite: roasted sprout halves, '
        'aubergine wedges, larger pieces of soft fruit. The food should '
        'still squash when pressed between finger and thumb. Stay close and '
        'let your baby work out how much to bite off.',
    foodIds: ['brussels_sprout', 'eggplant', 'strawberry', 'kiwi', 'papaya'],
    order: 8,
    fromMonths: 8,
  ),
  Skill(
    id: 'big_flavors_2',
    title: 'Big Flavors 2.0',
    level: '2.0',
    focus: 'Bright, bold flavours, with honey from one year.',
    description:
        'Bolder tastes: fish roe cooked through, citrus segments with the '
        'membrane removed, pineapple, and prunes. Honey joins only from '
        'twelve months. Strong flavours early and often help a child accept '
        'a wide range later.',
    foodIds: [
      'fish_roe',
      'honey',
      'orange',
      'pineapple',
      'prune',
      'sunflower_seed_butter',
    ],
    order: 9,
    fromMonths: 9,
  ),
  Skill(
    id: 'chewing_2',
    title: 'Chewing 2.0',
    level: '2.0',
    focus: 'Foods that strengthen biting and chewing.',
    description:
        'Foods that build chewing strength: shredded turkey thigh, ripe '
        'stone fruit, soft dates, banana in larger pieces. Offer pieces big '
        'enough to hold, and model chewing at the table.',
    foodIds: ['turkey', 'peach', 'apricot', 'date', 'banana'],
    order: 10,
    fromMonths: 9,
  ),
  Skill(
    id: 'chewing_3',
    title: 'Chewing 3.0',
    level: '3.0',
    focus: 'Firmer meats and fruit to refine chewing.',
    description:
        'Firmer textures to refine chewing: pork in thin strips or small '
        'pieces, thin apple slices cooked until soft, melon and watermelon '
        'in strips. Move on to firmer forms only as chewing becomes steady.',
    foodIds: ['pork', 'apple', 'melon', 'watermelon'],
    order: 11,
    fromMonths: 10,
  ),
  Skill(
    id: 'pick_up_1',
    title: 'Pick Up Practice 1.0',
    level: '2.0',
    focus: 'Small soft pieces for the pincer grasp.',
    description:
        'Small, soft pieces for the pincer grasp: blueberries squashed '
        'flat, peas lightly mashed, soaked raisins, ripe fig. This stage '
        'usually suits babies who have started picking food up between '
        'finger and thumb.',
    foodIds: ['blueberry', 'green_pea', 'raisin', 'fig'],
    order: 12,
    fromMonths: 9,
  ),
  Skill(
    id: 'pick_up_2',
    title: 'Pick Up Practice 2.0',
    level: '3.0',
    focus: 'Bite-sized pieces with more challenging textures.',
    description:
        'Bite-sized pieces with harder textures: grapes and cherries '
        'quartered lengthways and stoned, pumpkin seeds ground or as a thin '
        'butter, plum in small pieces. Keep cutting round foods lengthways '
        'until your child is well into school age.',
    foodIds: ['grape', 'cherry', 'pumpkin_seed', 'plum'],
    order: 13,
    fromMonths: 10,
  ),
  Skill(
    id: 'grains_starches_legumes',
    title: 'Grains, Starches & Legumes',
    level: '2 years',
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
      'parsnip',
      'polenta',
      'barley',
      'millet',
      'buckwheat',
      'couscous',
      'semolina',
      'noodles',
      'wheat_cereal',
      'kidney_bean',
      'white_bean',
      'edamame',
    ],
    order: 14,
    fromMonths: 24,
    ageGated: true,
  ),
];
