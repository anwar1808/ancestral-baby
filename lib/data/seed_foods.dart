// GENERATED SEED DATA — original copy grounded in public-health guidance.
//
// This is general educational information, NOT medical advice. Feeding and
// allergen decisions for an individual baby should be discussed with a
// qualified health professional. Guidance varies between countries and is
// summarised here in general terms (e.g. WHO, NHS Start4Life / SACN 2018,
// US NIAID 2017, AAP, Singapore HPB, US Dietary Guidelines 2020–2025).

import 'package:ancestral_baby/models/food.dart';
import 'package:ancestral_baby/models/media.dart';

const List<Food> kSeedFoods = [
  // ---------------------------------------------------------------------------
  // FRUIT
  // ---------------------------------------------------------------------------
  Food(
    id: 'avocado',
    name: 'Avocado',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/avocado_hero.jpg'),
    nutritionFlags: ['Healthy fats', 'Fibre'],
    minAgeMonths: 6,
    whyFirst:
        'Fat and softness with no cooking: a bridge between milk and meals.',
    chokingRisk: 'Low',
    introduction:
        'Avocado is a popular first food and can generally be offered from around six months, when most babies are showing signs of readiness for solids. Its soft, buttery flesh is easy to mash or hold, which makes it well suited to both spoon-feeding and baby-led approaches.\n\n'
        'Avocado is naturally rich in unsaturated fats that support a baby’s rapid brain growth, and it also provides fibre, folate, and potassium. Because it is energy-dense and mild in flavour, it pairs easily with iron-rich foods such as mashed lentils or pureed meat.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer a thick wedge of very ripe avocado as a graspable spear, or mash it smooth and offer on a pre-loaded spoon.',
        portion: 'About 1–2 tablespoons mashed, or a quarter as a spear.',
        texture: 'Soft and mashable.',
        safetyNote:
            'Choose fruit that is fully ripe and yields to gentle pressure; firm avocado is slippery and harder to manage.',
        media: AppMedia(uri: 'assets/foods/avocado_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut:
            'Cut into small bite-sized cubes for developing pincer grasp, or spread mashed avocado onto strips of toast.',
        portion: 'A small handful of cubes alongside other foods.',
        texture: 'Soft cubes or spread.',
        media: AppMedia(uri: 'assets/foods/avocado_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut:
            'Serve diced in salads, mashed into guacamole-style dips, or layered in sandwiches.',
        portion: 'Varies with appetite.',
        texture: 'Soft, varied.',
        media: AppMedia(uri: 'assets/foods/avocado_12mo.jpg'),
      ),
    ],
    choking:
        'Avocado is a relatively low choking-risk food because it is soft. Very firm, under-ripe avocado is slippery and harder to chew, so choose ripe fruit and offer it mashed or as a thick spear.',
    allergens: 'Not a common allergen.',
    faq:
        'Will avocado turn brown? Yes, cut flesh oxidises quickly; a squeeze of lemon or serving it fresh helps. Is it too high in fat for a baby? No — babies need plenty of healthy fat, and avocado is a good source.',
    tips:
        'Keep the skin on a wedge so there is a textured handle for baby to grip. Mix mashed avocado into iron-rich purees to boost overall nutrition.',
    sourceCitations: ['WHO complementary feeding', 'NHS Start4Life'],
  ),
  Food(
    id: 'banana',
    name: 'Banana',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/banana_hero.jpg'),
    nutritionFlags: ['Fibre', 'Potassium'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Banana is a convenient first food that can usually be offered from around six months. Ripe banana is soft enough to mash with a fork and requires no cooking, which makes it handy at home or when out.\n\n'
        'Banana provides carbohydrate for energy along with potassium, vitamin B6, and some fibre. Its natural sweetness is appealing to babies, so it pairs well with less sweet foods such as plain yoghurt or oats to broaden the range of flavours a baby accepts.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Leave the lower half of the peel on and offer the exposed top as a graspable handle, or mash ripe banana smooth.',
        portion: 'About half a small banana.',
        texture: 'Soft, mashable.',
        safetyNote:
            'A whole peeled banana can be slippery; scoring it lengthwise into thirds can make pieces easier to hold.',
        media: AppMedia(uri: 'assets/foods/banana_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut:
            'Cut into small bite-sized pieces for pincer practice, or break into short chunks.',
        portion: 'A few small pieces.',
        texture: 'Soft pieces.',
        media: AppMedia(uri: 'assets/foods/banana_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut:
            'Offer sliced into rounds, stirred into porridge, or blended into smoothies.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/banana_12mo.jpg'),
      ),
    ],
    choking:
        'Banana is generally low risk because it is soft. Slippery whole pieces can be awkward to hold, so mash it or leave part of the peel on as a handle for younger babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Can unripe banana cause constipation? Under-ripe banana is firmer and starchier; ripe, spotty banana is softer and gentler. Is banana too sugary? Whole banana also brings fibre and nutrients, so it is fine as part of a varied diet.',
    tips:
        'Very ripe banana with brown spots mashes most easily. Roll banana pieces in fine baby oat flakes to make slippery chunks easier to grip.',
    sourceCitations: ['WHO complementary feeding', 'NHS Start4Life'],
  ),
  Food(
    id: 'apple',
    name: 'Apple',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/apple_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'High',
    introduction:
        'Apple can generally be introduced from around six months, but raw apple is hard and is a recognised choking hazard for babies and young children. For this reason early servings are usually cooked until soft or grated very finely.\n\n'
        'Apple provides vitamin C, fibre, and natural sugars for energy. Cooking softens the flesh and makes it easy to mash, while leaving the skin on grated raw apple adds texture and fibre once a baby is chewing more confidently.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Peel, core, and cook (steam or stew) until very soft, then mash or offer as soft wedges.',
        portion: 'About 1–2 tablespoons of soft apple.',
        texture: 'Soft, cooked.',
        safetyNote:
            'Do not offer raw apple chunks or slices to babies — raw apple is a high choking risk.',
        media: AppMedia(uri: 'assets/foods/apple_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut:
            'Continue with soft cooked apple pieces, or finely grate raw apple so it is easy to manage.',
        portion: 'A small handful.',
        texture: 'Soft cooked or finely grated.',
        media: AppMedia(uri: 'assets/foods/apple_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut:
            'Grated raw apple or thin shavings are usually well managed; hard apple chunks are generally avoided until closer to age four.',
        portion: 'Varies with appetite.',
        texture: 'Grated or thin.',
        safetyNote:
            'Whole and chunked raw apple remains a choking hazard for young children.',
        media: AppMedia(uri: 'assets/foods/apple_12mo.jpg'),
      ),
    ],
    choking:
        'Raw apple is firm and round, making it one of the higher-risk foods for choking. Cooking it soft or grating it finely greatly reduces the risk for babies and toddlers.',
    allergens: 'Not a common allergen.',
    faq:
        'Can I give apple juice? Whole apple is preferred; juice is not recommended for babies and offers little nutritional benefit. When can baby have raw apple slices? Hard raw chunks are usually delayed until a child can chew well, generally around age four.',
    tips:
        'Steam apple with no added sugar and freeze leftovers in small portions. A sprinkle of cinnamon adds flavour without sweeteners.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'pear',
    name: 'Pear',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/pear_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Pear is a gentle first fruit that can usually be offered from around six months. A very ripe pear is soft enough to serve raw and mashed, while firmer pears are better cooked until tender.\n\n'
        'Pear supplies vitamin C, fibre, and natural sugars. It is mild and well tolerated, and its softness when ripe makes it an easy early food. As with other firm fruits, the texture matters more than the food itself for safety.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer very ripe pear as a soft peeled wedge, or cook firmer pear until tender and mash.',
        portion: 'About 1–2 tablespoons.',
        texture: 'Soft, ripe or cooked.',
        safetyNote:
            'Firm, under-ripe pear should be cooked soft before serving to a young baby.',
        media: AppMedia(uri: 'assets/foods/pear_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut:
            'Cut soft ripe pear into small bite-sized pieces, or continue with grated raw pear.',
        portion: 'A small handful.',
        texture: 'Soft pieces.',
        media: AppMedia(uri: 'assets/foods/pear_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve sliced or diced; very hard pear is best grated or cooked.',
        portion: 'Varies with appetite.',
        texture: 'Soft, varied.',
        media: AppMedia(uri: 'assets/foods/pear_12mo.jpg'),
      ),
    ],
    choking:
        'Ripe pear is soft, but firm pear can be a choking hazard in chunks. Choose ripe fruit, cook firmer pears, or grate raw pear to lower the risk.',
    allergens: 'Not a common allergen.',
    faq:
        'Does pear help with constipation? Pear contains fibre and sorbitol, which some families find gently loosening. Do I need to peel it? Peeling is sensible for young babies; later the skin can be left on if finely cut or grated.',
    tips:
        'Pear and apple stew well together for a simple, no-sugar puree. Choose fragrant, slightly soft pears for the easiest texture.',
    sourceCitations: ['NHS Start4Life', 'WHO complementary feeding'],
  ),
  Food(
    id: 'blueberry',
    name: 'Blueberry',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/blueberry_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Antioxidants'],
    minAgeMonths: 6,
    chokingRisk: 'High',
    introduction:
        'Blueberries can be offered from around six months, but whole blueberries are small, round, and firm — a classic choking shape — so they must be prepared safely for babies and toddlers.\n\n'
        'Blueberries are rich in vitamin C and plant antioxidants and have a naturally sweet, appealing flavour. Smashing, halving, or quartering them removes the round-and-firm risk while keeping the nutrition and taste that babies enjoy.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Smash or flatten each blueberry completely, or quarter them; you can also stir mashed berries into porridge or yoghurt.',
        portion: 'A few smashed berries.',
        texture: 'Smashed.',
        safetyNote:
            'Never offer whole blueberries to a baby — round firm berries are a high choking risk.',
        media: AppMedia(uri: 'assets/foods/blueberry_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Halve or quarter each berry depending on size and chewing skill.',
        portion: 'A small handful, prepared.',
        texture: 'Halved or quartered.',
        media: AppMedia(uri: 'assets/foods/blueberry_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut:
            'Continue halving or quartering; whole small berries are generally avoided until a child chews reliably, often around age four.',
        portion: 'Varies with appetite.',
        texture: 'Halved.',
        safetyNote: 'Whole round berries remain a choking hazard for young children.',
        media: AppMedia(uri: 'assets/foods/blueberry_12mo.jpg'),
      ),
    ],
    choking:
        'Whole blueberries are a high choking risk because they are small, round, and firm. Smashing, halving, or quartering them removes the hazard.',
    allergens: 'Not a common allergen.',
    faq:
        'Will blueberries stain or change stool colour? Yes, they can tint stools and clothes blue — this is harmless. Are frozen blueberries fine? Yes, once thawed and prepared safely they work well.',
    tips:
        'Roll smashed berries in baby oats to reduce mess. Frozen blueberries soften nicely when warmed and are easy to mash.',
    sourceCitations: ['AAP', 'NHS Start4Life'],
  ),
  Food(
    id: 'mango',
    name: 'Mango',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/mango_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Vitamin A'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Ripe mango can be offered from around six months. Its soft, juicy flesh is easy to mash or hold, making it a good early fruit, though it is slippery and benefits from a textured grip for younger babies.\n\n'
        'Mango is a good source of vitamin C and provides vitamin A (as beta-carotene), supporting immune function and vision. Its bright flavour and natural sweetness make it a popular introduction to a wider range of fruits.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer a large ripe spear with skin removed, or mash the flesh; the natural pit-side cheek can be held like a handle.',
        portion: 'About 1–2 tablespoons mashed, or one spear.',
        texture: 'Soft, ripe.',
        safetyNote: 'Mango is slippery; rolling spears in oats can help baby grip.',
        media: AppMedia(uri: 'assets/foods/mango_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut into small bite-sized cubes for pincer practice.',
        portion: 'A small handful of cubes.',
        texture: 'Soft cubes.',
        media: AppMedia(uri: 'assets/foods/mango_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve diced, in fruit salads, or blended into smoothies.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/mango_12mo.jpg'),
      ),
    ],
    choking:
        'Ripe mango is soft and low risk, but it is slippery. Offer large spears or mash it, and avoid firm under-ripe pieces.',
    allergens: 'Not a common allergen.',
    faq:
        'Can mango cause a rash around the mouth? Acidic fruits can cause harmless redness on contact in some babies; this differs from an allergic reaction. Is tinned mango fine? Choose varieties in juice or water rather than heavy syrup.',
    tips:
        'Keep the skin on the pit cheek so baby has a safe handle. Choose fragrant, slightly soft mangoes for the easiest texture.',
    sourceCitations: ['WHO complementary feeding', 'Singapore HPB 2023'],
  ),

  // ---------------------------------------------------------------------------
  // VEGETABLE
  // ---------------------------------------------------------------------------
  Food(
    id: 'sweet_potato',
    name: 'Sweet potato',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/sweet_potato_hero.jpg'),
    nutritionFlags: ['Vitamin A', 'Fibre'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Sweet potato is a gentle, popular first vegetable that can be offered from around six months once cooked until soft. It mashes easily and holds together well as a soft finger food.\n\n'
        'Sweet potato is rich in beta-carotene (vitamin A) and provides fibre and slow-release carbohydrate. Its mild sweetness is widely accepted, and it pairs nicely with iron-rich foods such as lentils or meat to support a balanced first-foods diet.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Roast or steam until very soft, then offer as a thick finger-sized wedge or mash smooth.',
        portion: 'About 1–2 tablespoons mashed, or one wedge.',
        texture: 'Soft, cooked.',
        safetyNote: 'Cook until a wedge squashes easily between your fingers.',
        media: AppMedia(uri: 'assets/foods/sweet_potato_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut soft cooked sweet potato into small bite-sized cubes.',
        portion: 'A small handful.',
        texture: 'Soft cubes.',
        media: AppMedia(uri: 'assets/foods/sweet_potato_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve as soft wedges, mash, or in stews and curries.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/sweet_potato_12mo.jpg'),
      ),
    ],
    choking:
        'Soft cooked sweet potato is low risk. Make sure it is cooked through; firm or undercooked pieces are harder to chew.',
    allergens: 'Not a common allergen.',
    faq:
        'Does sweet potato cause orange skin? Eating large amounts of beta-carotene foods can harmlessly tint skin; it fades when intake reduces. Is white potato also fine? Yes, cooked soft white potato is also a good early vegetable.',
    tips:
        'Roasting deepens the flavour without added sugar. Mix mashed sweet potato with iron-rich foods for a balanced meal.',
    sourceCitations: ['WHO complementary feeding', 'NHS Start4Life'],
  ),
  Food(
    id: 'broccoli',
    name: 'Broccoli',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/broccoli_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Folate'],
    minAgeMonths: 6,
    whyFirst:
        'A floret is a handle. Its vitamin C helps the iron from meat go further.',
    chokingRisk: 'Low',
    introduction:
        'Broccoli can be offered from around six months once steamed until soft. Its tree-like florets give babies a natural handle, which makes it a friendly early finger food.\n\n'
        'Broccoli provides vitamin C, folate, and fibre, and exposing babies to bitter green vegetables early may help them accept a wider range of flavours. Steaming until soft keeps the florets easy to gum and chew.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Steam whole florets until very soft and offer the stalk as a handle, or mash the florets.',
        portion: 'One or two soft florets.',
        texture: 'Soft, steamed.',
        safetyNote: 'Cook until the floret bends and squashes easily.',
        media: AppMedia(uri: 'assets/foods/broccoli_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Chop soft florets into small bite-sized pieces.',
        portion: 'A small handful.',
        texture: 'Soft pieces.',
        media: AppMedia(uri: 'assets/foods/broccoli_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve soft florets, chopped into pasta, or in mixed vegetable dishes.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/broccoli_12mo.jpg'),
      ),
    ],
    choking:
        'Well-steamed broccoli is low risk. Raw or firm florets are harder to chew, so cook until soft for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'What if baby refuses it? Bitter greens often take many tries; keep offering without pressure. Does broccoli cause wind? Some babies are gassier with brassicas, which is normal and harmless.',
    tips:
        'The floret makes a natural, easy-to-grip handle. Steaming rather than boiling helps retain more vitamin C.',
    sourceCitations: ['WHO complementary feeding', 'US Dietary Guidelines 2020–2025'],
  ),
  Food(
    id: 'carrot',
    name: 'Carrot',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/carrot_hero.jpg'),
    nutritionFlags: ['Vitamin A', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'High',
    introduction:
        'Carrot can be introduced from around six months, but raw carrot is hard and is one of the most recognised choking hazards for young children, so early servings should be cooked until soft.\n\n'
        'Carrot is rich in beta-carotene (vitamin A) and provides fibre. Cooked soft, it mashes and holds well as a finger food; grated raw carrot can be added later once a baby is chewing confidently.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Steam or roast carrot batons until very soft, then offer as a finger or mash.',
        portion: 'One soft baton or 1–2 tablespoons mashed.',
        texture: 'Soft, cooked.',
        safetyNote: 'Never offer raw carrot sticks or coins — a high choking risk.',
        media: AppMedia(uri: 'assets/foods/carrot_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut soft cooked carrot into small bite-sized pieces, or grate raw finely.',
        portion: 'A small handful.',
        texture: 'Soft cooked or finely grated.',
        media: AppMedia(uri: 'assets/foods/carrot_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut:
            'Soft cooked carrot or finely grated raw carrot; hard raw sticks are generally avoided until around age four.',
        portion: 'Varies with appetite.',
        texture: 'Soft or grated.',
        safetyNote: 'Raw carrot coins and sticks remain a choking hazard for young children.',
        media: AppMedia(uri: 'assets/foods/carrot_12mo.jpg'),
      ),
    ],
    choking:
        'Raw carrot is firm and a high choking risk. Cook it until soft or grate it finely to make it safe for babies and toddlers.',
    allergens: 'Not a common allergen.',
    faq:
        'When can baby have raw carrot batons? Hard raw carrot is usually delayed until a child chews well, often around age four. Does carrot help eyesight? It supports eye health via vitamin A as part of a varied diet.',
    tips:
        'Roasting brings out natural sweetness. Cook a batch of soft batons and refrigerate for easy meals.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'spinach',
    name: 'Spinach',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/spinach_hero.jpg'),
    nutritionFlags: ['Iron-rich', 'Folate'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Spinach can be offered from around six months, usually cooked and finely chopped or blended into other foods. Cooked spinach is soft and easy to combine into purees and family meals.\n\n'
        'Spinach contains plant-based (non-haem) iron, folate, and vitamin A. Plant iron is absorbed less efficiently than the iron in meat, so pairing spinach with a vitamin C source (such as a little tomato or citrus) can help absorption.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until wilted, chop finely or blend, and mix into purees.',
        portion: 'A spoonful blended into other foods.',
        texture: 'Soft, finely chopped or blended.',
        safetyNote: 'Whole raw leaves can ball up; cook and chop for young babies.',
        media: AppMedia(uri: 'assets/foods/spinach_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Finely chop cooked spinach into omelettes, dahl, or pasta sauces.',
        portion: 'A small amount mixed into meals.',
        texture: 'Soft, chopped.',
        media: AppMedia(uri: 'assets/foods/spinach_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Cooked spinach in a range of family dishes; small amounts of raw in soft mixes.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/spinach_12mo.jpg'),
      ),
    ],
    choking:
        'Cooked, chopped spinach is low risk. Large raw leaves can bunch together, so cook and finely chop it for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Is spinach a complete iron source? It provides iron but of the less-absorbed plant type; offer iron-rich meat, beans, or fortified foods too. Pair it with vitamin C to boost absorption.',
    tips:
        'Blend cooked spinach into tomato pasta sauce for an easy iron-plus-vitamin-C combination. A handful wilts down to very little, so add generously.',
    sourceCitations: ['WHO complementary feeding', 'SACN 2018'],
  ),
  Food(
    id: 'butternut_squash',
    name: 'Butternut squash',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/butternut_squash_hero.jpg'),
    nutritionFlags: ['Vitamin A', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Butternut squash is a soft, sweet vegetable that can be offered from around six months once cooked until tender. It mashes smoothly and holds together well as a finger food.\n\n'
        'Squash is rich in beta-carotene (vitamin A) and provides fibre and potassium. Its mild, naturally sweet flavour is widely accepted and combines easily with iron-rich foods and warming spices.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Roast or steam until very soft, then offer as a wedge or mash smooth.',
        portion: 'About 1–2 tablespoons mashed, or one wedge.',
        texture: 'Soft, cooked.',
        safetyNote: 'Cook until a piece squashes easily.',
        media: AppMedia(uri: 'assets/foods/butternut_squash_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut soft cooked squash into small bite-sized cubes.',
        portion: 'A small handful.',
        texture: 'Soft cubes.',
        media: AppMedia(uri: 'assets/foods/butternut_squash_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve in soups, mashes, risottos, and curries.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/butternut_squash_12mo.jpg'),
      ),
    ],
    choking:
        'Soft cooked squash is low risk. Ensure it is fully cooked; firm pieces are harder for babies to manage.',
    allergens: 'Not a common allergen.',
    faq:
        'Can I use frozen squash? Yes, frozen butternut cubes cook down well and are convenient. Is pumpkin similar? Yes, pumpkin can be prepared the same way with a similar nutrition profile.',
    tips:
        'Roasting concentrates the sweetness. A pinch of cinnamon or nutmeg adds variety without sugar or salt.',
    sourceCitations: ['WHO complementary feeding', 'NHS Start4Life'],
  ),
  Food(
    id: 'green_pea',
    name: 'Green peas',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/green_pea_hero.jpg'),
    nutritionFlags: ['Plant protein', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Cooked peas can be offered from around six months. Because whole peas are small and round with a firm skin, they are usually smashed or mashed for younger babies before being served whole later on.\n\n'
        'Peas provide plant protein, fibre, vitamin C, and some iron. Their sweet flavour is appealing, and they mix easily into mashes, purees, and family dishes.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until soft and smash or mash; or blend into a smooth pea puree.',
        portion: 'About 1–2 tablespoons mashed.',
        texture: 'Smashed or pureed.',
        safetyNote: 'Whole peas are small and round; smash them for young babies.',
        media: AppMedia(uri: 'assets/foods/green_pea_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Lightly smash whole cooked peas, or mix into soft grains and mashes.',
        portion: 'A small handful, smashed.',
        texture: 'Smashed, soft.',
        media: AppMedia(uri: 'assets/foods/green_pea_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut:
            'Whole soft peas mixed into meals are usually well managed; supervise closely.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/green_pea_12mo.jpg'),
      ),
    ],
    choking:
        'Whole peas are small, round, and firm, posing a moderate choking risk. Smashing or mashing them removes the hazard for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Are frozen peas fine? Yes, frozen peas are nutritious and cook quickly. Should I worry about the skins? The skins can be tough; smashing softens them for younger babies.',
    tips:
        'Stir smashed peas through mashed potato for an easy combination. Frozen peas cook in a couple of minutes from the bag.',
    sourceCitations: ['WHO complementary feeding', 'NHS Start4Life'],
  ),

  // ---------------------------------------------------------------------------
  // GRAIN
  // ---------------------------------------------------------------------------
  Food(
    id: 'oats',
    name: 'Oats (porridge)',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/oats_hero.jpg'),
    nutritionFlags: ['Iron-rich', 'Fibre'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Oats, usually served as porridge, can be offered from around six months. Cooked soft with milk or water, they make a smooth, easy first cereal that is gentle on a baby’s digestion.\n\n'
        'Oats provide fibre, slow-release carbohydrate, and some iron, especially when fortified. Plain porridge is a useful base that can be combined with mashed fruit or a nut or seed butter (thinned) to add flavour and nutrition.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Cook oats soft with breast milk, formula, or water to a smooth, thick porridge.',
        portion: 'A few spoonfuls.',
        texture: 'Smooth porridge.',
        safetyNote: 'Serve warm, not hot; stir and test the temperature first.',
        media: AppMedia(uri: 'assets/foods/oats_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer thicker porridge or soft oat fingers; stir in mashed fruit.',
        portion: 'A small bowl.',
        texture: 'Thick, soft.',
        media: AppMedia(uri: 'assets/foods/oats_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve porridge, overnight oats, or soft baked oat bars.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/oats_12mo.jpg'),
      ),
    ],
    choking:
        'Smooth cooked porridge is low risk. Avoid dry oats or thick clumps for very young babies.',
    allergens:
        'Oats themselves are not among the top common allergens, though some people are sensitive to them and they may carry traces of gluten from processing. Choose clearly labelled oats if avoiding gluten.',
    faq:
        'Can I add sugar or honey? No added sugar is needed, and honey should not be given before 12 months. Which oats are best? Fine or rolled oats cook to a smoother texture for young babies.',
    tips:
        'Cook with breast milk or formula for a familiar flavour. Stir in mashed banana or berries instead of sweeteners.',
    sourceCitations: ['WHO complementary feeding', 'NHS Start4Life'],
  ),
  Food(
    id: 'rice',
    name: 'Rice',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/rice_hero.jpg'),
    nutritionFlags: ['Energy', 'Carbohydrate'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Well-cooked rice can be offered from around six months as a soft, easy grain. Sticky or soft-cooked rice clumps together and is simple for babies to scoop or pick up.\n\n'
        'Rice provides carbohydrate for energy. Some health authorities advise limiting rice products such as rice drinks and large amounts of rice cereal for young children because of naturally occurring arsenic; ordinary cooked rice as part of a varied diet is fine. Rice drinks are generally not recommended as a milk substitute for under-fives.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook rice soft and sticky; serve in small soft clumps or mixed into puree.',
        portion: 'A few spoonfuls.',
        texture: 'Soft, sticky.',
        safetyNote: 'Cook until very soft; serve warm, not hot.',
        media: AppMedia(uri: 'assets/foods/rice_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer soft rice mixed with vegetables, lentils, or minced meat.',
        portion: 'A small handful.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/rice_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve rice in family dishes such as risotto, congee, or stir-fries.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/rice_12mo.jpg'),
      ),
    ],
    choking:
        'Soft cooked rice is low risk, especially sticky varieties that clump together. Loose dry grains are best mixed into moist dishes.',
    allergens: 'Not a common allergen.',
    faq:
        'Is rice safe given arsenic concerns? Ordinary cooked rice in a varied diet is fine; some authorities suggest limiting rice cereal and avoiding rice drinks for young children. Should I rinse rice? Rinsing and cooking in plenty of water can reduce arsenic content.',
    tips:
        'Cook rice slightly softer than for adults. Mix with iron-rich beans or meat to make a more complete meal.',
    sourceCitations: ['NHS Start4Life', 'US Dietary Guidelines 2020–2025'],
  ),
  Food(
    id: 'bread',
    name: 'Bread (wheat)',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/bread_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'wheat',
    nutritionFlags: ['Energy', 'Fibre'],
    approachNote:
        'Grains wait until about two in our approach. Bread is the exception: small, regular tastes from six months build tolerance to wheat, a common allergen. Offer it for allergen exposure, not as a staple.',
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Bread, which contains wheat, can be introduced from around six months. Wheat is a common allergen, so it is sensibly offered on its own the first time, in a small amount, earlier in the day so any reaction can be watched.\n\n'
        'Bread provides carbohydrate, fibre (especially wholemeal), and some iron and B vitamins, particularly where flour is fortified. Lightly toasting bread changes its texture so it is less likely to form a sticky ball in the mouth. Choose lower-salt options where possible.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Lightly toast and cut into fingers; you can spread thinly with a smooth nut or seed butter or mashed avocado.',
        portion: 'One or two fingers.',
        texture: 'Lightly toasted.',
        safetyNote: 'Soft fresh bread can ball up; light toasting reduces this.',
        media: AppMedia(uri: 'assets/foods/bread_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer toast fingers or small sandwich pieces with soft fillings.',
        portion: 'A few pieces.',
        texture: 'Toasted or soft.',
        media: AppMedia(uri: 'assets/foods/bread_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve sandwiches cut small, toast, or bread with meals.',
        portion: 'Varies with appetite.',
        texture: 'Varied.',
        media: AppMedia(uri: 'assets/foods/bread_12mo.jpg'),
      ),
    ],
    choking:
        'Fresh soft bread can compress into a sticky ball that is hard to clear. Lightly toasting it and cutting it into manageable fingers reduces the risk.',
    allergens:
        'Bread contains wheat, a common allergen. Introduce it on its own and watch for reactions such as hives, redness, swelling, vomiting, or, rarely, breathing difficulty. Seek emergency help for any severe symptoms.',
    faq:
        'Should I delay wheat to prevent allergy? Current guidance is not to delay common allergens beyond around six months. Is wholemeal better? Wholemeal adds fibre; very high-fibre diets can be filling, so balance with energy-dense foods.',
    tips:
        'Choose lower-salt bread and check labels. Thin nut or seed butter so it does not form a sticky layer.',
    sourceCitations: ['NIAID 2017', 'NHS Start4Life', 'SACN 2018'],
  ),
  Food(
    id: 'quinoa',
    name: 'Quinoa',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/quinoa_hero.jpg'),
    nutritionFlags: ['Plant protein', 'Iron-rich'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Quinoa, a small seed cooked like a grain, can be offered from around six months once cooked soft. It is naturally gluten-free and works well mixed into other foods.\n\n'
        'Quinoa provides plant protein, iron, magnesium, and fibre, making it a useful addition for varied first-foods diets, including vegetarian ones. Rinsing before cooking removes its natural bitter coating (saponin).',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Rinse, cook soft, and mix into vegetable purees or mashes.',
        portion: 'A spoonful mixed into other foods.',
        texture: 'Soft, mixed.',
        safetyNote: 'Cook until fluffy and soft; mix with moist foods so it is easy to eat.',
        media: AppMedia(uri: 'assets/foods/quinoa_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Serve soft quinoa with vegetables, beans, or minced meat.',
        portion: 'A small handful.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/quinoa_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Use in salads, patties, and family grain bowls.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/quinoa_12mo.jpg'),
      ),
    ],
    choking:
        'Soft cooked quinoa is low risk. Mixing it into moist dishes makes the small grains easier to manage.',
    allergens: 'Not a common allergen.',
    faq:
        'Why rinse quinoa? Rinsing removes a bitter natural coating and improves the taste. Is it good for vegetarian babies? Yes, it adds plant protein and iron, useful in meat-free diets.',
    tips:
        'Cook a batch and stir into vegetable mashes through the week. Combine with a vitamin C food to support iron absorption.',
    sourceCitations: ['WHO complementary feeding', 'US Dietary Guidelines 2020–2025'],
  ),
  Food(
    id: 'pasta',
    name: 'Pasta (wheat)',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/pasta_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'wheat',
    nutritionFlags: ['Energy', 'Carbohydrate'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Pasta, usually made from wheat, can be introduced from around six months cooked until soft. Because wheat is a common allergen, the first serving is sensibly small and on its own so any reaction can be observed.\n\n'
        'Pasta provides carbohydrate for energy and, when wholemeal, extra fibre. Large soft shapes are easy for babies to hold, and pasta carries iron-rich sauces such as bolognese or lentil ragu well.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Cook large shapes (e.g. fusilli or penne) until very soft; serve plain or lightly coated in a smooth sauce.',
        portion: 'A few pieces.',
        texture: 'Soft, cooked.',
        safetyNote: 'Cook softer than for adults so pieces squash easily.',
        media: AppMedia(uri: 'assets/foods/pasta_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer smaller pasta shapes with iron-rich sauces; cut larger pieces if needed.',
        portion: 'A small handful.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/pasta_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve a range of pasta dishes; cut long shapes into shorter lengths.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/pasta_12mo.jpg'),
      ),
    ],
    choking:
        'Soft cooked pasta is low risk. Cut long shapes such as spaghetti into shorter lengths so they are easy to manage.',
    allergens:
        'Wheat pasta contains a common allergen. Introduce it on its own and watch for reactions such as hives, swelling, vomiting, or breathing difficulty. Seek emergency help for any severe symptoms.',
    faq:
        'Can I use gluten-free pasta? Yes, though it is not needed unless avoiding wheat; cook it soft. Should pasta be plain at first? A plain or lightly sauced serving makes a reaction easier to spot on the first try.',
    tips:
        'Toss soft pasta with iron-rich lentil or meat sauce. Larger spiral shapes are easy for little hands to grip.',
    sourceCitations: ['NIAID 2017', 'NHS Start4Life'],
  ),

  // ---------------------------------------------------------------------------
  // PROTEIN
  // ---------------------------------------------------------------------------
  Food(
    id: 'egg',
    name: 'Egg',
    category: 'Egg',
    heroMedia: AppMedia(uri: 'assets/foods/egg_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'egg',
    nutritionFlags: ['Protein', 'Iron-rich'],
    minAgeMonths: 6,
    whyFirst:
        'Well-cooked whole egg, early and often: choline, DHA, and iron, and the best start on a top allergen.',
    chokingRisk: 'Low',
    introduction:
        'Well-cooked egg is a nutritious early food and can generally be introduced from around six months. Egg is a common allergen, so it is offered on its own at first, in a small amount and earlier in the day, with the baby watched afterwards.\n\n'
        'For babies at higher risk of food allergy (for example those with severe eczema or an existing egg allergy in the family picture), some guidance suggests discussing earlier, careful introduction of egg with a clinician, sometimes from around four months. Egg provides high-quality protein, iron, choline, and vitamin D. Always cook egg thoroughly for babies unless using eggs certified as safe to eat less cooked.',
    howToServeByAge: [
      ServingBand(
        ageBand: '4 mo+ (higher-risk)',
        howToCut:
            'Only on the advice of a clinician for higher-risk babies: a small amount of smooth, well-cooked egg, watched closely.',
        portion: 'A small clinician-guided amount.',
        texture: 'Smooth, well-cooked.',
        safetyNote:
            'Earlier introduction is for higher-risk babies only and should be discussed with a health professional first.',
        media: AppMedia(uri: 'assets/foods/egg_4mo.jpg'),
      ),
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer well-cooked egg as an omelette strip, hard-boiled wedge, or scrambled.',
        portion: 'A few strips or 1–2 tablespoons scrambled.',
        texture: 'Soft, fully cooked.',
        safetyNote: 'Cook until white and yolk are firm unless using safe-to-eat eggs.',
        media: AppMedia(uri: 'assets/foods/egg_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut cooked egg into small bite-sized pieces or fold into other dishes.',
        portion: 'A small handful.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/egg_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve egg in omelettes, frittatas, and a range of family meals.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/egg_12mo.jpg'),
      ),
    ],
    choking:
        'Cooked egg is soft and low risk. Cut firm hard-boiled egg into manageable pieces for younger babies.',
    allergens:
        'Egg is a common allergen. Introduce it alone and watch for hives, redness, swelling, vomiting, or breathing difficulty. Severe reactions need emergency care. This is general information, not medical advice; discuss higher-risk situations with a clinician.',
    faq:
        'Can I give runny egg? For babies, cook egg thoroughly unless the eggs are certified safe to eat less cooked. Does the whole egg matter? Both yolk and white are nutritious; offer the whole egg once tolerated.',
    tips:
        'A flat, well-cooked omelette cut into strips is easy to hold. Reintroduce egg regularly once tolerated to help maintain tolerance.',
    sourceCitations: ['NIAID 2017', 'LEAP & EAT trials', 'NHS Start4Life'],
  ),
  Food(
    id: 'chicken',
    name: 'Chicken',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/chicken_hero.jpg'),
    nutritionFlags: ['Protein', 'Iron-rich'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Chicken can be offered from around six months once cooked through and prepared in a soft, manageable form. Meat is an important early food because of its iron and protein content.\n\n'
        'Chicken provides protein, iron, and zinc. The iron in meat (haem iron) is well absorbed, which supports a baby’s falling iron stores after about six months. Moist preparations such as shredded chicken in sauce or blended into puree are easiest for young babies.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Cook thoroughly and offer finely shredded, minced, or blended into a moist puree.',
        portion: 'About 1–2 tablespoons.',
        texture: 'Soft, shredded or pureed.',
        safetyNote: 'Keep it moist; dry chunks of meat are harder to chew and swallow.',
        media: AppMedia(uri: 'assets/foods/chicken_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer soft shredded chicken or a large strip to gnaw, or small minced pieces.',
        portion: 'A small handful.',
        texture: 'Soft, shredded.',
        media: AppMedia(uri: 'assets/foods/chicken_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve diced or shredded chicken in stews, curries, and family dishes.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/chicken_12mo.jpg'),
      ),
    ],
    choking:
        'Firm or dry chunks of chicken are a moderate choking risk. Shredding, mincing, or serving it moist in sauce makes it easier and safer to eat.',
    allergens: 'Not a common allergen.',
    faq:
        'Which cut is best? Darker meat such as thigh is moister and often easier for babies than dry breast. Can I season it? Use herbs and mild spices but avoid added salt for babies.',
    tips:
        'Cook chicken in a sauce or stock to keep it tender. Pair with vitamin C foods to support iron absorption.',
    sourceCitations: ['WHO complementary feeding', 'SACN 2018'],
  ),
  Food(
    id: 'beef',
    name: 'Beef',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/beef_hero.jpg'),
    nutritionFlags: ['Iron-rich', 'Protein'],
    minAgeMonths: 6,
    whyFirst:
        'Slow-cooked in its own stock, beef is the first solid after the stock itself: haem iron, zinc, and gelatine in a form a six-month-old can manage.',
    chokingRisk: 'Moderate',
    introduction:
        'Beef can be offered from around six months once cooked through and served in a soft form such as mince or a moist, blended puree. Red meat is one of the best early sources of iron.\n\n'
        'Beef supplies well-absorbed haem iron, zinc, and protein, all important for growth and brain development as a baby’s iron stores naturally decline after about six months. Mince, slow-cooked shreds, or meat blended into sauces are well suited to young babies.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer soft minced beef, slow-cooked shredded beef, or meat blended into a moist puree.',
        portion: 'About 1–2 tablespoons.',
        texture: 'Soft, minced or pureed.',
        safetyNote: 'Avoid firm, chewy chunks; keep beef moist and soft.',
        media: AppMedia(uri: 'assets/foods/beef_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Serve soft mince or finely shredded slow-cooked beef in sauces.',
        portion: 'A small handful.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/beef_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve in bolognese, stews, meatballs (soft, cut up), and curries.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/beef_12mo.jpg'),
      ),
    ],
    choking:
        'Firm or chewy beef is a moderate choking risk. Mincing, slow-cooking until shreddable, or blending into sauce reduces the hazard.',
    allergens: 'Not a common allergen.',
    faq:
        'Is red meat suitable so young? Yes, it is encouraged as an early iron source; offer it in soft forms. How often? Iron-rich foods such as meat are recommended most days.',
    tips:
        'Slow-cooked beef shreds easily and stays moist. Combine with vitamin C vegetables to boost iron absorption.',
    sourceCitations: ['WHO complementary feeding', 'SACN 2018', 'AAP'],
  ),
  Food(
    id: 'salmon',
    name: 'Salmon (fish)',
    category: 'Fish & Seafood',
    heroMedia: AppMedia(uri: 'assets/foods/salmon_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'fish',
    nutritionFlags: ['Healthy fats', 'Protein'],
    minAgeMonths: 6,
    whyFirst:
        'Oily fish for DHA and vitamin D, and an early, careful start on the fish allergen.',
    chokingRisk: 'Low',
    introduction:
        'Salmon can be introduced from around six months once cooked through and carefully checked for bones. Fish is a common allergen, so the first serving is offered on its own in a small amount, with the baby watched afterwards.\n\n'
        'Salmon is an oily fish rich in omega-3 fats (DHA) that support brain and eye development, along with protein and vitamin D. Oily fish is encouraged in moderation; some authorities suggest limiting oily fish portions per week for young children. Always remove bones thoroughly.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook through, flake carefully checking for bones, and offer soft flakes or mash.',
        portion: 'About 1–2 tablespoons.',
        texture: 'Soft, flaked.',
        safetyNote: 'Check very carefully for small bones before serving.',
        media: AppMedia(uri: 'assets/foods/salmon_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer soft flaked salmon mixed into mash, rice, or pasta.',
        portion: 'A small handful.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/salmon_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve flaked salmon in fishcakes (soft), pasta, or with vegetables.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/salmon_12mo.jpg'),
      ),
    ],
    choking:
        'Flaked cooked salmon is soft and low risk. The main hazard is bones, so check the flesh thoroughly before serving.',
    allergens:
        'Fish is a common allergen. Introduce it alone and watch for hives, swelling, vomiting, or breathing difficulty. Severe reactions need emergency care. This is general information, not medical advice.',
    faq:
        'Is tinned salmon fine? Yes, lower-salt tinned salmon is convenient; soft tinned bones can be mashed in. How much oily fish? The NHS says boys can have up to four portions of oily fish a week and girls no more than two, because pollutants can build up in the body.',
    tips:
        'Mix flaked salmon with mashed potato for an easy meal. Buy boneless fillets and still double-check for stray bones.',
    sourceCitations: ['NIAID 2017', 'NHS Start4Life', 'SACN 2018'],
  ),
  Food(
    id: 'shrimp',
    name: 'Shrimp / prawn (shellfish)',
    category: 'Fish & Seafood',
    heroMedia: AppMedia(uri: 'assets/foods/shrimp_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'shellfish',
    nutritionFlags: ['Protein', 'Iodine'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Cooked shrimp (prawn) can be introduced from around six months, though many families choose to wait a little longer. Shellfish is a common allergen, so it is offered on its own in a small amount, earlier in the day, with the baby watched afterwards.\n\n'
        'Shrimp provides protein, iodine, and some zinc. It must be cooked thoroughly and chopped or minced finely, because its firm, rubbery texture makes whole or large pieces harder for babies to chew.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook thoroughly and finely mince or blend into a smooth, moist mixture.',
        portion: 'A small amount, finely minced.',
        texture: 'Soft, minced.',
        safetyNote: 'Whole or large pieces are rubbery and harder to chew; mince finely.',
        media: AppMedia(uri: 'assets/foods/shrimp_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer finely chopped cooked shrimp mixed into rice, pasta, or vegetables.',
        portion: 'A small handful, chopped.',
        texture: 'Soft, chopped.',
        media: AppMedia(uri: 'assets/foods/shrimp_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve chopped shrimp in stir-fries, rice dishes, and curries; supervise closely.',
        portion: 'Varies with appetite.',
        texture: 'Soft, chopped.',
        media: AppMedia(uri: 'assets/foods/shrimp_12mo.jpg'),
      ),
    ],
    choking:
        'Whole or large pieces of shrimp are rubbery and a moderate choking risk. Mincing or finely chopping cooked shrimp makes it safer.',
    allergens:
        'Shellfish is a common allergen and a frequent cause of lasting allergy. Introduce it alone and watch for hives, swelling, vomiting, or breathing difficulty. Severe reactions need emergency care. This is general information, not medical advice.',
    faq:
        'Should I wait to introduce shellfish? Guidance generally allows it from around six months; some families wait longer, which is also fine. Must it be cooked? Yes, always serve shellfish thoroughly cooked to babies.',
    tips:
        'Mince finely and mix into a familiar dish for the first try. Make sure it is cooked through with no translucent centre.',
    sourceCitations: ['NIAID 2017', 'NHS Start4Life'],
  ),
  Food(
    id: 'peanut_butter',
    name: 'Peanut butter',
    category: 'Nut & Seed',
    heroMedia: AppMedia(uri: 'assets/foods/peanut_butter_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'peanut',
    nutritionFlags: ['Healthy fats', 'Protein'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Smooth peanut butter (thinned) is the usual way to introduce peanut, generally from around six months. Evidence including the LEAP trial suggests that introducing peanut early and keeping it in the diet can reduce the risk of peanut allergy in many babies.\n\n'
        'For babies at higher risk — for example those with severe eczema, an existing egg allergy, or both — some guidance (such as the US NIAID 2017 addendum) suggests introducing peanut earlier, around four to six months, after discussion with a clinician and, where advised, allergy assessment. Never give whole peanuts or thick spoonfuls of nut butter, which are choking hazards.',
    howToServeByAge: [
      ServingBand(
        ageBand: '4 mo+ (higher-risk)',
        howToCut:
            'For higher-risk babies only and after clinician advice: a small amount of smooth peanut butter thinned with water, milk, or puree.',
        portion: 'A clinician-guided small amount.',
        texture: 'Thinned, smooth.',
        safetyNote:
            'Earlier introduction applies to higher-risk babies and should follow professional advice.',
        media: AppMedia(uri: 'assets/foods/peanut_butter_4mo.jpg'),
      ),
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Thin smooth peanut butter with warm water, breast milk, formula, or stir into porridge or yoghurt.',
        portion: 'Building toward about 2 g peanut protein (roughly a small teaspoon of peanut butter).',
        texture: 'Thinned, smooth.',
        safetyNote: 'Never offer thick, sticky spoonfuls or whole nuts to babies.',
        media: AppMedia(uri: 'assets/foods/peanut_butter_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinly on toast fingers or swirl into soft foods.',
        portion: 'A thin spread.',
        texture: 'Thin spread.',
        media: AppMedia(uri: 'assets/foods/peanut_butter_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Continue thin spreads and stirred-in peanut butter; still avoid whole peanuts.',
        portion: 'Varies with appetite.',
        texture: 'Thin spread.',
        safetyNote: 'Whole peanuts remain a choking hazard well beyond toddlerhood.',
        media: AppMedia(uri: 'assets/foods/peanut_butter_12mo.jpg'),
      ),
    ],
    choking:
        'Thick globs of peanut butter and whole peanuts are choking hazards. Always thin the butter or spread it thinly, and never give whole nuts to young children.',
    allergens:
        'Peanut is a common allergen. Introduce it alone and watch for hives, swelling, vomiting, or breathing difficulty. Severe reactions need emergency care. Higher-risk babies should be discussed with a clinician. This is general information, not medical advice.',
    faq:
        'Why introduce peanut early? Trials such as LEAP suggest early, sustained introduction lowers peanut allergy risk in many babies. How often after introducing? Keeping peanut in the diet regularly (for example a few times a week) helps maintain tolerance.',
    tips:
        'Use only smooth peanut butter, never crunchy, for babies. Stir a little into warm porridge to thin it easily.',
    sourceCitations: ['NIAID 2017', 'LEAP & EAT trials', 'NHS Start4Life'],
  ),
  Food(
    id: 'almond_butter',
    name: 'Almond butter (tree nut)',
    category: 'Nut & Seed',
    heroMedia: AppMedia(uri: 'assets/foods/almond_butter_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'tree_nuts',
    nutritionFlags: ['Healthy fats', 'Protein'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Smooth almond butter (thinned) is a common way to introduce tree nuts, generally from around six months. Tree nuts are a common allergen, so almond butter is offered on its own in a small amount, with the baby watched afterwards.\n\n'
        'Almond butter provides healthy unsaturated fats, protein, vitamin E, and some calcium. As with peanut, never give whole nuts or thick spoonfuls of nut butter, which are choking hazards; always thin the butter or spread it thinly.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Thin smooth almond butter with warm water, milk, or puree, or stir into porridge or yoghurt.',
        portion: 'A small thinned amount, building gradually.',
        texture: 'Thinned, smooth.',
        safetyNote: 'Never offer whole nuts or thick sticky spoonfuls to babies.',
        media: AppMedia(uri: 'assets/foods/almond_butter_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinly on toast fingers or swirl into soft foods.',
        portion: 'A thin spread.',
        texture: 'Thin spread.',
        media: AppMedia(uri: 'assets/foods/almond_butter_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Continue thin spreads and stirred-in nut butter; still avoid whole nuts.',
        portion: 'Varies with appetite.',
        texture: 'Thin spread.',
        safetyNote: 'Whole tree nuts remain a choking hazard for young children.',
        media: AppMedia(uri: 'assets/foods/almond_butter_12mo.jpg'),
      ),
    ],
    choking:
        'Whole tree nuts and thick globs of nut butter are choking hazards. Thin or thinly spread the butter, and never give whole nuts to young children.',
    allergens:
        'Tree nuts are a common allergen. Introduce one nut type alone and watch for hives, swelling, vomiting, or breathing difficulty. Severe reactions need emergency care. This is general information, not medical advice.',
    faq:
        'Does one tree nut cover them all? Not necessarily — tree nuts are separate allergens, so tolerance to almond does not guarantee tolerance to, say, cashew. Crunchy or smooth? Use smooth nut butter only for babies.',
    tips:
        'Stir a little into warm porridge to thin it. Introduce different tree nuts one at a time as smooth, thinned butters.',
    sourceCitations: ['NIAID 2017', 'NHS Start4Life'],
  ),
  Food(
    id: 'tofu',
    name: 'Tofu (soy)',
    category: 'Legume',
    heroMedia: AppMedia(uri: 'assets/foods/tofu_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'soy',
    nutritionFlags: ['Plant protein', 'Iron-rich'],
    approachNote:
        'Legumes wait until about two in our approach. Tofu is the exception: small, regular tastes from six months build tolerance to soy, a common allergen. Offer it for allergen exposure, not as a staple.',
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Tofu, made from soya beans, can be introduced from around six months. Soy is a common allergen, so tofu is offered on its own at first in a small amount, with the baby watched afterwards.\n\n'
        'Tofu provides plant protein, iron, and calcium, making it a useful food for vegetarian and varied diets. Its soft texture is easy for babies, and firmer tofu can be cut into graspable strips while silken tofu blends smoothly into purees.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer soft strips of firm tofu, or blend silken tofu into a smooth puree.',
        portion: 'A strip or 1–2 tablespoons.',
        texture: 'Soft.',
        safetyNote: 'Tofu is slippery; rolling strips in fine flakes can help baby grip.',
        media: AppMedia(uri: 'assets/foods/tofu_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut firm tofu into small bite-sized cubes, lightly pan-cooked if liked.',
        portion: 'A small handful.',
        texture: 'Soft cubes.',
        media: AppMedia(uri: 'assets/foods/tofu_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve in stir-fries, curries, and scrambles; cut into bite-sized pieces.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/tofu_12mo.jpg'),
      ),
    ],
    choking:
        'Soft tofu is low risk. Firm tofu cubes should be cut to a manageable size; slippery pieces can be coated to help grip.',
    allergens:
        'Soy is a common allergen. Introduce it alone and watch for hives, swelling, vomiting, or breathing difficulty. Severe reactions need emergency care. This is general information, not medical advice.',
    faq:
        'Is soy safe for babies? Tofu and other soy foods are fine as part of a varied diet; soy infant formula should only be used on professional advice. Firm or silken? Firm tofu suits finger feeding; silken tofu blends into purees.',
    tips:
        'Press firm tofu to remove water so it browns and firms up. Marinate lightly (no added salt) for flavour.',
    sourceCitations: ['NIAID 2017', 'WHO complementary feeding'],
  ),
  Food(
    id: 'tahini',
    name: 'Tahini (sesame)',
    category: 'Nut & Seed',
    heroMedia: AppMedia(uri: 'assets/foods/tahini_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'sesame',
    nutritionFlags: ['Healthy fats', 'Calcium'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Tahini, a smooth paste made from sesame seeds, is a practical way to introduce sesame, generally from around six months. Sesame is a common allergen, so tahini is offered on its own in a small thinned amount, with the baby watched afterwards.\n\n'
        'Tahini provides healthy fats, protein, calcium, and iron. Like nut butters, thick spoonfuls are a choking hazard, so it should be thinned or spread thinly. It also blends well into hummus and other dips.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Thin tahini with warm water, milk, or puree, or stir a little into porridge, yoghurt, or hummus.',
        portion: 'A small thinned amount.',
        texture: 'Thinned, smooth.',
        safetyNote: 'Never offer thick sticky spoonfuls; thin tahini before serving.',
        media: AppMedia(uri: 'assets/foods/tahini_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinly on toast fingers or mix into soft vegetable dishes and dips.',
        portion: 'A thin spread or stirred-in amount.',
        texture: 'Thin spread.',
        media: AppMedia(uri: 'assets/foods/tahini_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Use in hummus, dressings, and dips as part of family meals.',
        portion: 'Varies with appetite.',
        texture: 'Smooth.',
        media: AppMedia(uri: 'assets/foods/tahini_12mo.jpg'),
      ),
    ],
    choking:
        'Thick tahini can be sticky and a moderate choking risk, like nut butters. Thinning it or spreading it thinly reduces the hazard. Whole sesame seeds are very small and best mixed into foods.',
    allergens:
        'Sesame is a common allergen (added to the US major-allergen list in 2023). Introduce it alone and watch for hives, swelling, vomiting, or breathing difficulty. Severe reactions need emergency care. This is general information, not medical advice.',
    faq:
        'Is hummus a good way to give sesame? Yes, hummus contains tahini and is an easy vehicle once chickpeas are tolerated. Are whole sesame seeds enough? Tahini gives a more reliable amount of sesame protein than a sprinkle of seeds.',
    tips:
        'Stir tahini into plain yoghurt for a quick, mild introduction. Keep it thin so it never forms a sticky lump.',
    sourceCitations: ['NIAID 2017', 'US Dietary Guidelines 2020–2025'],
  ),

  // ---------------------------------------------------------------------------
  // DAIRY
  // ---------------------------------------------------------------------------
  Food(
    id: 'yoghurt',
    name: 'Yoghurt (cow’s milk)',
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/yoghurt_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Calcium', 'Protein'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Plain full-fat yoghurt made from cow’s milk can be offered from around six months. Although cow’s milk as a main drink is not recommended before twelve months, dairy foods such as yoghurt and cheese are fine from about six months in small amounts.\n\n'
        'Yoghurt provides calcium, protein, and (when full-fat) energy-dense fat that babies need. Cow’s milk is a common allergen, so the first serving is sensibly small and on its own. Choose unsweetened, full-fat plain yoghurt and add mashed fruit for flavour rather than sugar.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer plain full-fat yoghurt on a pre-loaded spoon, or let baby scoop with hands.',
        portion: 'A few spoonfuls.',
        texture: 'Smooth.',
        safetyNote: 'Choose unsweetened plain yoghurt; avoid added sugar.',
        media: AppMedia(uri: 'assets/foods/yoghurt_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Serve yoghurt with mashed fruit, or use as a dip for soft foods.',
        portion: 'A small bowl.',
        texture: 'Smooth.',
        media: AppMedia(uri: 'assets/foods/yoghurt_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve plain yoghurt with fruit, in smoothies, or in mild savoury dishes.',
        portion: 'Varies with appetite.',
        texture: 'Smooth.',
        media: AppMedia(uri: 'assets/foods/yoghurt_12mo.jpg'),
      ),
    ],
    choking: 'Yoghurt is smooth and low risk. Watch any solid mix-ins you add for choking shapes.',
    allergens:
        'Cow’s milk is a common allergen. Introduce it alone and watch for hives, swelling, vomiting, eczema flares, or breathing difficulty. Severe reactions need emergency care. This is general information, not medical advice.',
    faq:
        'Why not cow’s milk as a drink before one? Plain cow’s milk as a main drink is not recommended before twelve months, but it can be used in cooking and as yoghurt or cheese from around six months. Full-fat or low-fat? Use full-fat dairy for babies and toddlers.',
    tips:
        'Stir in mashed fruit instead of buying sweetened pots. Thick yoghurt makes a good first spoon-feeding food.',
    sourceCitations: ['NHS Start4Life', 'WHO complementary feeding'],
  ),
  Food(
    id: 'cheese',
    name: 'Cheese (cow’s milk)',
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/cheese_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Calcium', 'Protein'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Cheese made from cow’s milk can be offered from around six months, grated or cut into soft, manageable pieces. As a dairy food it is fine from about six months even though cow’s milk as a main drink waits until twelve months.\n\n'
        'Cheese provides calcium, protein, and fat. Choose full-fat varieties and be mindful that some cheeses are high in salt, so offer modest amounts. For babies, choose pasteurised cheeses and avoid mould-ripened or unpasteurised soft cheeses.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Finely grate firm pasteurised cheese over food, or offer a thin, soft slice that melts easily.',
        portion: 'A small sprinkle or thin slice.',
        texture: 'Grated or thin.',
        safetyNote: 'Avoid firm cubes or chunks; grate or slice thinly for young babies.',
        media: AppMedia(uri: 'assets/foods/cheese_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer grated cheese or thin strips; melt into omelettes or vegetables.',
        portion: 'A small handful, grated.',
        texture: 'Grated or melted.',
        media: AppMedia(uri: 'assets/foods/cheese_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve thin slices or small soft pieces; very firm chunks are cut small.',
        portion: 'Varies with appetite.',
        texture: 'Soft or thin.',
        safetyNote: 'Firm cheese cubes can be a choking risk; keep pieces thin and small.',
        media: AppMedia(uri: 'assets/foods/cheese_12mo.jpg'),
      ),
    ],
    choking:
        'Firm cheese in cubes or chunks is a moderate choking risk. Grating it or cutting thin, small pieces makes it safer for babies and toddlers.',
    allergens:
        'Cheese is a cow’s-milk product and a common allergen. Watch for hives, swelling, vomiting, eczema flares, or breathing difficulty. Severe reactions need emergency care. This is general information, not medical advice.',
    faq:
        'Which cheeses are best? Full-fat pasteurised hard cheeses (such as mild cheddar) or cream cheese; avoid mould-ripened and unpasteurised soft cheeses. Is cheese too salty? Some cheeses are salty, so offer modest amounts.',
    tips:
        'Grate cheese over vegetables to encourage acceptance. Choose lower-salt options where you can.',
    sourceCitations: ['NHS Start4Life', 'SACN 2018'],
  ),

  // ---------------------------------------------------------------------------
  // LEGUME
  // ---------------------------------------------------------------------------
  Food(
    id: 'lentil',
    name: 'Lentils',
    category: 'Legume',
    heroMedia: AppMedia(uri: 'assets/foods/lentil_hero.jpg'),
    nutritionFlags: ['Iron-rich', 'Plant protein'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Lentils can be offered from around six months once cooked soft. They cook down to a soft texture that mashes easily and mixes into many family dishes, making them a flexible early food.\n\n'
        'Lentils are a valuable plant source of iron, protein, and fibre, especially useful in vegetarian diets. Because plant (non-haem) iron is less well absorbed, serving lentils with a vitamin C food can help the body take up more iron.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and mash, or serve as a smooth dahl mixed with rice.',
        portion: 'About 1–2 tablespoons.',
        texture: 'Soft, mashed.',
        safetyNote: 'Cook until completely soft so they mash easily.',
        media: AppMedia(uri: 'assets/foods/lentil_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer soft whole cooked lentils mixed into rice, vegetables, or soups.',
        portion: 'A small handful.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/lentil_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve in dahls, soups, stews, and patties as part of family meals.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/lentil_12mo.jpg'),
      ),
    ],
    choking:
        'Soft cooked lentils are low risk. Cook them fully so they are tender and easy to swallow.',
    allergens: 'Not a common allergen.',
    faq:
        'Do lentils need soaking? Red split lentils cook quickly without soaking; larger types soften with longer cooking. Will they cause wind? Some babies are gassier with pulses, which is normal and tends to settle.',
    tips:
        'Cook a simple dahl and freeze in portions. Add a squeeze of vitamin C-rich tomato or citrus to support iron uptake.',
    sourceCitations: ['WHO complementary feeding', 'SACN 2018'],
  ),
  Food(
    id: 'chickpea',
    name: 'Chickpeas',
    category: 'Legume',
    heroMedia: AppMedia(uri: 'assets/foods/chickpea_hero.jpg'),
    nutritionFlags: ['Plant protein', 'Iron-rich'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Moderate',
    introduction:
        'Chickpeas can be offered from around six months once cooked very soft. Because whole chickpeas are round and firm with a skin, they are usually smashed or blended for younger babies, for example as hummus.\n\n'
        'Chickpeas provide plant protein, iron, and fibre. Hummus, which combines chickpeas with tahini, is a convenient way to serve them, though tahini introduces sesame, a common allergen, so introduce that component carefully.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and smash, or blend into smooth hummus.',
        portion: 'About 1–2 tablespoons smashed, or a little hummus.',
        texture: 'Smashed or smooth.',
        safetyNote: 'Whole chickpeas are round and firm; smash them for young babies.',
        media: AppMedia(uri: 'assets/foods/chickpea_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Lightly smash soft chickpeas, or serve hummus as a dip for soft foods.',
        portion: 'A small handful, smashed.',
        texture: 'Smashed.',
        media: AppMedia(uri: 'assets/foods/chickpea_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve soft whole chickpeas in stews and curries; supervise closely.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/chickpea_12mo.jpg'),
      ),
    ],
    choking:
        'Whole chickpeas are round and firm, a moderate choking risk. Smashing or blending them into hummus removes the hazard for babies.',
    allergens:
        'Chickpeas are not among the top common allergens, but hummus usually contains tahini (sesame), which is a common allergen — introduce sesame carefully.',
    faq:
        'Is tinned fine? Yes, lower-salt tinned chickpeas are convenient; rinse and cook a little longer to soften. Should I remove the skins? Removing skins makes a smoother mash for very young babies.',
    tips:
        'Blend into hummus with thinned tahini for an easy, nutritious dip. Mash tinned chickpeas with a fork for a quick meal addition.',
    sourceCitations: ['WHO complementary feeding', 'NHS Start4Life'],
  ),
  Food(
    id: 'black_bean',
    name: 'Black beans',
    category: 'Legume',
    heroMedia: AppMedia(uri: 'assets/foods/black_bean_hero.jpg'),
    nutritionFlags: ['Plant protein', 'Iron-rich'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Moderate',
    introduction:
        'Black beans can be offered from around six months once cooked soft. Like other beans, they are usually smashed or lightly mashed for younger babies because whole beans have a firm skin.\n\n'
        'Black beans provide plant protein, iron, fibre, and folate, making them a useful food for varied and vegetarian diets. Pairing them with a vitamin C food helps the body absorb more of their plant iron.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and smash, or blend into a smooth bean puree.',
        portion: 'About 1–2 tablespoons.',
        texture: 'Smashed or pureed.',
        safetyNote: 'Smash whole beans for young babies to soften the firm skin.',
        media: AppMedia(uri: 'assets/foods/black_bean_6mo.jpg'),
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Lightly smash soft beans and mix into rice, vegetables, or soft wraps.',
        portion: 'A small handful, smashed.',
        texture: 'Smashed, soft.',
        media: AppMedia(uri: 'assets/foods/black_bean_9mo.jpg'),
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Serve soft beans in stews, rice dishes, and mild chillis; supervise closely.',
        portion: 'Varies with appetite.',
        texture: 'Soft.',
        media: AppMedia(uri: 'assets/foods/black_bean_12mo.jpg'),
      ),
    ],
    choking:
        'Whole beans have a firm skin and pose a moderate choking risk. Smashing or mashing them softens the skin and makes them safer.',
    allergens: 'Not a common allergen.',
    faq:
        'Tinned or dried? Lower-salt tinned beans are convenient; rinse well before use. Why pair with vitamin C? It helps the body absorb the plant iron in beans.',
    tips:
        'Mash beans into a simple spread for toast fingers. Rinse tinned beans to reduce salt before serving.',
    sourceCitations: ['WHO complementary feeding', 'US Dietary Guidelines 2020–2025'],
  ),

  // ---------------------------------------------------------------------------
  // HONEY (special: not before 12 months — botulism risk)
  // ---------------------------------------------------------------------------
  Food(
    id: 'honey',
    name: 'Honey',
    category: 'Sweetener',
    heroMedia: AppMedia(uri: 'assets/foods/honey_hero.jpg'),
    nutritionFlags: ['Energy'],
    minAgeMonths: 12,
    chokingRisk: 'Low',
    introduction:
        'Honey should not be given to babies under twelve months of age, in any form, including in cooked or baked foods, drinks, or on a dummy. This is because honey can contain spores of the bacterium that causes infant botulism, a rare but serious illness in young babies whose gut cannot yet handle the spores.\n\n'
        'After the first birthday, a child’s digestive system is better able to handle these spores and honey can be offered. Honey is essentially a sugar, so it provides energy but little else nutritionally; it is best used sparingly to protect developing teeth and to avoid encouraging a strong preference for sweet tastes.',
    howToServeByAge: [
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'After the first birthday, a small amount can be stirred into foods such as yoghurt or porridge.',
        portion: 'A small amount, used sparingly.',
        texture: 'Smooth.',
        safetyNote: 'Never give honey before 12 months, even cooked or baked.',
        media: AppMedia(uri: 'assets/foods/honey_12mo.jpg'),
      ),
      ServingBand(
        ageBand: '18 mo+',
        howToCut: 'Use sparingly as an occasional sweetener; mind dental health.',
        portion: 'Small, occasional amounts.',
        texture: 'Smooth.',
        media: AppMedia(uri: 'assets/foods/honey_18mo.jpg'),
      ),
    ],
    choking:
        'Honey itself is not a notable choking hazard. The important safety concern is the risk of infant botulism before twelve months, not choking.',
    allergens: 'Not a common allergen.',
    faq:
        'Is cooked or baked honey safe before one? No — cooking does not reliably destroy the spores, so avoid honey entirely before twelve months. Why is honey risky for babies? It can carry bacterial spores that a young baby’s gut cannot yet handle, risking infant botulism.',
    tips:
        'Read ingredient labels, as honey can appear in cereals, biscuits, and sauces. Use mashed fruit instead of honey to sweeten foods for under-ones.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),

  // ---------------------------------------------------------------------------
  // FRUIT (continued)
  // ---------------------------------------------------------------------------
  Food(
    id: 'strawberry',
    name: 'Strawberry',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/strawberry_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Strawberries can be offered from around six months. They are rich in vitamin C, which helps the body absorb iron from other foods, so they pair well with iron-rich meals. Their bright flavour and colour make them an appealing early fruit.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer a whole large, very ripe strawberry to suck and gnaw, or mash ripe berries to a pulp.',
        portion: 'A tablespoon or two of mashed fruit.',
        texture: 'Soft, mashable.',
        safetyNote:
            'Whole small or firm strawberries are a choking risk — use only large soft ones whole, or mash.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut:
            'Quarter strawberries lengthways, or finely chop, so pieces cannot block the airway.',
        portion: 'A small handful, chopped.',
        texture: 'Soft pieces.',
      ),
    ],
    choking:
        'Round, firm berries are a choking hazard. Mash for younger babies, and quarter lengthways once your baby is taking finger foods.',
    allergens: 'Not a common allergen. Strawberries can sometimes cause a harmless skin rash around the mouth from contact — different from a true allergy.',
    faq:
        'Do strawberries cause allergies? They are not a major allergen, though local skin redness around the mouth is common and usually not an allergy. Wash well before serving.',
    tips:
        'Serve very ripe berries for natural sweetness and softness. Stir mashed strawberry into plain yoghurt or porridge.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'raspberry',
    name: 'Raspberry',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/raspberry_hero.jpg'),
    nutritionFlags: ['Fibre', 'Vitamin C'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft raspberries are an easy early fruit from around six months. They are high in fibre and vitamin C, and their soft, crumbly texture is simple for babies to manage.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer whole ripe raspberries (they squash easily), or mash onto a spoon.',
        portion: 'A few berries, mashed or whole-soft.',
        texture: 'Very soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer whole or lightly broken up to scatter on the tray.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk because raspberries are very soft and crumble easily. No special preparation is needed beyond using ripe fruit.',
    allergens: 'Not a common allergen.',
    faq:
        'Will the seeds be a problem? No — the tiny seeds are fine and add fibre. The bright colour can show in nappies, which is harmless.',
    tips:
        'A great food for early self-feeding because it squashes rather than rolls. Mix into yoghurt or oatmeal.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'blackberry',
    name: 'Blackberry',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/blackberry_hero.jpg'),
    nutritionFlags: ['Fibre', 'Antioxidants'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Ripe blackberries are soft and fibre-rich, suitable from around six months. They are mild and slightly tart, and squash easily for little hands.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Mash ripe blackberries, or offer whole soft berries to gum.',
        portion: 'A spoonful or two, mashed.',
        texture: 'Soft, juicy.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Halve or offer whole; they break down easily when chewed.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk; ripe berries are soft. Choose fully ripe fruit, as under-ripe blackberries are firmer and more tart.',
    allergens: 'Not a common allergen.',
    faq:
        'Are the seeds safe? Yes, the small seeds are fine. Expect dark stains on clothes and in nappies — harmless.',
    tips:
        'Combine with apple or pear puree to balance the tartness. Mash into porridge for extra fibre.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'watermelon',
    name: 'Watermelon',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/watermelon_hero.jpg'),
    nutritionFlags: ['Hydrating', 'Vitamin C'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Watermelon is a refreshing, hydrating fruit that can be offered from around six months. It is soft and mild, though its slippery texture means it needs sizing and de-seeding for safety.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer a large, thick stick with the rind left on as a handle, removing any seeds.',
        portion: 'One or two sticks.',
        texture: 'Soft, juicy.',
        safetyNote:
            'Remove seeds and never offer small round chunks — they are slippery and a choking risk.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Cut into small, thin, de-seeded pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Slippery cubes are a choking hazard. Offer as a large stick with rind-handle for younger babies, and remove seeds.',
    allergens: 'Not a common allergen.',
    faq:
        'Can babies have melon seeds? Remove black seeds before serving. The pale immature seeds are generally fine but easier to remove.',
    tips:
        'A good cooling food when teething. Keep the rind on as a non-slip handle for early self-feeding.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'melon',
    name: 'Melon (cantaloupe)',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/melon_hero.jpg'),
    nutritionFlags: ['Vitamin A', 'Vitamin C'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Soft, ripe cantaloupe melon can be offered from around six months. It is rich in vitamin A and naturally sweet, but is slippery, so size it appropriately.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer a large, soft, de-seeded spear with a little rind as a handle.',
        portion: 'One or two spears.',
        texture: 'Soft, juicy.',
        safetyNote: 'Avoid small slippery cubes for younger babies.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Cut into small bite-sized pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Slippery chunks are a choking risk; serve as a graspable spear first, then small soft pieces once chewing is established.',
    allergens: 'Not a common allergen.',
    faq:
        'Which melon is best to start with? Any ripe, soft melon works; very firm melon is harder to manage, so choose ripe fruit.',
    tips:
        'Choose a fragrant, ripe melon that yields slightly at the stem end. Pairs nicely with plain yoghurt.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'peach',
    name: 'Peach',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/peach_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Ripe peaches are soft, juicy, and easy to serve from around six months. They are a good source of vitamin C and gentle on little tummies.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer a large wedge of very ripe, soft peach (skin can stay on as a handle), or mash.',
        portion: 'A wedge or 1–2 tablespoons mashed.',
        texture: 'Soft, juicy.',
        safetyNote: 'Always remove the hard stone (pit) completely.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut into small soft pieces or thin slices.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'The stone is a serious choking and obstruction hazard — always remove it. Firm, under-ripe peach is harder to manage, so use ripe fruit.',
    allergens: 'Not a common allergen, though stone fruits occasionally cause oral itching in older children with pollen allergies.',
    faq:
        'Do I need to peel peaches? Not for babies who can manage it — the skin is soft when ripe and can act as a handle. Peel if you prefer.',
    tips:
        'Briefly steaming or roasting firmer peaches softens them. Mash with banana for a smooth puree.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'plum',
    name: 'Plum',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/plum_hero.jpg'),
    nutritionFlags: ['Fibre', 'Vitamin C'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Ripe plums are soft and slightly tart, suitable from around six months. They are naturally high in fibre and can help keep things moving for constipated babies.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer a large wedge of very soft, ripe, de-stoned plum, or mash.',
        portion: 'A wedge or a spoonful, mashed.',
        texture: 'Soft, juicy.',
        safetyNote: 'Remove the stone, and peel the skin for younger babies as it can be tough.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Chop soft plum into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'The stone must be removed. Plum skin can be tough and slippery — peel or cut small for younger babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Will plums help with constipation? They contain fibre and natural sorbitol, which can have a gentle laxative effect — useful in moderation.',
    tips:
        'Stewing softens firmer plums and mellows the tartness. Combine with apple or oats.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'apricot',
    name: 'Apricot',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/apricot_hero.jpg'),
    nutritionFlags: ['Vitamin A', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Fresh ripe apricots are soft and rich in vitamin A, suitable from around six months. Dried apricots are sticky and need extra care.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer a soft, ripe, de-stoned apricot half, or mash.',
        portion: 'Half a fruit or a spoonful, mashed.',
        texture: 'Soft.',
        safetyNote: 'Remove the stone. Avoid whole dried apricots, which are a choking risk.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut:
            'Chop fresh apricot small; finely chop or cook soft any dried apricot.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'The stone and whole dried apricots are choking hazards. Use ripe de-stoned fresh fruit, or soften and finely chop dried.',
    allergens: 'Not a common allergen. Some dried apricots contain sulphites (a declarable allergen) — check the label.',
    faq:
        'Are dried apricots ok? In small, finely chopped or cooked amounts; choose unsulphured where possible and avoid whole pieces.',
    tips:
        'Simmer dried apricots until plump and soft, then mash into porridge. Fresh apricot pairs well with yoghurt.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'kiwi',
    name: 'Kiwi',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/kiwi_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft, ripe kiwi is suitable from around six months and is exceptionally high in vitamin C. It is tangy, which some babies love straight away and others warm to over time.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Peel and offer a large wedge of soft kiwi, or mash.',
        portion: 'A wedge or a spoonful.',
        texture: 'Soft, juicy.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Peel and cut into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk once peeled and ripe. The tiny seeds are fine. Choose ripe, soft fruit.',
    allergens: 'Kiwi is not among the major regulated allergens, but it can occasionally cause reactions in some children — introduce on its own and watch as you would any new food.',
    faq:
        'Is kiwi too acidic for babies? Its acidity may cause a harmless rash around the mouth in some babies; a true allergy is uncommon but possible.',
    tips:
        'Choose fruit that yields to gentle pressure. Mix with banana or yoghurt to soften the tang.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'pineapple',
    name: 'Pineapple',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/pineapple_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Manganese'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Ripe pineapple is tangy and juicy and can be offered from around six months. It is fibrous, so it needs cutting with the grain into manageable pieces.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer a long, soft spear of ripe pineapple to gnaw, cut with the grain.',
        portion: 'One spear.',
        texture: 'Soft but fibrous.',
        safetyNote: 'Remove the tough core and any hard skin.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Cut into small, thin, soft pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'The core is firm and the flesh is fibrous; remove the core and cut small once your baby is past the spear stage.',
    allergens: 'Not a common allergen. Its acidity can cause a harmless mouth rash in some babies.',
    faq:
        'Why does pineapple tingle? Its natural enzyme (bromelain) can cause a mild tingle and occasionally a passing rash around the mouth — usually harmless.',
    tips:
        'Choose a fragrant, ripe pineapple. Briefly cooking it softens the fibres and mellows the acidity.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'orange',
    name: 'Orange',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/orange_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Folate'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Oranges and other citrus can be offered from around six months and are an excellent source of vitamin C, which boosts iron absorption from other foods.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer a large peeled segment with the thin membrane removed, or squeeze a little juice over other foods.',
        portion: 'A segment or two.',
        texture: 'Soft, juicy.',
        safetyNote: 'Remove all pips and tough membranes, which are choking risks.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Cut peeled, de-membraned segments into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Pips, peel, and tough segment membranes are choking hazards — remove them. The juicy flesh itself is soft.',
    allergens: 'Not a common allergen; citrus acidity may cause a harmless rash around the mouth.',
    faq:
        'Can I give orange juice? Whole fruit is preferable to juice for babies; if offered at all, juice should be very limited and well diluted, with meals.',
    tips:
        'A squeeze of orange over iron-rich foods like lentils helps iron absorption. Choose seedless varieties where possible.',
    sourceCitations: ['NHS Start4Life', 'US Dietary Guidelines 2020–2025'],
  ),
  Food(
    id: 'grape',
    name: 'Grape',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/grape_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Hydrating'],
    minAgeMonths: 6,
    chokingRisk: 'High',
    introduction:
        'Grapes are nutritious but are one of the highest-risk choking foods for young children because of their round, firm shape. They must always be cut before serving.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Quarter grapes lengthways (never serve whole or halved); for younger babies, squash the quartered pieces.',
        portion: 'A few quartered grapes.',
        texture: 'Soft once cut.',
        safetyNote:
            'Whole and halved grapes are a leading choking hazard — always quarter lengthways.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Continue to quarter grapes lengthways well past the first birthday.',
        portion: 'A small handful, quartered.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'High risk. Whole or halved grapes can completely block a child\'s airway. Always quarter lengthways — this remains important for several years.',
    allergens: 'Not a common allergen.',
    faq:
        'When can my child eat whole grapes? Keep quartering until at least four to five years, when chewing and the airway have matured.',
    tips:
        'Buy seedless grapes and quarter the whole bunch ahead of time so a safe portion is always ready.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'cherry',
    name: 'Cherry',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/cherry_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Antioxidants'],
    minAgeMonths: 6,
    chokingRisk: 'High',
    introduction:
        'Cherries are sweet and nutritious but contain a hard stone and are round, so they need careful preparation from around six months.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Remove the stone, then quarter or mash the soft flesh.',
        portion: 'A few prepared cherries.',
        texture: 'Soft once stoned and cut.',
        safetyNote:
            'Always remove the stone and quarter — whole cherries and stones are serious choking hazards.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Continue to stone and halve or quarter cherries.',
        portion: 'A small handful, prepared.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'High risk: the stone and the round shape are both hazards. Stone and quarter every cherry, well beyond the first birthday.',
    allergens: 'Not a common allergen.',
    faq:
        'Are cherry stones dangerous? Yes — they are a choking and obstruction risk and should always be removed before serving.',
    tips:
        'A cherry pitter speeds up preparation. Mash stoned cherries into yoghurt or porridge.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'fig',
    name: 'Fig',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/fig_hero.jpg'),
    nutritionFlags: ['Fibre', 'Calcium'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft, ripe figs are sweet and high in fibre, suitable from around six months. Dried figs are sticky and chewy and need softening.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer a halved soft ripe fig to scoop, or mash the flesh.',
        portion: 'Half a fig or a spoonful.',
        texture: 'Soft, seedy.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Chop fresh fig small; simmer and finely chop dried figs.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Fresh ripe figs are low risk. Dried figs are chewy and sticky — soften by cooking and chop small.',
    allergens: 'Not a common allergen.',
    faq:
        'Are fig seeds ok? Yes, the tiny seeds are fine and add fibre. Figs can have a gentle laxative effect.',
    tips:
        'Choose soft, slightly wrinkled ripe figs. Stir mashed fig into yoghurt or oatmeal.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'papaya',
    name: 'Papaya',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/papaya_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Vitamin A'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Ripe papaya is soft, buttery, and easy to serve from around six months. It is rich in vitamins A and C and very gentle on the stomach.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Scoop out seeds, then offer a soft spear or mash the flesh.',
        portion: 'A spear or 1–2 tablespoons mashed.',
        texture: 'Very soft.',
        safetyNote: 'Remove all the black seeds before serving.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut into small soft pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when ripe and de-seeded. Choose soft fruit, as firm papaya is harder to manage.',
    allergens: 'Not a common allergen.',
    faq:
        'How do I pick a ripe papaya? It should be mostly yellow-orange and yield to gentle pressure. Remove the seeds before serving.',
    tips:
        'A squeeze of lime brightens the flavour for older babies. Mashes smoothly with banana.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'coconut',
    name: 'Coconut',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/coconut_hero.jpg'),
    nutritionFlags: ['Healthy fats', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Coconut in soft forms — such as coconut milk in cooking or finely grated fresh coconut — can be offered from around six months. It adds richness and flavour to purees and curries.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Stir full-fat coconut milk into purees or porridge, or blend soft fresh coconut into a smooth puree.',
        portion: 'A spoonful stirred through food.',
        texture: 'Smooth when blended or as milk.',
        safetyNote: 'Avoid dry shredded or large hard pieces of coconut, which are a choking risk.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer finely grated soft coconut or coconut yoghurt.',
        portion: 'A small amount.',
        texture: 'Soft, fine.',
      ),
    ],
    choking:
        'Dry, shredded, or chunky coconut is a choking hazard. Use coconut milk or finely blended/grated soft coconut for babies.',
    allergens: 'Coconut is botanically a fruit; it is treated as a tree nut in some labelling systems, but most people with tree-nut allergy tolerate it. Introduce carefully if there is a known tree-nut allergy.',
    faq:
        'Is coconut a nut? Not really — but it is sometimes labelled with tree nuts. If your baby has a tree-nut allergy, check with your clinician first.',
    tips:
        'Coconut milk makes a dairy-free base for creamy purees and mild curries. Choose unsweetened versions.',
    sourceCitations: ['NHS Start4Life'],
  ),

  // ---------------------------------------------------------------------------
  // VEGETABLES (continued)
  // ---------------------------------------------------------------------------
  Food(
    id: 'potato',
    name: 'Potato',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/potato_hero.jpg'),
    nutritionFlags: ['Potassium', 'Vitamin C'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Well-cooked potato is a soft, mild starchy vegetable suitable from around six months. Mashed or as soft wedges, it is easy to eat and pairs with almost anything.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft, then mash (loosen with milk), or offer a soft wedge.',
        portion: '1–2 tablespoons mashed.',
        texture: 'Soft, smooth.',
        safetyNote: 'Avoid hard or under-cooked pieces, and skip added salt.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer soft-cooked cubes or wedges for self-feeding.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when fully cooked and soft. Avoid firm chunks; mash or cook until very tender.',
    allergens: 'Not a common allergen.',
    faq:
        'Are chips/fries ok? Home-cooked soft potato is best; avoid salty, fried, or heavily processed potato for babies.',
    tips:
        'Mash with a little breast milk, formula, or olive oil for a smooth texture. Mix with iron-rich foods.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'courgette',
    name: 'Courgette (zucchini)',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/courgette_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Hydrating'],
    minAgeMonths: 6,
    whyFirst:
        'The first non-starchy vegetable: soft, mild, and easy to cook down in butter.',
    chokingRisk: 'Low',
    introduction:
        'Courgette is a mild, soft vegetable that cooks quickly, suitable from around six months. It is a gentle way to add green vegetables to meals.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook soft and offer in long strips, or mash into purees.',
        portion: 'A strip or a spoonful.',
        texture: 'Soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer small soft-cooked pieces or grate into meals.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked soft. Raw courgette is firmer — cook until tender for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Do I peel courgette? No need; the soft skin is fine when cooked. Leave it on for extra nutrients.',
    tips:
        'Grate into pasta sauces and fritters. Roasting concentrates the flavour.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'cauliflower',
    name: 'Cauliflower',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/cauliflower_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft-cooked cauliflower is suitable from around six months. The florets make natural little handles for self-feeding.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Steam florets until very soft and offer whole as graspable handles, or mash.',
        portion: 'A floret or two, or mashed.',
        texture: 'Soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Chop soft florets into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when steamed soft. Avoid firm, crunchy raw florets for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Will it cause wind? Like other brassicas it can be a little gassy for some babies; this usually settles.',
    tips:
        'Cauliflower cheese (with low-salt cheese) is a tasty way to serve it. Mash into potato for a milder flavour.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'green_bean',
    name: 'Green beans',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/green_bean_hero.jpg'),
    nutritionFlags: ['Fibre', 'Vitamin C'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft-cooked green beans are suitable from around six months and make easy, graspable finger foods.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Steam whole beans until very soft and offer as spears, or mash.',
        portion: 'One or two soft beans.',
        texture: 'Soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut soft beans into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked very soft. Firm or raw beans are harder to chew — cook until tender.',
    allergens: 'Not a common allergen.',
    faq:
        'Fresh or frozen? Both are fine; frozen beans are picked ripe and cook quickly. Cook until soft.',
    tips:
        'Squash the bean slightly so it is easy to gum. Toss cooked beans in a little olive oil.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'bell_pepper',
    name: 'Bell pepper',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/bell_pepper_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Vitamin A'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Bell pepper is very high in vitamin C and can be offered soft-cooked from around six months. The skin can be tough, so cook well or remove it for younger babies.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Roast or steam strips until very soft; remove tough skin and offer as spears.',
        portion: 'A soft strip.',
        texture: 'Soft.',
        safetyNote: 'The skin can be chewy and slippery — cook soft or peel for babies.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer thin soft-cooked or finely chopped pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Raw pepper and tough skin are harder to manage; cook soft and remove skin for younger babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Which colour is best? Red, orange, and yellow peppers are sweeter and milder than green — good for first tastes.',
    tips:
        'Roasting makes peppers sweet and soft and loosens the skin for easy peeling.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'cucumber',
    name: 'Cucumber',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/cucumber_hero.jpg'),
    nutritionFlags: ['Hydrating'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Cool cucumber is hydrating and soothing for teething gums, suitable from around six months in appropriate shapes.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer a large, thick spear (skin on for grip) to gnaw and soothe gums.',
        portion: 'One spear.',
        texture: 'Crisp; gnawing, not biting chunks.',
        safetyNote: 'Avoid coin-shaped slices and small hard chunks, which are a choking risk.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Peel and cut into small thin pieces or batons.',
        portion: 'A small handful.',
        texture: 'Crisp, small.',
      ),
    ],
    choking:
        'Hard, round slices and chunks are a choking hazard. Offer as a large spear for gnawing first, then small pieces once chewing is established.',
    allergens: 'Not a common allergen.',
    faq:
        'Chilled cucumber for teething? Yes — a cold, large spear can soothe sore gums under supervision.',
    tips:
        'Leave the skin on a spear for grip. Peel and chop small for older babies and toddlers.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'tomato',
    name: 'Tomato',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/tomato_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Antioxidants'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Tomatoes are suitable from around six months, soft and rich in vitamin C and lycopene. Cherry tomatoes need quartering because of their round shape.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer soft cooked tomato, or large pieces of ripe soft tomato with skin removed.',
        portion: 'A spoonful or a soft piece.',
        texture: 'Soft, juicy.',
        safetyNote: 'Quarter cherry/small tomatoes lengthways; whole ones are a choking hazard.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Quarter small tomatoes; chop larger ones into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Whole cherry tomatoes are a choking hazard — always quarter lengthways. Skins can be chewy; remove for younger babies.',
    allergens: 'Not a common allergen; acidity can cause a harmless rash around the mouth.',
    faq:
        'Do tomatoes cause rashes? The acidity sometimes reddens the skin around the mouth — usually irritation, not allergy.',
    tips:
        'Cook into simple, unsalted sauces for pasta. Remove skins by scoring and briefly blanching.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'beetroot',
    name: 'Beetroot',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/beetroot_hero.jpg'),
    nutritionFlags: ['Folate', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft-cooked beetroot is earthy, naturally sweet, and rich in folate, suitable from around six months. Choose plain cooked beetroot, not the kind pickled in vinegar and salt.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and offer as strips, or mash/puree.',
        portion: 'A strip or a spoonful.',
        texture: 'Soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut soft beetroot into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked soft. Avoid firm, raw beetroot for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Why is the nappy pink? Beetroot can turn stools and urine pink/red — this is harmless and temporary.',
    tips:
        'Use plain cooked (not pickled) beetroot. Mix into yoghurt or potato for a milder taste and pretty colour.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'parsnip',
    name: 'Parsnip',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/parsnip_hero.jpg'),
    nutritionFlags: ['Fibre', 'Vitamin C'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Parsnip is a sweet, soft root vegetable, suitable from around six months when well-cooked. It is a comforting, mild first vegetable.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Roast or steam until very soft; offer as a soft wedge or mash.',
        portion: 'A wedge or a spoonful.',
        texture: 'Soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Cut soft parsnip into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when soft. Remove any hard woody core and cook until tender.',
    allergens: 'Not a common allergen.',
    faq:
        'Is parsnip sweet enough on its own? Yes — roasting brings out natural sweetness, so no sugar is needed.',
    tips:
        'Roast for a caramelised flavour, or mash with potato and carrot for a soft medley.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'pumpkin',
    name: 'Pumpkin',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/pumpkin_hero.jpg'),
    nutritionFlags: ['Vitamin A', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Pumpkin and other soft squashes are rich in vitamin A and easy to serve from around six months, mashed or as soft pieces.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Roast or steam until very soft, then mash or offer soft strips.',
        portion: '1–2 tablespoons mashed.',
        texture: 'Soft, smooth.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer small soft-cooked pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked soft. Remove skin and seeds; cook until tender.',
    allergens: 'Not a common allergen.',
    faq:
        'Can I use tinned pumpkin? Plain pumpkin puree (not sweetened pie filling) is a convenient option.',
    tips:
        'Pumpkin pairs well with mild spices like cinnamon (no sugar). Roast seeds are not for babies.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'asparagus',
    name: 'Asparagus',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/asparagus_hero.jpg'),
    nutritionFlags: ['Folate', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft-cooked asparagus spears make natural finger foods from around six months and are a good source of folate.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Steam spears until very soft and offer whole as a graspable handle.',
        portion: 'One soft spear.',
        texture: 'Soft.',
        safetyNote: 'Use the tender tip and upper stalk; the woody base is too tough.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Chop soft spears into small pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked soft. Avoid the fibrous woody ends; cook the tender part well.',
    allergens: 'Not a common allergen.',
    faq:
        'Will it change the smell of urine? Asparagus can give urine a distinctive smell — completely harmless.',
    tips:
        'Snap off the woody ends before cooking. A drizzle of olive oil helps fat-soluble vitamin absorption.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'eggplant',
    name: 'Aubergine (eggplant)',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/eggplant_hero.jpg'),
    nutritionFlags: ['Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Well-cooked aubergine becomes soft and creamy, suitable from around six months. It readily absorbs flavours from the dishes it is cooked in.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Roast or bake until very soft, then offer soft strips or mash the flesh.',
        portion: 'A strip or a spoonful.',
        texture: 'Soft, creamy.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer small soft-cooked pieces or blend into dips.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when fully cooked. Undercooked aubergine is spongy and firm — cook until tender.',
    allergens: 'Not a common allergen.',
    faq:
        'Do I need to salt it? Salting to draw out bitterness is not needed for babies; just cook it well and skip added salt.',
    tips:
        'Roast and blend into a smooth dip with a little tahini for older babies.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'kale',
    name: 'Kale',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/kale_hero.jpg'),
    nutritionFlags: ['Vitamin K', 'Vitamin C', 'Iron'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Kale is a nutrient-dense leafy green, suitable from around six months when cooked soft and finely chopped or blended.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft, then finely chop or blend into purees and sauces.',
        portion: 'A spoonful stirred through food.',
        texture: 'Soft, finely chopped.',
        safetyNote: 'Large pieces of leaf can be hard to manage — chop finely or blend.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer finely chopped soft-cooked kale mixed into meals.',
        portion: 'A small amount.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Leafy greens can ball up in the mouth — cook soft and chop finely or blend for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Are kale crisps ok? Crunchy kale crisps are a choking risk and often salty — stick to soft-cooked kale.',
    tips:
        'Remove tough stems, then blend into pasta sauces, soups, and purees to add iron and vitamins.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'cabbage',
    name: 'Cabbage',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/cabbage_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft-cooked cabbage is mild and suitable from around six months, finely chopped or blended into dishes.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and finely chop, or blend into purees.',
        portion: 'A spoonful through food.',
        texture: 'Soft.',
        safetyNote: 'Avoid large leaf pieces; chop finely.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer finely chopped soft cabbage in mixed dishes.',
        portion: 'A small amount.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Large leaves can bunch up — cook soft and chop finely for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Will cabbage cause wind? It can be a little gassy for some babies; cooking well helps.',
    tips:
        'Soft-cook into mild stir-fries and soups. Mix with potato or carrot to soften the flavour.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'corn',
    name: 'Corn',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/corn_hero.jpg'),
    nutritionFlags: ['Fibre', 'Carbohydrate'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Moderate',
    introduction:
        'Corn can be offered from around six months. A cob can be gnawed under supervision, while loose kernels need care because of their shape and skin.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer a section of soft-cooked cob to gnaw the kernels off (supervised), or blend kernels into a puree.',
        portion: 'A cob piece or a spoonful of puree.',
        texture: 'Soft.',
        safetyNote: 'Loose whole kernels can be a choking risk for young babies — blend or smash them.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer loose kernels once chewing is well established, or lightly smashed.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Whole kernels have a tough skin and can be inhaled by young babies; offer on the cob to gnaw, or blend/smash kernels until older.',
    allergens: 'Not a common allergen.',
    faq:
        'Is sweetcorn from a tin ok? Yes, choose no-added-salt corn; blend or smash for younger babies.',
    tips:
        'A cob section doubles as a soothing, graspable teether. Blend kernels into soups and fritters.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'celery',
    name: 'Celery',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/celery_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'celery',
    nutritionFlags: ['Hydrating', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Celery is a declarable allergen in the UK and EU. It is very fibrous and stringy raw, so for babies it is best well-cooked and soft, or blended into soups and stocks, from around six months.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and finely chop, or blend into soups and purees.',
        portion: 'A spoonful through food.',
        texture: 'Soft, finely chopped.',
        safetyNote: 'Raw celery and its long strings are a choking hazard — cook soft for babies.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer finely chopped soft-cooked celery in mixed dishes.',
        portion: 'A small amount.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Raw celery is stringy and crunchy — a notable choking hazard. Cook it soft and chop finely for young children.',
    allergens: 'Celery (including celeriac and celery in stocks) is a declarable allergen. Introduce on its own and watch for a reaction, as with other allergens.',
    faq:
        'Where is celery hidden? It often appears in stocks, soups, and spice mixes — check labels if your baby has reacted.',
    tips:
        'Use it blended into homemade vegetable soups and stocks for flavour. Cook until very soft.',
    sourceCitations: ['NHS Start4Life', 'UK FIC'],
  ),

  // ---------------------------------------------------------------------------
  // PROTEIN — meat, poultry & fish (continued)
  // ---------------------------------------------------------------------------
  Food(
    id: 'turkey',
    name: 'Turkey',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/turkey_hero.jpg'),
    nutritionFlags: ['Protein', 'Iron', 'Zinc'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Turkey is a lean source of protein, iron, and zinc, suitable from around six months. Like all meats it should be moist and tender for babies — dry meat is hard to manage.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer moist shredded turkey, or blend into a smooth puree with a little stock.',
        portion: 'A spoonful, shredded or pureed.',
        texture: 'Moist, soft.',
        safetyNote: 'Keep it moist; dry, stringy meat is a choking risk.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer finely chopped or shredded turkey, or a soft meatball.',
        portion: 'A small handful.',
        texture: 'Soft, moist.',
      ),
    ],
    choking:
        'Dry or tough meat is a choking hazard. Cook until tender, keep moist with sauce or stock, and shred or mince for babies.',
    allergens: 'Not a common allergen.',
    faq:
        'Which cut is best? Darker thigh meat stays moister and is richer in iron than breast.',
    tips:
        'Mince into soft meatballs or blend into purees with iron-boosting vegetables.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'pork',
    name: 'Pork',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/pork_hero.jpg'),
    nutritionFlags: ['Protein', 'Iron', 'B vitamins'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Well-cooked, tender pork provides protein, iron, and B vitamins, suitable from around six months when soft and moist.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Slow-cook until very tender, then shred finely, or blend into a puree.',
        portion: 'A spoonful, shredded.',
        texture: 'Moist, soft.',
        safetyNote: 'Avoid salty, cured pork (bacon, ham) and dry chops; cook fully and keep moist.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer finely chopped tender pork or a soft meatball.',
        portion: 'A small handful.',
        texture: 'Soft, moist.',
      ),
    ],
    choking:
        'Dry or chewy pork is a choking hazard. Slow-cook until it shreds easily and keep it moist.',
    allergens: 'Not a common allergen.',
    faq:
        'Is bacon or ham ok? These are high in salt and best avoided for babies; choose fresh, plain pork.',
    tips:
        'Pulled, slow-cooked pork shoulder is naturally tender and easy to shred for little ones.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'lamb',
    name: 'Lamb',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/lamb_hero.jpg'),
    nutritionFlags: ['Protein', 'Iron', 'Zinc'],
    minAgeMonths: 6,
    whyFirst:
        'A second gelatinous slow-cook meat that keeps iron coming while textures stay soft.',
    chokingRisk: 'Moderate',
    introduction:
        'Lamb is rich in iron and zinc and suitable from around six months when slow-cooked until tender and served moist.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Slow-cook until very soft, shred finely, or blend into a puree with stock.',
        portion: 'A spoonful, shredded.',
        texture: 'Moist, soft.',
        safetyNote: 'Keep it moist; remove any bones, gristle, and fatty hard bits.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer finely chopped tender lamb or a soft kofta/meatball.',
        portion: 'A small handful.',
        texture: 'Soft, moist.',
      ),
    ],
    choking:
        'Tough or dry lamb is a choking hazard. Cook low and slow, keep moist, and shred or mince.',
    allergens: 'Not a common allergen.',
    faq:
        'Best cut for babies? Slow-cooked shoulder or leg becomes very tender and easy to shred.',
    tips:
        'Mild spices like cumin and coriander suit lamb well — flavour freely, but skip the salt.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'cod',
    name: 'Cod',
    category: 'Fish & Seafood',
    heroMedia: AppMedia(uri: 'assets/foods/cod_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'fish',
    nutritionFlags: ['Protein', 'Lean'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Cod is a mild white fish and a common allergen, suitable from around six months. Fish is a valuable protein; introduce it carefully and check thoroughly for bones.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook through, flake finely, and check carefully for bones; offer flaked or in a puree.',
        portion: 'A spoonful, flaked.',
        texture: 'Soft, flaky.',
        safetyNote: 'Remove every bone — fish bones are a serious choking hazard.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer flaked cod mixed into mash or made into soft fish cakes.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Fish bones are a choking hazard; check meticulously. Cook fully and flake finely.',
    allergens: 'Fish is a common allergen. Introduce on its own, earlier in the day, and watch for about two hours; keep it in the diet once tolerated.',
    faq:
        'How much white fish is safe? White fish like cod has no specific weekly limit, unlike some oily fish — but always remove bones.',
    tips:
        'Poach gently in milk for a soft, mild result, or flake into potato for fish cakes.',
    sourceCitations: ['NHS Start4Life', 'SACN 2018'],
  ),
  Food(
    id: 'haddock',
    name: 'Haddock',
    category: 'Fish & Seafood',
    heroMedia: AppMedia(uri: 'assets/foods/haddock_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'fish',
    nutritionFlags: ['Protein', 'Lean'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Haddock is another mild white fish, suitable from around six months. Choose fresh (not smoked/salted) fillets and check carefully for bones.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook through, flake finely, and remove all bones; serve flaked or pureed.',
        portion: 'A spoonful, flaked.',
        texture: 'Soft, flaky.',
        safetyNote: 'Avoid smoked haddock (high salt) for babies; remove all bones.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Flake into mash or soft fish cakes.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Bones are a choking hazard; check thoroughly. Cook fully and flake.',
    allergens: 'Fish is a common allergen — introduce carefully and keep in the diet once tolerated.',
    faq:
        'Smoked haddock ok? No — smoked fish is salty; use fresh fillets for babies.',
    tips:
        'Mild and flaky, haddock works well in simple fish pie with soft mashed potato.',
    sourceCitations: ['NHS Start4Life', 'SACN 2018'],
  ),
  Food(
    id: 'tuna',
    name: 'Tuna',
    category: 'Fish & Seafood',
    heroMedia: AppMedia(uri: 'assets/foods/tuna_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'fish',
    nutritionFlags: ['Protein', 'Omega-3'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Tuna is a common allergen and can be offered from around six months. Tinned tuna is convenient and soft; note that fresh tuna counts as oily fish, and mercury guidance applies.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Mash tinned tuna (in spring water, no added salt) into a smooth, soft mixture.',
        portion: 'A spoonful, mashed.',
        texture: 'Soft, flaky.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Mix flaked tuna into mash, pasta, or soft fritters.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk; tuna is soft and flaky. Check tinned tuna for any stray bones.',
    allergens: 'Fish is a common allergen. Introduce carefully and keep in the diet once tolerated.',
    faq:
        'Is there a limit on tuna? Tinned tuna isn\'t restricted like fresh tuna, but fresh/oily fish and high-mercury fish have portion limits — follow local guidance.',
    tips:
        'Choose tuna tinned in spring water with no added salt. Mix with a little plain yoghurt for moisture.',
    sourceCitations: ['NHS Start4Life', 'SACN 2018'],
  ),
  Food(
    id: 'sardine',
    name: 'Sardine',
    category: 'Fish & Seafood',
    heroMedia: AppMedia(uri: 'assets/foods/sardine_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'fish',
    nutritionFlags: ['Omega-3', 'Calcium', 'Vitamin D'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Sardines are an oily fish rich in omega-3, calcium, and vitamin D, suitable from around six months. Tinned soft-bone sardines are especially nutritious when well mashed.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Mash tinned sardines (in water/oil, no added salt) thoroughly, crushing the soft bones in.',
        portion: 'A spoonful, mashed.',
        texture: 'Soft, mashed.',
        safetyNote: 'Mash the soft bones completely; remove any firm bones.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread mashed sardine on toast fingers or mix into pasta.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Mash the soft bones fully; check for any firm bones. The flesh itself is soft.',
    allergens: 'Fish is a common allergen. Oily fish like sardines has a recommended portion limit for young children — follow local guidance.',
    faq:
        'Are the bones safe? In tinned sardines the small bones are soft and a good calcium source when thoroughly mashed.',
    tips:
        'A budget-friendly omega-3 source. Mash onto toast with a little tomato for an easy meal.',
    sourceCitations: ['NHS Start4Life', 'SACN 2018'],
  ),
  Food(
    id: 'mackerel',
    name: 'Mackerel',
    category: 'Fish & Seafood',
    heroMedia: AppMedia(uri: 'assets/foods/mackerel_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'fish',
    nutritionFlags: ['Omega-3', 'Vitamin D'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Mackerel is an oily fish high in omega-3, suitable from around six months. Use fresh (not smoked/salted) mackerel and remove bones carefully.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook through, flake finely, remove all bones, and serve flaked or in a puree.',
        portion: 'A spoonful, flaked.',
        texture: 'Soft, flaky.',
        safetyNote: 'Avoid smoked mackerel (salty); remove every bone.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Mix flaked mackerel into mash or soft patties.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Bones are a choking hazard; check thoroughly. Cook fully and flake.',
    allergens: 'Fish is a common allergen. Oily fish has a portion limit for young children — follow local guidance.',
    faq:
        'Smoked mackerel ok? No — it is high in salt; choose fresh fillets for babies.',
    tips:
        'Strong-flavoured but nutritious; balance with mild mash or potato.',
    sourceCitations: ['NHS Start4Life', 'SACN 2018'],
  ),
  Food(
    id: 'duck',
    name: 'Duck',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/duck_hero.jpg'),
    nutritionFlags: ['Protein', 'Iron'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Tender, well-cooked duck offers protein and iron and can be introduced from around six months when soft and moist.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Slow-cook until very tender, shred finely, or blend into a puree.',
        portion: 'A spoonful, shredded.',
        texture: 'Moist, soft.',
        safetyNote: 'Remove skin and any bones; keep the meat moist.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer finely chopped tender duck.',
        portion: 'A small handful.',
        texture: 'Soft, moist.',
      ),
    ],
    choking:
        'Dry meat and bones are choking hazards. Slow-cook, remove bones, and keep moist.',
    allergens: 'Not a common allergen.',
    faq:
        'Is duck too fatty? Remove the skin and excess fat; the meat itself is a fine occasional protein.',
    tips:
        'Slow-cooked duck legs shred easily. Pair with soft, mild vegetables.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'liver',
    name: 'Liver',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/liver_hero.jpg'),
    nutritionFlags: ['Iron', 'Vitamin A', 'B12'],
    minAgeMonths: 6,
    whyFirst:
        'The densest source of iron, vitamin A, and B12 we have. Small, and about once a week.',
    chokingRisk: 'Low',
    introduction:
        'Liver is exceptionally rich in iron, vitamin A, and B12, and can be introduced from around six months. Because of its very high vitamin A, it should be offered in small amounts and only about once a week.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook through, then blend into a very smooth pâté or stir a small amount into a puree.',
        portion: 'A small amount — roughly weekly.',
        texture: 'Smooth.',
        safetyNote: 'Cook liver thoroughly and keep portions small and infrequent due to its high vitamin A.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread a thin layer of smooth liver pâté on toast fingers.',
        portion: 'A small amount, about weekly.',
        texture: 'Smooth.',
      ),
    ],
    choking:
        'Low risk when smooth and well-cooked. The main caution is vitamin A — keep servings small and roughly weekly.',
    allergens: 'Not a common allergen.',
    faq:
        'Why limit liver? It is so rich in vitamin A that frequent large servings could provide too much; about once a week in small amounts is a common guide.',
    tips:
        'A little blended into a meat puree boosts iron significantly. Always cook fully.',
    sourceCitations: ['NHS Start4Life', 'SACN 2018'],
  ),

  // ---------------------------------------------------------------------------
  // GRAINS (continued)
  // ---------------------------------------------------------------------------
  Food(
    id: 'barley',
    name: 'Barley',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/barley_hero.jpg'),
    nutritionFlags: ['Fibre', 'Carbohydrate'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Soft-cooked barley is a hearty, fibre-rich grain suitable from around six months. It contains gluten, so introduce it as you would other gluten grains.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and serve as a thick porridge or blended into soups.',
        portion: '1–2 tablespoons.',
        texture: 'Soft, sticky.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer soft cooked barley grains mixed into stews.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked very soft. Avoid firm, undercooked grains.',
    allergens: 'Barley contains gluten. Coeliac disease is separate from wheat allergy; if there is a family history, discuss introduction with a clinician.',
    faq:
        'Is barley gluten-free? No — barley contains gluten, so it is not suitable for a gluten-free diet.',
    tips:
        'Pearl barley cooks soft into comforting soups and porridges. Cook longer than the packet suggests for babies.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'millet',
    name: 'Millet',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/millet_hero.jpg'),
    nutritionFlags: ['Iron', 'Gluten-free'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Millet is a mild, naturally gluten-free grain suitable from around six months. Cooked soft, it makes a fluffy porridge.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook with extra liquid until soft and porridge-like; mash if needed.',
        portion: '1–2 tablespoons.',
        texture: 'Soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer soft cooked millet mixed with vegetables or fruit.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked soft with plenty of liquid.',
    allergens: 'Naturally gluten-free and not a common allergen.',
    faq:
        'Is millet nutritious? Yes — it provides iron and is a good gluten-free option to vary grains.',
    tips:
        'Cook in extra water or milk for a creamy texture. Stir in mashed fruit or veg.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'buckwheat',
    name: 'Buckwheat',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/buckwheat_hero.jpg'),
    nutritionFlags: ['Fibre', 'Gluten-free', 'Iron'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Despite its name, buckwheat is gluten-free and unrelated to wheat. Cooked soft, it is a nutritious grain alternative from around six months.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and serve as porridge, or use fine buckwheat flour in soft pancakes.',
        portion: '1–2 tablespoons.',
        texture: 'Soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer soft cooked buckwheat mixed into meals.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked soft.',
    allergens: 'Gluten-free. Buckwheat allergy exists but is uncommon; introduce on its own and watch as with any new food.',
    faq:
        'Is buckwheat related to wheat? No — it is a seed, naturally gluten-free, and suitable for gluten-free diets.',
    tips:
        'Soft buckwheat pancakes make great finger food. Toasted buckwheat (kasha) has a nuttier flavour.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'couscous',
    name: 'Couscous',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/couscous_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'wheat',
    nutritionFlags: ['Carbohydrate'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Couscous is made from wheat, so it is a way to introduce the wheat allergen from around six months. Cooked soft and fluffy, it mixes easily into other foods.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook soft, then stir into a moist puree or mash so the small grains stick together.',
        portion: '1–2 tablespoons, moist.',
        texture: 'Soft, slightly sticky.',
        safetyNote: 'Loose dry couscous can be inhaled — keep it moist and clumped together.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Mix moist couscous with finely chopped soft vegetables.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Dry, loose grains can be inhaled by young babies — serve moist and mixed into other foods.',
    allergens: 'Couscous is wheat-based (contains gluten). Introduce as a wheat allergen, on its own, and keep it in the diet once tolerated.',
    faq:
        'Is couscous a grain? It is small balls of steamed wheat (semolina) — effectively a quick-cooking pasta/grain.',
    tips:
        'Stir into a moist vegetable or meat dish so it holds together for easy eating.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'semolina',
    name: 'Semolina',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/semolina_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'wheat',
    nutritionFlags: ['Carbohydrate'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Semolina, made from wheat, cooks into a smooth, soft pudding-like porridge — an easy way to offer the wheat allergen from around six months.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook with milk into a smooth, soft porridge and cool before serving.',
        portion: '1–2 tablespoons.',
        texture: 'Smooth, soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Serve soft semolina with mashed fruit stirred through.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk; semolina is smooth and soft when cooked.',
    allergens: 'Semolina is wheat-based (contains gluten). Introduce as a wheat allergen and keep in the diet once tolerated.',
    faq:
        'Is semolina the same as couscous? They are both from durum wheat; semolina is the ground flour, often cooked into a smooth pudding.',
    tips:
        'Cook in whole milk (once dairy is tolerated) for a creamy texture; sweeten with mashed fruit, not sugar.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'noodles',
    name: 'Noodles',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/noodles_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'wheat',
    nutritionFlags: ['Carbohydrate'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Soft wheat noodles are an easy, fun finger food from around six months and a way to offer the wheat allergen. Choose plain noodles, not salty instant-noodle seasoning.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and offer long strands to grasp, or chop and mix into sauce.',
        portion: 'A small handful.',
        texture: 'Soft, slippery.',
        safetyNote: 'Avoid salty instant-noodle flavour sachets.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer chopped soft noodles mixed with vegetables and protein.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked very soft. Long slippery strands are fine; cut shorter if easier.',
    allergens: 'Wheat noodles contain gluten — introduce as a wheat allergen. Rice or buckwheat noodles are wheat-free alternatives.',
    faq:
        'Are rice noodles different? Yes — rice noodles are wheat-free; check the label if avoiding wheat.',
    tips:
        'Long soft noodles are great self-feeding practice. Toss in a little sauce so they cling together.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'polenta',
    name: 'Polenta',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/polenta_hero.jpg'),
    nutritionFlags: ['Carbohydrate', 'Gluten-free'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Polenta (cooked cornmeal) is naturally gluten-free and suitable from around six months, served soft and creamy or as soft set fingers.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook into a soft, creamy porridge and cool before serving.',
        portion: '1–2 tablespoons.',
        texture: 'Soft, creamy.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Let it set, then cut into soft fingers for self-feeding.',
        portion: 'A few soft fingers.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when soft. If set and cut into fingers, keep them soft, not firm and crisp.',
    allergens: 'Naturally gluten-free and not a common allergen.',
    faq:
        'Is polenta the same as cornmeal? Yes — polenta is cooked from cornmeal, making it a gluten-free grain option.',
    tips:
        'Stir grated low-salt cheese or soft vegetables into creamy polenta for flavour.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'wheat_cereal',
    name: 'Iron-fortified cereal',
    category: 'Grain',
    heroMedia: AppMedia(uri: 'assets/foods/wheat_cereal_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'wheat',
    nutritionFlags: ['Iron', 'Fortified'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Low',
    introduction:
        'Iron-fortified infant cereals are a common early food because a baby\'s iron stores fall from around six months. Wheat-based cereals also help introduce the wheat allergen.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Mix with breast milk, formula, or water to a smooth, soft consistency.',
        portion: '1–2 tablespoons, made up.',
        texture: 'Smooth, soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Make thicker and stir in mashed fruit or veg.',
        portion: 'A small bowl.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when mixed to a smooth consistency.',
    allergens: 'Wheat-based cereals contain gluten — they help introduce the wheat allergen. Oat or rice cereals are wheat-free options.',
    faq:
        'Why fortified cereal? The added iron supports babies as their natural stores decline around six months.',
    tips:
        'Pair with a vitamin-C fruit (like mashed berries) to boost iron absorption.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),

  // ---------------------------------------------------------------------------
  // DAIRY (continued)
  // ---------------------------------------------------------------------------
  Food(
    id: 'butter',
    name: 'Butter',
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/butter_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Healthy fats', 'Vitamin A'],
    minAgeMonths: 6,
    whyFirst:
        'The first fat on its own. Pasteurised butter also starts the dairy allergen gently.',
    chokingRisk: 'Low',
    introduction:
        'A little butter can be used in cooking from around six months and is a way dairy enters the diet. It adds energy-dense fat and helps the body absorb fat-soluble vitamins from vegetables.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Melt a small knob into mashed or cooked vegetables.',
        portion: 'A small knob in cooking.',
        texture: 'Melted through food.',
        safetyNote: 'Use unsalted butter and keep added salt low.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinly on toast fingers.',
        portion: 'A thin spread.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk; butter is soft. The main note is to keep salt low — choose unsalted.',
    allergens: 'Butter is a dairy product. It contains only traces of milk protein but still counts toward dairy introduction; watch as with other dairy.',
    faq:
        'Is butter just empty fat? Babies need plenty of fat for growth; a little butter is a useful energy source in home cooking.',
    tips:
        'Toss soft vegetables in a little butter to help absorb their vitamins. Choose unsalted.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'cottage_cheese',
    name: 'Cottage cheese',
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/cottage_cheese_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Protein', 'Calcium'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft cottage cheese is a mild, protein- and calcium-rich dairy food suitable from around six months. Choose full-fat and low- or no-added-salt.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer on a pre-loaded spoon, or blend smoother if the curds are large.',
        portion: '1–2 tablespoons.',
        texture: 'Soft, lumpy.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Serve as a dip with soft veg, or mix with fruit.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk; it is soft. Larger curds can be blended smoother for younger babies.',
    allergens: 'A dairy product — introduce as part of dairy and keep in the diet once tolerated.',
    faq:
        'Full-fat or low-fat? Full-fat dairy is recommended for babies and toddlers for the energy and fat they need.',
    tips:
        'Mix with mashed fruit for a quick sweet bowl, or with soft veg for a savoury one.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'ricotta',
    name: 'Ricotta',
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/ricotta_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Protein', 'Calcium'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Ricotta is a soft, mild, creamy cheese suitable from around six months — easy to spread, mix, and cook with.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Offer a spoonful on its own, or stir into purees and pasta.',
        portion: '1–2 tablespoons.',
        texture: 'Soft, creamy.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread on toast or dollop onto soft pasta and vegetables.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk; ricotta is soft and smooth.',
    allergens: 'A dairy product — introduce as part of dairy.',
    faq:
        'Is ricotta salty? It is milder and lower in salt than many cheeses, making it a good early choice.',
    tips:
        'Stir into warm pasta with soft vegetables, or mix with mashed fruit.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'cream_cheese',
    name: 'Cream cheese',
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/cream_cheese_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Calcium', 'Healthy fats'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Full-fat cream cheese is a soft, spreadable dairy food suitable from around six months. Choose a low-salt option and spread it thinly.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Stir a little into purees, or spread very thinly on a soft strip.',
        portion: 'A small amount.',
        texture: 'Soft, spreadable.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinly on toast fingers or soft crackers.',
        portion: 'A thin spread.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when spread thinly. Avoid thick, sticky blobs, which can be harder to manage.',
    allergens: 'A dairy product — introduce as part of dairy.',
    faq:
        'Is cream cheese high in salt? Some are — check the label and choose lower-salt versions for babies.',
    tips:
        'Spread thinly rather than thickly, and mix into mashed vegetables for creaminess.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'kefir',
    name: 'Kefir',
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/kefir_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Probiotics', 'Calcium', 'Protein'],
    minAgeMonths: 6,
    whyFirst:
        'The first fermented dairy: live cultures, fat, and protein, once butter is tolerated.',
    chokingRisk: 'Low',
    introduction:
        'Kefir is a cultured, drinkable dairy product with live cultures, suitable in small amounts from around six months. Choose plain, full-fat, unsweetened kefir.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Stir a little plain kefir into purees or porridge.',
        portion: 'A spoonful or two.',
        texture: 'Smooth, pourable.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer a small amount in an open cup, or mixed with fruit.',
        portion: 'A small amount.',
        texture: 'Drinkable.',
      ),
    ],
    choking:
        'Low risk; kefir is liquid. Offer in an open cup rather than letting baby sip all day.',
    allergens: 'A dairy product with live cultures — introduce as part of dairy. Use pasteurised kefir for infants.',
    faq:
        'Can kefir replace milk feeds? No — breast milk or formula stays the main milk drink until twelve months; kefir is a food, in small amounts.',
    tips:
        'Use plain, unsweetened, pasteurised kefir. Stir into porridge for a tangy, probiotic boost.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'whole_milk',
    name: "Whole cow's milk",
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/whole_milk_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Calcium', 'Protein', 'Vitamin D'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Cow\'s milk can be used in cooking and with cereal from around six months, but should not be given as a main drink until twelve months. Breast milk or formula remains the main milk in the first year.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Use whole milk in cooking — in porridge, sauces, or mashed potato.',
        portion: 'In cooking only.',
        texture: 'Liquid in food.',
        safetyNote: 'Not as a main drink before 12 months; breast milk or formula stays the main milk.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Whole cow\'s milk can become a main drink, ideally from an open cup.',
        portion: 'About 2–3 servings a day.',
        texture: 'Drink.',
      ),
    ],
    choking:
        'Low risk; it is a liquid. The key point is timing — a food/cooking ingredient before 12 months, a main drink after.',
    allergens: 'Cow\'s milk is a common allergen. Dairy foods (yoghurt, cheese) can come earlier; milk as a main drink waits until 12 months.',
    faq:
        'Why wait until 12 months to drink it? Cow\'s milk is low in iron and can displace iron-rich foods or milk feeds if given as a main drink too early.',
    tips:
        'Use full-fat (whole) milk for under-twos. Introduce a cup rather than a bottle as the main vessel.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),

  // ---------------------------------------------------------------------------
  // LEGUMES, NUTS & SEEDS (continued)
  // ---------------------------------------------------------------------------
  Food(
    id: 'kidney_bean',
    name: 'Kidney beans',
    category: 'Legume',
    heroMedia: AppMedia(uri: 'assets/foods/kidney_bean_hero.jpg'),
    nutritionFlags: ['Protein', 'Iron', 'Fibre'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Moderate',
    introduction:
        'Kidney beans are a plant protein and iron source suitable from around six months when very well cooked and soft. Always cook dried kidney beans thoroughly, or use tinned.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft, then mash or lightly smash so beans cannot be inhaled whole.',
        portion: '1–2 tablespoons, mashed.',
        texture: 'Soft, mashed.',
        safetyNote: 'Whole beans are a choking risk for young babies — smash or mash. Never serve undercooked kidney beans.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer lightly smashed whole soft beans or mix into dishes.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Whole beans can be inhaled by young babies — smash or mash. Raw/undercooked kidney beans are unsafe; cook fully (tinned are pre-cooked).',
    allergens: 'Not a common allergen. Pair with a vitamin-C food to boost iron absorption.',
    faq:
        'Tinned or dried? Tinned (no added salt) are convenient and fully cooked. If using dried, boil hard then simmer until very soft.',
    tips:
        'Mash into a soft bean dip, or stir into a mild chilli or stew (no added salt).',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'white_bean',
    name: 'White beans',
    category: 'Legume',
    heroMedia: AppMedia(uri: 'assets/foods/white_bean_hero.jpg'),
    nutritionFlags: ['Protein', 'Iron', 'Fibre'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Moderate',
    introduction:
        'Soft white beans (such as cannellini or butter beans) are creamy and mild, suitable from around six months when well cooked and mashed.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft and mash to a creamy texture.',
        portion: '1–2 tablespoons, mashed.',
        texture: 'Soft, creamy.',
        safetyNote: 'Smash or mash whole beans for young babies.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer lightly smashed soft beans or blend into dips.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Whole beans can be inhaled by young babies — mash or smash. Cook until very soft.',
    allergens: 'Not a common allergen.',
    faq:
        'Are butter beans the same? They are a large, creamy white bean and work the same way — mash them well.',
    tips:
        'White beans blend into a smooth, mild dip and add protein to soups.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'edamame',
    name: 'Edamame',
    category: 'Legume',
    heroMedia: AppMedia(uri: 'assets/foods/edamame_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'soy',
    nutritionFlags: ['Protein', 'Iron', 'Fibre'],
    minAgeMonths: 6,
    ancestralFromMonths: 24,
    chokingRisk: 'Moderate',
    introduction:
        'Edamame (young soybeans) is a way to introduce the soy allergen from around six months. The whole beans are firm and round, so smash them well for babies.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook soft, remove from the pod, and smash or mash the beans thoroughly.',
        portion: 'A spoonful, smashed.',
        texture: 'Soft, smashed.',
        safetyNote: 'Whole edamame beans and pods are a choking hazard — always smash and remove pods.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer lightly smashed soft beans once chewing is well established.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Whole edamame beans are firm and round — a choking hazard. Smash well and never serve in the pod.',
    allergens: 'Edamame is soy — a common allergen. Introduce on its own, watch for a reaction, and keep in the diet once tolerated.',
    faq:
        'Is edamame the same soy as tofu? Both are soy; offering either helps introduce the soy allergen.',
    tips:
        'Smash into a bright green mash, or blend into a smooth dip.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'cashew_butter',
    name: 'Cashew butter',
    category: 'Nut & Seed',
    heroMedia: AppMedia(uri: 'assets/foods/cashew_butter_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'tree_nuts',
    nutritionFlags: ['Healthy fats', 'Protein'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Smooth cashew butter is a way to introduce tree nuts from around six months. Never give whole nuts; thin nut butter so it is not a thick, sticky blob.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Thin smooth cashew butter with water, milk, or puree and offer a small amount.',
        portion: 'A small spoonful, thinned.',
        texture: 'Smooth, thinned.',
        safetyNote: 'Whole nuts and thick blobs of nut butter are choking hazards — always thin it.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinly on a soft strip, or stir into porridge.',
        portion: 'A thin spread.',
        texture: 'Smooth.',
      ),
    ],
    choking:
        'Whole tree nuts are a serious choking hazard for young children. Thick nut butter can also stick — always thin or spread thinly.',
    allergens: 'Cashew is a tree nut — a common allergen. Tree nuts are separate allergens, so tolerating one does not guarantee tolerating another. Introduce on its own and watch.',
    faq:
        'When can children have whole nuts? Whole nuts are not advised until around five years because of the choking risk; use smooth nut butters or finely ground nuts.',
    tips:
        'Stir a small amount into porridge or yoghurt. Choose unsweetened, unsalted cashew butter.',
    sourceCitations: ['NHS Start4Life', 'AAP'],
  ),
  Food(
    id: 'sunflower_seed_butter',
    name: 'Sunflower seed butter',
    category: 'Nut & Seed',
    heroMedia: AppMedia(uri: 'assets/foods/sunflower_seed_butter_hero.jpg'),
    nutritionFlags: ['Healthy fats', 'Vitamin E'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Smooth sunflower seed butter is a nut-free spread option from around six months — handy for nut-free settings. As with any seed/nut butter, thin it so it is not a sticky blob.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Thin with water, milk, or puree and offer a small amount.',
        portion: 'A small spoonful, thinned.',
        texture: 'Smooth, thinned.',
        safetyNote: 'Thick blobs of seed butter can stick in the mouth — always thin or spread thinly.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinly on a soft strip.',
        portion: 'A thin spread.',
        texture: 'Smooth.',
      ),
    ],
    choking:
        'Thick, sticky seed butter is a choking risk — thin it or spread thinly.',
    allergens: 'Sunflower seed is not a major regulated allergen and is a useful alternative in nut-free environments; introduce on its own as with any new food.',
    faq:
        'Is seed butter as good as nut butter? It offers healthy fats and vitamin E and is a great nut-free option, though it does not replace introducing actual tree nuts/peanut where appropriate.',
    tips:
        'A good choice for nut-free nurseries. Stir into porridge or thin onto toast.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'pumpkin_seed',
    name: 'Pumpkin seed butter',
    category: 'Nut & Seed',
    heroMedia: AppMedia(uri: 'assets/foods/pumpkin_seed_hero.jpg'),
    nutritionFlags: ['Iron', 'Healthy fats', 'Magnesium'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Ground or smooth pumpkin seed butter is an iron-rich, nut-free option from around six months. Whole seeds are a choking hazard, so use ground or butter forms.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Stir finely ground pumpkin seeds or thinned pumpkin-seed butter into purees.',
        portion: 'A small spoonful.',
        texture: 'Smooth or finely ground.',
        safetyNote: 'Whole or chopped seeds are a choking hazard — use ground or smooth butter only.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinned seed butter thinly, or sprinkle finely ground seeds over food.',
        portion: 'A small amount.',
        texture: 'Smooth/fine.',
      ),
    ],
    choking:
        'Whole and chopped seeds can be inhaled — only offer finely ground or as a smooth, thinned butter.',
    allergens: 'Not a major regulated allergen; introduce on its own and watch as with any new food.',
    faq:
        'Why pumpkin seeds? They are a good plant source of iron and magnesium — useful ground into meals.',
    tips:
        'Grind seeds to a fine powder and stir into porridge for an iron boost.',
    sourceCitations: ['NHS Start4Life'],
  ),

  // ---------------------------------------------------------------------------
  // MORE VEGETABLES & DRIED FRUIT (continued)
  // ---------------------------------------------------------------------------
  Food(
    id: 'brussels_sprout',
    name: 'Brussels sprouts',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/brussels_sprout_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Vitamin K', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Soft-cooked brussels sprouts are suitable from around six months. Their mild, slightly sweet flavour when roasted can win babies over.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Steam or roast until very soft, then halve or mash.',
        portion: 'A halved soft sprout or a spoonful, mashed.',
        texture: 'Soft.',
        safetyNote: 'Whole sprouts can be a choking risk — halve or quarter soft ones.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer quartered soft sprouts or finely chopped.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Cook until very soft and halve or quarter; whole sprouts are a choking risk.',
    allergens: 'Not a common allergen.',
    faq:
        'Will they cause wind? Like other brassicas they can be a little gassy for some babies; this usually settles.',
    tips:
        'Roasting mellows the flavour and adds sweetness — far more appealing than boiled.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'turnip',
    name: 'Turnip',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/turnip_hero.jpg'),
    nutritionFlags: ['Vitamin C', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Turnip is a mild root vegetable suitable from around six months when cooked until very soft, mashed or as soft pieces.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft, then mash or offer soft wedges.',
        portion: 'A wedge or a spoonful, mashed.',
        texture: 'Soft.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Offer small soft-cooked pieces.',
        portion: 'A small handful.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Low risk when cooked soft. Avoid firm, raw turnip.',
    allergens: 'Not a common allergen.',
    faq:
        'Turnip or swede? They are similar; both mash well. Use whichever you have, cooked very soft.',
    tips:
        'Mash with potato and carrot for a soft, mild root medley.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'mushroom',
    name: 'Mushroom',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/mushroom_hero.jpg'),
    nutritionFlags: ['B vitamins', 'Fibre'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    introduction:
        'Well-cooked mushrooms are suitable from around six months and add savoury flavour. Cook thoroughly and chop finely, as the rubbery texture can be tricky.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Cook until very soft, then finely chop or blend into sauces and purees.',
        portion: 'A spoonful through food.',
        texture: 'Soft, finely chopped.',
        safetyNote: 'Use only shop-bought edible mushrooms, cooked well; never wild-picked ones.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer finely chopped soft-cooked mushrooms in mixed dishes.',
        portion: 'A small amount.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Cook well and chop finely; the springy texture of large pieces can be hard to chew.',
    allergens: 'Not a common allergen.',
    faq:
        'Are mushrooms safe for babies? Cooked, shop-bought mushrooms are fine. Never use foraged/wild mushrooms.',
    tips:
        'Finely chopped mushrooms melt into pasta sauces and add savoury depth.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'raisin',
    name: 'Raisins',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/raisin_hero.jpg'),
    nutritionFlags: ['Iron', 'Fibre'],
    minAgeMonths: 9,
    chokingRisk: 'Moderate',
    introduction:
        'Raisins offer iron and fibre but are small, sticky, and chewy, so they need care. They are usually introduced a little later, around nine months, and softened or chopped.',
    howToServeByAge: [
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Soak or cook to plump and soften, then finely chop or mash into food.',
        portion: 'A small amount, softened.',
        texture: 'Soft, chopped.',
        safetyNote: 'Whole raisins are a choking risk for young babies — soften and chop.',
      ),
      ServingBand(
        ageBand: '18 mo+',
        howToCut: 'Offer whole raisins only once your child chews well, with supervision.',
        portion: 'A small amount.',
        texture: 'Chewy.',
      ),
    ],
    choking:
        'Small, sticky, and chewy — a choking risk for young babies. Soften and chop; offer whole only when chewing is well established.',
    allergens: 'Not a common allergen. Dried fruit is sticky and sugary, so offer with meals and rinse/brush teeth to protect them.',
    faq:
        'Are raisins bad for teeth? Sticky dried fruit clings to teeth; serve with meals rather than as a grazing snack, and keep up tooth-brushing.',
    tips:
        'Plump raisins in warm water, then chop into porridge or soft baking.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'date',
    name: 'Dates',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/date_hero.jpg'),
    nutritionFlags: ['Fibre', 'Potassium', 'Natural sweetness'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Dates are very sweet and sticky and contain a hard stone. Softened and mashed, date can be used as a natural sweetener in baby food from around six months.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Remove the stone, soak to soften, then mash into a smooth paste to stir through food.',
        portion: 'A small amount as a sweetener.',
        texture: 'Smooth paste.',
        safetyNote: 'Always remove the stone; whole/sticky dates are a choking hazard.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Offer finely chopped soft, de-stoned date.',
        portion: 'A small amount.',
        texture: 'Soft, chopped.',
      ),
    ],
    choking:
        'The stone is a choking hazard — always remove it. Whole sticky dates are also a risk; mash or finely chop.',
    allergens: 'Not a common allergen. Naturally very sugary, so use sparingly and protect teeth.',
    faq:
        'Can I sweeten baby food with dates? Yes — date paste is a useful whole-food sweetener instead of added sugar, in small amounts.',
    tips:
        'Blend de-stoned soaked dates into a paste to sweeten porridge or baking naturally.',
    sourceCitations: ['NHS Start4Life'],
  ),
  Food(
    id: 'prune',
    name: 'Prunes',
    category: 'Fruit',
    heroMedia: AppMedia(uri: 'assets/foods/prune_hero.jpg'),
    nutritionFlags: ['Fibre', 'Iron'],
    minAgeMonths: 6,
    chokingRisk: 'Moderate',
    introduction:
        'Prunes (dried plums) are well known for gently easing constipation and are suitable from around six months as a smooth puree.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut: 'Stew or soak to soften, then blend into a smooth puree (remove any stones first).',
        portion: '1–2 teaspoons of puree.',
        texture: 'Smooth.',
        safetyNote: 'Check for stones; whole prunes are a choking hazard.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Finely chop soft, stoned prunes into porridge or yoghurt.',
        portion: 'A small amount.',
        texture: 'Soft.',
      ),
    ],
    choking:
        'Whole prunes and any stones are choking hazards — soften, de-stone, and puree or finely chop.',
    allergens: 'Not a common allergen. Sticky and sugary — offer with meals and keep up tooth-brushing.',
    faq:
        'Do prunes help constipation? Yes — prune puree contains fibre and sorbitol with a gentle laxative effect; use small amounts.',
    tips:
        'A spoon of prune puree stirred into porridge can help a constipated baby. Start small.',
    sourceCitations: ['NHS Start4Life'],
  ),
  // ---------------------------------------------------------------------------
  // ANCESTRAL CANON ADDITIONS (25 Oct 2026, decision B)
  // ---------------------------------------------------------------------------
  Food(
    id: 'meat_stock',
    name: 'Meat stock',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/meat_stock_hero.jpg'),
    nutritionFlags: ['Gelatine', 'Minerals', 'Hydrating'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    whyFirst:
        'In our approach this is the very first food beyond milk: a spoon of warm, '
        'short-cooked stock from meaty bones, gentle on a new gut.',
    introduction:
        'Meat stock is water in which meaty bones and joints have simmered for a few hours. It is shorter-cooked and milder than a long-simmered bone broth, which is why the ancestral approach offers it first: a spoonful of warm, gelatinous liquid is about as gentle a start as solids can be.\n\n'
        'Nutritionally it brings gelatine, a little fat, and minerals, and it makes a useful base for loosening mashes and cooking vegetables. It is not a meal on its own, and milk remains the main source of nutrition for the first year. Mainstream guidance does not single out stock as a first food, but there is nothing in it that conflicts with that guidance as long as it is homemade and unsalted.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Offer a teaspoon or two of warm (not hot) stock from a spoon, or stir it into mashed vegetables or shredded meat.',
        portion: 'A few teaspoons, building to a small cup over weeks.',
        texture: 'Thin liquid; set to a soft jelly when cold.',
        safetyNote:
            'Homemade only, with no salt or stock cubes. Skim fat if it is very rich, and always check the temperature.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut:
            'Use as the cooking liquid for soft vegetables and meats, or serve a small cup to sip with help.',
        portion: 'Up to a small cup alongside a meal.',
        texture: 'Liquid or soft jelly.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut:
            'Serve as a light soup with soft pieces in it, or in an open cup to drink.',
        portion: 'Varies with appetite.',
        texture: 'Soup.',
      ),
    ],
    choking:
        'A thin liquid carries no choking risk of its own. Any pieces served in it must follow the age guidance for that food.',
    allergens:
        'Not a common allergen on its own. Watch what goes into the pot: celery is a listed allergen in the UK and EU, and some bones are sold with seasoning.',
    faq:
        'Is this the same as bone broth? Broth is simmered much longer, which draws out more and can be harder on a young gut; stock is the gentler starting point. Can I use shop-bought stock? Most contain salt, so no. Does it replace milk? No; it is a first taste, not a meal.',
    tips:
        'Make a batch from a chicken carcass or beef bones with a splash of vinegar, simmer three to four hours, strain, cool, and freeze in ice-cube trays. One cube is a serving.',
    sourceCitations: ['NHS Start for Life (no added salt under 12 months)', 'SACN Feeding in the First Year of Life (2018)'],
  ),
  Food(
    id: 'ghee',
    name: 'Ghee',
    category: 'Dairy',
    heroMedia: AppMedia(uri: 'assets/foods/ghee_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'dairy',
    nutritionFlags: ['Healthy fats', 'Vitamin A', 'Energy'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    whyFirst:
        'Clarified butter is the canon\'s cooking fat: stable, mild, and most of the milk protein skimmed away.',
    introduction:
        'Ghee is butter that has been simmered until the water cooks off and the milk solids separate and are removed, leaving clear golden fat. It keeps well, tolerates heat, and tastes gently nutty, which makes it the everyday cooking fat in the ancestral kitchen.\n\n'
        'Fat matters for babies: it carries energy and the fat-soluble vitamins, and it makes vegetables and meats easier to swallow. Because most of the milk proteins are removed, some babies with mild dairy sensitivity tolerate ghee, but it is still a dairy product and should be treated as one for allergen purposes.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Melt a small knob into mashed vegetables, shredded meat, or warm stock.',
        portion: 'About half a teaspoon in a serving.',
        texture: 'Melts into the food.',
        safetyNote:
            'Ghee is dairy. Introduce it as you would butter, on its own first, and watch for a reaction.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Use for pan-cooking soft vegetable pieces and egg.',
        portion: 'A teaspoon in cooking.',
        texture: 'Cooking fat.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Cook with it freely; spread thinly where you would use butter.',
        portion: 'Varies.',
        texture: 'Cooking fat or spread.',
      ),
    ],
    choking: 'No choking risk of its own.',
    allergens:
        'Dairy. Trace milk proteins remain, so a baby with a diagnosed cow\'s milk allergy should not have ghee unless their allergy team says so.',
    faq:
        'Is ghee better than butter? It is more heat-stable and lower in milk protein; butter has a little more flavour. Both have a place. Can I make it? Yes: melt unsalted butter gently, skim the foam, and pour off the clear fat, leaving the solids behind.',
    tips: 'Buy unsalted, or make your own from unsalted butter. A jar keeps for weeks in a cool cupboard.',
    sourceCitations: ['NHS Start for Life (dairy allergen introduction)', 'BSACI early feeding guidance'],
  ),
  Food(
    id: 'bone_marrow',
    name: 'Bone marrow',
    category: 'Meat & Poultry',
    heroMedia: AppMedia(uri: 'assets/foods/bone_marrow_hero.jpg'),
    nutritionFlags: ['Healthy fats', 'Energy', 'Collagen'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    whyFirst:
        'Soft, rich, and spoonable straight from a roasted bone: an ancestral fat source babies take to easily.',
    introduction:
        'Bone marrow is the soft fatty tissue inside large bones. Roasted, it becomes spreadable and mild, and it has been a prized baby food in many traditional cultures because it is energy-dense and needs no chewing.\n\n'
        'It is mostly fat, with some collagen and small amounts of minerals. In our approach it sits alongside butter and ghee as an early fat, offered in small amounts stirred into meat, stock, or vegetables.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Roast marrow bones until the marrow is soft, scoop it out, and mash a little into vegetables or shredded meat.',
        portion: 'About a teaspoon.',
        texture: 'Soft, spreadable.',
        safetyNote:
            'Never give the bone itself. Check for and remove any small bone fragments after scooping.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Spread thinly on soft cooked vegetable strips, or melt into stock.',
        portion: 'A teaspoon or two.',
        texture: 'Spread or melted.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Use as a cooking fat or stir into stews.',
        portion: 'Varies.',
        texture: 'Rich, soft.',
      ),
    ],
    choking:
        'The marrow itself is soft. The risk is bone fragments, so scoop carefully and never offer the bone.',
    allergens: 'Not a common allergen.',
    faq:
        'Is it too rich? A teaspoon at a time is plenty for a baby; it is a fat, not a protein food. Where do I buy it? Butchers sell marrow bones cheaply, often cut lengthways for roasting.',
    tips: 'Roast at a high heat for about twenty minutes until the marrow is soft and just starting to melt. Cool before scooping.',
    sourceCitations: ['NHS Start for Life (fats in weaning)', 'SACN Feeding in the First Year of Life (2018)'],
  ),
  Food(
    id: 'fish_roe',
    name: 'Fish roe',
    category: 'Fish & Seafood',
    heroMedia: AppMedia(uri: 'assets/foods/fish_roe_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'fish',
    nutritionFlags: ['Omega-3', 'Vitamin D', 'Choline'],
    minAgeMonths: 9,
    chokingRisk: 'Low',
    introduction:
        'Fish roe, the eggs of fish such as salmon, trout, or cod, is one of the most concentrated sources of DHA, vitamin D, and choline in any food. Traditional coastal diets gave it to babies early and often.\n\n'
        'The limit is salt. Most roe sold for eating is cured in salt, and cured caviar-style products are far too salty for a baby. Fresh or lightly salted roe, rinsed, in small amounts is what we mean here. Roe is a fish product and counts as the fish allergen.',
    howToServeByAge: [
      ServingBand(
        ageBand: '9 mo+',
        howToCut:
            'A few rinsed eggs mashed into cooked egg yolk, avocado, or full-fat yoghurt.',
        portion: 'Half a teaspoon.',
        texture: 'Small soft beads that pop.',
        safetyNote:
            'Only fresh or lightly salted roe, rinsed well. Skip anything labelled caviar or heavily cured. Fish allergen: introduce after fish itself has been tolerated.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'Spoon a little over soft fish or egg.',
        portion: 'A teaspoon.',
        texture: 'Beads.',
      ),
    ],
    choking:
        'Individual eggs are small and soft and present a low choking risk. Serve mixed into a soft food rather than loose.',
    allergens: 'Fish. Treat as part of the fish allergen and keep it in rotation once tolerated.',
    faq:
        'Why not from six months? Because almost all roe is salted, and we would rather fish itself goes first. Is smoked cod roe suitable? No; it is heavily salted and often smoked with additives.',
    tips: 'Ask a fishmonger for fresh roe in season, freeze in tiny portions, and rinse before serving.',
    sourceCitations: ['NHS Start for Life (salt and fish)', 'BSACI early feeding guidance'],
  ),
  Food(
    id: 'fermented_brine',
    name: 'Fermented vegetable brine',
    category: 'Vegetable',
    heroMedia: AppMedia(uri: 'assets/foods/fermented_brine_hero.jpg'),
    nutritionFlags: ['Probiotics', 'Enzymes'],
    minAgeMonths: 6,
    chokingRisk: 'Low',
    whyFirst:
        'A few drops of the liquid from naturally fermented vegetables, stirred into stock: the canon\'s first taste of live cultures.',
    introduction:
        'The brine from naturally fermented vegetables such as sauerkraut or fermented cucumbers carries live cultures and the sour, savoury flavour of the ferment without the fibrous vegetable itself. The ancestral approach introduces it very early, a few drops at a time, as a first exposure to beneficial bacteria.\n\n'
        'Brine is salty by nature, which is why the amounts are tiny: drops, not spoonfuls, and never as a drink. Mainstream guidance has no position on fermented brine for babies; it simply asks that salt be kept to a minimum, and a few drops keep within that.',
    howToServeByAge: [
      ServingBand(
        ageBand: '6 mo+',
        howToCut:
            'Stir two or three drops into warm meat stock or a mashed vegetable.',
        portion: 'Drops.',
        texture: 'Liquid.',
        safetyNote:
            'Use only a naturally fermented product with no vinegar, sugar, or preservatives. Drops only, because of the salt.',
      ),
      ServingBand(
        ageBand: '9 mo+',
        howToCut: 'Up to half a teaspoon stirred into food, plus a small shred of the fermented vegetable itself, finely chopped.',
        portion: 'Half a teaspoon.',
        texture: 'Liquid plus soft shreds.',
      ),
      ServingBand(
        ageBand: '12 mo+',
        howToCut: 'A teaspoon of well-rinsed fermented vegetable alongside meals.',
        portion: 'A teaspoon.',
        texture: 'Soft shreds.',
      ),
    ],
    choking: 'Liquid carries no risk. Chop any vegetable shreds finely.',
    allergens: 'Not a common allergen. Check the label for celery or mustard seed in mixed ferments.',
    faq:
        'Is shop sauerkraut fine? Only the refrigerated, unpasteurised kind with no vinegar; shelf-stable jars are pickled, not fermented. Will the salt harm my baby? At drop level the amount is tiny, which is why we keep it to drops until later.',
    tips: 'Making your own is cheap: shredded cabbage and salt in a jar, pressed under its own brine for a week or two.',
    sourceCitations: ['NHS Start for Life (salt under 12 months)', 'SACN Feeding in the First Year of Life (2018)'],
  ),
];
