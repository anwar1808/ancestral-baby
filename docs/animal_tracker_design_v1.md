# Animal tracker — design v1 (not built)

**Status:** DESIGN, 25 Oct 2026. Annie's answers the same day: both framings (species count and species by part); ambiguous foods ask which animal at the tick; custom foods carry an animal tag; dairy defaults to cow and sheep or goat milk can be recorded instead. Build waits for her go.

## 1. What it answers

"Which animals has my baby eaten, and which parts of them?" Today the app counts foods and ten food categories, so beef, liver, marrow, stock, butter, and kefir are six ticks with no idea they are one cow, and Meat & Poultry is one category whether the baby has had one species or six. The ancestral canon talks in animals and parts (nose to tail), so the tracker should too.

## 2. Model

**Animal.** A small fixed list plus write-ins: cow, sheep, goat, pig, buffalo, chicken, turkey, duck, goose, quail, deer, rabbit; salmon, trout, cod, haddock, tuna, sardine, mackerel, herring, prawn; `other` with a free-text name. Grouped as land and bird, or fish and seafood.

**Part.** `muscle` (meat, fish flesh), `organ` (liver, heart), `bone` (stock, broth, marrow), `fat` (butter, ghee, dripping), `milk` (yoghurt, cheese, kefir, milk), `egg`, `roe`.

**Food to animal defaults** (catalogue, 27 animal-derived foods):

| Food(s) | Part | Default animal | Alternatives offered |
|---|---|---|---|
| beef | muscle | cow | none |
| lamb | muscle | sheep | goat |
| pork | muscle | pig | none |
| chicken, turkey, duck | muscle | itself | none |
| salmon, cod, haddock, tuna, sardine, mackerel | muscle | itself | none |
| shrimp | muscle | prawn | none |
| egg | egg | chicken | duck, quail, goose |
| yoghurt, cheese, cottage_cheese, ricotta, cream_cheese, kefir, whole_milk | milk | cow | sheep, goat, buffalo |
| butter, ghee | fat | cow | sheep, goat |
| bone_marrow | bone | cow | sheep |
| fish_roe | roe | salmon | trout, cod, herring |
| **liver** | organ | **none, must choose** | cow, sheep, chicken, pig, duck |
| **meat_stock** | bone | **none, must choose** | chicken, cow, sheep, pig, fish |

**Storage.** Two nullable columns on `tracker_entry`: `animalId TEXT`, `part TEXT` (schema v5). One column on `custom_food`: `animalId TEXT` plus `part TEXT`. No new table: the journal already holds every "tried" and "meal" event, deletion and export follow the journal, and partner sharing (when built) syncs it for free. The Animals view is derived from tracker entries at read time, as the skill progress and badges are today.

## 3. When an animal gets recorded

1. **Marking a catalogue food tried.** Foods with a default are recorded silently with that animal; the confirmation snackbar reads "Tried liver · cow" with a **Change** action, and the food card gains an **Animal** row that can be tapped to change it afterwards. The two must-choose foods (liver, meat stock) open a one-tap sheet first: chips for the alternatives, an **Other** write-in, nothing preselected.
2. **Logging a recipe or ticking a planned meal as cooked.** Each ingredient food resolves to its default animal. Recipes name the animal in their ingredients where it is ambiguous (chicken liver, beef stock), so the recipe library gets an optional `animals` map (foodId → animalId) that overrides the default; the 48 ancestral recipes are annotated once by script and checked by hand.
3. **Custom foods.** The add and edit sheets gain an Animal chip row (same list plus write-in) and a Part row. A custom "sheep's milk yoghurt" records sheep, milk.
4. **Manual entry.** The Animals screen has an **Add** button for "we had goat's cheese today" without inventing a food: pick animal, part, optional note. Written as a `meal` tracker entry with the two columns set.

Every path writes the same two columns, so the view has one source.

## 4. Screens

- **Progress → Animals section.** Two numbers side by side, land and bird animals and fish and seafood, with the total; tapping opens the Animals screen. Sits above Milestones.
- **Animals screen.** Two tabs. **By animal:** a card per animal eaten, newest first, showing its parts as filled or empty pills (muscle, organ, bone, fat, milk, egg, roe, only the parts that make sense for that animal: no roe on a cow, no milk on a salmon) and the dates of first and latest serving; below, greyed cards for animals not yet eaten with the catalogue foods that would unlock them ("Try: duck" / "Try: sardine, mackerel"). **By part:** seven rows (muscle, organ, bone, fat, milk, egg, roe) each listing the animals eaten that way, so "organ: cow, chicken" and "bone: chicken" read at a glance.
- **Food card.** An **Animal** meta row for animal-derived foods, tappable to change the recorded animal for the latest entry.
- **Export.** CSV gains `animal` and `part` columns on every entry; the PDF summary gains an "Animals" block (species count and a nose-to-tail line per animal).

## 5. Badges

`first_animal`, `five_animals`, `ten_animals`; `first_fish`, `five_fish`; `nose_to_tail` (one animal with muscle, organ, and bone all recorded). Added to the existing tier engine; no celebration screen until that mechanic exists.

## 6. Recommended next

One tie-breaker added inside a canon tier: an untried food that would add a **new animal** ranks ahead of one that would not. No change to the tier order.

## 7. Work

| Step | Effort |
|---|---|
| Schema v5 migration, `TrackerEntry` and `CustomFood` fields, animal and part tables in Dart, food defaults | small |
| `AppState`: record on tried, recipe log, cooked tick, custom food; derived views (animals, parts, unlock hints); badges; recommended-next tie-breaker | medium |
| Sheet for must-choose foods, snackbar Change, food-card Animal row, custom-food chips, Animals screen (two tabs), Progress section, export columns | medium |
| Annotate the 48 recipes with animals where ambiguous; tests for defaults, derivations, and the nose-to-tail badge | small |

About one session, released as v1.4.0+8.

## 8. Not in v1

Portion or frequency per animal, farmed versus wild, organ sub-types beyond liver and heart, and any per-animal nutrition claims. Fish advice (oily fish frequency, tuna limits) stays where it is on the food cards and is not restated here.
