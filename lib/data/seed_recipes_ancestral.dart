/// Ancestral recipe library for the Meals tab. Forty-eight original recipes,
/// sixteen per stage, written for this app in our own words. The judgement is
/// the ancestral canon (docs/ancestral_canon_v1.md): animal foods and their
/// fats first, well-cooked whole egg early, oily fish, a small weekly serving of
/// liver, soft non-starchy vegetables, low-sugar fruit, and fermented dairy
/// once tolerated. Under decision A there are no grains, starches, or legumes
/// in this library before 24 months.
///
/// Safety floor, never crossed: everything from an animal is cooked through;
/// dairy is pasteurised, full-fat, and unsweetened; no honey, added sugar, or
/// added salt; no seed oils; liver is small and about once a week; shapes
/// follow the stage (mashes and soft strips at 6 mo+, pea-sized pieces from
/// 9 mo+). Recipes that contain egg, milk, fish, or shellfish say so, because
/// those are common allergens. This is the app's point of view, offered for
/// information. It is not medical advice; talk to your health visitor or GP
/// about any approach you take with your baby.
library;

import 'seed_recipes.dart';

const List<Recipe> kAncestralRecipes = [
  // =========================================================================
  // 6 mo+  (4 breakfast, 8 main, 3 snack, 1 base)
  // =========================================================================

  // ---- 6 mo+ breakfast ----
  Recipe(
    id: 'ra_yolk_avocado_mash',
    title: 'Egg and avocado mash',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'breakfast',
    summary:
        'A hard-cooked egg gives choline and iron, and avocado and warm '
        'stock bring the fat and gelatine that help baby use them. Contains '
        'egg, a common allergen.',
    ingredients: [
      '1 egg',
      '¼ ripe avocado',
      '1 to 2 tbsp warm homemade meat stock, no salt',
    ],
    steps: [
      'Lower the egg into boiling water and cook for 10 minutes so the yolk '
          'is fully hard, then cool it in cold water.',
      'Peel the egg. Mash the yolk and chop the white very finely; offering '
          'both early is the allergy guidance.',
      'Mash the egg with the avocado, loosening with warm stock until it '
          'slides off a spoon.',
      'Check it is only warm, then offer on a pre-loaded spoon or as a thick '
          'smear baby can scoop.',
    ],
    foodIds: ['egg', 'avocado', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_crumbled_yolk_warm_stock',
    title: 'Crumbled egg in warm stock',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'breakfast',
    summary:
        'The simplest canon breakfast: hard-cooked egg for choline and iron, '
        'stirred into gelatine-rich stock so it is easy to swallow. Contains '
        'egg, a common allergen, and milk if you add the butter.',
    ingredients: [
      '1 egg',
      '3 tbsp homemade meat stock, no salt',
      '1 tsp butter (optional)',
    ],
    steps: [
      'Hard-boil the egg for 10 minutes, cool it under the tap, and peel it.',
      'Warm the stock gently in a small pan with the butter until it just '
          'steams; do not let it boil hard.',
      'Mash the yolk and chop the white very finely, then stir both into '
          'the stock to a loose, spoonable slurry.',
      'Let it cool to warm and feed from a spoon, a little at a time.',
    ],
    foodIds: ['egg', 'meat_stock', 'butter'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_kefir_crushed_blueberries',
    title: 'Kefir with crushed blueberries',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'breakfast',
    summary:
        'Full-fat kefir brings live cultures and fat for the gut, with a few '
        'blueberries crushed flat for taste and colour. Contains milk, a '
        'common allergen.',
    ingredients: [
      '3 tbsp full-fat plain kefir, pasteurised and unsweetened',
      '5 or 6 blueberries',
      'A pinch of ground cinnamon (optional)',
    ],
    steps: [
      'Press each blueberry flat between finger and thumb, then chop the '
          'skins small.',
      'Stir the berries and cinnamon through the kefir; it should be thick '
          'enough to stay on a spoon.',
      'Serve cool on a pre-loaded spoon, and keep the portion small while '
          'kefir is new.',
    ],
    foodIds: ['kefir', 'blueberry'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_butter_soft_courgette_ribbons',
    title: 'Butter-soft courgette ribbons',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'breakfast',
    summary:
        'A first vegetable with its fat built in: courgette cooked floppy in '
        'butter so the fat-soluble vitamins come with it. Contains milk, a '
        'common allergen.',
    ingredients: [
      '½ small courgette',
      '1 tsp butter',
      '1 tbsp water or homemade meat stock, no salt',
    ],
    steps: [
      'Peel the courgette into wide ribbons with a vegetable peeler, '
          'stopping at the seedy core.',
      'Melt the butter in a small pan over a low heat, add the ribbons and '
          'the water, and cover.',
      'Cook for 5 to 6 minutes until the ribbons droop and squash easily '
          'between two fingers.',
      'Cool to warm and offer as finger-length ribbons to hold, or chop and '
          'mash for a spoon.',
    ],
    foodIds: ['courgette', 'butter'],
    ancestral: true,
  ),

  // ---- 6 mo+ main ----
  Recipe(
    id: 'ra_beef_in_its_own_stock',
    title: 'Beef cooked in its own stock',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'main',
    summary:
        'The canon\'s first meal: slow-cooked beef for haem iron and zinc, '
        'served in the gelatine-rich liquid it cooked in. Makes a batch.',
    ingredients: [
      '400 g beef shin or chuck, in large pieces',
      '1 litre water',
      '1 carrot, halved',
      '1 bay leaf',
    ],
    steps: [
      'Put the beef, water, carrot, and bay leaf in a pan, bring to a '
          'simmer, and skim off any foam.',
      'Cover and cook very gently for 3 hours on the hob, or 6 to 8 hours '
          'in a slow cooker, until the meat falls apart.',
      'Lift out a piece, pull it into finger-length strips along the grain, '
          'and moisten with a spoon of the stock.',
      'Serve warm, not hot, as a strip to hold or shredded finely into a '
          'spoon of stock. Freeze the rest in portions.',
    ],
    foodIds: ['beef', 'meat_stock', 'carrot'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_slow_lamb_shoulder_strips',
    title: 'Slow lamb shoulder strips',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'main',
    summary:
        'Lamb shoulder cooked until it shreds gives iron, zinc, and plenty '
        'of fat, and the long cook turns the connective tissue into '
        'gelatine. Makes a batch.',
    ingredients: [
      '500 g lamb shoulder on the bone',
      '500 ml water',
      '1 sprig rosemary',
      '1 clove garlic, whole',
    ],
    steps: [
      'Put everything in a lidded dish or slow cooker, cover, and cook at '
          '150°C for 4 hours, or on low for 8 hours.',
      'Let it cool enough to handle, then pull the meat from the bone and '
          'discard any gristle.',
      'Tear into soft finger-length strips, dipping each in the cooking '
          'juices so it stays moist.',
      'Offer one or two strips at a time, cooled to warm. Keep the juices '
          'as stock for other meals.',
    ],
    foodIds: ['lamb', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_salmon_flaked_into_avocado',
    title: 'Salmon flaked into avocado',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'main',
    summary:
        'Oily fish for DHA and vitamin D, folded into avocado for a soft, '
        'fatty mash. Contains fish, a common allergen.',
    ingredients: [
      '40 g salmon fillet, skin on',
      '¼ ripe avocado',
      '1 tsp olive oil',
      'A squeeze of lemon (optional)',
    ],
    steps: [
      'Steam or bake the salmon for about 10 minutes until it is opaque all '
          'the way through and flakes easily.',
      'Remove the skin and run your fingers through the flesh to find and '
          'pull out every bone.',
      'Mash the avocado with the olive oil, then fork in the flaked salmon '
          'until no large pieces remain.',
      'Serve warm on a spoon, or thick enough to scoop by hand.',
    ],
    foodIds: ['salmon', 'avocado'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_chicken_thigh_broccoli_stock',
    title: 'Chicken thigh and broccoli in stock',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'main',
    summary:
        'Dark thigh meat has more iron and fat than breast, and cooking it '
        'in stock with broccoli keeps everything soft and adds gelatine. '
        'Makes a batch.',
    ingredients: [
      '2 chicken thighs, bone in, skin on',
      '400 ml homemade meat stock, no salt',
      '3 broccoli florets',
    ],
    steps: [
      'Simmer the thighs in the stock, covered, for 40 minutes until the '
          'meat pulls cleanly from the bone.',
      'Add the broccoli for the last 10 minutes so it cooks until it '
          'squashes easily.',
      'Shred the chicken finely, discarding the skin and bone, chop the '
          'broccoli small, and moisten with stock.',
      'Cool to warm and offer as a thick spoonable mix, or a floret and a '
          'strip of thigh to hold.',
    ],
    foodIds: ['chicken', 'broccoli', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_first_liver_spoon',
    title: 'First liver pâté on a spoon',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'main',
    summary:
        'A small taste of liver gives iron, vitamin A, and B vitamins in a '
        'form baby can absorb; keep it to about once a week because of the '
        'vitamin A. Contains milk, a common allergen.',
    ingredients: [
      '50 g chicken livers, trimmed',
      '1 tbsp butter',
      '2 tbsp homemade meat stock, no salt',
      '1 small sprig thyme (optional)',
    ],
    steps: [
      'Rinse the livers, cut away any green or stringy parts, and pat them '
          'dry.',
      'Cook in the butter over a medium heat for 6 to 8 minutes, turning, '
          'until no pink remains in the centre when one is cut open.',
      'Blend with the stock and thyme until completely smooth, adding more '
          'stock if it is stiff.',
      'Offer a teaspoon on its own or stirred into yolk or avocado, about '
          'once a week. Freeze the rest in teaspoon portions.',
    ],
    foodIds: ['liver', 'butter', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_sardine_avocado_mash',
    title: 'Sardine and avocado mash',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'main',
    summary:
        'Tinned sardines are a cheap oily fish full of DHA, calcium, and '
        'iron, and avocado smooths them into a mash. Contains fish, a '
        'common allergen.',
    ingredients: [
      '1 tinned sardine, from a tin in spring water or olive oil',
      '¼ ripe avocado',
      '1 tsp olive oil',
    ],
    steps: [
      'Choose a tin with no added salt if you can find one; otherwise rinse '
          'the sardine under the tap and drain it well.',
      'Split the fish open and lift out the spine and any bones you can '
          'see.',
      'Mash the fish finely with a fork, then mash in the avocado and olive '
          'oil.',
      'Press the mash flat with the fork to check for stray bones, then '
          'serve from a spoon.',
    ],
    foodIds: ['sardine', 'avocado'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_shredded_beef_soft_carrot',
    title: 'Shredded beef with soft carrot',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'main',
    summary:
        'Haem iron from beef, a little sweetness from carrot cooked soft in '
        'stock, and no starch in the bowl.',
    ingredients: [
      '2 tbsp slow-cooked beef, shredded (see Beef cooked in its own stock)',
      '½ carrot',
      '4 tbsp homemade meat stock, no salt',
      '1 tsp beef dripping or the fat from the top of the stock',
    ],
    steps: [
      'Cut the carrot into finger-length batons and simmer in the stock for '
          '15 minutes until a fork slides straight through.',
      'Warm the shredded beef in the same stock with the fat for a minute '
          'or two.',
      'Mash the carrot roughly and fold the beef through, or serve a carrot '
          'baton and a soft strip of beef side by side.',
      'Cool to warm before offering.',
    ],
    foodIds: ['beef', 'carrot', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_pork_shoulder_cauliflower_cream',
    title: 'Pork shoulder with cauliflower cream',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'main',
    summary:
        'Slow pork for iron, zinc, and B vitamins, with cauliflower mashed '
        'in butter and stock to stand in for a starchy side. Contains milk, '
        'a common allergen. Makes a batch.',
    ingredients: [
      '500 g pork shoulder, skin removed',
      '300 ml water',
      '4 cauliflower florets',
      '1 tbsp butter',
      '2 tbsp homemade meat stock, no salt',
    ],
    steps: [
      'Cook the pork with the water in a covered dish at 150°C for 3 to 4 '
          'hours until it pulls apart with two forks.',
      'Simmer the cauliflower in the stock for 10 minutes until very soft, '
          'then mash or blend with the butter.',
      'Pull the pork into fine shreds or soft strips and moisten with its '
          'juices.',
      'Serve a spoon of cauliflower cream with pork folded through, cooled '
          'to warm. Freeze the rest.',
    ],
    foodIds: ['pork', 'cauliflower', 'butter', 'meat_stock'],
    ancestral: true,
  ),

  // ---- 6 mo+ snack ----
  Recipe(
    id: 'ra_thick_avocado_wedge',
    title: 'Thick avocado wedge',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'snack',
    summary:
        'The easiest fat there is: a soft wedge baby can grip and gum, with '
        'no cooking at all.',
    ingredients: [
      '¼ ripe avocado',
      'A squeeze of lemon (optional, to slow browning)',
      'A few drops of olive oil (optional, if mashing)',
    ],
    steps: [
      'Cut a wedge about as long as your finger from a ripe avocado and '
          'peel it.',
      'Squeeze over a little lemon so it does not brown while baby works on '
          'it.',
      'Hand it over to hold; if it keeps slipping away, mash it with the '
          'olive oil and pre-load a spoon instead.',
    ],
    foodIds: ['avocado'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_buttered_broccoli_tree',
    title: 'Buttered broccoli tree',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'snack',
    summary:
        'A floret with its own handle, steamed soft and tossed in butter so '
        'the vitamins in the greens come with fat. Contains milk, a common '
        'allergen.',
    ingredients: [
      '2 broccoli florets with a length of stem',
      '1 tsp butter',
      '2 tbsp water',
    ],
    steps: [
      'Steam the florets for 8 to 10 minutes until the stem squashes easily '
          'between finger and thumb.',
      'Toss in the butter while still hot so it melts into the head.',
      'Cool to warm and hand over stem first, so baby holds the handle and '
          'chews the top.',
    ],
    foodIds: ['broccoli', 'butter'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_skinned_tomato_olive_oil',
    title: 'Skinned tomato with olive oil',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'snack',
    summary:
        'A low-sugar fruit from the canon: ripe tomato without its skin, '
        'softened in olive oil for a little fat.',
    ingredients: [
      '1 ripe tomato',
      '1 tsp olive oil',
      'A pinch of dried oregano (optional)',
    ],
    steps: [
      'Nick a cross in the base of the tomato, cover with boiling water for '
          'a minute, then slip off the skin.',
      'Cut into wedges, scoop out the seeds and juice, and warm the flesh '
          'gently in the olive oil for 2 minutes.',
      'Cool to warm and offer as soft wedges to hold, or mash for a spoon.',
    ],
    foodIds: ['tomato'],
    ancestral: true,
  ),

  // ---- 6 mo+ base ----
  Recipe(
    id: 'ra_short_cooked_chicken_stock',
    title: 'Short-cooked chicken stock',
    collection: 'Ancestral',
    stage: '6 mo+',
    mealType: 'base',
    summary:
        'The canon\'s first food: a short, gentle stock from meat on the '
        'bone, rich in gelatine and easy on a new gut, with a few drops of '
        'fermented brine added once it is tolerated. Makes a batch.',
    ingredients: [
      '4 chicken thighs or drumsticks, bone in, skin on',
      '1.5 litres water',
      '1 carrot, halved',
      '1 stick celery (optional)',
      'A few drops of fermented vegetable brine (optional, after a few days)',
    ],
    steps: [
      'Put the chicken, water, and vegetables in a large pan, bring slowly '
          'to a simmer, and skim off the foam.',
      'Cover and simmer very gently for 2 to 3 hours; a short cook keeps '
          'the flavour mild and the stock gentle.',
      'Strain, keep the fat on top because it is part of the food, and use '
          'the meat for other meals.',
      'Cool and refrigerate for 3 days or freeze in ice-cube trays. Add no '
          'salt at any point.',
      'Once stock has been tolerated for a few days, stir 2 or 3 drops of '
          'fermented vegetable brine into a warm spoonful just before '
          'serving; the brine is a seasoning, never a drink.',
    ],
    foodIds: ['meat_stock', 'chicken', 'fermented_brine'],
    ancestral: true,
  ),

  // =========================================================================
  // 9 mo+  (4 breakfast, 8 main, 3 snack, 1 base)
  // =========================================================================

  // ---- 9 mo+ breakfast ----
  Recipe(
    id: 'ra_soft_butter_scramble',
    title: 'Soft butter scramble',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'breakfast',
    summary:
        'Yolk and white together now, for choline, protein, and iron, '
        'cooked slowly in butter until fully set. Contains egg and milk, '
        'both common allergens.',
    ingredients: [
      '1 egg',
      '1 tsp butter',
      '1 tbsp whole milk or homemade meat stock, no salt',
      'A pinch of chopped chives (optional)',
    ],
    steps: [
      'Beat the egg with the milk or stock and the chives.',
      'Melt the butter in a small pan over a low heat, pour in the egg, and '
          'stir slowly as it thickens.',
      'Keep going until there is no wet, glossy egg left: soft curds, but '
          'fully set.',
      'Cool to warm and break into pea-sized pieces for pincer practice, or '
          'serve on a spoon.',
    ],
    foodIds: ['egg', 'butter', 'whole_milk'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_kefir_crushed_raspberries',
    title: 'Kefir with crushed raspberries',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'breakfast',
    summary:
        'Live cultures and fat from the kefir, a little vitamin C and colour '
        'from the raspberries, nothing sweetened. Contains milk, a common '
        'allergen.',
    ingredients: [
      '4 tbsp full-fat plain kefir, pasteurised and unsweetened',
      '4 raspberries',
      '1 tsp desiccated coconut, unsweetened (optional)',
    ],
    steps: [
      'Crush the raspberries with the back of a spoon until they break '
          'down.',
      'Stir through the kefir with the coconut; it should drip slowly off '
          'the spoon.',
      'Serve cool in a small bowl baby can dip a spoon into, or pre-load '
          'spoons.',
    ],
    foodIds: ['kefir', 'raspberry', 'coconut'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_egg_courgette_fritter',
    title: 'Egg and courgette fritter, no flour',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'breakfast',
    summary:
        'A hand-held breakfast of egg and grated courgette fried in ghee, '
        'giving choline, protein, and fat without any flour. Contains egg '
        'and milk, both common allergens. Makes a batch.',
    ingredients: [
      '2 eggs',
      '1 small courgette, grated',
      '2 tbsp grated cheese (optional)',
      '1 tbsp ghee',
      'A pinch of dried oregano',
    ],
    steps: [
      'Squeeze the grated courgette hard in a clean tea towel to get the '
          'water out.',
      'Beat the eggs with the courgette, cheese, and oregano.',
      'Fry spoonfuls in the ghee over a medium heat for 3 minutes a side '
          'until golden and set right through.',
      'Cool to warm and cut into finger-length strips or pea-sized pieces. '
          'Keep spares in the fridge for 2 days.',
    ],
    foodIds: ['egg', 'courgette', 'cheese', 'ghee'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_ricotta_squashed_blackberries',
    title: 'Ricotta with squashed blackberries',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'breakfast',
    summary:
        'Full-fat ricotta is a gentle fresh cheese with fat and protein, and '
        'squashed blackberries add colour and a little vitamin C. Contains '
        'milk, a common allergen.',
    ingredients: [
      '3 tbsp full-fat ricotta',
      '4 blackberries',
      '1 tsp melted butter (optional)',
    ],
    steps: [
      'Squash each blackberry flat and chop it small, as the seeds and skin '
          'can be fibrous.',
      'Fold the berries and butter through the ricotta.',
      'Serve from a spoon, or spread thick on a plate for baby to scoop up.',
    ],
    foodIds: ['ricotta', 'blackberry', 'butter'],
    ancestral: true,
  ),

  // ---- 9 mo+ main ----
  Recipe(
    id: 'ra_beef_courgette_stew',
    title: 'Beef and courgette stew',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'main',
    summary:
        'A family stew with iron-rich beef, soft courgette, and tomato in '
        'gelatine-rich stock, everything cut small for pincer practice. '
        'Makes a batch.',
    ingredients: [
      '400 g stewing beef, diced small',
      '1 courgette, diced',
      '1 ripe tomato, skinned and chopped',
      '500 ml homemade meat stock, no salt',
      '1 tbsp beef dripping or olive oil',
      '1 clove garlic, crushed',
    ],
    steps: [
      'Brown the beef in the fat, add the garlic, tomato, and stock, and '
          'bring to a simmer.',
      'Cover and cook gently for 2 hours until the beef breaks up with a '
          'spoon.',
      'Add the courgette for the last 20 minutes so it is soft but still '
          'holds its shape.',
      'Cool to warm, cut any meat larger than a pea, and serve in a bowl '
          'with a spoon. Freeze the rest in portions.',
    ],
    foodIds: ['beef', 'courgette', 'tomato', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_lamb_cauliflower_mash',
    title: 'Lamb with cauliflower mash',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'main',
    summary:
        'Slow lamb for iron and zinc on a buttery cauliflower mash that '
        'takes the place of potato. Contains milk, a common allergen.',
    ingredients: [
      '2 tbsp slow-cooked lamb, shredded (see Slow lamb shoulder strips)',
      '4 cauliflower florets',
      '1 tbsp butter',
      '2 tbsp homemade meat stock, no salt',
      'A pinch of ground cumin (optional)',
    ],
    steps: [
      'Simmer the cauliflower in the stock, covered, for 10 minutes until '
          'very soft.',
      'Mash with the butter and cumin until creamy, adding a little cooking '
          'liquid if it is dry.',
      'Warm the lamb in a spoon of stock, chop into pea-sized pieces, and '
          'fold through the mash.',
      'Cool to warm and serve in a bowl with a spoon.',
    ],
    foodIds: ['lamb', 'cauliflower', 'butter', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_mackerel_soft_tomato',
    title: 'Mackerel with soft tomato',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'main',
    summary:
        'Fresh mackerel is one of the richest sources of DHA and vitamin D, '
        'and soft tomato cooked in olive oil cuts through its richness. '
        'Contains fish, a common allergen.',
    ingredients: [
      '1 small fresh mackerel fillet',
      '1 ripe tomato, skinned and chopped',
      '1 tbsp olive oil',
      'A few leaves of basil or parsley',
    ],
    steps: [
      'Bake the mackerel skin side down at 200°C for 10 to 12 minutes until '
          'the flesh is opaque right through.',
      'Meanwhile cook the tomato in the olive oil for 5 minutes until it '
          'collapses.',
      'Lift the fish off its skin and comb through it with your fingers to '
          'remove every pin bone.',
      'Flake the fish into pea-sized pieces, fold through the tomato with '
          'the herbs, and cool to warm.',
    ],
    foodIds: ['mackerel', 'tomato'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_duck_leg_shreds_green_beans',
    title: 'Duck leg shreds with green beans',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'main',
    summary:
        'Duck leg slow-roasted in its own fat gives iron, B vitamins, and '
        'plenty of good fat, with green beans cooked soft alongside. Makes '
        'a batch.',
    ingredients: [
      '1 duck leg',
      '1 sprig thyme',
      '8 green beans, topped and tailed',
      '2 tbsp water',
    ],
    steps: [
      'Roast the duck leg with the thyme in a small covered dish at 160°C '
          'for 2 hours until the meat falls off the bone.',
      'Simmer the beans in the water for 10 to 12 minutes until they squash '
          'easily, then toss in a spoon of the duck fat.',
      'Pull the duck into fine shreds, discarding the skin and bone, and '
          'chop any pieces larger than a pea.',
      'Serve the shreds with soft bean lengths to hold, cooled to warm. '
          'Keep the rest of the fat for cooking vegetables.',
    ],
    foodIds: ['duck', 'green_bean'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_chicken_liver_heart_weekly',
    title: 'Chicken liver and heart, the weekly one',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'main',
    summary:
        'Liver gives iron, vitamin A, and B vitamins, and heart adds more '
        'iron with a milder, meatier taste; a small portion about once a '
        'week is enough because of the vitamin A. Contains milk, a common '
        'allergen.',
    ingredients: [
      '30 g chicken livers, trimmed',
      '2 chicken hearts (optional)',
      '1 tsp butter',
      '2 tbsp homemade meat stock, no salt',
      '1 tbsp grated courgette',
    ],
    steps: [
      'Trim the livers and halve the hearts, cutting away any tubes, then '
          'chop both as finely as you can.',
      'Cook in the butter for 2 minutes, add the stock and courgette, and '
          'simmer for 8 to 10 minutes until no pink remains anywhere.',
      'Mash with a fork so the pieces are no bigger than a pea and the mix '
          'stays moist.',
      'Cool to warm and offer a tablespoon or two on a spoon, about once a '
          'week. Freeze the rest in small portions.',
    ],
    foodIds: ['liver', 'butter', 'meat_stock', 'courgette'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_cod_in_butter_green_beans',
    title: 'Cod in butter with green beans',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'main',
    summary:
        'White fish cooked gently in butter is an easy protein with iodine '
        'and B vitamins, and soft green beans add a vegetable to hold. '
        'Contains fish and milk, both common allergens.',
    ingredients: [
      '50 g cod loin, skinless',
      '1 tbsp butter',
      '6 green beans, topped and tailed',
      '1 tbsp water',
      'A squeeze of lemon (optional)',
    ],
    steps: [
      'Simmer the beans in the water, covered, for 10 to 12 minutes until '
          'very soft.',
      'Melt the butter in a small pan, add the cod, cover, and cook on a '
          'low heat for 6 to 8 minutes until it flakes and is white all '
          'through.',
      'Flake the fish, feeling for any bones, and spoon the butter over it.',
      'Cool to warm and serve the flakes beside halved bean lengths, with '
          'the lemon if using.',
    ],
    foodIds: ['cod', 'butter', 'green_bean'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_little_beef_meatballs',
    title: 'Little beef meatballs, no breadcrumbs',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'main',
    summary:
        'Beef mince bound with egg yolk and grated courgette instead of '
        'bread, for iron, zinc, and choline, simmered in stock so they stay '
        'soft. Contains egg, a common allergen. Makes a batch.',
    ingredients: [
      '250 g beef mince, not lean',
      '1 egg yolk',
      '½ courgette, grated and squeezed dry',
      '1 tsp dried oregano',
      '300 ml homemade meat stock, no salt',
    ],
    steps: [
      'Mix the mince, yolk, courgette, and oregano, and roll into balls the '
          'size of a walnut.',
      'Lower them into simmering stock, cover, and cook for 15 minutes '
          'until no pink remains in the middle of one cut open.',
      'Cool to warm, then quarter each ball or mash it with a little stock; '
          'never serve one whole or in round slices.',
      'Freeze the rest in the stock for quick dinners.',
    ],
    foodIds: ['beef', 'egg', 'courgette', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_salmon_avocado_little_roe',
    title: 'Salmon with avocado and a little roe',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'main',
    summary:
        'Flaked salmon and a few fresh roe eggs are among the richest whole '
        'foods for DHA, served in avocado for fat. Contains fish and milk, '
        'both common allergens.',
    ingredients: [
      '40 g salmon fillet',
      '1 tsp fresh or lightly salted salmon roe (not cured, caviar-style '
          'roe)',
      '¼ ripe avocado',
      '1 tsp butter',
    ],
    steps: [
      'Bake or steam the salmon until opaque right through, then remove '
          'the skin and every bone.',
      'Warm the roe in the butter in a small pan for a minute or two until '
          'the eggs turn pale and are cooked through.',
      'Mash the avocado, flake in the salmon in pea-sized pieces, and fold '
          'in the roe with its butter.',
      'Cool to warm and serve from a spoon; keep the roe to a teaspoon, as '
          'it carries some salt.',
    ],
    foodIds: ['salmon', 'fish_roe', 'avocado', 'butter'],
    ancestral: true,
  ),

  // ---- 9 mo+ snack ----
  Recipe(
    id: 'ra_grated_cheese_to_pinch',
    title: 'Grated cheese to pinch',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'snack',
    summary:
        'A little full-fat cheese gives fat, calcium, and protein in a shape '
        'that is safe to practise picking up. Contains milk, a common '
        'allergen.',
    ingredients: [
      '1 tbsp finely grated mild pasteurised cheese',
      '¼ ripe avocado, diced small (optional)',
      'A few cooked green peas, squashed flat (optional)',
    ],
    steps: [
      'Grate the cheese finely, or cut a soft cheese such as mozzarella into '
          'pea-sized pieces; no cubes or sticks yet.',
      'Scatter a small pile on the tray with the avocado and squashed peas '
          'alongside.',
      'Keep the portion small, because cheese carries salt, and offer water '
          'with it.',
    ],
    foodIds: ['cheese', 'avocado', 'green_pea'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_coconut_and_berry_spoon',
    title: 'Coconut and berry spoon',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'snack',
    summary:
        'A dairy-free fat from coconut with a few crushed berries, for '
        'babies not yet on dairy or simply for variety.',
    ingredients: [
      '2 tbsp thick cream from the top of a chilled tin of full-fat coconut '
          'milk, or plain unsweetened coconut yoghurt',
      '4 blueberries or raspberries',
      'A pinch of ground cinnamon (optional)',
    ],
    steps: [
      'Chill the tin of coconut milk overnight so the thick cream sets on '
          'top, then spoon it off.',
      'Crush the berries and stir them through the coconut cream with the '
          'cinnamon.',
      'Serve cool from a spoon; check that any shop-bought coconut yoghurt '
          'has no added sugar or sweetener.',
    ],
    foodIds: ['coconut', 'blueberry', 'raspberry'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_buttered_green_beans_to_grip',
    title: 'Buttered green beans to grip',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'snack',
    summary:
        'Green beans cooked soft and rolled in butter give a vegetable with '
        'its fat attached, shaped for small hands. Contains milk, a common '
        'allergen.',
    ingredients: ['6 green beans', '1 tsp butter', '2 tbsp water'],
    steps: [
      'Top and tail the beans and simmer them in the water, covered, for 10 '
          'to 12 minutes until they bend and squash easily.',
      'Drain and toss in the butter while hot.',
      'Cool to warm and offer as finger-length pieces to hold, or cut into '
          'pea-sized pieces to pick up.',
    ],
    foodIds: ['green_bean', 'butter'],
    ancestral: true,
  ),

  // ---- 9 mo+ base ----
  Recipe(
    id: 'ra_long_cooked_beef_bone_broth',
    title: 'Long-cooked beef bone broth',
    collection: 'Ancestral',
    stage: '9 mo+',
    mealType: 'base',
    summary:
        'A long, slow broth from marrow and knuckle bones that sets to a '
        'jelly when cold, giving gelatine and minerals, with a few drops of '
        'sauerkraut brine stirred in at the table for live cultures. Makes '
        'a batch.',
    ingredients: [
      '1 kg beef bones, a mix of marrow and knuckle',
      '2 litres water',
      '1 tbsp cider vinegar',
      '1 onion, halved',
      '1 carrot',
      'A few drops of brine from unpasteurised sauerkraut, to serve',
    ],
    steps: [
      'Roast the bones at 200°C for 30 minutes for flavour, then put them '
          'in a big pan or slow cooker with the water and vinegar.',
      'Bring slowly to a simmer, skim the foam, add the onion and carrot, '
          'and cook on the lowest heat for 12 to 24 hours.',
      'Strain, cool, and keep the fat on top; the broth should wobble when '
          'chilled. Add no salt.',
      'Refrigerate for 4 days or freeze in cubes, and use as the liquid in '
          'stews, mashes, and scrambles.',
      'To serve on its own, warm a few tablespoons, let it cool to warm, '
          'and stir in 3 or 4 drops of the brine; never offer the brine as '
          'a drink.',
    ],
    foodIds: ['meat_stock', 'beef', 'fermented_brine'],
    ancestral: true,
  ),

  // =========================================================================
  // 12 mo+  (4 breakfast, 8 main, 3 snack, 1 base)
  // =========================================================================

  // ---- 12 mo+ breakfast ----
  Recipe(
    id: 'ra_cheese_omelette_strips',
    title: 'Cheese omelette strips',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'breakfast',
    summary:
        'A whole-egg omelette with melted cheese for choline, protein, '
        'calcium, and fat, cut into strips to hold. Contains egg and milk, '
        'both common allergens.',
    ingredients: [
      '1 egg',
      '1 tbsp grated cheese',
      '1 tsp butter',
      '1 tbsp whole milk',
      'A few chopped chives or a little finely chopped spinach (optional)',
    ],
    steps: [
      'Beat the egg with the milk and the herbs or spinach.',
      'Melt the butter in a small frying pan over a medium heat, pour in '
          'the egg, and swirl it thin.',
      'Scatter the cheese over, and when the top is no longer wet fold the '
          'omelette in half and cook a minute more so it is set through.',
      'Cool to warm and cut into finger-length strips.',
    ],
    foodIds: ['egg', 'cheese', 'butter', 'whole_milk'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_kefir_strawberry_bowl',
    title: 'Kefir and strawberry bowl',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'breakfast',
    summary:
        'Live cultures and fat from full-fat kefir with chopped '
        'strawberries, nothing sweetened and no cereal. Contains milk, a '
        'common allergen.',
    ingredients: [
      '5 tbsp full-fat plain kefir, pasteurised and unsweetened',
      '2 ripe strawberries',
      '1 tsp ground pumpkin seeds or desiccated coconut (optional)',
    ],
    steps: [
      'Hull the strawberries, cut them lengthways into quarters, then into '
          'small dice.',
      'Stir through the kefir with the ground seeds or coconut.',
      'Serve cool in a bowl with a spoon; some will end up on the floor, '
          'and that is fine.',
    ],
    foodIds: ['kefir', 'strawberry', 'pumpkin_seed', 'coconut'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_baked_yolk_custard',
    title: 'Baked yolk custard, no sugar',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'breakfast',
    summary:
        'Egg yolks set gently in whole milk and cream make a spoonable '
        'custard rich in choline, fat, and calcium with nothing sweet '
        'added. Contains egg and milk, both common allergens. Makes a '
        'batch.',
    ingredients: [
      '3 egg yolks',
      '150 ml whole milk',
      '100 ml double cream',
      '½ tsp vanilla extract (alcohol-free) or a pinch of cinnamon',
      'Butter for the ramekins',
    ],
    steps: [
      'Heat the oven to 150°C and butter four small ramekins.',
      'Warm the milk and cream until steaming, then whisk slowly into the '
          'yolks with the vanilla.',
      'Pour into the ramekins, stand them in a roasting tin half-filled '
          'with hot water, and bake for 25 to 30 minutes until set with no '
          'liquid in the middle.',
      'Cool completely before serving; keep covered in the fridge for 2 '
          'days.',
    ],
    foodIds: ['egg', 'whole_milk', 'butter'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_butter_fried_mushroom_egg',
    title: 'Butter-fried mushroom and egg',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'breakfast',
    summary:
        'Mushrooms cooked down in butter with a set egg give B vitamins, a '
        'little vitamin D, and choline. Contains egg and milk, both common '
        'allergens.',
    ingredients: [
      '2 chestnut mushrooms',
      '1 egg',
      '2 tsp butter',
      'A few thyme leaves (optional)',
    ],
    steps: [
      'Chop the mushrooms small and fry in half the butter with the thyme '
          'for 5 minutes until soft and browned.',
      'Push them to one side, add the rest of the butter, and crack in the '
          'egg; break the yolk and stir until no runny egg remains.',
      'Mix the mushrooms through the egg and cool to warm.',
      'Serve in pea-sized pieces, or chop and spoon it.',
    ],
    foodIds: ['mushroom', 'egg', 'butter'],
    ancestral: true,
  ),

  // ---- 12 mo+ main ----
  Recipe(
    id: 'ra_slow_lamb_aubergine_olives',
    title: 'Slow lamb with aubergine and olives',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'main',
    summary:
        'Lamb cooked soft with aubergine, tomato, and a few rinsed olives '
        'gives iron, zinc, and fat with the taste of a family dinner. Makes '
        'a batch.',
    ingredients: [
      '400 g lamb neck or shoulder, diced',
      '1 small aubergine, diced',
      '2 ripe tomatoes, skinned and chopped',
      '4 pitted olives, rinsed well',
      '300 ml homemade meat stock, no salt',
      '1 tbsp olive oil',
      '1 clove garlic, crushed',
      'A pinch of ground cinnamon',
    ],
    steps: [
      'Brown the lamb in the olive oil, add the garlic, tomatoes, cinnamon, '
          'and stock, and bring to a simmer.',
      'Cover and cook gently for 1½ hours, then add the aubergine and cook '
          'for 30 minutes more until everything is soft.',
      'Quarter the rinsed olives lengthways and stir them in for the last '
          '5 minutes.',
      'Cool to warm, cut any lamb larger than a pea, and serve in a bowl. '
          'Freeze the rest in portions.',
    ],
    foodIds: ['lamb', 'eggplant', 'tomato', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_beef_bone_marrow_stew',
    title: 'Beef and bone-marrow stew',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'main',
    summary:
        'Beef cooked in its stock with a spoon of roasted marrow stirred '
        'through gives iron, gelatine, and a fat the canon prizes. Makes a '
        'batch.',
    ingredients: [
      '400 g beef shin, diced',
      '2 marrow bones, cut by the butcher',
      '500 ml homemade meat stock, no salt',
      '1 carrot, diced',
      '1 courgette, diced',
      '1 bay leaf',
    ],
    steps: [
      'Simmer the beef with the stock, carrot, and bay leaf, covered, for '
          '2 hours until the meat falls apart.',
      'Roast the marrow bones at 220°C for 15 minutes until the marrow is '
          'soft and bubbling, then scoop it out.',
      'Add the courgette to the stew for the last 20 minutes, then stir the '
          'marrow through so it melts in.',
      'Cool to warm, cut any beef larger than a pea, and serve with a '
          'spoon. Freeze the rest.',
    ],
    foodIds: ['beef', 'bone_marrow', 'meat_stock', 'carrot', 'courgette'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_salmon_cakes_no_flour',
    title: 'Salmon cakes, no flour',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'main',
    summary:
        'Flaked salmon bound with egg and grated courgette, fried in ghee, '
        'for DHA and choline in a shape toddlers can hold. Contains fish, '
        'egg, and milk, all common allergens. Makes a batch.',
    ingredients: [
      '200 g cooked salmon, skin and bones removed',
      '1 egg',
      '½ courgette, grated and squeezed dry',
      '2 tbsp grated cheese (optional)',
      '1 tbsp ghee',
      'A handful of chopped dill or parsley',
    ],
    steps: [
      'Flake the salmon finely, checking again for bones, and mix with the '
          'egg, courgette, cheese, and herbs.',
      'Shape into small flat patties and chill for 10 minutes so they hold '
          'together.',
      'Fry in the ghee over a medium heat for 3 to 4 minutes a side until '
          'golden and hot right through.',
      'Cool to warm and cut into strips or pea-sized pieces. Keep spares '
          'in the fridge for 2 days.',
    ],
    foodIds: ['salmon', 'egg', 'courgette', 'cheese', 'ghee'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_turkey_thigh_soft_kale',
    title: 'Turkey thigh with soft kale',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'main',
    summary:
        'Dark turkey thigh for iron and zinc, with kale wilted long in '
        'butter and stock so it is soft enough to chew. Contains milk, a '
        'common allergen. Makes a batch.',
    ingredients: [
      '1 turkey thigh, bone in',
      '400 ml homemade meat stock, no salt',
      '2 large kale leaves, stems removed',
      '1 tbsp butter',
      '1 clove garlic, sliced',
    ],
    steps: [
      'Simmer the turkey thigh in the stock, covered, for 1 hour until the '
          'meat pulls from the bone.',
      'Shred the kale finely and cook it in the butter and garlic with a '
          'ladle of the stock for 15 minutes until very soft.',
      'Shred the turkey, discarding the skin and bone, chop into pea-sized '
          'pieces, and fold through the kale with a spoon of stock.',
      'Cool to warm and serve in a bowl. Freeze the rest in portions.',
    ],
    foodIds: ['turkey', 'kale', 'butter', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_liver_onion_avocado_dip',
    title: 'Liver and onion with avocado dip',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'main',
    summary:
        'Liver cooked soft with sweet onion gives iron, vitamin A, B '
        'vitamins, and choline, and mashed avocado turns it into a dip '
        'plate; keep it to about once a week because of the vitamin A. '
        'Contains milk, a common allergen.',
    ingredients: [
      '40 g lamb or chicken liver, trimmed',
      '½ small onion, finely sliced',
      '1 tbsp butter',
      '2 tbsp homemade meat stock, no salt',
      '¼ ripe avocado',
      'Soft-cooked courgette or green bean batons, to serve',
    ],
    steps: [
      'Cook the onion in the butter over a low heat for 10 minutes until '
          'soft and golden.',
      'Add the liver and cook for 6 to 8 minutes, turning, until no pink '
          'remains in the centre when cut.',
      'Chop or blend the liver and onion with the stock to a coarse, '
          'spoonable paste.',
      'Mash the avocado, cool everything to warm, and serve the two side by '
          'side with the vegetable batons to dip.',
      'Offer liver about once a week, and freeze the rest in small '
          'portions.',
    ],
    foodIds: ['liver', 'butter', 'meat_stock', 'avocado'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_fish_pie_cauliflower_top',
    title: 'Fish pie with a cauliflower top',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'main',
    summary:
        'Haddock and salmon in whole milk under a buttery cauliflower mash '
        'give protein, iodine, DHA, and calcium with no flour or potato. '
        'Contains fish, milk, and egg, all common allergens. Makes a batch.',
    ingredients: [
      '150 g skinless haddock',
      '150 g skinless salmon',
      '250 ml whole milk',
      '1 small cauliflower, in florets',
      '2 tbsp butter',
      '2 egg yolks',
      '2 tbsp grated cheese',
      'A handful of chopped parsley',
    ],
    steps: [
      'Poach the fish in the milk for 8 minutes until it flakes, lift it '
          'out, flake it, and feel for bones.',
      'Simmer the cauliflower until very soft, drain well, and mash with '
          'half the butter until smooth.',
      'Whisk the egg yolks into the warm poaching milk over a low heat, '
          'stirring until it thickens slightly; do not let it boil.',
      'Mix the fish, sauce, and parsley in a dish, spread the cauliflower '
          'on top, dot with the rest of the butter and the cheese, and bake '
          'at 190°C for 25 minutes until bubbling and set through.',
      'Cool to warm before serving, and freeze the rest in portions.',
    ],
    foodIds: [
      'haddock',
      'salmon',
      'whole_milk',
      'cauliflower',
      'butter',
      'egg',
      'cheese',
    ],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_chicken_in_coconut_stock',
    title: 'Chicken in coconut stock',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'main',
    summary:
        'Chicken thigh simmered in meat stock and coconut milk with spinach '
        'gives iron, gelatine, and coconut fat in one soft bowl. Makes a '
        'batch.',
    ingredients: [
      '4 boneless chicken thighs, diced',
      '300 ml homemade meat stock, no salt',
      '200 ml full-fat coconut milk',
      '2 handfuls spinach, chopped',
      '1 tsp grated fresh ginger',
      '1 tsp ground turmeric',
      '1 tbsp coconut oil',
      'A squeeze of lime (optional)',
    ],
    steps: [
      'Soften the ginger and turmeric in the coconut oil for a minute, add '
          'the chicken, and turn it in the spices.',
      'Pour in the stock and coconut milk and simmer gently, covered, for '
          '25 minutes until the chicken is cooked through and tender.',
      'Stir in the spinach for the last 3 minutes until wilted.',
      'Cool to warm, cut the chicken into pea-sized pieces, and serve in a '
          'bowl with its liquid. Freeze the rest.',
    ],
    foodIds: ['chicken', 'coconut', 'spinach', 'meat_stock'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_shrimp_in_butter_courgette',
    title: 'Shrimp in butter with courgette',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'main',
    summary:
        'Prawns cooked through in butter with soft courgette give protein, '
        'iodine, selenium, and fat. Contains shellfish and milk, both '
        'common allergens.',
    ingredients: [
      '4 raw prawns, peeled and deveined',
      '1 tbsp butter',
      '½ courgette, diced small',
      '1 clove garlic, crushed',
      'A squeeze of lemon and a little parsley (optional)',
    ],
    steps: [
      'Cook the courgette in half the butter over a medium heat for 5 '
          'minutes until soft.',
      'Add the rest of the butter, the garlic, and the prawns, and cook for '
          '3 to 4 minutes, turning, until pink, curled, and opaque all the '
          'way through.',
      'Chop the prawns into pea-sized pieces; a whole prawn is too round '
          'and firm to serve as it is.',
      'Toss with the courgette, lemon, and parsley, and cool to warm.',
    ],
    foodIds: ['shrimp', 'butter', 'courgette'],
    ancestral: true,
  ),

  // ---- 12 mo+ snack ----
  Recipe(
    id: 'ra_cheese_stick_to_hold',
    title: 'Cheese stick to hold',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'snack',
    summary:
        'A thin stick of mild hard cheese gives fat, protein, and calcium '
        'for a toddler who can now bite and chew. Contains milk, a common '
        'allergen.',
    ingredients: [
      'A finger-length stick of mild pasteurised hard cheese',
      '¼ ripe avocado, sliced (optional)',
      'A few blueberries, squashed flat (optional)',
    ],
    steps: [
      'Cut the cheese into a stick no thicker than a pencil; if it '
          'crumbles, grate it instead.',
      'Serve with the avocado and squashed berries so the snack is not all '
          'cheese.',
      'Keep it to one stick, because cheese carries salt, and offer water '
          'with it.',
    ],
    foodIds: ['cheese', 'avocado', 'blueberry'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_avocado_cottage_cheese',
    title: 'Avocado and cottage cheese',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'snack',
    summary:
        'Two soft foods, one full of fat and one full of protein and '
        'calcium, mashed together in a minute. Contains milk, a common '
        'allergen.',
    ingredients: [
      '¼ ripe avocado',
      '2 tbsp full-fat cottage cheese',
      'A few chopped chives or a grind of black pepper (optional)',
    ],
    steps: [
      'Mash the avocado roughly with a fork.',
      'Fold through the cottage cheese and chives, breaking up any large '
          'curds.',
      'Serve from a spoon, or spread thick on soft-cooked courgette batons '
          'to dip.',
    ],
    foodIds: ['avocado', 'cottage_cheese'],
    ancestral: true,
  ),
  Recipe(
    id: 'ra_berries_and_cream',
    title: 'Berries and cream',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'snack',
    summary:
        'Crushed berries in thick cream, a small sweet-tasting snack whose '
        'fat is the point. Contains milk, a common allergen.',
    ingredients: [
      '6 blueberries and 3 raspberries',
      '2 tbsp double cream or thick full-fat plain yoghurt',
      'A pinch of ground cinnamon (optional)',
    ],
    steps: [
      'Squash the blueberries flat and break up the raspberries.',
      'Fold the berries through the cream with the cinnamon.',
      'Serve cool from a spoon; keep the berries squashed, as a whole round '
          'berry can still block a small airway.',
    ],
    foodIds: ['blueberry', 'raspberry', 'yoghurt'],
    ancestral: true,
  ),

  // ---- 12 mo+ base ----
  Recipe(
    id: 'ra_roasted_marrow_and_broth',
    title: 'Roasted marrow and its broth',
    collection: 'Ancestral',
    stage: '12 mo+',
    mealType: 'base',
    summary:
        'Marrow bones roasted so the soft marrow can be spooned into '
        'vegetables and stews as a fat, then simmered for a second meal of '
        'gelatine-rich broth. Makes a batch.',
    ingredients: [
      '4 beef marrow bones, cut lengthways or into short pieces by the '
          'butcher',
      '1.5 litres water',
      '1 tbsp cider vinegar',
      '1 onion, halved',
      '1 bay leaf',
      'A few drops of fermented vegetable brine, to serve (optional)',
    ],
    steps: [
      'Roast the bones cut side up at 220°C for 15 to 20 minutes until the '
          'marrow is soft and just starting to melt.',
      'Scoop out the marrow and keep it in a jar in the fridge; a teaspoon '
          'melted into warm vegetables, mash, or stew is a serving.',
      'Put the bones in a pan with the water, vinegar, onion, and bay leaf, '
          'and simmer very gently for 8 to 12 hours; add no salt.',
      'Strain, cool, and refrigerate for 4 days or freeze in cubes.',
      'To serve, warm a few tablespoons, let it cool to warm, and stir in a '
          'few drops of brine; never offer the brine on its own.',
    ],
    foodIds: ['bone_marrow', 'meat_stock', 'beef', 'fermented_brine'],
    ancestral: true,
  ),
];
