/// Age-grouped meal ideas (§5 Meals). Each links to its component food ids so
/// the user can open the relevant cut-and-serve guidance. Original copy.
class MealIdea {
  final String id;
  final String stage; // "6 mo+", "9 mo+", "12 mo+"
  final String title;
  final String description;
  final List<String> foodIds;
  const MealIdea({
    required this.id,
    required this.stage,
    required this.title,
    required this.description,
    required this.foodIds,
  });
}

const List<MealIdea> kSeedMeals = [
  MealIdea(
    id: 'avo_oats',
    stage: '6 mo+',
    title: 'Creamy oats with avocado',
    description:
        'Soft porridge oats loosened with milk, served with ripe avocado '
        'spears on the side. Iron from the oats, healthy fats from the avocado.',
    foodIds: ['oats', 'avocado'],
  ),
  MealIdea(
    id: 'egg_toast',
    stage: '6 mo+',
    title: 'Egg strips with toast fingers',
    description:
        'Well-cooked egg cut into strips with lightly toasted bread fingers. A '
        'gentle way to introduce two common allergens — offer one at a time.',
    foodIds: ['egg', 'bread'],
  ),
  MealIdea(
    id: 'sweetpotato_lentil',
    stage: '6 mo+',
    title: 'Sweet potato & lentil mash',
    description:
        'Steamed sweet potato mashed with soft-cooked red lentils. Smooth, '
        'iron-rich, and easy to scoop or pre-load onto a spoon.',
    foodIds: ['sweet_potato', 'lentil'],
  ),
  MealIdea(
    id: 'yoghurt_blueberry',
    stage: '9 mo+',
    title: 'Yoghurt with smashed blueberries',
    description:
        'Full-fat plain yoghurt with blueberries quartered or smashed to '
        'reduce choking risk. A quick calcium-rich breakfast.',
    foodIds: ['yoghurt', 'blueberry'],
  ),
  MealIdea(
    id: 'chicken_broccoli',
    stage: '9 mo+',
    title: 'Shredded chicken & broccoli',
    description:
        'Moist shredded chicken with soft-cooked broccoli florets used as '
        'little brushes. Good practice for the pincer grasp.',
    foodIds: ['chicken', 'broccoli'],
  ),
  MealIdea(
    id: 'salmon_peas',
    stage: '9 mo+',
    title: 'Flaked salmon with peas',
    description:
        'Carefully de-boned, flaked salmon mixed with lightly smashed peas. '
        'Introduces fish, an omega-3 source, in a soft form.',
    foodIds: ['salmon', 'green_pea'],
  ),
  MealIdea(
    id: 'tofu_rice',
    stage: '12 mo+',
    title: 'Tofu & veg rice bowl',
    description:
        'Soft tofu cubes with rice and finely chopped vegetables. A plant-based '
        'protein meal that introduces soy.',
    foodIds: ['tofu', 'rice'],
  ),
  MealIdea(
    id: 'hummus_plate',
    stage: '12 mo+',
    title: 'Chickpea hummus plate',
    description:
        'Smooth chickpea and tahini hummus with soft veg batons and bread for '
        'dipping. Introduces sesame alongside fibre-rich chickpeas.',
    foodIds: ['chickpea', 'tahini', 'bread'],
  ),
];
