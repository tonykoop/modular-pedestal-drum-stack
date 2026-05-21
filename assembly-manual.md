<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Assembly Manual — Modular Pedestal Drum Stack

Builder-facing step-by-step. Assumes all parts have been fabricated, finished,
and laid out per `fabrication-plan.md` Phase 7 complete.

## Tools required

- Drum key (square 5/16" or 6 mm)
- Allen/hex set (for M4 setscrews)
- 10 mm wrench (for M8 levelling feet)
- Drum dial or strobe tuner
- Mallet pair (for final tap testing)
- Soft cloth + Loctite Blue

## Parts checklist

- [ ] 1× base plate with welded socket and 4× levelling feet installed
- [ ] 1× pole, 25 mm OD × 1350 mm
- [ ] 5× drum shells with internal brackets pre-welded
- [ ] 5× counter hoops
- [ ] 5× drum heads (300, 250, 200, 150, 100 mm)
- [ ] 30× lugs with anchor screws
- [ ] 30× tension rods with washers
- [ ] 30× claw hooks
- [ ] 4× rubber pucks (inter-drum isolators)
- [ ] 10× M4 setscrews
- [ ] Loctite blue

## Step 1 — Stand the pedestal

1. Place base plate on a flat, level surface. Use a bubble level to confirm
   horizontal; adjust the 4 levelling feet until level.
   *(Photo placeholder: base plate level-set)*
2. Insert pole into the centre socket. Push fully down until the pole bottoms
   on the welded floor of the socket.
3. Tighten the 2× M4 setscrews on the side of the socket to lock the pole.

## Step 2 — Install lugs in each shell

Repeat 5×.

1. Hold drum shell upright, batter-edge up.
2. From outside, align a lug with its two pre-drilled holes.
3. Hand-thread 2× M6 lug anchor screws from inside the shell into the lug; do
   not fully tighten yet.
4. Repeat for all 6 lugs.
5. Once all 6 lugs are seated, tighten each anchor screw with a hex driver.
   Add a drop of Loctite Blue on the threads.
   *(Photo placeholder: lug install detail)*

## Step 3 — Mount drum-1 (300 mm) on pole

1. Slide drum-1 onto the pole, bottom-up first (open shell end facing down).
2. Lower until the drum-1 head height matches `drum1_Z = 720 mm` above the
   base plate (target measurement; refer to `parameters.csv`).
3. Tighten the 6× M4 setscrews on the 3 internal brackets into the pole
   (2 per bracket × 3 brackets).
4. Verify drum is level using a bubble level on the bearing edge.

## Step 4 — Mount drums 2–5

Same procedure as step 3, in ascending order (2 → 5).

Between each drum, drop a rubber puck onto the previous drum's lug-ring top
to act as inter-drum isolator. The puck centers itself on the pole.

Target heights:

- drum-2: 890 mm
- drum-3: 1050 mm
- drum-4: 1200 mm
- drum-5: 1380 mm

*(Photo placeholder: 5 drums mounted on pole)*

## Step 5 — Head + hoop on each drum

Repeat 5× (drum-1 down to drum-5 in this order is fine; small drums sit on top
and are easier last).

1. Drop the head onto the drum's bearing edge, flesh-hoop facing up.
2. Drop the counter hoop over the head, lining up with claw-hook slots.
3. Hook a claw over the counter hoop at each of 6 lug positions.
4. Thread a tension rod through each claw and into its lug, with a nylon
   washer between rod head and claw.
5. Hand-tighten each rod until snug.

## Step 6 — Star-pattern tensioning

Per `tuning-notes.md` procedure.

1. Add 1/4 turn to each rod in star pattern: rod 1, rod 4, rod 2, rod 5,
   rod 3, rod 6 (using 1-6 ordering around the rim).
2. Continue 1/4 turns per round until the head feels firm with no slack.
3. Center-strike with a stick handle and listen — note the pitch.
4. Cross-tap at each rod position: equalize tap pitches to within 3 cents.
5. Bring center pitch to ~3% above target Hz (see `parameters.csv`
   `drumN_target_freq`).
6. Let head rest 10 min. Re-check.
7. Fine-tune to target ±5 cents.

## Step 7 — Final inspection

- All lug screws Loctite'd and snug
- No exposed rod tips poking outward (cap with rubber if any extend > 5 mm)
- Stack feels stable when pushed at the top with 5 kg force
- No rattles when struck — tap test each drum, then strike adjacent drums
  and listen for sympathetic ring on the silent ones (some is OK and expected)
- Each drum within ±15 cents of target after final tune

Sign off in `validation.csv` `measured` column, then play.

## Disassembly note

To break down for transport: remove each drum top-down by loosening setscrews
and lifting off the pole. Heads and hoops can stay tensioned. The pole and
base disassemble by loosening the socket setscrews. Total break-down ~10 min.
