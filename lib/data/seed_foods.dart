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
    category: 'Protein',
    heroMedia: AppMedia(uri: 'assets/foods/egg_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'egg',
    nutritionFlags: ['Protein', 'Iron-rich'],
    minAgeMonths: 6,
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
    category: 'Protein',
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
    category: 'Protein',
    heroMedia: AppMedia(uri: 'assets/foods/beef_hero.jpg'),
    nutritionFlags: ['Iron-rich', 'Protein'],
    minAgeMonths: 6,
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
    category: 'Protein',
    heroMedia: AppMedia(uri: 'assets/foods/salmon_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'fish',
    nutritionFlags: ['Healthy fats', 'Protein'],
    minAgeMonths: 6,
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
        'Is tinned salmon fine? Yes, lower-salt tinned salmon is convenient; soft tinned bones can be mashed in. How much oily fish? Some guidance suggests limiting oily fish for young children to a small number of portions weekly.',
    tips:
        'Mix flaked salmon with mashed potato for an easy meal. Buy boneless fillets and still double-check for stray bones.',
    sourceCitations: ['NIAID 2017', 'NHS Start4Life', 'SACN 2018'],
  ),
  Food(
    id: 'shrimp',
    name: 'Shrimp / prawn (shellfish)',
    category: 'Protein',
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
    category: 'Protein',
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
    category: 'Protein',
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
    category: 'Protein',
    heroMedia: AppMedia(uri: 'assets/foods/tofu_hero.jpg'),
    isCommonAllergen: true,
    allergenId: 'soy',
    nutritionFlags: ['Plant protein', 'Iron-rich'],
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
    category: 'Protein',
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
    category: 'Other',
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
];
