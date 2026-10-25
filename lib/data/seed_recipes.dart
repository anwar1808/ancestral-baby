/// Recipe library for the Meals tab (§5). Original recipes written for this app
/// — simple, baby-appropriate, grounded in safe-serving basics (cook well, no
/// added salt/sugar, no honey before 12 months, soften/shape to reduce choking).
/// Includes an "Ancestral" collection consistent with the app's Ancestral
/// filter. Ingredient lists are factual; methods are our own wording.
library;

class Recipe {
  final String id;
  final String title;
  final String collection; // First Meals / Iron-Rich / Quick & Easy / Ancestral
  final String stage; // "6 mo+", "9 mo+", "12 mo+"
  final String summary;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> foodIds; // catalog links
  final bool ancestral;

  /// 'breakfast' | 'main' | 'snack' | 'base' (stock or ferment). Empty for
  /// older entries; the meal planner groups by this.
  final String mealType;

  const Recipe({
    required this.id,
    required this.title,
    required this.collection,
    required this.stage,
    required this.summary,
    required this.ingredients,
    required this.steps,
    this.foodIds = const [],
    this.ancestral = false,
    this.mealType = '',
  });
}

const List<Recipe> kSeedRecipes = [
  // ---- First Meals ----
  Recipe(
    id: 'r_avocado_mash',
    title: 'Simple avocado mash',
    collection: 'First Meals',
    stage: '6 mo+',
    summary: 'A creamy, no-cook first food rich in healthy fats.',
    ingredients: ['½ ripe avocado', 'A little breast milk or formula (optional)'],
    steps: [
      'Scoop the flesh from a soft, ripe avocado into a bowl.',
      'Mash with a fork until smooth, loosening with a little milk if needed.',
      'Serve on a pre-loaded spoon, or let baby scoop with their hands.',
    ],
    foodIds: ['avocado'],
  ),
  Recipe(
    id: 'r_banana_oats',
    title: 'Banana porridge',
    collection: 'First Meals',
    stage: '24 mo+',
    summary: 'Soft oats with mashed banana — gentle and filling.',
    ingredients: ['2 tbsp porridge oats', 'Milk or water to cook', '½ ripe banana'],
    steps: [
      'Cook the oats with milk or water until soft and thick, then cool.',
      'Mash the banana and stir it through.',
      'Check the temperature and serve loose enough to scoop.',
    ],
    foodIds: ['oats', 'banana'],
  ),
  Recipe(
    id: 'r_sweet_potato_mash',
    title: 'Roasted sweet potato mash',
    collection: 'First Meals',
    stage: '24 mo+',
    summary: 'Naturally sweet, soft, and easy to self-feed.',
    ingredients: ['1 small sweet potato', 'A drizzle of olive oil'],
    steps: [
      'Roast or steam the sweet potato until very soft.',
      'Scoop out the flesh and mash with a little oil.',
      'Serve as a mash, or as soft wedges for older babies.',
    ],
    foodIds: ['sweet_potato'],
  ),
  // ---- Iron-Rich ----
  Recipe(
    id: 'r_lentil_veg',
    title: 'Soft lentil & carrot mash',
    collection: 'Iron-Rich',
    stage: '24 mo+',
    summary: 'Iron-rich red lentils with sweet carrot.',
    ingredients: ['3 tbsp red lentils', '½ carrot, diced', 'Water or stock'],
    steps: [
      'Rinse the lentils, then simmer with the carrot until both are very soft.',
      'Mash or blend to the texture your baby is ready for.',
      'Cool and serve; pair with a vitamin-C food to boost iron absorption.',
    ],
    foodIds: ['lentil', 'carrot'],
  ),
  Recipe(
    id: 'r_egg_strips',
    title: 'Well-cooked egg strips',
    collection: 'Iron-Rich',
    stage: '6 mo+',
    summary: 'A great early protein and a common allergen to introduce.',
    ingredients: ['1 egg', 'A little oil for the pan'],
    steps: [
      'Whisk the egg and cook it fully into a thin, firm omelette.',
      'Cool, then cut into graspable strips.',
      'Offer on its own the first few times to watch for any reaction.',
    ],
    foodIds: ['egg'],
  ),
  Recipe(
    id: 'r_chicken_broccoli',
    title: 'Shredded chicken & soft broccoli',
    collection: 'Iron-Rich',
    stage: '9 mo+',
    summary: 'Tender chicken with soft-cooked broccoli florets.',
    ingredients: ['Cooked chicken thigh', 'A few broccoli florets'],
    steps: [
      'Steam the broccoli until very soft.',
      'Finely shred or chop moist cooked chicken.',
      'Serve together; the florets make handy little brushes for self-feeding.',
    ],
    foodIds: ['chicken', 'broccoli'],
  ),
  // ---- Quick & Easy ----
  Recipe(
    id: 'r_yoghurt_berries',
    title: 'Yoghurt with smashed blueberries',
    collection: 'Quick & Easy',
    stage: '9 mo+',
    summary: 'A fast calcium-rich bowl.',
    ingredients: ['Full-fat plain yoghurt', 'A few blueberries'],
    steps: [
      'Smash or quarter the blueberries to reduce choking risk.',
      'Stir through plain full-fat yoghurt.',
      'Serve chilled.',
    ],
    foodIds: ['yoghurt', 'blueberry'],
  ),
  Recipe(
    id: 'r_hummus_plate',
    title: 'Chickpea & tahini hummus plate',
    collection: 'Quick & Easy',
    stage: '24 mo+',
    summary: 'Smooth hummus with soft dippers — introduces sesame.',
    ingredients: ['Cooked chickpeas', 'Smooth tahini', 'Lemon and olive oil',
        'Soft veg batons or bread'],
    steps: [
      'Blend chickpeas with tahini, a little oil, and lemon until smooth.',
      'Spread thinly or offer as a dip with soft dippers.',
      'Keep it smooth and unsalted for babies.',
    ],
    foodIds: ['chickpea', 'tahini', 'bread'],
  ),
  Recipe(
    id: 'r_salmon_peas',
    title: 'Flaked salmon with smashed peas',
    collection: 'Quick & Easy',
    stage: '9 mo+',
    summary: 'Omega-3-rich fish in a soft, scoopable form.',
    ingredients: ['Cooked salmon fillet', 'Cooked peas'],
    steps: [
      'Cook the salmon through and flake it, checking carefully for bones.',
      'Lightly smash the peas.',
      'Mix together and serve soft.',
    ],
    foodIds: ['salmon', 'green_pea'],
  ),
  // ---- Ancestral ----
  Recipe(
    id: 'r_anc_eggyolk_avocado',
    title: 'Egg & avocado with a spoon of broth',
    collection: 'Ancestral',
    stage: '6 mo+',
    summary: 'A grain-free, nutrient-dense start with well-cooked egg and broth.',
    ingredients: ['1 well-cooked egg', '¼ ripe avocado',
        '1 tsp warm meat stock'],
    steps: [
      'Cook the egg fully; mash the yolk and chop the white very finely.',
      'Mash the egg with avocado, loosening with a little warm stock.',
      'Serve warm. Introduce egg on its own the first few times.',
    ],
    foodIds: ['egg', 'avocado'],
    ancestral: true,
  ),
  Recipe(
    id: 'r_anc_chicken_bonebroth',
    title: 'Chicken in bone broth with buttered broccoli',
    collection: 'Ancestral',
    stage: '9 mo+',
    summary: 'Gelatine-rich broth with a non-starchy vegetable.',
    ingredients: ['Cooked chicken', 'Bone broth', 'Broccoli', 'A little butter'],
    steps: [
      'Warm shredded chicken gently in bone broth.',
      'Steam broccoli until soft and toss in a little butter.',
      'Serve together; the fat helps absorb the vegetable\'s vitamins.',
    ],
    foodIds: ['chicken', 'broccoli'],
    ancestral: true,
  ),
  Recipe(
    id: 'r_anc_beef_carrot',
    title: 'Slow-cooked beef with soft carrot',
    collection: 'Ancestral',
    stage: '6 mo+',
    summary: 'Highly absorbable heme iron from gently cooked beef.',
    ingredients: ['Slow-cooked beef', 'Soft-cooked carrot', 'Meat stock'],
    steps: [
      'Cook the beef low and slow until it shreds easily.',
      'Soften the beef in a little stock and mash or finely shred.',
      'Serve with soft carrot alongside.',
    ],
    foodIds: ['beef', 'carrot'],
    ancestral: true,
  ),
];
