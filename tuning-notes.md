<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Tuning Notes — Modular Pedestal Drum Stack

## Acoustic targets

| Drum | OD (mm) | Target note | Target Hz | Predicted T (N/m) | Predicted first overtone (Hz) |
|------|---------|-------------|-----------|-------------------|-------------------------------|
| 1    | 300     | A2          | 110.00    | 425               | 175.3                         |
| 2    | 250     | C3          | 130.81    | 419               | 208.5                         |
| 3    | 200     | E3          | 164.81    | 426               | 262.7                         |
| 4    | 150     | G3          | 196.00    | 343               | 312.4                         |
| 5    | 100     | A3          | 220.00    | 215               | 350.6                         |

Predictions from `wolfram-starter.wl` for an ideal circular membrane under uniform
tension. Real drums diverge in three predictable ways:

1. **Air-load drop** — a head with open shell below it drops ~2–3% in fundamental
   relative to the ideal-membrane prediction. Account for this by tensioning ~3%
   above target before final adjustment.
2. **Stiffness rise** — mylar has finite bending stiffness, which raises the
   fundamental by 1–2% over the ideal prediction. Partially cancels (1).
3. **Per-rod tuning variance** — even with a drum dial, rod-to-rod tension varies
   ±5 cents around the rim. The audible pitch sits at the mean; sharp spots ring
   slightly out.

Net: tune to within ±15 cents of target and accept the result. Anything tighter
chases noise.

## Tuning procedure (per drum)

1. Seat the head: hand-tighten all 6 rods until snug, then add 1/4 turn each in
   star pattern (1-4-2-5-3-6).
2. Cross-tap each rod position with a stick handle while listening for the
   tap-pitch around the rim. Equalize tap pitches across all 6 positions to within
   3 cents — this is the "even seat" step.
3. Bring the head to ~3% above target Hz (use a drum dial or tuner with
   center-strike).
4. Let the head rest 10 minutes (mylar relaxes); re-check pitch.
5. Fine-tune down to target ±5 cents.

## Bearing edge

- 45° inward chamfer on the top edge of each shell, machined on a lathe with a
  V-tool or filed by hand.
- Width of contact patch with head: 1.5–2.0 mm. Wider = warmer / more sustain;
  narrower = brighter / shorter sustain. Default 1.5 mm.
- Polish the chamfer to remove burrs; a burr that snags the head will detune the
  drum non-uniformly.

## Pentatonic scale rationale

A2-C3-E3-G3-A3 is a minor pentatonic (A-C-D-E-G) with the D omitted, giving:

- A → C: minor third (3 semitones)
- C → E: major third (4 semitones)
- E → G: minor third (3 semitones)
- G → A: major second (2 semitones)

The non-uniform interval set means **no two adjacent drums are the same interval
apart** — useful for the player's spatial memory. The bottom three drums form an
A-minor triad (A-C-E), the top three form a C-major triad (C-E-G... wait, the
top is G-A so the top triad is actually E-G-A, which is a sus4 with no fifth —
treat it as an ambient cluster).

Alternative tunings to consider for v0.2:

- **Whole-tone:** A2-B2-C#3-D#3-F3 — equal 2-semitone steps, dreamy non-tonal.
- **Drone-and-melody:** A2-A3 octave on drums 1 and 5, with C3-D3-E3 melody in
  the middle three.
- **Custom:** swap the predicted tensions in `wolfram-starter.wl` to derive a
  fabricator-specified scale.

## Strike-zone notes

- **Center strike** excites primarily f01 (the fundamental). Use for melodic
  pentatonic phrases.
- **Off-center strike** (1/3 radius from center) excites f11 (first overtone) more
  strongly — gives a "splash" tone with no clear pitch.
- **Rim strike** excites the shell ring mode (1600–4900 Hz depending on drum).
  Treat as a percussive accent, not a pitched note.

## Sustain

Single-headed open-shell drums have shorter sustain than double-headed; expect
~0.6 s for drum-1 down to ~0.2 s for drum-5. Sheet-metal shells with chamfered
edges shorten this further (~30%) vs wood shells of the same dimensions. This is
intentional — the stack is a **melodic** instrument, not an ambient one. Long
sustain would smear pentatonic phrases into mud.
