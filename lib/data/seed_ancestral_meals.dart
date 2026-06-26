/// Ancestral / nutrient-dense meal alternatives for the Meals "Ancestral"
/// filter. Inspired by the publicly-stated approach of Kate Pope
/// (@wildnutritionist) — a gut-health-first, ancestral philosophy that leans on
/// meat stock / bone broth, organ meats (liver), egg yolk, slow-cooked meats,
/// healthy fats, and fermented foods, while avoiding processed baby food.
///
/// PRODUCE RULE for this tab:
///  • FRUITS are kept to a low-sugar, keto-friendly set — avocado, olives,
///    tomato, berries (rasp/black/straw/blue in small portions), coconut,
///    star fruit, and lemon/lime.
///  • VEGETABLES are welcome (e.g. broccoli, courgette, leafy greens) EXCEPT
///    starch-based staples (potato, sweet potato, yam) and grains/legumes,
///    which are swapped out.
///
/// IMPORTANT: this is an ALTERNATIVE philosophy. It diverges from the mainstream
/// guidance (NHS / AAP / WHO) the rest of the app follows — those bodies
/// recommend a diverse diet including fruit, veg, and starchy carbohydrates,
/// which babies need for energy and growth. This is presented for information
/// and is NOT medical advice. The content here is original, not copied from any
/// paid course. Standard infant-safety rules still apply: cook meats, egg, and
/// especially liver thoroughly (liver is very high in vitamin A — about once a
/// week at most); use pasteurised dairy; keep olives/salt minimal; no honey
/// before 12 months; introduce one new food at a time; discuss any approach
/// with your paediatrician.
library;

class AncestralMeal {
  final String id;
  final String stage; // "6 mo+", "9 mo+", "12 mo+"
  final String title;
  final String description;

  /// The standard meal (by title) this is offered as an alternative to.
  final String insteadOf;

  /// Food ids that exist in the First Foods database (tappable links).
  final List<String> foodIds;

  /// Ancestral ingredients not in the food DB — shown as plain chips.
  final List<String> ancestralExtras;

  /// Why an ancestral cook might choose this combo.
  final String why;

  const AncestralMeal({
    required this.id,
    required this.stage,
    required this.title,
    required this.description,
    required this.insteadOf,
    this.foodIds = const [],
    this.ancestralExtras = const [],
    required this.why,
  });
}

const List<AncestralMeal> kAncestralMeals = [
  AncestralMeal(
    id: 'a_eggyolk_avocado',
    stage: '6 mo+',
    title: 'Soft egg yolk & avocado with a little broth',
    description:
        'Well-cooked pastured egg yolk mashed with ripe avocado, loosened with '
        'a spoon of warm meat stock instead of milk-soaked oats.',
    insteadOf: 'Creamy oats with avocado',
    foodIds: ['egg', 'avocado'],
    ancestralExtras: ['Pastured egg yolk', 'Bone broth / meat stock'],
    why:
        'Egg yolk brings choline, DHA, and bioavailable iron; broth and avocado '
        'add gelatine and healthy fats — a grain-free, nutrient-dense start.',
  ),
  AncestralMeal(
    id: 'a_liver_pate_egg',
    stage: '6 mo+',
    title: 'Egg yolk with grass-fed liver pâté',
    description:
        'A smear of thoroughly-cooked, smooth grass-fed chicken-liver pâté '
        'alongside soft egg yolk — in place of egg strips on toast.',
    insteadOf: 'Egg strips with toast fingers',
    foodIds: ['egg'],
    ancestralExtras: ['Chicken liver (well-cooked)', 'Pastured egg yolk'],
    why:
        'Liver is exceptionally rich in vitamin A, B12, and iron. Cook it '
        'fully and offer only a tiny amount — because of its very high vitamin '
        'A, most guidance suggests liver no more than about once a week.',
  ),
  AncestralMeal(
    id: 'a_beef_broth_carrot',
    stage: '6 mo+',
    title: 'Slow-cooked beef in stock with soft carrot',
    description:
        'Shredded slow-cooked beef softened in meat stock, with soft-cooked '
        'carrot — a meat-first take that drops the starchy sweet potato and '
        'the lentils.',
    insteadOf: 'Sweet potato & lentil mash',
    foodIds: ['beef', 'carrot'],
    ancestralExtras: ['Meat stock'],
    why:
        'Heme iron from beef is highly absorbable, and meat stock adds '
        'collagen. Carrot keeps a soft vegetable in the bowl while leaving out '
        'the starchy sweet potato and legumes.',
  ),
  AncestralMeal(
    id: 'a_kefir_blueberry',
    stage: '9 mo+',
    title: 'Fermented kefir with a few smashed blueberries',
    description:
        'Cultured full-fat dairy (kefir or well-fermented plain yoghurt) with '
        'a small amount of smashed blueberries — chosen for live cultures over '
        'plain yoghurt.',
    insteadOf: 'Yoghurt with smashed blueberries',
    foodIds: ['yoghurt', 'blueberry'],
    ancestralExtras: ['Kefir / fermented dairy'],
    why:
        'Fermented dairy adds live cultures for the developing gut. Blueberries '
        'are the higher-carb fruit on the keto list (~12g/100g), so keep the '
        'portion small. Use pasteurised dairy for infants.',
  ),
  AncestralMeal(
    id: 'a_chicken_bonebroth',
    stage: '9 mo+',
    title: 'Chicken cooked in bone broth with buttered broccoli',
    description:
        'Chicken slow-cooked in bone broth, served with broccoli tossed in a '
        'little grass-fed butter — richer in fat and gelatine than the plain '
        'version.',
    insteadOf: 'Shredded chicken & broccoli',
    foodIds: ['chicken', 'broccoli'],
    ancestralExtras: ['Bone broth', 'Grass-fed butter'],
    why:
        'Bone broth contributes collagen and minerals, while butter helps a '
        'baby absorb the fat-soluble vitamins in the broccoli — a non-starchy '
        'vegetable that stays.',
  ),
  AncestralMeal(
    id: 'a_salmon_avocado_roe',
    stage: '9 mo+',
    title: 'Wild salmon with avocado (and a little roe)',
    description:
        'Flaked, carefully de-boned wild salmon with mashed avocado — and, for '
        'the adventurous, a tiny amount of well-sourced salmon roe.',
    insteadOf: 'Flaked salmon with peas',
    foodIds: ['salmon', 'avocado'],
    ancestralExtras: ['Salmon roe (optional)'],
    why:
        'Oily fish and roe are among the richest whole-food sources of DHA for '
        'brain development; avocado adds healthy fats in place of starchy peas.',
  ),
  AncestralMeal(
    id: 'a_beef_softveg',
    stage: '12 mo+',
    title: 'Grass-fed beef with soft non-starchy vegetables',
    description:
        'Slow-cooked grass-fed beef with soft non-starchy vegetables (such as '
        'courgette, broccoli, or greens) in stock — a grain- and soy-free '
        'alternative to the tofu rice bowl.',
    insteadOf: 'Tofu & veg rice bowl',
    foodIds: ['beef'],
    ancestralExtras: ['Meat stock', 'Soft non-starchy vegetables'],
    why:
        'Swaps soy and rice for pastured red meat and stock, keeping soft '
        'vegetables but leaving out the grain.',
  ),
  AncestralMeal(
    id: 'a_liver_avocado_plate',
    stage: '12 mo+',
    title: "Liver pâté & avocado 'dip' plate",
    description:
        'Smooth, well-cooked liver pâté and mashed avocado as dips, with soft '
        'non-starchy vegetable batons — an organ-meat plate in place of '
        'chickpea hummus.',
    insteadOf: 'Chickpea hummus plate',
    foodIds: ['avocado'],
    ancestralExtras: [
      'Chicken / beef liver (well-cooked)',
      'Soft non-starchy veg batons',
    ],
    why:
        'Replaces legume-based hummus with organ meat for far greater nutrient '
        'density — vitamin A, B12, iron, and choline. Keep liver to small, '
        'roughly weekly servings given its high vitamin A.',
  ),
];
