# Cohesiveness check v2: before the "grow with the baby" build

**Date:** 25 Oct 2026. **Scope:** the v1.3.0 app as shipped, plus the build Annie approved after teardown v3 (13 readiness stages, per-stage food picker feeding the planner, serving ladders past 12 months, 18-month recipes, already-tried intake, toddler guides). Each item states the contradiction and the call taken. Calls marked **[Annie to confirm]** were open questions from check v1; Annie said "do it", so the recommended option was taken and can be reversed.

## A. Carried over from check v1

| # | Contradiction | Call |
|---|---|---|
| 1 | Allergen Programme introduces wheat and soy from six months, but grains and legumes "wait until two". In the code, bread and tofu were already exempt from the delay, but nothing told the parent why, and the wheat series also pointed at pasta, which is delayed. | **[Annie to confirm]** Explicit allergen-exposure exception: small, regular amounts of bread (wheat) and tofu (soy) from six months to build tolerance, not as staples. Written into the canon (§2), on both food cards ("Our approach" note), and the wheat series now points at bread only. |
| 2 | Planner gives a six-month-old four meals a day. | Meals per day by age: one meal at six months, two at seven to eight, three at nine to eleven, three plus a snack from twelve. Matches NHS Best Start in Life (checked 25 Oct 2026): once a day to start, moving towards three meals at seven to nine months, three meals and no snacks at ten to twelve, three meals and up to two snacks from one. Two at seven to eight is our step within "gradually". |
| 3 | Two first-foods orders: the Ancestral guide put soft vegetables and organ meats before egg, and egg yolk weeks before white; the First Foods stage puts egg third. | **[Annie to confirm]** Stage order wins, guide rewritten to match: stock and soft meat, then a few drops of brine, then well-cooked whole egg early (allergy guidance from BSACI and NHS favours early, regular egg; delaying the white is not advised), fats, liver weekly, soft vegetables alongside. |
| 4a | "Skill" vs "stage" vocabulary; badges said "Skill complete". | "Stage" everywhere a parent reads it. Code keeps `Skill`. |
| 4b | Mainstream "Choosing first foods" guide names lentils and fortified cereal with no word on our approach. | Adds one sentence naming our order and pointing to the Ancestral guide. |
| 4c | Ghee sat in Scoop & Mash 1.0, fish roe in Chewing. | Ghee moves to Scoop & Mash 2.0 (stirred into mashes); fish roe to Big Flavors 2.0. |
| 4d | Onboarding says "no honey", everywhere else "no honey before 12 months". | Onboarding says "no honey before 12 months". |
| 4e | Home shows "First Foods" as the section title and again on the plan card. | Section title becomes "{name}'s foods". |
| 4f | Settings About cites only public-health bodies. | Left as is: the canon names Kate Pope's approach on the onboarding Approach screen and the Ancestral guide (decision D). |
| 4g | June `AncestralMeal` ideas duplicate the recipe library. | Left for a later tidy; no contradiction in content. |

## B. New, raised by this build

| # | Contradiction | Call |
|---|---|---|
| 5 | Teardown v3: stages open by readiness, not age. Ours lock by age, and decision A delays grains to 24 months. | All 13 readiness stages open from six months with a "suggested from N months" pill. The Grains, Starches & Legumes stage stays age-gated at 24 months (decision A is a food rule, not a stage rule). |
| 6 | Renaming stages would orphan badges already earned (`skill_scoop_mash` etc.). | The four 1.0 stages and the grains stage keep their ids; 2.0, 3.0, and Pick Up stages get new ids. |
| 7 | A twelve-month-old starts at zero, so "Next up" and the planner offer foods already eaten. | Already-tried intake: a "Foods already tried" screen, offered on Home for any baby of seven months or more with fewer than five foods tried, and always reachable from the Plan. (Not an onboarding step: Home catches new and existing babies alike.) Ticked foods are marked tried without journal entries; ticked allergens move to rotation. |
| 8 | Recipes jump from 12 to 24 months; the meal filter in Solid Starts has 18. | New '18 mo+' stage across `babyStage`, recipe chips, and the planner. 16 ancestral 18-month recipes (still grain-free) and 12 at 24 months (grains, starches, legumes join). |
| 9 | Serving ladders stop at 9 months for 50 foods and at 12 for almost all; choking guidance changes after one for some foods. | Extra bands merged at load: 12 mo+ for the 50, and 18 mo+, 24 mo+, or 3 yr+ only where the safe preparation changes. |
| 10 | Food picker: Solid Starts asks "choose N this week". Ours only recommends. | Stage screen gets "This week's foods": pick up to the stage's batch target; picked foods go first in Next up and the planner scores recipes containing them higher. |
| 11 | Toddler content is four short guides. | Ten new toddler and picky-eating guides in our words. |
| 12 | "100 Foods Plan" name now covers 105 foods across 14 stages. | Name kept; it mirrors the familiar term and the count is approximate by design. |

## C. Facts checked against NHS pages (25 Oct 2026)

| Claim in the app | NHS says | Result |
|---|---|---|
| Whole nuts not before five | "shouldn't be given to children under 5" (What to feed young children, reviewed 28 Mar 2023) | Confirmed |
| Quarter grapes and cherry tomatoes until about five | Cut small round foods such as grapes, cherries, berries, and cherry tomatoes into quarters (Best Start in Life, preparing food safely). No age to stop is given. | Age removed; cards now say NHS gives no age to stop |
| Toddler milk 300 to 400 ml a day | "at least 350ml (12oz) of milk a day, or 2 servings of foods made from milk" | Corrected to 350 ml |
| Whole milk until two, then semi-skimmed | Whole or semi-skimmed from age one; no skimmed or 1% before five (Drinks and cups, reviewed 5 Oct 2022) | Corrected; our approach still prefers whole |
| Move from bottle to cup around 12 months | Cup from around six months; bottle feeding discouraged from one | Corrected |
| Oily fish: "a weekly upper limit, check the advice" | Boys up to four portions a week, girls no more than two | Figures added (guide and salmon card) |
| Avoid shark, swordfish, marlin | Children under 16 should avoid them | Confirmed, age added |
| Vitamins A, C, and D from six months to five years | Confirmed; not needed if having more than 500 ml formula a day | Exception added |

Sources: nhs.uk/baby/weaning-and-feeding/what-to-feed-young-children/ · nhs.uk/conditions/baby/weaning-and-feeding/drinks-and-cups-for-babies-and-young-children/ · nhs.uk/live-well/eat-well/food-types/fish-and-shellfish-nutrition/ · nhs.uk/conditions/baby/weaning-and-feeding/vitamins-for-children/ · nhs.uk/best-start-in-life/baby/weaning/what-to-feed-your-baby/ (6 months, 7 to 9, 10 to 12, over 12 months) · nhs.uk/best-start-in-life/baby/weaning/safe-weaning/preparing-food-safely/

Later serving bands (checked 25 Oct 2026 against AAP, healthychildren.org Choking Prevention, and CDC, Infant and Toddler Nutrition: choking hazards). AAP keeps raw vegetable sticks, raw fruit chunks, whole grapes, nuts and seeds (sunflower in particular), popcorn, sausages, and chunks of meat away until at least four. CDC lists bones in meat or fish and whole corn kernels, with no age. Changes: apple, carrot, and celery raw sticks moved from 3 yr+ to 4 yr+; raw pepper at 24 mo+ finely chopped or slivers only; corn kernels in moist dishes; lamb and chicken at 24 mo+ off the bone; whole sunflower and pumpkin seeds not before four. Still our judgement: the 24 mo+ step for thin raw slices and grated raw vegetables, which AAP does not address.

## D. Whole-app cohesiveness pass after v1.4.1 (25 Oct 2026)

Method: an audit over the live app data (every recipe's foods against their safe and approach ages, unsafe words in recipe text, stage foods against stage ages, serving-band order, allergen serving foods), then a wording sweep of screens, guides, and docs.

| # | Found | Fix |
|---|---|---|
| 13 | Recipes: no food below its safe age, no ancestral recipe using a food before our approach allows it, no honey before 12 months, every "sugar" and "whole nuts" mention is a "no" or "never". | None needed. |
| 14 | Honey sits in Big Flavors 2.0 (suggested from nine months) but is safe only from 12. It could not be picked, but the list gave no reason. | Stage lists now say "Safe from 12 months" on any food not yet safe for the baby's age. |
| 15 | Older "Milk & moving to a cup" guide said "two to three servings" and "limit juice"; the new toddler guides say at least 350 ml and no juice. | Older guide now gives the NHS figure and our no-juice line. |
| 16 | Search looked in the retired June meal-idea list, not the recipe library, and guide results could not be opened. | Search covers all recipes (title, summary, ingredients) and opens recipes and guides. |
| 17 | Canon §3 still listed "egg (yolk first)" and §4 did not mention picks or the bread and tofu exception. | Canon updated to match the code. |
| 18 | Home's empty-state card said "Build baby's first foods plan". | "Start the 100 Foods Plan". |
| 19 | Mustard (UK and EU list) has no food in the catalogue to serve it with, so its series cannot suggest one. | Open: needs a catalogue food with a photo and serving bands. Not built. |
| 20 | Wheat foods other than bread, and edamame, are delayed to 24 months while their allergens are introduced at six. | Consistent with item 1: bread and tofu are the exposures. No change. |
