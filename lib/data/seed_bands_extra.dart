/// Extra serving bands merged onto catalogue foods at load (12 mo+ where a
/// food stopped at 9 mo+, and 18 mo+, 24 mo+, 3 yr+ where safety changes).
/// Original wording; general information, not medical advice.
library;

import '../models/food.dart';

const Map<String, List<ServingBand>> kExtraBands = {
  // ---------------------------------------------------------------------------
  // FRUIT
  // ---------------------------------------------------------------------------
  'strawberry': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Halve or quarter strawberries lengthways, or slice thinly. Large, very ripe berries can be offered whole to bite from.',
      portion: 'A small handful.',
      texture: 'Soft pieces or slices.',
      safetyNote:
          'Small, firm berries are still safer cut lengthways than served whole.',
    ),
  ],
  'raspberry': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer whole raspberries on their own, scattered over yoghurt, or squashed into porridge.',
      portion: 'A small handful.',
      texture: 'Soft, squashable.',
    ),
  ],
  'blackberry': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer ripe blackberries whole, or halve any that are large or firm.',
      portion: 'A small handful.',
      texture: 'Soft, juicy.',
      safetyNote: 'Firm, under-ripe berries are best halved.',
    ),
  ],
  'peach': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer ripe peach in slices or bite-sized pieces, skin on or off, or a large stoned half to bite from.',
      portion: 'Half to one small peach.',
      texture: 'Soft, juicy.',
      safetyNote: 'Remove the stone completely before serving.',
    ),
  ],
  'plum': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer ripe stoned plum in slices or bite-sized pieces. The skin can usually stay on once your child chews well.',
      portion: 'One small plum.',
      texture: 'Soft, juicy.',
      safetyNote:
          'Always remove the stone; firm, unripe plum is harder to chew.',
    ),
  ],
  'apricot': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer ripe fresh apricot in slices or pieces. Soak dried apricots until plump and chop them small.',
      portion: 'One fresh apricot, or a few chopped dried pieces.',
      texture: 'Soft.',
      safetyNote:
          'Whole dried apricots are sticky and firm; keep chopping them small.',
    ),
  ],
  'kiwi': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut: 'Peel and cut into slices, half-moons, or bite-sized pieces.',
      portion: 'Half to one kiwi.',
      texture: 'Soft, juicy.',
    ),
  ],
  'fig': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer ripe fresh fig halved or quartered. Soften dried figs in warm water and chop them small.',
      portion: 'One fresh fig, or a few chopped dried pieces.',
      texture: 'Soft, seedy.',
      safetyNote: 'Dried figs are chewy and sticky; keep them soft and small.',
    ),
  ],
  'papaya': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer ripe papaya in slices, spears, or bite-sized pieces with every seed removed.',
      portion: 'A small handful.',
      texture: 'Very soft.',
      safetyNote: 'Remove all the black seeds before serving.',
    ),
  ],
  'prune': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Chop soft, stoned prunes into small pieces, or stir prune puree into porridge or yoghurt.',
      portion: 'One or two prunes, chopped.',
      texture: 'Soft, sticky.',
      safetyNote:
          'Whole prunes are sticky and can lodge in the throat; keep chopping them and check for stones.',
    ),
  ],
  'grape': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Keep quartering every grape lengthways. Halving is not enough, because a half grape can still block a small airway.',
      portion: 'A small handful, quartered.',
      texture: 'Soft once cut.',
      safetyNote:
          'What changes is the portion and how independently your child eats, not the cut. Serve at the table with an adult watching.',
    ),
    ServingBand(
      ageBand: '3 yr+',
      howToCut:
          'Continue to quarter grapes lengthways. UK guidance advises cutting grapes and similar small round foods for young children, at least until around school age.',
      portion: 'A small handful, quartered.',
      texture: 'Soft once cut.',
      safetyNote:
          'Whole grapes remain one of the foods most linked to choking in young children. Eat sitting down, not while running or playing.',
    ),
  ],
  'cherry': [
    ServingBand(
      ageBand: '3 yr+',
      howToCut:
          'Remove the stone yourself, then halve or quarter the cherry. Do not leave a child to eat around the stone.',
      portion: 'A small handful, stoned and cut.',
      texture: 'Soft once prepared.',
      safetyNote:
          'Whole cherries and loose stones remain choking hazards for young children. Serve seated and supervised.',
    ),
  ],
  'apple': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Offer raw apple sliced very thinly (about as thin as a coin is wide), or grated. Lightly cooked apple slices are still a good option.',
      portion: 'Half a small apple.',
      texture: 'Thin and crisp, or grated.',
      safetyNote:
          'Thick wedges and bite-sized chunks of raw apple are still choking hazards.',
    ),
    ServingBand(
      ageBand: '3 yr+',
      howToCut:
          'Thin raw slices remain the safest raw cut. Move to thicker slices only when your child chews well and takes small bites.',
      portion: 'Half to one small apple.',
      texture: 'Crisp.',
      safetyNote:
          'Avoid hard raw chunks until your child chews confidently; always supervise and serve seated.',
    ),
  ],

  // ---------------------------------------------------------------------------
  // VEGETABLES
  // ---------------------------------------------------------------------------
  'potato': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer soft cooked potato as wedges, cubes, or mash alongside the family meal.',
      portion: 'Two to three tablespoons, or a few soft wedges.',
      texture: 'Soft.',
      safetyNote:
          'Avoid crisps, chips, and hard roasted edges; keep added salt out.',
    ),
  ],
  'courgette': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer cooked courgette in rounds, half-moons, or strips, or grated into sauces and fritters.',
      portion: 'A small handful.',
      texture: 'Soft.',
    ),
  ],
  'cauliflower': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer soft cooked florets whole or halved, or roasted until tender.',
      portion: 'A small handful.',
      texture: 'Soft, tender.',
      safetyNote: 'Raw florets are hard; keep cooking until tender.',
    ),
  ],
  'green_bean': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer whole cooked beans or bite-sized pieces, cooked until tender but no longer mushy.',
      portion: 'A small handful.',
      texture: 'Tender.',
      safetyNote: 'Raw or barely cooked beans are tough; cook until tender.',
    ),
  ],
  'tomato': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Quarter cherry tomatoes lengthways. Offer larger ripe tomatoes sliced or chopped into small pieces.',
      portion: 'A small handful.',
      texture: 'Soft, juicy.',
      safetyNote:
          'Whole cherry tomatoes are a choking hazard; always quarter them lengthways.',
    ),
    ServingBand(
      ageBand: '3 yr+',
      howToCut:
          'Continue to quarter cherry tomatoes lengthways. Larger tomatoes can be sliced or cut into wedges.',
      portion: 'A small handful.',
      texture: 'Soft, juicy.',
      safetyNote:
          'UK guidance treats cherry tomatoes like grapes: cut them for young children, at least until around school age.',
    ),
  ],
  'beetroot': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer cooked beetroot in wedges or bite-sized pieces, or finely grate raw beetroot into salads.',
      portion: 'A small handful.',
      texture: 'Soft cooked, or finely grated raw.',
      safetyNote: 'Raw beetroot chunks are hard; grate it finely if raw.',
    ),
  ],
  'parsnip': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer roasted or steamed parsnip as soft wedges or pieces, or mashed with butter.',
      portion: 'A small handful.',
      texture: 'Soft.',
      safetyNote: 'Trim any woody core and avoid hard, crisp ends.',
    ),
  ],
  'pumpkin': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer roasted or steamed pumpkin in cubes, wedges with the skin removed, or mashed.',
      portion: 'A small handful.',
      texture: 'Soft.',
    ),
  ],
  'asparagus': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut: 'Offer tender cooked spears whole or cut into short pieces.',
      portion: 'Two or three spears.',
      texture: 'Tender.',
      safetyNote:
          'Trim the woody base; it stays stringy however long it cooks.',
    ),
  ],
  'eggplant': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer roasted aubergine in strips or pieces, or mashed into a dip.',
      portion: 'A small handful.',
      texture: 'Soft, creamy.',
      safetyNote:
          'Undercooked aubergine is spongy and tough; roast until fully soft.',
    ),
  ],
  'brussels_sprout': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer soft cooked sprouts halved or quartered, or shredded finely into mixed dishes.',
      portion: 'Two or three sprouts.',
      texture: 'Soft.',
      safetyNote:
          'Whole sprouts are round and firm; keep cutting them until your child chews well.',
    ),
  ],
  'turnip': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer cooked turnip in wedges or small pieces, or mashed with butter.',
      portion: 'A small handful.',
      texture: 'Soft.',
    ),
  ],
  'carrot': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Alongside soft cooked carrot, offer raw carrot as very thin ribbons made with a vegetable peeler, or finely grated.',
      portion: 'A small handful.',
      texture: 'Thin and pliable, or grated.',
      safetyNote:
          'Raw carrot coins, chunks, and thick sticks are still choking hazards.',
    ),
    ServingBand(
      ageBand: '3 yr+',
      howToCut:
          'Thin matchsticks of raw carrot can be tried once your child chews well. Soft cooked sticks remain a good choice.',
      portion: 'A small handful.',
      texture: 'Thin and crisp.',
      safetyNote:
          'Never cut raw carrot into coins. Serve seated and supervised.',
    ),
  ],
  'celery': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Remove the strings with a peeler, then slice raw celery very thinly across the stalk, or keep using it cooked soft.',
      portion: 'A small amount.',
      texture: 'Thin and crisp.',
      safetyNote:
          'The long strings can catch in the throat; always remove them.',
    ),
    ServingBand(
      ageBand: '3 yr+',
      howToCut:
          'Thin sticks of de-strung raw celery can be tried once your child chews well.',
      portion: 'A few thin sticks.',
      texture: 'Crisp.',
      safetyNote: 'Keep removing the strings, and supervise.',
    ),
  ],
  'cucumber': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Offer thin batons or thin rounds cut in half, with the skin on or off.',
      portion: 'A small handful.',
      texture: 'Crisp, thin.',
      safetyNote:
          'Thick whole rounds are the shape to avoid; halve or quarter them.',
    ),
  ],
  'bell_pepper': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Offer raw pepper in thin strips, with seeds and white pith removed, alongside cooked pepper.',
      portion: 'A few strips.',
      texture: 'Thin and crisp.',
      safetyNote:
          'Raw skin is tough; thin strips are easier to chew than chunks.',
    ),
  ],
  'corn': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Offer short lengths of soft cooked corn on the cob to bite kernels from, or loose cooked kernels stirred into meals.',
      portion: 'A short piece of cob, or a small handful of kernels.',
      texture: 'Soft kernels.',
      safetyNote:
          'Popcorn is a different food: it is a recognised choking hazard and is best kept away from young children.',
    ),
  ],
  'green_pea': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Offer whole cooked peas freely in meals, or thawed frozen peas as a finger food.',
      portion: 'A small handful.',
      texture: 'Soft.',
      safetyNote:
          'Hard roasted or dried crunchy peas are not the same food; keep them away from young children.',
    ),
  ],

  // ---------------------------------------------------------------------------
  // MEAT, FISH, OFFAL
  // ---------------------------------------------------------------------------
  'turkey': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer moist shredded or diced turkey, soft meatballs, or pieces in stews and sauces.',
      portion: 'Two to three tablespoons.',
      texture: 'Moist, tender.',
      safetyNote:
          'Keep it moist; dry, stringy breast meat is harder to swallow.',
    ),
  ],
  'pork': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer tender slow-cooked pork shredded or diced small, or soft meatballs.',
      portion: 'Two to three tablespoons.',
      texture: 'Moist, tender.',
      safetyNote:
          'Avoid salty cured pork such as bacon and ham, and chewy chops; cook fully.',
    ),
  ],
  'lamb': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer tender slow-cooked lamb shredded or diced small, or soft koftas and meatballs.',
      portion: 'Two to three tablespoons.',
      texture: 'Moist, tender.',
      safetyNote: 'Remove bones, gristle, and hard fatty pieces.',
    ),
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'A trimmed lamb rib or a chop bone with tender meat left on can be offered to gnaw, alongside small pieces of meat.',
      portion: 'One bone, plus small pieces.',
      texture: 'Tender.',
      safetyNote:
          'Check the bone for loose splinters and small fragments, remove gristle, and take the bone away once the meat is gone. Supervise throughout.',
    ),
  ],
  'chicken': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'A drumstick with skin, loose cartilage, and the thin splinter bones removed can be offered to eat from. Otherwise, small moist pieces.',
      portion: 'One small drumstick, or a small handful of pieces.',
      texture: 'Moist, tender.',
      safetyNote:
          'Check carefully for small bones and cartilage. Large, dry chunks of meat remain a choking hazard for young children.',
    ),
  ],
  'duck': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer tender cooked duck shredded or diced small, mixed through rice or vegetables.',
      portion: 'Two to three tablespoons.',
      texture: 'Moist, tender.',
      safetyNote: 'Remove crisp skin and any bones; keep the meat moist.',
    ),
  ],
  'liver': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Spread smooth liver pâté on toast fingers, or finely chop cooked liver into mince dishes.',
      portion:
          'About once a week, small portion: roughly a teaspoon or two of pâté.',
      texture: 'Smooth, or finely chopped.',
      safetyNote:
          'Cook thoroughly. Liver is very high in vitamin A, so keep it to about once a week in a small portion.',
    ),
  ],
  'cod': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer flaked cod, soft fish cakes, or chunks in a mild sauce, checking every flake for bones.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft, flaky.',
      safetyNote: 'Remove every bone, however small.',
    ),
  ],
  'haddock': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer flaked haddock, fish cakes, or pieces in a pie, checking carefully for bones.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft, flaky.',
      safetyNote:
          'Smoked haddock is salty, so keep it occasional and small; remove all bones.',
    ),
  ],
  'tuna': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer flaked tinned tuna in spring water mixed through pasta, rice, or mashed potato, or in fishcakes.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft, flaky.',
      safetyNote:
          'Choose tuna in spring water with no added salt, and vary it with other fish through the week.',
    ),
  ],
  'sardine': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Break tinned sardines into pieces with a fork, pressing the soft bones in, or mash onto toast.',
      portion: 'One to two small sardines.',
      texture: 'Soft.',
      safetyNote:
          'Crush the soft bones well and lift out any firm ones, such as the larger backbone of bigger fish.',
    ),
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Small tinned sardines can be offered in larger pieces once your child chews well. Fresh sardines need every bone removed.',
      portion: 'Two small sardines.',
      texture: 'Soft.',
      safetyNote:
          'Fresh and grilled sardines have firm bones that do not soften; fillet them carefully.',
    ),
  ],
  'mackerel': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer flaked cooked mackerel mixed into mash, rice, or soft patties, checking every flake for bones.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft, flaky.',
      safetyNote:
          'Remove every bone; smoked mackerel is salty, so keep it occasional.',
    ),
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Offer boned fillet in larger flakes or pieces. Run your fingers along each piece first to find the fine pin bones.',
      portion: 'A small fillet piece.',
      texture: 'Soft, flaky.',
      safetyNote:
          'The fine bones in mackerel do not soften with age or cooking. An adult should still check every piece.',
    ),
  ],

  // ---------------------------------------------------------------------------
  // GRAINS AND STARCHES
  // ---------------------------------------------------------------------------
  'barley': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer soft cooked pearl barley stirred into soups, stews, or as a risotto-style dish.',
      portion: 'Two to three tablespoons, cooked.',
      texture: 'Soft, chewy.',
    ),
  ],
  'millet': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer soft cooked millet as porridge, pressed into patties, or as a side with stew.',
      portion: 'Two to three tablespoons, cooked.',
      texture: 'Soft.',
    ),
  ],
  'buckwheat': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer soft cooked buckwheat groats in porridge or with vegetables, or small buckwheat pancakes.',
      portion: 'Two to three tablespoons, or one small pancake.',
      texture: 'Soft.',
    ),
  ],
  'couscous': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer moist couscous mixed with sauce or vegetables so it holds together on a spoon or in the hand.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft, moist.',
      safetyNote: 'Dry, loose grains are easy to inhale; keep it moist.',
    ),
  ],
  'semolina': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer semolina porridge, or let it set and cut it into soft fingers.',
      portion: 'A small bowl, or a few fingers.',
      texture: 'Soft.',
      safetyNote: 'Sweeten with fruit, not sugar.',
    ),
  ],
  'noodles': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer soft cooked noodles cut into shorter lengths, mixed with vegetables and protein.',
      portion: 'A small bowl.',
      texture: 'Soft.',
      safetyNote: 'Avoid salty instant-noodle flavour sachets and sauces.',
    ),
  ],
  'polenta': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer soft polenta, or set polenta cut into fingers or cubes and gently pan-warmed.',
      portion: 'A few fingers, or two to three tablespoons.',
      texture: 'Soft.',
      safetyNote: 'Avoid hard, crisp-fried edges for now.',
    ),
  ],
  'wheat_cereal': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer as a thicker porridge with fruit or nut butter stirred through.',
      portion: 'A small bowl.',
      texture: 'Soft.',
      safetyNote: 'Choose a plain version with no added sugar or salt.',
    ),
  ],

  // ---------------------------------------------------------------------------
  // DAIRY
  // ---------------------------------------------------------------------------
  'butter': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Spread on toast, melt into vegetables and grains, or use in cooking.',
      portion: 'A small knob or thin spread.',
      texture: 'Soft.',
      safetyNote: 'Unsalted butter keeps the salt in the meal low.',
    ),
  ],
  'cottage_cheese': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer by the spoonful, as a dip, spread on toast, or mixed with fruit.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft, lumpy.',
      safetyNote: 'Choose pasteurised, full-fat cottage cheese.',
    ),
  ],
  'ricotta': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer spread on toast, stirred through pasta, or baked into pancakes.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft, creamy.',
      safetyNote: 'Choose pasteurised ricotta.',
    ),
  ],
  'cream_cheese': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut: 'Spread on toast or crackers, or stir into sauces.',
      portion: 'A thin spread.',
      texture: 'Soft, spreadable.',
      safetyNote:
          'Spread thinly; thick blobs can stick to the roof of the mouth.',
    ),
  ],
  'kefir': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer plain kefir in an open cup, poured over porridge, or blended with fruit.',
      portion: 'A small cup.',
      texture: 'Drinkable.',
      safetyNote: 'Choose plain, unsweetened, pasteurised kefir.',
    ),
  ],

  // ---------------------------------------------------------------------------
  // LEGUMES
  // ---------------------------------------------------------------------------
  'kidney_bean': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer whole soft cooked beans, lightly squashed, or mixed into chilli-style stews without hot spice.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft.',
      safetyNote:
          'Always cook dried kidney beans fully; tinned beans are already cooked. Squash any firm beans.',
    ),
  ],
  'white_bean': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Offer whole soft beans, lightly squashed, in stews, or blended into dips.',
      portion: 'Two to three tablespoons.',
      texture: 'Soft.',
      safetyNote: 'Squash any firm beans until your child chews well.',
    ),
  ],
  'edamame': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Offer whole soft cooked beans out of the pod once your child chews well, or halved.',
      portion: 'A small handful.',
      texture: 'Soft.',
      safetyNote:
          'Pods are tough and fibrous; serve the beans only. Supervise while eating.',
    ),
  ],

  // ---------------------------------------------------------------------------
  // NUT AND SEED BUTTERS, SEEDS
  // ---------------------------------------------------------------------------
  'peanut_butter': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Spread smooth peanut butter on toast or crackers, or stir it into porridge and sauces. Finely ground peanuts can be used in baking.',
      portion: 'A thin spread.',
      texture: 'Thin spread.',
      safetyNote:
          'Avoid spoonfuls or thick blobs, which can stick in the throat. NHS guidance is not to give whole peanuts or other whole nuts to children under 5.',
    ),
  ],
  'almond_butter': [
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Spread smooth almond butter on toast or fruit slices, or stir into porridge. Ground almonds can be used in baking.',
      portion: 'A thin spread.',
      texture: 'Thin spread.',
      safetyNote:
          'Avoid spoonfuls or thick blobs. NHS guidance is not to give whole nuts to children under 5.',
    ),
  ],
  'cashew_butter': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Spread thinly on toast fingers, or stir into porridge, yoghurt, or sauces.',
      portion: 'A thin spread.',
      texture: 'Smooth.',
      safetyNote:
          'Keep spreads thin and never offer spoonfuls. Whole cashews remain a choking hazard.',
    ),
    ServingBand(
      ageBand: '24 mo+',
      howToCut: 'Spread on toast or crackers, or use in sauces and baking.',
      portion: 'A thin spread.',
      texture: 'Thin spread.',
      safetyNote:
          'Avoid thick blobs. NHS guidance is not to give whole nuts to children under 5.',
    ),
  ],
  'sunflower_seed_butter': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Spread thinly on toast fingers, or stir into porridge or yoghurt.',
      portion: 'A thin spread.',
      texture: 'Smooth.',
      safetyNote: 'Thick spreads can stick in the mouth; keep it thin.',
    ),
    ServingBand(
      ageBand: '24 mo+',
      howToCut: 'Spread on toast or crackers, or use in sauces and baking.',
      portion: 'A thin spread.',
      texture: 'Thin spread.',
      safetyNote:
          'Avoid spoonfuls. Offer whole sunflower seeds only once your child chews well, and never in a handful.',
    ),
  ],
  'pumpkin_seed': [
    ServingBand(
      ageBand: '12 mo+',
      howToCut:
          'Sprinkle finely ground pumpkin seeds over porridge, yoghurt, or vegetables, or spread thinned seed butter thinly.',
      portion: 'A teaspoon or two, ground.',
      texture: 'Finely ground or smooth.',
      safetyNote: 'Whole and roughly chopped seeds are still a choking hazard.',
    ),
    ServingBand(
      ageBand: '24 mo+',
      howToCut:
          'Continue with ground seeds and seed butter. Seeds baked into bread or bars are usually manageable.',
      portion: 'A small amount.',
      texture: 'Ground, or baked in.',
      safetyNote:
          'Offer loose whole seeds only once your child chews well, a few at a time and seated.',
    ),
  ],
};
