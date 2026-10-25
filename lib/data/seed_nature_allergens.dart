import '../models/nature_allergen.dart';

/// Environmental-allergen profiles per region. Data is drawn from official /
/// authoritative bodies (see `sourceBody` and `caveat` on each). Months are
/// TYPICAL windows — real seasons shift year to year with weather — so the UI
/// presents them as typical and points to the live official forecast. This is
/// general information, not medical advice.
///
/// Sources:
///  • UK — Met Office national pollen forecast + Asthma + Lung UK pollen
///    calendar (data: National Pollen and Aerobiology Research Unit, Univ. of
///    Worcester).
///  • US mid-Atlantic — Lo et al. 2019, "Pollen Calendars and Maps of
///    Allergenic Pollen in North America" (AAAAI National Allergy Bureau data).
///  • Singapore — A*STAR (Andiappan et al. 2014), Yin et al. 2025 "Landscape of
///    Aeroallergen Sensitization in Asia", Kidon et al., GUSTO cohort.
const List<NatureProfile> kNatureProfiles = [
  // ---------------------------------------------------------------- UK / EU
  NatureProfile(
    regionName: 'United Kingdom',
    flag: '🇬🇧',
    regionCodes: ['UK', 'EU', 'FR'],
    seasonal: true,
    summary:
        'Hay fever runs in three overlapping waves: tree pollen in spring, '
        'grass pollen from late spring into summer (the one that affects the '
        'most people), and weed pollen through late summer.',
    sourceBody:
        'Met Office · Asthma + Lung UK / National Pollen and Aerobiology '
        'Research Unit',
    caveat:
        'Typical UK windows. If you are in continental Europe or France, treat '
        'this as an approximation — the mix is similar, though ragweed is a '
        'larger late-summer factor in parts of the continent.',
    allergens: [
      // Trees (spring)
      NatureAllergen(name: 'Alder', category: NatureCategory.tree, activeMonths: [1, 2, 3, 4], peakMonths: [2, 3]),
      NatureAllergen(name: 'Hazel', category: NatureCategory.tree, activeMonths: [1, 2, 3, 4], peakMonths: [2, 3]),
      NatureAllergen(name: 'Yew', category: NatureCategory.tree, activeMonths: [1, 2, 3, 4, 5], peakMonths: [2, 3]),
      NatureAllergen(name: 'Elm', category: NatureCategory.tree, activeMonths: [2, 3, 4], peakMonths: [3]),
      NatureAllergen(name: 'Willow', category: NatureCategory.tree, activeMonths: [2, 3, 4, 5], peakMonths: [3, 4]),
      NatureAllergen(name: 'Birch', category: NatureCategory.tree, activeMonths: [3, 4, 5, 6], peakMonths: [4, 5], note: 'The most allergenic UK tree pollen.'),
      NatureAllergen(name: 'Ash', category: NatureCategory.tree, activeMonths: [2, 3, 4, 5], peakMonths: [4]),
      NatureAllergen(name: 'Plane', category: NatureCategory.tree, activeMonths: [3, 4, 5], peakMonths: [4, 5]),
      NatureAllergen(name: 'Oak', category: NatureCategory.tree, activeMonths: [4, 5, 6], peakMonths: [5]),
      NatureAllergen(name: 'Pine', category: NatureCategory.tree, activeMonths: [4, 5, 6, 7], peakMonths: [5, 6]),
      NatureAllergen(name: 'Lime', category: NatureCategory.tree, activeMonths: [6, 7, 8], peakMonths: [7]),
      // Grass
      NatureAllergen(name: 'Grass', category: NatureCategory.grass, activeMonths: [5, 6, 7, 8, 9], peakMonths: [6, 7], note: 'Affects the most hay-fever sufferers; two peaks.'),
      // Weeds
      NatureAllergen(name: 'Oilseed rape', category: NatureCategory.weed, activeMonths: [3, 4, 5, 6, 7], peakMonths: [4, 5]),
      NatureAllergen(name: 'Plantain', category: NatureCategory.weed, activeMonths: [4, 5, 6, 7, 8], peakMonths: [5, 6]),
      NatureAllergen(name: 'Nettle', category: NatureCategory.weed, activeMonths: [5, 6, 7, 8, 9], peakMonths: [6, 7, 8]),
      NatureAllergen(name: 'Dock', category: NatureCategory.weed, activeMonths: [5, 6, 7, 8], peakMonths: [6, 7]),
      NatureAllergen(name: 'Mugwort', category: NatureCategory.weed, activeMonths: [6, 7, 8, 9], peakMonths: [7, 8]),
    ],
    exposureTips: [
      'Check the Met Office pollen forecast; plan outdoor time for lower-count days.',
      'On high-count days keep windows closed, especially early morning and evening.',
      'After being outside, change clothes and wipe your child\'s face and hands.',
      'Dry washing indoors during peak season so pollen doesn\'t settle on it.',
      'A wide-brimmed or wraparound hat helps keep pollen out of little eyes.',
    ],
  ),

  // ---------------------------------------------------- US mid-Atlantic (VA/DC)
  NatureProfile(
    regionName: 'US — Virginia & DC',
    flag: '🇺🇸',
    regionCodes: ['US'],
    seasonal: true,
    summary:
        'A tree-heavy spring (oak the standout), a grass shoulder in early '
        'summer, then a strong ragweed peak in the fall. The DC area is a '
        'notably heavy ragweed location.',
    sourceBody:
        'AAAAI National Allergy Bureau · Lo et al. 2019 pollen calendars',
    caveat:
        'The mid-Atlantic windows are interpolated for the DC/Virginia latitude '
        '(~39°N) rather than read from a printed local calendar, so treat them '
        'as typical and check live counts at the AAAAI National Allergy Bureau.',
    allergens: [
      NatureAllergen(name: 'Cedar / juniper', category: NatureCategory.tree, activeMonths: [1, 2, 3, 4], peakMonths: [2, 3], note: 'Earliest tree; timing is highly variable year to year.'),
      NatureAllergen(name: 'Elm', category: NatureCategory.tree, activeMonths: [2, 3], peakMonths: [3]),
      NatureAllergen(name: 'Maple', category: NatureCategory.tree, activeMonths: [2, 3, 4], peakMonths: [3]),
      NatureAllergen(name: 'Poplar / cottonwood', category: NatureCategory.tree, activeMonths: [3, 4], peakMonths: [3, 4]),
      NatureAllergen(name: 'Ash', category: NatureCategory.tree, activeMonths: [3, 4], peakMonths: [4]),
      NatureAllergen(name: 'Birch', category: NatureCategory.tree, activeMonths: [4], peakMonths: [4], note: 'Short, sharp window; strong allergen.'),
      NatureAllergen(name: 'Oak', category: NatureCategory.tree, activeMonths: [4, 5], peakMonths: [4], note: 'The dominant spring tree pollen.'),
      NatureAllergen(name: 'Mulberry', category: NatureCategory.tree, activeMonths: [4, 5], peakMonths: [4, 5]),
      NatureAllergen(name: 'Pine', category: NatureCategory.tree, activeMonths: [4, 5], peakMonths: [5], note: 'Very visible, but a milder allergen.'),
      NatureAllergen(name: 'Grass', category: NatureCategory.grass, activeMonths: [5, 6, 7], peakMonths: [5, 6]),
      NatureAllergen(name: 'Ragweed', category: NatureCategory.weed, activeMonths: [8, 9, 10], peakMonths: [9], note: 'The principal fall trigger; DC is a heavy ragweed area.'),
    ],
    exposureTips: [
      'Check the AAAAI National Allergy Bureau or a local pollen count before outdoor play.',
      'Ragweed peaks in September — plan for the fall as well as spring.',
      'Keep car and home windows closed on high-count days; use AC on recirculate.',
      'Rinse your child\'s face and hands, and change clothes, after time outside.',
      'Pollen is often highest in the morning — later outings can be gentler.',
    ],
  ),

  // ---------------------------------------------------------------- Singapore
  NatureProfile(
    regionName: 'Singapore',
    flag: '🇸🇬',
    regionCodes: ['SG'],
    seasonal: false,
    summary:
        'Singapore has no real pollen season. Allergies here are driven '
        'year-round by house dust mite — one of the highest sensitisation '
        'rates in the world — with cockroach a distant second and pollen, '
        'mould, and pets minor.',
    sourceBody:
        'A*STAR (Andiappan et al. 2014) · Yin et al. 2025 · GUSTO cohort',
    caveat:
        'Specific mould genera and their rates for Singapore could not be '
        'verified from an open source, so mould is shown only as a minor, '
        'general category.',
    allergens: [
      NatureAllergen(name: 'House dust mite — Blomia tropicalis', category: NatureCategory.mite, yearRound: true, note: 'The dominant local mite; ~96% of allergy-clinic patients react to it.'),
      NatureAllergen(name: 'House dust mite — Dermatophagoides pteronyssinus', category: NatureCategory.mite, yearRound: true, note: '~93% of clinic patients sensitised.'),
      NatureAllergen(name: 'House dust mite — Dermatophagoides farinae', category: NatureCategory.mite, yearRound: true, note: '~92% of clinic patients sensitised.'),
      NatureAllergen(name: 'Cockroach', category: NatureCategory.weed, yearRound: true, note: 'A distant second (~15% of adults) — grouped here as an indoor allergen.'),
      NatureAllergen(name: 'Grass (Bermuda)', category: NatureCategory.grass, yearRound: true, note: 'Minor — around 7% of adults.'),
      NatureAllergen(name: 'Mould', category: NatureCategory.mould, yearRound: true, note: 'Minor overall (<3%); thrives in the humid climate.'),
    ],
    exposureTips: [
      'Dust mite is the priority: wash bedding weekly at 60°C or above.',
      'Use dust-mite-proof covers on your child\'s mattress and pillows.',
      'Keep indoor humidity down (air-conditioning / dehumidifier) — mites and mould love damp.',
      'Reduce soft toys and heavy fabrics in the sleeping area, and wash the ones you keep hot.',
      'Address any visible mould promptly and ventilate damp rooms.',
    ],
  ),
];

/// Common allergic-rhinitis symptoms a parent might log for a toddler.
const List<String> kEnvSymptoms = [
  'Runny nose',
  'Blocked nose',
  'Sneezing',
  'Itchy / watery eyes',
  'Itchy nose or throat',
  'Cough',
  'Wheeze / chesty',
];
