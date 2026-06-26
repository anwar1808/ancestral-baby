/// Original how-to content for the Guides tab (§5). Written in our own words
/// from public-health sources; general information, not medical advice.
class Guide {
  final String id;
  final String section; // Getting Ready / Safety / Feeding
  final String title;
  final int readMinutes;
  final String body;
  const Guide({
    required this.id,
    required this.section,
    required this.title,
    required this.readMinutes,
    required this.body,
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
        'both. Skip added salt and sugar, and hold honey until 12 months.',
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
];
