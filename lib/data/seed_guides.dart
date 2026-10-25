/// Original how-to content for the Guides tab (§5). Written in our own words
/// from public-health sources; general information, not medical advice.
class Guide {
  final String id;
  final String section; // Getting Ready / Safety / Feeding / Ancestral
  final String title;
  final int readMinutes;
  final String body;
  final String audience; // Babies / Toddlers
  const Guide({
    required this.id,
    required this.section,
    required this.title,
    required this.readMinutes,
    required this.body,
    this.audience = 'Babies',
  });
}

const List<Guide> kSeedGuides = [
  Guide(
    id: 'when_to_start',
    section: 'Getting Ready',
    title: 'When to start solids',
    readMinutes: 3,
    body:
        'Most babies are ready for solid foods at around six months. Before '
        'then, breast milk or formula provides everything a baby needs. Waiting '
        'until about six months gives the gut and the swallowing reflexes time '
        'to mature.\n\n'
        'Age is a guide, not a rule — look for readiness signs too: sitting up '
        'with little support and steady head control, reaching for and mouthing '
        'objects, and genuine interest in food. If your baby was born before 37 '
        'weeks, your health team may suggest using corrected age. When in '
        'doubt, ask your paediatrician or health visitor.',
  ),
  Guide(
    id: 'first_foods',
    section: 'Getting Ready',
    title: 'Choosing first foods',
    readMinutes: 3,
    body:
        'There is no single "perfect" first food. Iron-rich foods are a smart '
        'early focus because a baby\'s iron stores start to run low around six '
        'months — think well-cooked egg, soft meats, lentils, and iron-fortified '
        'cereals, alongside fruits and vegetables.\n\n'
        'Offer single foods at first so you can spot how your baby responds, '
        'then build variety. Soft textures and easy-to-hold shapes work well '
        'whether you spoon-feed purées, offer finger foods, or do a bit of '
        'both. Skip added salt and sugar, and hold honey until 12 months.\n\n'
        'Our approach orders this differently: meat in its stock, egg, fats, '
        'and soft vegetables first, with grains and legumes waiting until '
        'around two. See The ancestral first-foods order under Ancestral.',
  ),
  Guide(
    id: 'gagging_vs_choking',
    section: 'Safety',
    title: 'Gagging vs choking',
    readMinutes: 4,
    body:
        'Gagging is a normal, protective reflex that moves food away from the '
        'airway. It can look dramatic — coughing, watery eyes, a red face — but '
        'the baby is moving air and usually sorts it out themselves. Stay calm '
        'and let them work through it.\n\n'
        'Choking is different and silent: the airway is blocked, so there is '
        'little or no sound, and the baby may go quiet, floppy, or blue. This is '
        'an emergency. Reduce the risk by always seating your baby upright, '
        'never leaving them alone while eating, and preparing high-risk foods '
        'safely (see below). Consider taking an infant first-aid course so you '
        'know what to do.',
  ),
  Guide(
    id: 'choking_hazards',
    section: 'Safety',
    title: 'Common choking hazards',
    readMinutes: 3,
    body:
        'Some everyday foods are the wrong shape or texture for babies and need '
        'modifying: whole grapes and cherry tomatoes (quarter them lengthways), '
        'whole nuts (use smooth nut butters thinly spread or finely ground '
        'instead), raw hard fruit and veg like apple and carrot (grate, cook, '
        'or cut into thin batons), round coin-shaped slices of sausage, and '
        'globs of thick nut butter.\n\n'
        'The principles are simple: soften hard foods by cooking, change round '
        'shapes so they can\'t plug the airway, and avoid small hard items '
        'entirely until your child can chew well.',
  ),
  Guide(
    id: 'allergens_intro',
    section: 'Feeding',
    title: 'Introducing allergens',
    readMinutes: 4,
    body:
        'Current guidance encourages introducing the common allergens from '
        'around six months rather than delaying them — early, regular exposure '
        'is associated with lower rates of some food allergies. Introduce one '
        'allergen at a time, earlier in the day, starting with a small amount, '
        'and watch for about two hours.\n\n'
        'If your baby has severe eczema and/or a known egg allergy, talk to your '
        'doctor — guidance supports introducing peanut earlier (around four to '
        'six months) for higher-risk babies, sometimes after allergy testing. '
        'Once an allergen is tolerated, keep it in the diet regularly to help '
        'maintain tolerance. The Allergen Programme tab tracks this for you.',
  ),
  Guide(
    id: 'responsive_feeding',
    section: 'Feeding',
    title: 'Responsive feeding',
    readMinutes: 2,
    body:
        'Babies are good at regulating how much they eat. Your job is to offer '
        'safe, varied food on a calm schedule; their job is to decide whether '
        'and how much to eat. Watch for fullness cues — turning away, closing '
        'the mouth, losing interest — and don\'t pressure the last spoonful.\n\n'
        'Expect mess, refusals, and repeats: it can take many exposures before '
        'a baby accepts a new food. Keep offering without forcing, and let them '
        'explore with their hands.',
  ),
  Guide(
    id: 'ancestral_first_foods_order',
    section: 'Ancestral',
    title: 'The ancestral first-foods order',
    readMinutes: 4,
    body:
        'This is the gut-health-first sequence popularised by Kate Pope '
        '(@wildnutritionist). It is an alternative to mainstream guidance, not '
        'medical advice — the NHS, AAP, and WHO instead recommend a diverse '
        'diet that includes fruit, vegetables, and grains. Read it as one '
        'philosophy among several, and discuss any approach with your '
        'paediatrician.\n\n'
        'The order, roughly:\n\n'
        '1. Meat stock and soft meat first. Short-cooked meaty bones (gentler '
        'and more gelatinous than long-cooked bone broth), offered by the '
        'spoonful, then the slow-cooked meat itself.\n\n'
        '2. Fermented brine. A few drops of the liquid from naturally '
        'fermented vegetables, stirred into the meat stock.\n\n'
        '3. Egg, early and whole. Some ancestral writers give the yolk for '
        'weeks before the white. Allergy guidance (BSACI, NHS) favours '
        'well-cooked whole egg early and regularly, because delaying the white '
        'is not thought to help and may make egg allergy more likely. Safety '
        'wins here, so our First Foods stage offers well-cooked whole egg in '
        'the first weeks.\n\n'
        '4. Fats. Avocado, butter, and oily fish such as salmon.\n\n'
        '5. Organ meats: liver, heart, and bone marrow, for nutrient density. '
        'Liver is very rich in vitamin A, so keep it to small, roughly weekly '
        'servings.\n\n'
        '6. Soft cooked vegetables alongside throughout, then well-fermented, '
        'pasteurised dairy such as kefir and yoghurt once tolerated.\n\n'
        '7. Grains, starchy roots, and legumes wait until around two years in '
        'this approach, once animal foods, fats, and vegetables are well '
        'established. (Mainstream guidance includes them from six months.)\n\n'
        'Throughout: slow-cooked gelatinous cuts of meat, and no processed '
        'baby food. Standard safety still applies — cook meats and egg '
        'thoroughly, use pasteurised dairy, no honey before 12 months, and '
        'introduce one new food at a time while watching for reactions. You '
        'can explore these ideas as meal swaps under Meals → Ancestral.',
  ),

  // ---- Toddlers ----
  Guide(
    id: 't_portion_sizes',
    section: 'Feeding',
    audience: 'Toddlers',
    title: 'Toddler portions',
    readMinutes: 3,
    body:
        'Toddlers have small stomachs and appetites that swing from day to day. '
        'A rough guide is a portion about the size of your child\'s own hand or '
        'fist for each food, offered across three meals and a couple of snacks.'
        '\n\nYour job is to offer balanced choices on a regular rhythm; theirs is '
        'to decide how much to eat. Appetite naturally dips as growth slows after '
        'the first year, so judge intake over a week rather than a single meal.',
  ),
  Guide(
    id: 't_picky_eating',
    section: 'Feeding',
    audience: 'Toddlers',
    title: 'Handling picky eating',
    readMinutes: 4,
    body:
        'Fussiness is a normal developmental stage, not a sign you\'ve done '
        'something wrong. Toddlers are wired to be wary of new foods, and it can '
        'take many calm, pressure-free exposures before a food is accepted.'
        '\n\nKeep serving rejected foods alongside familiar ones without '
        'comment, eat the same foods together, and avoid turning meals into a '
        'battle or a bribe. Offer, don\'t force; model enjoyment; and trust that '
        'variety builds over time. If your child is losing weight, gagging '
        'frequently, or eating an extremely narrow range, speak to your health '
        'team.',
  ),
  Guide(
    id: 't_milk_and_cups',
    section: 'Feeding',
    audience: 'Toddlers',
    title: 'Milk & moving to a cup',
    readMinutes: 3,
    body:
        'From around 12 months, whole or semi-skimmed cow\'s milk can become a '
        'main drink. The NHS suggests offering a cup from around six months and '
        'discouraging bottles once your child is one, to protect developing '
        'teeth. Water and milk are the best drinks. Our approach skips juice '
        'and other sweet drinks altogether.'
        '\n\nThe NHS suggests at least 350 ml of milk a day, or two servings '
        'of foods made from milk such as yoghurt or cheese. Much more than '
        'that can blunt appetite for food and affect iron levels, so offer it '
        'with or after meals rather than sipping all day.',
  ),
  Guide(
    id: 't_family_meals',
    section: 'Feeding',
    audience: 'Toddlers',
    title: 'Family meals & independence',
    readMinutes: 2,
    body:
        'Eating together is one of the most powerful things you can do for a '
        'toddler\'s eating. Children learn by watching, so sharing the same food '
        'at the same table — even briefly — encourages them to try more.'
        '\n\nLet them practise self-feeding with a spoon and fork, pour from a '
        'small jug, and make some choices. Expect mess; it\'s part of learning. '
        'Keep mealtimes calm, screen-free where you can, and roughly to a '
        'routine so hunger and fullness stay predictable.',
  ),
];
