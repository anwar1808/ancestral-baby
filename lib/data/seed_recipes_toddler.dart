/// Toddler recipes: 18 mo+ (family table, still grain-free per decision A)
/// and 24 mo+ (grains, starches, and legumes join). Original content.
///
/// Every recipe is a family meal sized for two adults and a toddler, with a
/// step for portioning and cutting the toddler's share. The safety floor from
/// docs/ancestral_canon_v1.md still applies: no honey, added sugar, syrups, or
/// added salt (adults salt their own plates at the table); no seed oils;
/// dairy pasteurised; egg, meat, fish, and shellfish cooked through; fish
/// deboned; nuts only as thin nut butter; round foods quartered lengthways;
/// raw hard vegetables grated or in thin strips. Liver appears once, about
/// once a week. At 24 mo+ grains, starchy roots, and legumes are prepared the
/// ancestral way (soaked, long-cooked, cooked in stock, or with animal fat)
/// and each dish is still built around animal food and fat. This is the
/// app's point of view, offered for information, not medical advice.
library;

import 'seed_recipes.dart';

const List<Recipe> kToddlerRecipes = [
  // =========================================================================
  // 18 mo+  (4 breakfast, 8 main, 3 snack, 1 base). No grains, starches, or
  // legumes yet.
  // =========================================================================

  // ---- 18 mo+ breakfast ----
  Recipe(
    id: 'rt_spinach_cheese_frittata',
    title: 'Spinach and cheese frittata squares',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'breakfast',
    summary:
        'A thick oven frittata the whole family can share, with whole eggs, '
        'wilted spinach, and cheese for choline, iron, and calcium. Leftover '
        'squares travel well. Contains egg and milk, both common allergens.',
    ingredients: [
      '6 eggs',
      '100 g spinach',
      '60 g grated hard cheese',
      '2 tbsp whole milk',
      '1 tbsp butter',
      'A pinch of black pepper',
    ],
    steps: [
      'Heat the oven to 180°C and melt the butter in an ovenproof frying pan '
          'over a medium heat.',
      'Wilt the spinach in the butter for a minute or two, then squeeze out '
          'any extra water and chop it.',
      'Whisk the eggs with the milk, most of the cheese, and the pepper, '
          'stir in the spinach, and pour it back into the pan.',
      'Cook on the hob for 3 minutes until the edges set, scatter over the '
          'rest of the cheese, and bake for 12 to 15 minutes until firm in '
          'the middle with no liquid egg when you press it.',
      'Cut the toddler\'s share first: one wedge cut into finger-width '
          'strips or small squares, cooled to warm. Adults add salt at the '
          'table if they want it.',
    ],
    foodIds: ['egg', 'spinach', 'cheese', 'whole_milk', 'butter'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_yoghurt_blackberry_almond',
    title: 'Thick yoghurt with warm blackberries and almond butter',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'breakfast',
    summary:
        'Full-fat yoghurt with blackberries warmed until they burst and a thin '
        'ribbon of almond butter, for fat, protein, and a little fruit with '
        'no added sweetener. Contains milk and almond, both common allergens.',
    ingredients: [
      '500 g full-fat plain yoghurt, unsweetened',
      '200 g blackberries, fresh or frozen',
      '3 tbsp smooth almond butter, no added salt or sugar',
      '1 tbsp warm water',
    ],
    steps: [
      'Warm the blackberries in a small pan with a splash of water for 5 '
          'minutes until they collapse, then mash them lightly and let them '
          'cool a little.',
      'Stir the almond butter with the warm water until it is thin and runny; '
          'thick nut butter can stick in a toddler\'s mouth.',
      'Spoon the yoghurt into three bowls and top each with the blackberries '
          'and a drizzle of the thinned almond butter.',
      'Give the toddler a smaller bowl with the berries squashed flat and the '
          'almond butter swirled right through, not in a blob.',
    ],
    foodIds: ['yoghurt', 'blackberry', 'almond_butter'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_salmon_chive_scramble',
    title: 'Salmon and chive scramble',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'breakfast',
    summary:
        'Soft scrambled eggs folded through with flaked poached salmon and '
        'chives, a breakfast rich in DHA, choline, and vitamin D. Use fresh '
        'salmon, not smoked, which is salty. Contains egg, fish, and milk, '
        'all common allergens.',
    ingredients: [
      '1 salmon fillet, about 150 g, skinless',
      '6 eggs',
      '2 tbsp butter',
      'A small bunch of chives, finely snipped',
      'A splash of whole milk',
    ],
    steps: [
      'Poach the salmon in barely simmering water for 8 to 10 minutes until '
          'it is opaque all the way through and flakes easily.',
      'Flake the salmon with your fingers, feeling carefully for any bones.',
      'Whisk the eggs with the milk. Melt the butter in a pan over a low heat, '
          'add the eggs, and stir slowly until they are fully set with no '
          'wet egg left, folding in the salmon and chives near the end.',
      'Spoon the toddler\'s share onto a plate first, break up any large '
          'curds, and let it cool to warm before serving.',
    ],
    foodIds: ['salmon', 'egg', 'butter', 'whole_milk'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_pork_apple_patties',
    title: 'Pork, apple, and sage breakfast patties',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'breakfast',
    summary:
        'Homemade breakfast patties of minced pork with grated apple and sage, '
        'with none of the salt, rusk, or sugar in shop sausages. A protein '
        'breakfast that freezes well. Contains milk if fried in butter.',
    ingredients: [
      '500 g minced pork, not too lean',
      '1 small apple, peeled and finely grated',
      '6 sage leaves, finely chopped',
      'A pinch of black pepper',
      '1 tbsp ghee or butter',
    ],
    steps: [
      'Mix the pork, apple, sage, and pepper with your hands until evenly '
          'combined.',
      'Shape into flat round patties about the width of your palm; keep them '
          'flat rather than sausage-shaped.',
      'Fry in the ghee over a medium heat for 4 to 5 minutes a side until '
          'browned and cooked through, with no pink in the middle and clear '
          'juices.',
      'Cut the toddler\'s patty into thin strips or small pieces and cool to '
          'warm. Freeze extra cooked patties for quick breakfasts.',
    ],
    foodIds: ['pork', 'apple', 'ghee'],
    ancestral: true,
  ),

  // ---- 18 mo+ main ----
  Recipe(
    id: 'rt_chicken_thigh_traybake',
    title: 'Chicken thigh traybake with courgette and peppers',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'main',
    summary:
        'Bone-in chicken thighs roasted over courgette, peppers, and red onion '
        'so the vegetables cook in the chicken fat. A single tray, little washing '
        'up, and the bones go into the next stock.',
    ingredients: [
      '6 bone-in chicken thighs, skin on',
      '2 courgettes, cut into thick batons',
      '2 red peppers, cut into wide strips',
      '1 red onion, cut into wedges',
      '2 tbsp olive oil or melted ghee',
      '1 lemon, halved',
      'A few sprigs of thyme',
    ],
    steps: [
      'Heat the oven to 200°C. Toss the vegetables with the oil and spread '
          'them in a large roasting tin.',
      'Sit the chicken on top skin side up, tuck in the thyme and lemon '
          'halves, and roast for 40 to 45 minutes until the skin is crisp and '
          'the juices run clear with no pink at the bone.',
      'Squeeze the roasted lemon over the vegetables and stir them through '
          'the pan juices.',
      'For the toddler, pull the meat off one thigh, remove all bones and '
          'cartilage, and tear it into thin shreds; cut the peppers and '
          'courgette into soft strips. Cool to warm.',
      'Keep the bones for stock.',
    ],
    foodIds: ['chicken', 'courgette', 'bell_pepper'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_lamb_patties_yoghurt_dip',
    title: 'Spiced lamb patties with cucumber yoghurt',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'main',
    summary:
        'Minced lamb with cumin, coriander, and grated onion shaped into flat '
        'patties, served with a cool yoghurt dip and soft roasted vegetables. '
        'Gentle warmth, not heat. Contains milk, a common allergen.',
    ingredients: [
      '500 g minced lamb',
      '1 small onion, finely grated',
      '1 tsp ground cumin',
      '1 tsp ground coriander',
      'A handful of mint or parsley, finely chopped',
      '250 g full-fat plain yoghurt, unsweetened',
      '¼ cucumber, finely grated and squeezed',
      '1 aubergine, cut into chunks and roasted with a little olive oil',
    ],
    steps: [
      'Mix the lamb, onion, spices, and half the herbs, then shape into small '
          'flat patties.',
      'Cook in a dry frying pan or under a hot grill for 4 to 5 minutes a '
          'side until browned and cooked right through with no pink inside.',
      'Stir the grated cucumber and the rest of the herbs into the yoghurt.',
      'Serve with the roasted aubergine. For the toddler, cut a patty into '
          'thin strips, mash the aubergine slightly, and add a spoon of the '
          'yoghurt to dip into. Cool to warm.',
    ],
    foodIds: ['lamb', 'yoghurt', 'cucumber', 'eggplant'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_beef_ragu_courgette_ribbons',
    title: 'Slow beef ragù on courgette ribbons',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'main',
    summary:
        'A long-simmered ragù of beef, tomato, carrot, and celery cooked in '
        'stock, served over buttered courgette ribbons in place of pasta. '
        'Makes a batch for the freezer. Contains celery, a common allergen, '
        'and milk from the butter.',
    ingredients: [
      '500 g minced beef',
      '1 onion, finely chopped',
      '1 carrot, finely chopped',
      '1 celery stick, finely chopped',
      '2 tbsp butter or ghee',
      '400 g tin chopped tomatoes, no added salt',
      '250 ml homemade meat stock, no salt',
      '1 bay leaf',
      '3 courgettes',
      'Grated hard cheese, to serve',
    ],
    steps: [
      'Soften the onion, carrot, and celery in half the butter over a low '
          'heat for 10 minutes.',
      'Turn up the heat, add the beef, and break it up until it is browned '
          'all over.',
      'Add the tomatoes, stock, and bay leaf, and simmer gently with the lid '
          'ajar for at least an hour, stirring now and then, until thick and '
          'rich.',
      'Shave the courgettes into ribbons with a peeler and toss them in the '
          'rest of the butter in a hot pan for 2 minutes until just soft.',
      'Serve the toddler a small nest of ribbons cut into short lengths with '
          'ragù spooned over and a little cheese, cooled to warm. Freeze the '
          'leftover ragù in portions.',
    ],
    foodIds: [
      'beef',
      'carrot',
      'celery',
      'tomato',
      'meat_stock',
      'courgette',
      'butter',
      'cheese',
    ],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_cod_cheese_herb_crust',
    title: 'Cod with a cheese and herb crust and peas',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'main',
    summary:
        'Thick cod fillets baked under a crust of grated cheese, parsley, and '
        'butter instead of breadcrumbs, with buttered peas. Mild white fish '
        'for iodine and protein. Contains fish and milk, both common '
        'allergens.',
    ingredients: [
      '3 thick skinless cod fillets',
      '60 g finely grated hard cheese',
      'A handful of parsley, finely chopped',
      '2 tbsp soft butter',
      'Grated zest of ½ lemon',
      '300 g frozen peas',
    ],
    steps: [
      'Heat the oven to 200°C and lay the cod in a buttered baking dish.',
      'Mash the cheese, parsley, lemon zest, and most of the butter together '
          'and press a thin layer over the top of each fillet.',
      'Bake for 12 to 15 minutes until the crust is golden and the fish is '
          'opaque all the way through and flakes easily.',
      'Cook the peas in boiling water for 3 minutes, drain, and toss with the '
          'rest of the butter.',
      'Flake the toddler\'s portion, checking carefully for bones, and lightly '
          'squash the peas so they do not roll. Cool to warm.',
    ],
    foodIds: ['cod', 'cheese', 'butter', 'green_pea'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_beef_liver_burgers',
    title: 'Beef and liver burgers, the weekly one',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'main',
    summary:
        'Beef burgers with a little liver blended in, so the whole family gets '
        'iron, vitamin A, and B vitamins without a plate of liver. Keep this '
        'to about once a week because of the vitamin A. Contains milk if '
        'served with the butter.',
    ingredients: [
      '450 g minced beef',
      '75 g beef or lamb liver, trimmed',
      '1 small onion, finely grated',
      '1 tsp dried oregano',
      '1 tbsp ghee or butter',
      'A large head of broccoli, in florets',
      'Butter, to serve',
    ],
    steps: [
      'Blend the liver to a smooth purée, then mix it into the beef with the '
          'onion and oregano until you cannot see streaks.',
      'Shape into burgers about the size of your palm and chill for 15 '
          'minutes so they hold together.',
      'Fry in the ghee over a medium heat for 5 to 6 minutes a side until '
          'cooked right through with no pink in the centre.',
      'Steam the broccoli until soft and toss it with a little butter.',
      'For the toddler, cut a small burger into thin strips and serve with '
          'broccoli florets to hold, cooled to warm. Offer liver about once a '
          'week, and freeze extra burgers.',
    ],
    foodIds: ['beef', 'liver', 'ghee', 'broccoli', 'butter'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_pork_shoulder_red_cabbage',
    title: 'Braised pork shoulder with red cabbage and apple',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'main',
    summary:
        'Pork shoulder braised slowly until it falls apart, with red cabbage '
        'and apple softened in the pork fat. No sugar needed: the apple does '
        'the sweetening. A weekend pot that feeds the week.',
    ingredients: [
      '1 kg boneless pork shoulder, in large chunks',
      '1 tbsp ghee',
      '1 onion, sliced',
      '½ red cabbage, finely shredded',
      '1 apple, peeled and grated',
      '1 tbsp cider vinegar',
      '300 ml homemade meat stock, no salt',
      '2 bay leaves',
    ],
    steps: [
      'Heat the oven to 160°C. Brown the pork in the ghee in a lidded '
          'casserole, then lift it out.',
      'Soften the onion in the same pan, then stir in the cabbage, apple, '
          'vinegar, and bay leaves.',
      'Return the pork, pour in the stock, cover, and cook in the oven for '
          '2½ to 3 hours until the pork pulls apart with a fork.',
      'For the toddler, shred a portion of pork into fine strands, remove '
          'any gristle, and mix it with the soft cabbage. Cool to warm.',
    ],
    foodIds: ['pork', 'ghee', 'cabbage', 'apple', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_mild_prawn_coconut_curry',
    title: 'Mild prawn and coconut curry with cauliflower',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'main',
    summary:
        'Prawns and spinach in a gentle coconut and tomato sauce, served over '
        'grated cauliflower cooked in ghee instead of rice. Fragrant rather '
        'than hot. Contains shellfish, a common allergen.',
    ingredients: [
      '350 g raw peeled king prawns',
      '1 tbsp ghee',
      '1 onion, finely chopped',
      '1 thumb of ginger, grated',
      '1 tsp mild curry powder',
      '½ tsp ground turmeric',
      '400 ml tin full-fat coconut milk',
      '200 g tinned chopped tomatoes, no added salt',
      '100 g spinach',
      '1 cauliflower, grated',
    ],
    steps: [
      'Soften the onion and ginger in half the ghee for 8 minutes, then stir '
          'in the spices for a minute.',
      'Add the coconut milk and tomatoes and simmer for 10 minutes until '
          'slightly thickened.',
      'Add the prawns and spinach and simmer for 4 to 5 minutes until the '
          'prawns are pink and opaque all the way through.',
      'Meanwhile, cook the grated cauliflower in the rest of the ghee for 5 '
          'minutes, stirring, until tender.',
      'Chop the toddler\'s prawns into small pieces and serve them in a '
          'little sauce over the cauliflower, cooled to warm. Leave out any '
          'chilli until the adults\' plates.',
    ],
    foodIds: ['shrimp', 'ghee', 'coconut', 'tomato', 'spinach', 'cauliflower'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_turkey_courgette_meatloaf',
    title: 'Turkey and courgette meatloaf, no breadcrumbs',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'main',
    summary:
        'A moist meatloaf of turkey thigh mince, grated courgette, egg, and '
        'cheese, with no breadcrumbs, served with buttery green beans. Slices '
        'well cold for the next day. Contains egg and milk, both common '
        'allergens.',
    ingredients: [
      '500 g turkey thigh mince',
      '1 courgette, coarsely grated and squeezed dry',
      '1 egg',
      '50 g grated hard cheese',
      '1 small onion, finely grated',
      '1 tsp dried thyme',
      '300 g green beans, trimmed',
      '1 tbsp butter',
    ],
    steps: [
      'Heat the oven to 180°C and line a small loaf tin with baking paper.',
      'Mix the turkey, courgette, egg, cheese, onion, and thyme until just '
          'combined, then press into the tin.',
      'Bake for 45 to 50 minutes until firm, the juices run clear, and the '
          'centre is piping hot all the way through. Rest for 10 minutes.',
      'Steam the green beans until soft and toss them with the butter.',
      'Cut the toddler a thin slice and break it into small pieces, and give '
          'whole soft green beans to hold. Cool to warm.',
    ],
    foodIds: ['turkey', 'courgette', 'egg', 'cheese', 'green_bean', 'butter'],
    ancestral: true,
  ),

  // ---- 18 mo+ snack ----
  Recipe(
    id: 'rt_egg_avocado_dip_peppers',
    title: 'Egg and avocado dip with roasted pepper strips',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'snack',
    summary:
        'Hard-boiled eggs mashed with ripe avocado and lemon into a thick dip, '
        'with soft roasted pepper strips for scooping. Fat and protein to '
        'carry a toddler to the next meal. Contains egg, a common allergen.',
    ingredients: [
      '3 eggs',
      '1 ripe avocado',
      'A squeeze of lemon',
      '2 red or yellow peppers, cut into wide strips',
      '1 tbsp olive oil',
    ],
    steps: [
      'Roast the pepper strips with the oil at 200°C for 20 to 25 minutes '
          'until soft and slightly charred, then cool.',
      'Hard-boil the eggs for 10 minutes so the yolks are fully set, cool, '
          'and peel.',
      'Mash the eggs with the avocado and lemon to a thick, mostly smooth '
          'dip.',
      'Give the toddler a small bowl of dip with a few soft pepper strips; '
          'peel off any loose skin first.',
    ],
    foodIds: ['egg', 'avocado', 'bell_pepper'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_pear_fingers_cashew_butter',
    title: 'Ripe pear fingers with cashew butter',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'snack',
    summary:
        'Soft ripe pear cut into fingers and dipped in thinned cashew butter, '
        'for a little fruit balanced by fat and protein. Contains cashew, a '
        'common allergen.',
    ingredients: [
      '2 very ripe pears',
      '3 tbsp smooth cashew butter, no added salt or sugar',
      '1 to 2 tbsp warm water or full-fat yoghurt',
    ],
    steps: [
      'Peel the pears if the skin is tough, core them, and cut into long '
          'fingers. The pear should be soft enough to squash between your '
          'finger and thumb; if it is not, steam the fingers for 2 to 3 '
          'minutes.',
      'Stir the cashew butter with the warm water or yoghurt until it is '
          'thin and smooth.',
      'Serve the fingers with the thinned cashew butter to dip or spread '
          'thinly over them. Never serve whole nuts.',
    ],
    foodIds: ['pear', 'cashew_butter'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_tomato_mozzarella_plate',
    title: 'Quartered tomatoes with mozzarella and basil',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'snack',
    summary:
        'Sweet cherry tomatoes quartered lengthways with soft pasteurised '
        'mozzarella and torn basil, dressed in olive oil. A cool snack plate '
        'to share. Contains milk, a common allergen.',
    ingredients: [
      '250 g cherry tomatoes',
      '1 ball pasteurised mozzarella',
      'A few basil leaves',
      '1 tbsp olive oil',
    ],
    steps: [
      'Cut every cherry tomato lengthways into quarters, top to bottom; never '
          'serve them whole or halved to a toddler.',
      'Tear the mozzarella into small soft pieces.',
      'Toss with the torn basil and olive oil.',
      'Put the toddler\'s share on a separate plate and check every tomato '
          'is quartered before serving.',
    ],
    foodIds: ['tomato', 'cheese'],
    ancestral: true,
  ),

  // ---- 18 mo+ base ----
  Recipe(
    id: 'rt_fish_frame_stock',
    title: 'Quick fish-frame stock',
    collection: 'Ancestral',
    stage: '18 mo+',
    mealType: 'base',
    summary:
        'A light, quick stock from the bones and heads of white fish, for '
        'fish soups, poaching, and sauces. Iodine and gelatine with a short '
        'cooking time. Contains fish, a common allergen.',
    ingredients: [
      '1 kg white fish frames and heads, such as cod or haddock, gills '
          'removed (ask the fishmonger)',
      '1 onion, sliced',
      '1 leek, white part only, sliced',
      'A few parsley stalks',
      '1 bay leaf',
      '1.5 litres cold water',
    ],
    steps: [
      'Rinse the frames under cold water until the water runs clear.',
      'Put everything in a large pan, bring slowly to a simmer, and skim off '
          'any foam.',
      'Simmer very gently for 25 to 30 minutes, no longer, or the stock turns '
          'bitter; add no salt.',
      'Strain through a fine sieve lined with a clean cloth so that no small '
          'bones pass through.',
      'Cool quickly, refrigerate for up to 2 days, or freeze in portions.',
    ],
    foodIds: ['cod', 'haddock'],
    ancestral: true,
  ),

  // =========================================================================
  // 24 mo+  (3 breakfast, 7 main, 2 snack). Grains, starchy roots, and
  // legumes join, prepared the ancestral way and built around animal food.
  // =========================================================================

  // ---- 24 mo+ breakfast ----
  Recipe(
    id: 'rt_soaked_oat_porridge',
    title: 'Soaked oat porridge with butter and blueberries',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'breakfast',
    summary:
        'Oats soaked overnight with a spoon of yoghurt, then cooked slowly in '
        'whole milk and finished with butter and blueberries. Soaking softens '
        'the oats and makes them gentler to digest. Contains milk, a common '
        'allergen; oats are not always gluten-free.',
    ingredients: [
      '150 g porridge oats',
      '300 ml warm water',
      '1 tbsp full-fat plain yoghurt or kefir',
      '400 ml whole milk',
      '2 tbsp butter',
      '150 g blueberries',
      'A pinch of cinnamon (optional)',
    ],
    steps: [
      'The night before, stir the oats, warm water, and yoghurt together in a '
          'pan, cover, and leave at room temperature.',
      'In the morning, add the milk and cook over a low heat for 8 to 10 '
          'minutes, stirring, until thick and creamy.',
      'Stir in the butter and cinnamon.',
      'Cut the toddler\'s blueberries in half or squash them flat, and '
          'serve their porridge in a smaller bowl, cooled to warm, with the '
          'berries stirred through.',
    ],
    foodIds: ['oats', 'yoghurt', 'whole_milk', 'butter', 'blueberry'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_sourdough_scrambled_egg',
    title: 'Buttered sourdough fingers with scrambled egg',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'breakfast',
    summary:
        'Long-fermented sourdough toast, generously buttered, with soft '
        'scrambled eggs cooked through. Slow fermentation is the traditional '
        'way to prepare wheat. Contains wheat (gluten), egg, and milk, all '
        'common allergens.',
    ingredients: [
      '3 to 4 slices of sourdough bread, made with a long ferment',
      '6 eggs',
      '3 tbsp butter',
      'A splash of whole milk',
      'Snipped chives (optional)',
    ],
    steps: [
      'Toast the sourdough lightly and spread it with butter while warm.',
      'Whisk the eggs with the milk. Melt a tablespoon of butter in a pan '
          'over a low heat and stir the eggs slowly until fully set with no '
          'runny egg left.',
      'Scatter over the chives.',
      'For the toddler, trim the crusts if they are very hard, cut the toast '
          'into thin fingers, and serve with a spoon of egg on the side. Cool '
          'to warm.',
    ],
    foodIds: ['bread', 'egg', 'butter', 'whole_milk'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_sweet_potato_egg_hash',
    title: 'Sweet potato hash with eggs baked in',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'breakfast',
    summary:
        'Diced sweet potato fried slowly in ghee with onion and spinach, then '
        'baked with eggs nestled in until fully set. Starch arrives cooked in '
        'animal fat alongside protein. Contains egg, a common allergen, and '
        'ghee is made from milk.',
    ingredients: [
      '2 medium sweet potatoes, peeled and cut into small dice',
      '2 tbsp ghee',
      '1 onion, chopped',
      '100 g spinach',
      '½ tsp smoked paprika',
      '5 eggs',
    ],
    steps: [
      'Fry the sweet potato in the ghee in a wide ovenproof pan over a '
          'medium heat for 12 to 15 minutes, turning, until soft and browned.',
      'Add the onion and paprika for 5 minutes, then stir in the spinach '
          'until it wilts.',
      'Make five hollows, crack an egg into each, and bake at 190°C for 10 '
          'to 12 minutes until the whites and yolks are completely firm.',
      'Give the toddler an egg chopped into small pieces with a spoon of the '
          'hash, sweet potato squashed lightly. Cool to warm.',
    ],
    foodIds: ['sweet_potato', 'ghee', 'spinach', 'egg'],
    ancestral: true,
  ),

  // ---- 24 mo+ main ----
  Recipe(
    id: 'rt_chicken_stock_rice_peas',
    title: 'One-pot chicken and stock rice with peas',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'main',
    summary:
        'Chicken thighs and rice cooked together in homemade stock with butter '
        'and peas, so every grain soaks up gelatine and fat. A gentle first '
        'family rice dish. Contains milk, a common allergen.',
    ingredients: [
      '6 boneless chicken thighs, cut into chunks',
      '250 g long-grain or basmati rice',
      '2 tbsp butter',
      '1 onion, finely chopped',
      '1 garlic clove, crushed',
      '600 ml homemade chicken or meat stock, no salt',
      '200 g frozen peas',
      'A handful of parsley, chopped',
    ],
    steps: [
      'Rinse the rice, then soak it in cold water for 30 minutes and drain.',
      'Brown the chicken in the butter in a lidded pan, then add the onion '
          'and garlic and cook for 5 minutes more.',
      'Stir in the rice to coat it in the fat, pour in the stock, and bring '
          'to the boil. Cover and cook on the lowest heat for 15 minutes.',
      'Scatter the peas on top, cover again, and leave off the heat for 10 '
          'minutes until the rice is tender and the chicken is cooked through.',
      'Fork through the parsley. For the toddler, cut the chicken into small '
          'pieces and lightly squash the peas. Cool to warm; cool and '
          'refrigerate leftover rice within an hour.',
    ],
    foodIds: ['chicken', 'rice', 'butter', 'meat_stock', 'green_pea'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_lamb_shank_white_beans',
    title: 'Lamb shanks with soaked white beans',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'main',
    summary:
        'Lamb shanks braised for hours with soaked white beans, tomato, and '
        'rosemary until the meat slips off the bone and the beans are creamy '
        'with lamb fat. A slow pot for a cold day.',
    ingredients: [
      '200 g dried cannellini or haricot beans',
      '3 lamb shanks',
      '1 tbsp ghee or lamb dripping',
      '1 onion, chopped',
      '2 carrots, chopped',
      '2 garlic cloves, sliced',
      '400 g tin chopped tomatoes, no added salt',
      '500 ml homemade meat stock, no salt',
      '2 sprigs of rosemary',
    ],
    steps: [
      'Soak the beans in plenty of cold water for 12 to 24 hours, then drain, '
          'rinse, and boil them in fresh water for 10 minutes. Drain.',
      'Heat the oven to 160°C. Brown the shanks in the fat in a casserole, '
          'lift them out, and soften the onion, carrot, and garlic.',
      'Return the shanks with the beans, tomatoes, stock, and rosemary. Cover '
          'and cook for 3 hours until the lamb falls from the bone and the '
          'beans are completely soft.',
      'For the toddler, pull the meat from a shank, discard every bone and '
          'any gristle, shred it finely, and mash some of the beans into the '
          'sauce. Cool to warm.',
    ],
    foodIds: ['white_bean', 'lamb', 'ghee', 'carrot', 'tomato', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_beef_red_lentil_keema',
    title: 'Beef and red lentil keema',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'main',
    summary:
        'Minced beef cooked down with soaked red lentils, tomato, peas, and '
        'warm spices in ghee, finished with a spoon of yoghurt. Lentils '
        'stretch the meat and thicken the sauce. Contains milk, a common '
        'allergen.',
    ingredients: [
      '100 g red lentils',
      '400 g minced beef',
      '2 tbsp ghee',
      '1 onion, finely chopped',
      '1 thumb of ginger, grated',
      '2 garlic cloves, crushed',
      '1 tsp ground cumin',
      '1 tsp garam masala',
      '200 g tinned chopped tomatoes, no added salt',
      '300 ml homemade meat stock, no salt',
      '150 g frozen peas',
      'Full-fat plain yoghurt, to serve',
    ],
    steps: [
      'Soak the lentils in warm water for a few hours or overnight, then '
          'drain and rinse well.',
      'Soften the onion, ginger, and garlic in the ghee for 8 minutes, add '
          'the spices for a minute, then brown the beef.',
      'Add the lentils, tomatoes, and stock and simmer gently for 25 to 30 '
          'minutes until the lentils have collapsed and the sauce is thick.',
      'Stir in the peas for the last 5 minutes.',
      'Spoon the toddler\'s portion into a bowl with a swirl of yoghurt to '
          'cool it, and squash the peas lightly. Add chilli only to the '
          'adults\' plates.',
    ],
    foodIds: [
      'lentil',
      'beef',
      'ghee',
      'tomato',
      'meat_stock',
      'green_pea',
      'yoghurt',
    ],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_shepherds_pie_butter_mash',
    title: 'Shepherd\'s pie with a buttery potato top',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'main',
    summary:
        'Lamb mince slow-cooked in stock with carrot and peas under a potato '
        'mash made rich with butter and whole milk, so the starch comes '
        'with plenty of fat. Contains milk, a common allergen. Makes a batch.',
    ingredients: [
      '500 g minced lamb',
      '1 onion, finely chopped',
      '2 carrots, finely diced',
      '1 tbsp tomato purée',
      '400 ml homemade meat stock, no salt',
      '1 tsp dried thyme',
      '150 g frozen peas',
      '900 g floury potatoes, peeled and cut into chunks',
      '60 g butter',
      '100 ml whole milk',
    ],
    steps: [
      'Brown the lamb in a dry pan, then add the onion and carrot and cook for '
          '8 minutes.',
      'Stir in the tomato purée, stock, and thyme and simmer for 30 minutes '
          'until rich and thick; add the peas at the end.',
      'Boil the potatoes until very soft, drain, and mash with the butter and '
          'warm milk until smooth.',
      'Spoon the lamb into a dish, spread the mash on top, and bake at 200°C '
          'for 25 minutes until golden and bubbling.',
      'Serve the toddler a scoop with the filling and mash mixed together, '
          'peas squashed, cooled to warm. Freeze the rest in portions.',
    ],
    foodIds: [
      'lamb',
      'carrot',
      'meat_stock',
      'green_pea',
      'potato',
      'butter',
      'whole_milk',
    ],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_salmon_duck_fat_sweet_potato',
    title: 'Roast salmon with duck-fat sweet potato wedges',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'main',
    summary:
        'Sweet potato wedges roasted in duck fat until crisp at the edges, '
        'with salmon baked on the same tray and soft broccoli. Oily fish, '
        'animal fat, and a starchy root in a single tin. Contains fish, a common '
        'allergen.',
    ingredients: [
      '3 salmon fillets, skinless',
      '3 medium sweet potatoes, cut into wedges',
      '2 tbsp duck fat',
      '1 head of broccoli, in florets',
      '1 lemon, cut into wedges',
      'A pinch of smoked paprika',
    ],
    steps: [
      'Heat the oven to 200°C. Melt the duck fat in a roasting tin, toss the '
          'wedges in it with the paprika, and roast for 25 minutes.',
      'Turn the wedges, add the broccoli to the tin and the salmon on top, '
          'and roast for 12 to 15 minutes until the salmon is opaque all the '
          'way through and flakes easily.',
      'Squeeze over the lemon.',
      'For the toddler, flake the salmon and check for bones, and cut the '
          'wedges into soft fingers, peeling off any very crisp edges. Cool to '
          'warm.',
    ],
    foodIds: ['salmon', 'sweet_potato', 'broccoli'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_mild_pork_kidney_bean_chilli',
    title: 'Mild pork and kidney bean chilli',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'main',
    summary:
        'Minced pork and properly boiled kidney beans in a smoky tomato sauce '
        'with peppers, served with yoghurt and avocado. Warm spice for '
        'flavour, with the heat added only for the adults. Contains milk, a '
        'common allergen.',
    ingredients: [
      '150 g dried kidney beans',
      '500 g minced pork',
      '1 tbsp ghee',
      '1 onion, chopped',
      '1 red pepper, diced',
      '2 garlic cloves, crushed',
      '1 tsp ground cumin',
      '1 tsp smoked paprika',
      '400 g tin chopped tomatoes, no added salt',
      '300 ml homemade meat stock, no salt',
      'Full-fat plain yoghurt and 1 ripe avocado, to serve',
    ],
    steps: [
      'Soak the kidney beans for at least 12 hours. Drain, cover with fresh '
          'water, and boil hard for at least 10 minutes, then simmer for about '
          'an hour until completely soft. Raw or undercooked kidney beans are '
          'toxic, so never skip the hard boil or use a slow cooker for this '
          'step.',
      'Brown the pork in the ghee, then add the onion, pepper, garlic, and '
          'spices and cook for 8 minutes.',
      'Add the tomatoes, stock, and cooked beans and simmer for 30 minutes '
          'until thick.',
      'For the toddler, mash some of the beans into the sauce and serve with '
          'yoghurt and small pieces of avocado, cooled to warm. Add chilli to '
          'the adults\' bowls only.',
    ],
    foodIds: [
      'kidney_bean',
      'pork',
      'ghee',
      'bell_pepper',
      'tomato',
      'meat_stock',
      'yoghurt',
      'avocado',
    ],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_haddock_kedgeree',
    title: 'Haddock kedgeree with egg and butter',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'main',
    summary:
        'Rice cooked in fish-poaching milk and stock with gentle curry spice, '
        'folded through with flaked haddock, chopped egg, and plenty of '
        'butter. Use unsmoked haddock to keep the salt down. Contains fish, '
        'egg, and milk, all common allergens.',
    ingredients: [
      '400 g unsmoked haddock fillet',
      '300 ml whole milk',
      '250 g basmati rice, rinsed and soaked for 30 minutes',
      '3 tbsp butter',
      '1 onion, finely chopped',
      '1 tsp mild curry powder',
      '300 ml fish or meat stock, no salt',
      '3 eggs',
      'A handful of parsley, chopped',
    ],
    steps: [
      'Poach the haddock in the milk for 6 to 8 minutes until it flakes. '
          'Lift it out, flake it, and remove every bone; keep the milk.',
      'Hard-boil the eggs for 10 minutes, cool, peel, and chop.',
      'Soften the onion in the butter, stir in the curry powder and drained '
          'rice, then add the poaching milk and stock. Cover and cook on a low '
          'heat for 15 minutes until the rice is tender.',
      'Fold in the haddock, eggs, and parsley.',
      'Serve the toddler a small bowl with the fish and egg in small pieces, '
          'cooled to warm. Cool and refrigerate leftover rice within an hour.',
    ],
    foodIds: ['haddock', 'whole_milk', 'rice', 'butter', 'egg', 'meat_stock'],
    ancestral: true,
  ),

  // ---- 24 mo+ snack ----
  Recipe(
    id: 'rt_chickpea_yoghurt_hummus',
    title: 'Soaked chickpea hummus with yoghurt',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'snack',
    summary:
        'Hummus made from soaked and long-cooked chickpeas, whipped with '
        'tahini, olive oil, and a spoon of yoghurt for extra fat, with soft '
        'vegetable fingers to dip. Contains sesame and milk, both common '
        'allergens.',
    ingredients: [
      '150 g dried chickpeas',
      '3 tbsp tahini',
      '3 tbsp full-fat plain yoghurt',
      '3 tbsp olive oil',
      'Juice of ½ lemon',
      '1 small garlic clove',
      'Steamed carrot sticks and roasted pepper strips, to serve',
    ],
    steps: [
      'Soak the chickpeas overnight, drain, and simmer in fresh water for 1½ '
          'to 2 hours until they crush easily between your fingers.',
      'Drain, keeping some cooking water, and blend while warm with the '
          'tahini, yoghurt, olive oil, lemon, and garlic until very smooth, '
          'loosening with cooking water.',
      'Serve with the steamed carrot sticks and pepper strips, soft enough to '
          'squash.',
      'Give the toddler a small dish of hummus thin enough to scoop. Keep '
          'the rest in the fridge for 3 days.',
    ],
    foodIds: ['chickpea', 'tahini', 'yoghurt', 'carrot', 'bell_pepper'],
    ancestral: true,
  ),
  Recipe(
    id: 'rt_potato_cheese_cakes',
    title: 'Potato and cheese cakes in butter',
    collection: 'Ancestral',
    stage: '24 mo+',
    mealType: 'snack',
    summary:
        'Leftover mashed potato bound with egg and cheese and fried in butter '
        'until golden, with no flour. Easy to hold and good cold the next day. '
        'Contains egg and milk, both common allergens.',
    ingredients: [
      '400 g cold mashed potato, made without salt',
      '1 egg',
      '60 g grated hard cheese',
      '2 spring onions, finely sliced',
      '2 tbsp butter',
    ],
    steps: [
      'Mix the potato, egg, cheese, and spring onions until evenly combined.',
      'Shape into small flat cakes about the size of a biscuit.',
      'Fry in the butter over a medium heat for 4 minutes a side until '
          'golden and piping hot in the middle.',
      'Cool the toddler\'s cakes to warm and cut each one in half to hold. '
          'Keep leftovers in the fridge and eat within 2 days.',
    ],
    foodIds: ['potato', 'egg', 'cheese', 'butter'],
    ancestral: true,
  ),
];
