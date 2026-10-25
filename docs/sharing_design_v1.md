# Partner sharing — design v1 (two parents, one source of truth)

**Status:** DRAFT, 25 Oct 2026. Not built. Answers the brief's headline feature three, deferred since June behind `SyncRepository`.
**Goal:** both parents log foods, meals, notes, and reactions for the same baby from their own phones, and both see one consistent journal, allergen status, and progress. Offline keeps working. No account unless you share.

## 1. What already anticipates this

- `Baby.householdId` exists in the model and the schema (default `'local'`).
- `SyncRepository` already declares the surface: magic-link sign-in, `createInviteCode`, `joinHousehold`, `sync`. `LocalOnlySync` throws `SyncUnavailable` today.
- Every per-baby table is keyed by `babyId`, and tracker entries and milestones carry their own UUIDs. That is most of what a sync engine needs.

## 2. Model

```
household (id, created_at)
household_member (household_id, user_id, role: owner|partner, joined_at)
invite (code, household_id, expires_at, used_by)
baby (… as local, household_id NOT NULL)
food_state, allergen_status, tracker_entry, milestone, custom_food (… as local, plus updated_at, updated_by, deleted_at)
```

One household per baby. A user can belong to more than one household (a childminder, a grandparent). Access is by membership only, enforced server-side with row-level security.

## 3. Identity and joining

- **Default:** no account. Everything stays as it is now.
- **To share:** parent A taps Share in Settings, signs in with an email one-time code (passwordless), the app creates a household, moves the local baby into it, and shows a six-digit code and a QR. Parent B installs, picks "Join a household", signs in the same way, enters the code. Both now sync.
- **Why an email identity rather than a device code:** recovery. A new phone or a reinstall restores the household by signing in. A device-only identity loses everything with the phone. The brief made the same call.
- **Privacy posture:** this is a child's health data. Sync is opt-in, scoped to the household, and the app keeps no analytics. The privacy page must say where the data lives and how to delete the household.

## 4. Sync engine

Local SQLite stays the source the UI reads. The engine is an outbox plus a pull:

1. Every local write also appends to an `outbox` table (table, row id, op, payload, local timestamp).
2. `sync()` pushes the outbox in order, then pulls every row in the household with `updated_at` after the last pull cursor, and applies it locally.
3. Realtime subscription on the household triggers a pull when the other parent writes, so the journal updates within seconds when both are online.
4. Runs on app open, on resume, after every write when online, and never blocks the UI.

**Conflict rules, per table:**

| Table | Rule | Why |
|---|---|---|
| `tracker_entry`, `milestone`, `custom_food` | Append-only by UUID; deletes are tombstones | Two parents logging the same lunch produce two entries, which is correct |
| `food_state` (tried, favourite, try-later) | Last write wins per field, by `updated_at` | Low stakes, rarely contended |
| `allergen_status` | Last write wins, **except** `reactionNoted` is sticky: it can only be cleared by an explicit resume action, never by a stale "served" from the other phone | Safety: a reaction must not be overwritten by a sync race |
| `baby` | Last write wins per field | Profile edits are rare |
| `settings` | Not synced; per device | Reminder time and units are personal |

Reminders: each phone schedules its own local notifications from the synced allergen status, so both parents get the "due" nudge, and a serve logged by either clears it on both after sync.

## 5. Backend choice

| | Supabase (brief's pick) | Firebase Firestore (brief's named alternative) |
|---|---|---|
| Fit | Postgres, row-level security, realtime, email OTP built in; schema mirrors SQLite one-to-one | Document store, security rules, realtime, email-link auth; Flutter SDK has offline persistence built in |
| Free tier risk | Free projects are paused after 7 days of low activity (Supabase docs, checked 25 Oct 2026; "a few user requests to the database each day" avoids it; paused projects restorable for 90 days). Two parents logging most days would usually stay above the line, but a quiet fortnight would pause the project and the next sync would fail until it is restored | Spark plan does not pause; quotas are generous for two users |
| Export | Plain Postgres dump | Export via Firestore tooling; less convenient |
| Google SDK in the app | None | Firebase core (not analytics) |
| Conflict handling | We write the rules in §4 ourselves | Same, though offline persistence smooths the common cases |

**Recommendation:** Supabase if Annie is willing to run a daily keepalive (a GitHub Actions cron making one small request) or pay the small-tier fee later; otherwise Firestore. Source: https://supabase.com/docs/guides/platform/free-project-pausing Either way the code lives behind `SyncRepository`, so the choice is reversible at the cost of the adapter.

## 6. Work estimate

| Step | Sessions |
|---|---|
| Schema + RLS/rules + invite flow on the backend | 1 |
| Outbox, pull, cursor, tombstones, conflict rules, realtime trigger | 1–2 |
| Sign-in and Join UI, Settings "Sharing" section, household delete | 1 |
| Migration of an existing local baby into a household | ½ |
| Testing with two devices, airplane-mode cases | ½–1 |

Four to five sessions, independent of the content work.

## 7. What Annie has to do

- Choose Supabase or Firestore (§5).
- Create the project under an account she controls and paste the project URL and anon key into the app's config. I cannot create the project without her login.
- Decide whether grandparents and childminders are in scope for v1 (affects invite expiry and roles only).
