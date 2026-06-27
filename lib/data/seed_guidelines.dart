/// Regional dietary-guideline comparison content (feature: compare SG vs UK vs
/// US etc.). Topic-first: each topic carries one guidance string per region,
/// plus where they broadly agree.
///
/// IMPORTANT: guidelines change and bodies word things differently. This is a
/// plain-language summary for orientation, NOT a verbatim quotation of any
/// guideline and NOT medical advice. Every topic should be verified against the
/// current primary source before relying on specifics.
library;

class RegionInfo {
  final String code;
  final String name;
  final String flag;
  final String bodies;
  final String group; // Global / Europe / Americas / Asia-Pacific
  const RegionInfo(this.code, this.name, this.flag, this.bodies,
      {this.group = 'Other'});
}

/// Order here is the default display order (user's region gets pinned first).
/// Regions are grouped (Global / Europe / Americas / Asia-Pacific) in the UI.
const List<RegionInfo> kRegions = [
  RegionInfo('WHO', 'World Health Organization', '🌍', 'WHO · Codex',
      group: 'Global'),
  RegionInfo('UK', 'United Kingdom', '🇬🇧', 'NHS Start4Life · SACN',
      group: 'Europe'),
  RegionInfo('EU', 'Europe', '🇪🇺', 'EFSA · ESPGHAN', group: 'Europe'),
  RegionInfo('SE', 'Sweden', '🇸🇪', 'Livsmedelsverket', group: 'Europe'),
  RegionInfo('IS', 'Iceland', '🇮🇸', 'Directorate of Health', group: 'Europe'),
  RegionInfo('US', 'United States', '🇺🇸', 'AAP · NIAID · USDA',
      group: 'Americas'),
  RegionInfo('SG', 'Singapore', '🇸🇬', 'HPB · MOH', group: 'Asia-Pacific'),
  RegionInfo('JP', 'Japan', '🇯🇵', 'MHLW', group: 'Asia-Pacific'),
  RegionInfo('MN', 'Mongolia', '🇲🇳', 'Ministry of Health', group: 'Asia-Pacific'),
  RegionInfo('AU', 'Australia', '🇦🇺', 'NHMRC · ASCIA', group: 'Asia-Pacific'),
];

/// Group display order.
const List<String> kRegionGroups = ['Global', 'Europe', 'Americas', 'Asia-Pacific'];

RegionInfo regionByCode(String code) =>
    kRegions.firstWhere((r) => r.code == code, orElse: () => kRegions.first);

class GuidelineTopic {
  final String id;
  final String title;
  final String question;
  final String consensus;
  final Map<String, String> byRegion;
  final List<String> sources;
  const GuidelineTopic({
    required this.id,
    required this.title,
    required this.question,
    required this.consensus,
    required this.byRegion,
    this.sources = const [],
  });
}

const List<GuidelineTopic> kGuidelineTopics = [
  GuidelineTopic(
    id: 'when_to_start',
    title: 'When to start solids',
    question: 'At what age should I begin complementary foods?',
    consensus:
        'Broad agreement: aim for around 6 months, and not before 4 months. '
        'Readiness signs matter alongside age.',
    byRegion: {
      'WHO':
          'Recommends exclusive breastfeeding for the first 6 months, then '
          'introducing complementary foods at 6 months while continuing '
          'breastfeeding.',
      'UK':
          'NHS advises starting at around 6 months, when babies show the '
          'readiness signs — and not before 4 months.',
      'US':
          'AAP supports introducing solids around 6 months; some babies may be '
          'developmentally ready between 4 and 6 months.',
      'EU':
          'ESPGHAN/EFSA guidance allows introduction from no earlier than 4 '
          'months and by around 6 months, with some flexibility in the 4–6 '
          'month window.',
      'SG':
          'HPB recommends starting at around 6 months, and not before 4 '
          'months.',
      'SE':
          'Livsmedelsverket allows small tastes from 4 months, with proper '
          'complementary feeding from around 6 months, alongside continued '
          'breastfeeding.',
      'IS':
          'Iceland advises around 6 months (with breastfeeding to about 6 '
          'months), in line with Nordic guidance; small tastes from 4 months '
          'are sometimes allowed.',
      'JP':
          'Weaning (rinyushoku) usually begins around 5–6 months, progressing '
          'through staged textures as the baby develops.',
      'MN':
          'Broadly follows WHO: exclusive breastfeeding for about 6 months, '
          'then complementary foods from 6 months. Confirm current national '
          'guidance.',
      'AU':
          'NHMRC advises around 6 months, and not before 4 months, while '
          'continuing breastfeeding.',
    },
    sources: ['WHO complementary feeding', 'NHS Start4Life', 'AAP', 'ESPGHAN', 'HPB 2023'],
  ),
  GuidelineTopic(
    id: 'allergen_list',
    title: 'Which allergens are regulated',
    question: 'How many "major" allergens does each region recognise?',
    consensus:
        'The same priority foods drive infant allergy guidance everywhere '
        '(milk, egg, peanut, tree nuts, soy, wheat, sesame, fish, shellfish). '
        'Food-labelling law differs in how many it lists.',
    byRegion: {
      'WHO':
          'Codex Alimentarius lists a priority set of around 8–9 allergens '
          'used as a global reference for labelling.',
      'UK':
          'Law requires 14 allergens to be declared on food (the core set plus '
          'celery, mustard, lupin, molluscs, sulphites, and gluten-containing '
          'cereals broken out).',
      'US':
          'Recognises 9 major food allergens for labelling — sesame was added '
          'as the 9th in January 2023 under the FASTER Act.',
      'EU':
          'Same 14 regulated allergens as the UK (EU FIC Regulation 1169/2011).',
      'SG':
          'Labelling commonly covers a similar priority set; check the current '
          'SFA/HPB list for specifics.',
      'SE':
          'As an EU member, Sweden follows EU food law — 14 declarable '
          'allergens.',
      'IS':
          'As an EEA country, Iceland aligns with the EU\'s 14 declarable '
          'allergens.',
      'JP':
          'Japan mandates labelling of a core set (including egg, milk, wheat, '
          'peanut, shrimp, and crab) plus buckwheat — a notable local addition '
          '— with a further recommended list.',
      'MN':
          'Labelling requirements vary; guidance references the common priority '
          'allergens. Check current national rules.',
      'AU':
          'Australia and New Zealand require declaration of a set of allergens '
          '(including peanut, tree nuts, milk, egg, sesame, fish, shellfish, '
          'soy, wheat, and lupin); ASCIA leads clinical advice.',
    },
    sources: ['FASTER Act 2021', 'EU FIC 1169/2011', 'UK FIC', 'Codex', 'FSANZ'],
  ),
  GuidelineTopic(
    id: 'peanut',
    title: 'Introducing peanut',
    question: 'When and how should peanut be introduced?',
    consensus:
        'Early introduction (from around 6 months, not delayed) is now '
        'encouraged everywhere. The US gives the most explicit risk-tiered '
        'timing; higher-risk babies may start earlier after medical advice.',
    byRegion: {
      'WHO':
          'Supports timely introduction of complementary foods including common '
          'allergens; defers specifics to national bodies.',
      'UK':
          'SACN/NHS: introduce peanut (as smooth butter or ground, never whole) '
          'from around 6 months alongside other foods. For babies with severe '
          'eczema or known egg allergy, seek medical advice first; no blanket '
          'pre-testing.',
      'US':
          'NIAID 2017 addendum is risk-tiered: severe eczema and/or egg allergy '
          '→ introduce around 4–6 months, ideally after evaluation; moderate '
          'risk → around 6 months; low risk → around 6 months with other '
          'solids.',
      'EU':
          'Allergy societies support introducing peanut from around 4–6 months, '
          'particularly for higher-risk infants, in line with the LEAP '
          'evidence.',
      'SG':
          'Encourages introducing peanut once solids have begun rather than '
          'delaying; higher-risk babies should be discussed with a doctor.',
      'SE':
          'Encourages introducing peanut (smooth or ground, never whole) from '
          'around 4–6 months alongside other foods, in line with Nordic and EU '
          'advice.',
      'IS':
          'Supports early, non-delayed introduction of peanut, aligned with '
          'Nordic/EU guidance; discuss higher-risk infants with a clinician.',
      'JP':
          'Introduce peanut (smooth, never whole) once weaning is under way, '
          'with careful, graded amounts.',
      'MN':
          'Follows the general early-introduction principle; defers specifics '
          'to clinicians.',
      'AU':
          'ASCIA strongly recommends introducing peanut in the first year (by '
          '12 months), including for higher-risk babies, and keeping it in the '
          'diet regularly.',
    },
    sources: ['NIAID 2017', 'LEAP trial (NEJM)', 'SACN 2018', 'HPB 2023', 'ASCIA'],
  ),
  GuidelineTopic(
    id: 'egg',
    title: 'Introducing egg',
    question: 'When can I give egg, and how cooked?',
    consensus:
        'Introduce well-cooked egg from around 6 months. Higher-risk babies '
        'may start earlier with medical advice. Avoid raw/runny egg in infancy.',
    byRegion: {
      'WHO': 'Egg is a valued early protein and iron source; timing per '
          'national guidance.',
      'UK':
          'Eggs (including white and yolk, well cooked) can be given from around '
          '6 months. Lion-marked eggs may be given less cooked to older '
          'children, but for infants, cook well.',
      'US':
          'Well-cooked egg is encouraged as an early common-allergen food from '
          'around 6 months; earlier for higher-risk infants per NIAID-style '
          'advice.',
      'EU':
          'Cooked egg from around 6 months; early rather than delayed '
          'introduction is supported.',
      'SG':
          'Well-cooked egg can be introduced from around 6 months as part of '
          'early allergen exposure.',
      'SE':
          'Well-cooked egg from around 4–6 months; early introduction is '
          'encouraged.',
      'IS':
          'Cooked egg from around 6 months, with early rather than delayed '
          'introduction.',
      'JP':
          'Egg is introduced carefully in stages — typically well-cooked yolk '
          'first, then white — from around 5–6 months.',
      'MN':
          'Well-cooked egg as an early protein and iron source, timed per '
          'WHO-aligned national guidance.',
      'AU':
          'ASCIA recommends introducing well-cooked egg in the first year '
          '(around 6 months) and keeping it in the diet.',
    },
    sources: ['SACN 2018', 'AAP', 'EAT trial (NEJM)', 'ASCIA'],
  ),
  GuidelineTopic(
    id: 'honey',
    title: 'Honey',
    question: 'When is honey safe?',
    consensus:
        'Universal: no honey before 12 months, because of the risk of infant '
        'botulism. This is one of the most consistent rules across regions.',
    byRegion: {
      'WHO': 'Honey is not advised for infants under 12 months.',
      'UK': 'NHS: do not give honey until your baby is 1 year old.',
      'US': 'AAP/CDC: avoid honey before 12 months (infant botulism risk).',
      'EU': 'Not recommended before 12 months.',
      'SG': 'HPB: avoid honey before 12 months.',
      'SE': 'No honey before 12 months.',
      'IS': 'No honey before 12 months.',
      'JP': 'No honey before 12 months — infant botulism is a well-recognised risk.',
      'MN': 'No honey before 12 months.',
      'AU': 'No honey before 12 months (infant botulism risk).',
    },
    sources: ['NHS', 'AAP', 'CDC'],
  ),
  GuidelineTopic(
    id: 'cows_milk',
    title: "Cow's milk",
    question: 'When can cow\'s milk be a drink vs a food?',
    consensus:
        'Aligned: cow\'s milk as a main drink not before 12 months, but small '
        'amounts in cooking and dairy foods (yoghurt, cheese) are fine from '
        'around 6 months.',
    byRegion: {
      'WHO': 'Breast milk or formula remains the main milk in the first year.',
      'UK':
          'NHS: cow\'s milk should not be the main drink before 12 months, but '
          'can be used in cooking and as full-fat dairy foods from around 6 '
          'months.',
      'US':
          'AAP: avoid cow\'s milk as a main beverage before 12 months; yoghurt '
          'and cheese are fine earlier.',
      'EU': 'Cow\'s milk as a drink from 12 months; dairy foods earlier.',
      'SG':
          'HPB: full cream cow\'s milk as a main drink from 12 months; dairy '
          'foods earlier.',
      'SE':
          'Cow\'s milk not as a main drink before 12 months; small amounts in '
          'food and dairy foods are fine earlier.',
      'IS': 'Cow\'s milk as a main drink from 12 months; dairy foods earlier.',
      'JP':
          'Cow\'s milk as a main drink from around 12 months; breast milk or '
          'formula in the first year.',
      'MN':
          'Breast milk or formula as the main milk in the first year; cow\'s '
          'milk as a drink from 12 months.',
      'AU':
          'Cow\'s milk can be used in foods from around 6 months but not as a '
          'main drink before 12 months; full-fat for under-2s.',
    },
    sources: ['NHS', 'AAP'],
  ),
  GuidelineTopic(
    id: 'vitamin_d',
    title: 'Vitamin D',
    question: 'Does my baby need a vitamin D supplement?',
    consensus:
        'Commonly recommended for breastfed infants, but exact amounts and who '
        'needs it differ by region — check local advice.',
    byRegion: {
      'WHO':
          'Recommends vitamin D where deficiency risk is high; specifics set '
          'nationally.',
      'UK':
          'NHS: breastfed babies should be given a daily 8.5–10 µg vitamin D '
          'supplement; formula-fed babies taking 500 ml+ a day usually don\'t '
          'need one.',
      'US':
          'AAP: 400 IU (10 µg) vitamin D daily from birth for breastfed and '
          'partially breastfed infants.',
      'EU':
          'Most European countries recommend routine infant vitamin D; the '
          'amount varies by country.',
      'SG':
          'HPB provides vitamin D guidance; confirm current recommendation for '
          'your baby with a doctor.',
      'SE':
          'Sweden recommends daily vitamin D drops for infants and young '
          'children, often continued into early childhood given limited winter '
          'sun.',
      'IS':
          'Iceland recommends vitamin D supplementation for infants (D-drops), '
          'reflecting low sunlight at high latitude.',
      'JP':
          'Vitamin D adequacy is a recognised concern; supplementation may be '
          'advised in some cases — check current guidance.',
      'MN':
          'Vitamin D deficiency is common given long winters and limited sun, '
          'so supplementation for infants and children is widely recommended.',
      'AU':
          'Most infants get enough from sunlight, but supplements are advised '
          'for at-risk babies (limited sun, darker skin, or covered).',
    },
    sources: ['NHS', 'AAP 2008/updates'],
  ),
  GuidelineTopic(
    id: 'salt_sugar',
    title: 'Salt & sugar',
    question: 'How much salt and sugar is OK?',
    consensus:
        'Aligned in spirit: keep salt very low and avoid added/free sugars in '
        'infancy.',
    byRegion: {
      'WHO': 'Advises avoiding added sugar and salt in foods for infants and '
          'young children.',
      'UK':
          'NHS: babies under 1 should have less than 1 g salt a day; avoid '
          'added sugar.',
      'US':
          'Dietary Guidelines 2020–2025: avoid added sugars for children under '
          '2, and limit sodium.',
      'EU': 'Avoid added salt and sugar in the first year.',
      'SG': 'HPB: avoid adding salt and sugar to baby\'s food.',
      'SE': 'Avoid added salt and sugar in infancy.',
      'IS': 'Avoid added salt and sugar in the first year.',
      'JP': 'Keep seasoning very light for babies; avoid added salt and sugar.',
      'MN': 'Avoid adding salt and sugar to infant foods.',
      'AU': 'Avoid added salt and sugar for infants and toddlers.',
    },
    sources: ['US Dietary Guidelines 2020–2025', 'NHS', 'WHO'],
  ),
  GuidelineTopic(
    id: 'iron',
    title: 'Iron',
    question: 'Why the focus on iron-rich first foods?',
    consensus:
        'Aligned: iron stores fall from around 6 months, so iron-rich foods '
        '(meat, egg, lentils, iron-fortified cereals) are encouraged early.',
    byRegion: {
      'WHO': 'Emphasises iron-rich or iron-fortified complementary foods.',
      'UK': 'SACN highlights iron-rich foods from the start of weaning.',
      'US': 'AAP/USDA emphasise iron- and zinc-rich first foods from ~6 months.',
      'EU': 'ESPGHAN stresses iron-rich complementary foods.',
      'SG': 'HPB recommends iron-rich first foods such as meat and fortified '
          'cereal.',
      'SE': 'Emphasises iron-rich complementary foods from the start of weaning.',
      'IS': 'Encourages iron-rich first foods, in line with Nordic guidance.',
      'JP':
          'Iron-rich foods (such as red meat, fish, egg yolk, and fortified '
          'foods) are encouraged as weaning progresses.',
      'MN':
          'Iron-rich complementary foods are encouraged, important given the '
          'prevalence of infant anaemia.',
      'AU':
          'Iron-rich first foods (iron-fortified cereal, meat, and '
          'alternatives) are recommended from around 6 months, as iron needs '
          'are high.',
    },
    sources: ['SACN 2018', 'AAP', 'ESPGHAN'],
  ),
];
