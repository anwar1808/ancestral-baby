# Ancestral Baby — Content Canon v1 (draft for Annie's sign-off)

**Status:** IMPLEMENTED in v1.3.0 (25 Oct 2026). Annie answered §6 the same day: **A** delay grains, starches, and legumes to 24 months; **B** add all five canon foods to the catalogue; **C** onboarding "Our approach" page plus a "why this first" line on First Foods cards; **D** name Kate Pope's approach as the inspiration, cite the safety-floor bodies, no titles until verified. §8 records what shipped.
**Rule this document implements:** *mechanics from Solid Starts, judgement from the ancestral canon.* Judgement covers defaults, order, and recommendations, not only recipes.
**Companion:** `~/Annie-Claude/solid-starts-teardown/gap_analysis_ancestral_baby_v1.md` §3–4.

---

## 1. Two layers, and which wins

| Layer | What it governs | Source of authority | Can the other layer override it? |
|---|---|---|---|
| **Safety floor** | What is unsafe at a given age: choking shapes, honey, added salt and sugar, unpasteurised dairy, undercooked egg and meat, whole nuts, allergen introduction method and timing, liver frequency | NHS Start for Life weaning guidance; SACN *Feeding in the First Year of Life* (2018); BSACI / BDA early-allergen guidance; AAP; WHO complementary feeding; LEAP (2015) and EAT (2016) trials | **No.** The ancestral layer never goes below the floor. |
| **Ancestral layer** | Which foods we put first, what we recommend next, how we suggest serving, every recipe | The canon in §2, as confirmed by Annie | Yes, within the floor. |

The disclaimers already in the app stay as they are. The ancestral layer is presented as the app's point of view, with the mainstream position named alongside it where they differ, as the existing guide already does.

## 2. The canon (what "ancestral" means in this app)

Drawn from the app's own guide `ancestral_first_foods_order` and the header of `seed_ancestral_meals.dart`, both written in June. These are the principles already in the product:

1. **Animal foods first.** Meat stock, slow-cooked gelatinous meats, egg yolk before white, oily fish, and small weekly servings of liver lead the first weeks.
2. **Fat is a feature.** Butter, ghee, animal fats, avocado, and full-fat fermented dairy once tolerated. No seed oils in recipes.
3. **Fermented foods early and small.** A few drops of fermented vegetable brine in stock, then kefir and yoghurt.
4. **Whole food, nothing processed.** No pouches, no fortified cereals as a staple, no added sugar in any form.
5. **Produce is real but secondary.** Soft non-starchy vegetables are welcome. Fruit is kept low-sugar and small: avocado, berries, tomato, coconut, olives.
6. **Starches, grains, and legumes are the open question.** The June meal file swaps them out entirely. The June guide only delays them. See §6, decision A.

**Named sources to confirm (VERIFY before citing in-app):**
- Kate Pope, @wildnutritionist. Annie's stated reference; the June content already names her. I have not verified any specific publication of hers, so the app should cite her approach, not a title, until Annie confirms one.
- The "meat stock first, then fermented brine, then soft vegetables, then organ meats, then yolk" sequence is characteristic of the GAPS introduction diet (Natasha Campbell-McBride). I am fairly confident of that lineage but it should be checked before we say so anywhere user-facing.
- Weston A. Price Foundation materials and *Nourishing Traditions* (Sally Fallon Morell) are the usual background for this school. Whether the app names them is Annie's call; they carry positions (raw dairy in particular) that the safety floor excludes.

## 3. First Foods stage, recomposed

**Today (mainstream list):** avocado, banana, sweet potato, broccoli, carrot, butternut squash, pear.

**Proposed ancestral First Foods (all already in the 100-food catalogue, all 6 mo+):**

| Order | Food | Why it leads | Safety-floor note |
|---|---|---|---|
| 1 | Beef (slow-cooked, in its stock) | Meat stock is the canon's first food; beef carries haem iron and zinc | Cook until it shreds; serve as a strip or a spoon of stock |
| 2 | Egg (yolk first) | Choline, DHA, iron; yolk-before-white is canon | Hard-cooked; egg is a top allergen, so it also starts the Allergen Programme |
| 3 | Avocado | Fat, soft texture, no cooking | None |
| 4 | Lamb | Second gelatinous slow-cook meat | As beef |
| 5 | Salmon | Oily fish, DHA, vitamin D | Fish is a top allergen; bones removed; cooked through |
| 6 | Liver | Iron, vitamin A, B12 | **At most about once a week** and small, because of vitamin A. The app must enforce the cadence in copy and in the plan |
| 7 | Courgette | First soft non-starchy vegetable | Cooked soft |
| 8 | Broccoli | Florets as a handle | Cooked soft |
| 9 | Butter | First fat on its own | Pasteurised; dairy allergen |
| 10 | Kefir or yoghurt | First fermented dairy | Pasteurised, full-fat, unsweetened; dairy allergen |

**Not in the catalogue yet but central to the canon:** meat stock / bone broth, ghee, bone marrow, fermented vegetable brine, fish roe. Decision B in §6 asks whether to add them as catalogue foods (each needs a photo, serving bands by age, and a safety note) or keep them as recipe ingredients only.

## 4. "Recommended next" rules (the Compass mechanic on our judgement)

When the home card or a stage suggests the next food, apply in order:

1. Nothing below the safety floor for the baby's corrected age.
2. If an allergen series is active, the next food is that series' food.
3. Otherwise prefer, in order: an untried animal food, an untried fat or fermented dairy, an untried non-starchy vegetable, an untried low-sugar fruit, then everything else.
4. Liver only when seven or more days have passed since the last liver log.
5. Starches, grains, and legumes rank last by default (decision A may change this).
6. Within a tier, prefer foods the parent marked Try Later, then foods with iron-rich or healthy-fats flags.

The current engine ranks by catalogue order within a skill. Implementing the rules above is a small change in `AppState`, not a new system.

## 5. Recipe plan (to carry a weekly meal plan later)

Target: 48 recipes, 16 per stage, each with catalogue `foodIds` plus `ancestralExtras`, ancestral flag on, no seed oils, no sugar, no honey, no raw dairy, liver limited to one recipe per stage. Existing 13 recipes and 9 ancestral ideas are folded in where they fit.

| Stage | Breakfast | Lunch / dinner | Snack / side | Stock and ferment bases |
|---|---|---|---|---|
| 6 mo+ | Soft yolk with avocado · Yolk in warm stock · Kefir with smashed blueberries · Butter-soft courgette ribbons | Beef in its stock · Lamb shoulder strips · Salmon with avocado · Chicken thigh in stock with broccoli · Liver pâté on a spoon (weekly) · Sardine mash | Avocado wedge · Buttered broccoli floret · Soft cucumber spear · Ripe tomato (skinned) | Short-cooked meat stock · Stock with a few drops of brine |
| 9 mo+ | Yolk and white scramble in butter · Kefir with raspberries · Egg and courgette fritter (no flour) · Ricotta with blackberries | Beef and courgette stew · Lamb and cauliflower mash · Mackerel with soft tomato · Duck leg shreds · Chicken liver and heart (weekly) · Cod in butter with green beans · Pork shoulder pieces · Meatballs (beef, no breadcrumbs) | Cheese cubes · Olive (pitted, quartered, rinsed) · Coconut yoghurt · Soft peach | Bone broth · Sauerkraut juice stir-in |
| 12 mo+ | Omelette with cheese · Kefir and strawberry · Yolk-rich custard (no sugar) · Butter-fried mushroom and egg | Slow lamb with aubergine · Beef and bone-marrow stew · Salmon cakes (no flour) · Turkey thigh with kale · Liver and onion (weekly) · Whole-milk fish pie topped with cauliflower · Chicken in coconut stock · Shrimp in butter with courgette | Hard cheese stick · Avocado and cottage cheese · Berries and cream · Dates (quartered) | Marrow broth · Fermented vegetable spoonful |

Decision A determines whether a parallel set of starch and grain recipes exists at all.

## 6. Decisions needed from Annie

**A. Starches, grains, legumes.** Three options:
- *Exclude* (June meal file). Then the Scoop & Mash skill (oats, lentils, beans, chickpeas, peas) and Chewing skill (pasta, rice, quinoa) must be recomposed around meats, vegetables, and dairy, and about 20 catalogue foods will never be recommended, only browsable.
- *Delay* (June guide). Grains and legumes enter at 9 or 12 months, after animal foods and fats are established. Skills keep their names, food lists shift later.
- *Neutral*. Keep mainstream lists, make ancestral a recipe-only angle. This is what we have, and it is why the identity reads as a label.
My recommendation is **Delay**: it is defensible against the safety floor, it keeps the whole catalogue in play, and it is visibly different from Solid Starts.

**B. Add canon foods to the catalogue?** Meat stock, ghee, bone marrow, fermented brine, fish roe. Recommendation: add meat stock and ghee now (both easy to photograph and serve), hold the rest.

**C. How loud is the point of view?** Options: a single "Ancestral" badge on recommended foods and recipes; or a "Why this first" line on every First Foods card; or a short "Our approach" screen in onboarding with the mainstream alternative named. Recommendation: the onboarding screen plus the "Why this first" line. One sentence each, with the disclaimer already in place.

**D. Which named sources go in the app?** See §2. Recommendation: name Kate Pope's approach as the inspiration, as the June guide already does, and cite the safety-floor bodies for every safety claim. Nothing else until verified.

## 7. What happens once A–D are answered

1. Recompose `seed_skills.dart` First Foods per §3, and the other skills per decision A.
2. Implement the §4 ranking in `AppState` for Plan and home suggestions.
3. Author the 48 recipes into `seed_recipes.dart` (same `Recipe` model, `ancestral: true`), retire the separate `AncestralMeal` list by folding its nine ideas in.
4. Add meat stock and ghee to the catalogue if B says yes.
5. Only then switch on the meal-plan mechanic from the gap analysis.

## 8. What shipped in v1.3.0 (25 Oct 2026)

| Canon item | Where it lives |
|---|---|
| Decision A: 22 grain, starch, and legume foods carry `ancestralFromMonths: 24`; food cards show "Our approach: from 24 months" beside the mainstream age; recipes using them are staged 24 mo+ | `lib/models/food.dart`, `lib/data/seed_foods.dart`, `lib/data/seed_recipes.dart` |
| Decision B: meat stock, ghee, bone marrow, fish roe (9 mo+), fermented vegetable brine added with serving bands, safety notes, and CC-licensed heroes (credits in `assets/foods/PHOTO_CREDITS.json`) | `lib/data/seed_foods.dart`, `assets/foods/` |
| Decision C: onboarding ends with "Our approach" (three cards, mainstream named); ten First Foods carry a `whyFirst` line shown on the stage list, the food card, and the home "Next up" card | `lib/screens/onboarding_screen.dart`, `skill_detail_screen.dart`, `food_detail_screen.dart`, `home_screen.dart` |
| Decision D: Kate Pope named as inspiration on the onboarding page and in the existing guide; safety bodies cited per food | as above, `lib/data/seed_guides.dart` |
| §3 First Foods recomposed (12 foods: meat stock, beef, egg, avocado, lamb, salmon, liver, courgette, broccoli, butter, kefir, brine); seven stages with `fromMonths` gating (Big Flavors and Chewing from 9, Grains, Starches & Legumes from 24); plan progress counts open stages only | `lib/data/seed_skills.dart`, `lib/state/app_state.dart` |
| §4 ranking as `AppState.recommendedNext`: allergen series food first, then the current stage in order, then canon tiers (animal, fat or fermented, non-starchy veg, low-sugar fruit, rest, delayed last); Try Later and iron or fat flags break ties; liver only when seven or more days since the last liver log; known allergies and noted reactions excluded | `lib/state/app_state.dart`, tests in `test/recommendation_test.dart` |
| §5 recipe plan: 48 ancestral recipes (16 per stage: 4 breakfast, 8 main, 3 snack, 1 stock or ferment base), one liver recipe per stage, no seed oils, sugar, honey, raw dairy, grains, starches, or legumes | `lib/data/seed_recipes_ancestral.dart` |
| Meal-plan mechanic: Meals tab "This week" generates a seven-day, four-slot plan from the stage's ancestral pool, tilted towards recommended-next foods, liver at most once a week, with swap per slot and a cooked tick that logs the meal and marks its foods tried; stored per ISO week (schema v4, table `meal_plan`) | `lib/screens/week_plan_view.dart`, `lib/data/db.dart`, `lib/models/meal_plan.dart` |

**Deviations from §5 the recipe author made, all driven by the safety floor:** soft peach and dates dropped (not low-sugar); olives only at 12 mo+ (quartered, rinsed); no home-fermenting recipe (needs added salt), so each stage's base is a stock with brine as a few-drops stir-in; cucumber unused (raw); fish roe is warmed in butter until cooked through rather than served raw.

**Still open:** Kate Pope publication unverified (approach named, no title); the June `AncestralMeal` ideas remain under Meals → Ideas → Ancestral alongside the new library rather than being deleted; per-food video has no supply.
