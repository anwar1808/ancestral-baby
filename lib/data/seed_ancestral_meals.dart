/// Ancestral / nutrient-dense meal alternatives for the Meals "Ancestral"
/// filter. Inspired by the publicly-stated approach of Kate Pope
/// (@wildnutritionist) — a gut-health-first, ancestral philosophy that leans on
/// meat stock / bone broth, organ meats (liver), egg yolk, slow-cooked meats,
/// healthy fats, and fermented foods, while avoiding processed baby food.
///
/// IMPORTANT: this is an ALTERNATIVE philosophy. It diverges from the mainstream
/// guidance (NHS / AAP / WHO) the rest of the app follows — for example by
/// starting with meats rather than fibrous veg, and using organ meats and
/// fermented dairy early. It is presented for information and is NOT medical
/// advice. The content here is original, not copied from any paid course.
/// Standard infant-safety rules still apply: cook meats, egg, and especially
/// liver thoroughly; no honey before 12 months; introduce one new food at a
/// time and watch for reactions; discuss any approach with your paediatrician.
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

  /// Ancestral ingredients that aren't in the food DB — shown as plain chips.
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
        'Liver is exceptionally rich in vitamin A, B12, and iron. Cook liver '
        'fully and offer a tiny amount at first — it is potent, so a little '
        'goes a long way.',
  ),
  AncestralMeal(
    id: 'a_beef_broth_sweetpotato',
    stage: '6 mo+',
    title: 'Slow-cooked beef in stock with sweet potato',
    description:
        'Shredded slow-cooked beef softened in meat stock, with mashed sweet '
        'potato — a meat-first take on the lentil mash.',
    insteadOf: 'Sweet potato & lentil mash',
    foodIds: ['beef', 'sweet_potato'],
    ancestralExtras: ['Meat stock'],
    why:
        'Heme iron from beef is highly absorbable, and meat stock adds collagen '
        '— an ancestral pairing that starts with animal foods rather than '
        'fibrous legumes.',
  ),
  AncestralMeal(
    id: 'a_kefir_blueberry',
    stage: '9 mo+',
    title: 'Fermented full-fat kefir with smashed blueberries',
    description:
        'Cultured full-fat dairy (kefir or well-fermented plain yoghurt) with '
        'smashed blueberries — chosen for live cultures over plain yoghurt.',
    insteadOf: 'Yoghurt with smashed blueberries',
    foodIds: ['yoghurt', 'blueberry'],
    ancestralExtras: ['Kefir / fermented dairy'],
    why:
        'Fermented dairy adds live cultures that support the developing gut '
        'microbiome — a central idea in the ancestral approach. Use pasteurised '
        'dairy for infants.',
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
        'baby absorb the fat-soluble vitamins in the broccoli.',
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
    title: 'Grass-fed beef with soft cooked vegetables',
    description:
        'Slow-cooked grass-fed beef with soft seasonal vegetables in stock — a '
        'grain- and soy-free alternative to the tofu rice bowl.',
    insteadOf: 'Tofu & veg rice bowl',
    foodIds: ['beef'],
    ancestralExtras: ['Meat stock', 'Seasonal vegetables'],
    why:
        'Swaps soy and grain for pastured red meat and stock, prioritising '
        'animal protein and minerals over plant-based fillers.',
  ),
  AncestralMeal(
    id: 'a_liver_avocado_plate',
    stage: '12 mo+',
    title: "Liver pâté & avocado 'dip' plate",
    description:
        'Smooth, well-cooked liver pâté and mashed avocado as dips, with soft '
        'vegetable batons — an organ-meat plate in place of chickpea hummus.',
    insteadOf: 'Chickpea hummus plate',
    foodIds: ['avocado'],
    ancestralExtras: ['Chicken / beef liver (well-cooked)', 'Soft veg batons'],
    why:
        'Replaces legume-based hummus with organ meat for far greater nutrient '
        'density — vitamin A, B12, iron, and choline in one small plate.',
  ),
];
