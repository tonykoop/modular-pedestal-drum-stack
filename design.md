<!-- SPDX-License-Identifier: CC-BY-4.0 -->
---
family: membranophone
subfamily: single-headed cylindrical drum stack
scale: pentatonic
target_pitches:
  drum-1: A2  # 110.00 Hz
  drum-2: C3  # 130.81 Hz
  drum-3: E3  # 164.81 Hz
  drum-4: G3  # 196.00 Hz
  drum-5: A3  # 220.00 Hz
geometry:
  drum-1: { od_mm: 300, height_mm: 180, head_diam_mm: 300 }
  drum-2: { od_mm: 250, height_mm: 160, head_diam_mm: 250 }
  drum-3: { od_mm: 200, height_mm: 140, head_diam_mm: 200 }
  drum-4: { od_mm: 150, height_mm: 120, head_diam_mm: 150 }
  drum-5: { od_mm: 100, height_mm: 100, head_diam_mm: 100 }
materials:
  shell: cold-rolled steel
  shell_thickness_mm: 1.2
  head: synthetic mylar (Remo or Evans coated, 7-10 mil)
  pole: 25 mm OD stainless tube, 1.5 mm wall
  base: 380 mm steel plate, 6 mm
tuning_mechanism: snare-style external lug ring with 6 tension rods per drum
acoustic_intent: pentatonic ascending tom array with metal-shell snap and short sustain
---

# Modular Pedestal Drum Stack — Parametric Design

## 1. Family and acoustic target

The instrument sits in the **single-headed cylindrical membranophone** family — closest
kin are octobans, marching tenors, Roto-toms, and tabla-baya. Distinctive choices:

- **Single head**, top-batter only — open-bottom shell radiates downward like a
  conga or octoban, giving a focussed fundamental rather than a tom's tom-tom blur.
- **Sheet-metal shell**, 1.2 mm rolled steel — adds high-frequency cut over wood,
  shorter sustain than brass or copper, and lets the shells form structural columns
  on the pedestal.
- **Pentatonic five-pitch array** rather than chromatic — favours fast melodic phrases
  over single-stroke melodies. A2, C3, E3, G3, A3 spans 7 semitones less than an
  octave, keeping all five within comfortable reach of a single player.

## 2. Membrane acoustics — first-principles

The fundamental frequency of an ideal circular membrane of radius `a`, areal density `σ`
(kg/m²), under tension `T` (N/m) is:

```
f_01 = (z_01 / (2π a)) · sqrt(T / σ)
```

where `z_01 ≈ 2.4048` is the first zero of the Bessel function J₀.

Solving for the tension required to hit each target pitch with a fixed head density:

- mylar head, 10 mil (0.254 mm), ρ = 1390 kg/m³ → σ = 0.353 kg/m²
- drum-1 (a = 0.150 m, target 110 Hz): T ≈ 425 N/m
- drum-2 (a = 0.125 m, target 130.81 Hz): T ≈ 419 N/m
- drum-3 (a = 0.100 m, target 164.81 Hz): T ≈ 426 N/m
- drum-4 (a = 0.075 m, target 196.00 Hz): T ≈ 343 N/m
- drum-5 (a = 0.050 m, target 220.00 Hz): T ≈ 215 N/m

Targets cluster in the 200–425 N/m range — well within a standard 6-rod snare-style
lug ring's working envelope (a typical 14" snare is tensioned to ~600 N/m for a tight
crack). The smallest drum (drum-5) needs the **loosest** tension, which inverts the
intuitive "tighter = smaller" assumption for fixed-pitch arrays. See
`modular-pedestal-drum-stack-starter.wl` for the full sweep, sensitivity to head thickness, and harmonic
predictions.

## 3. Shell role — coupling and damping

Unlike a frame drum where the rim is purely structural, a 1.2 mm steel shell of these
diameters has its own ring modes in the 800–4000 Hz range, which couple to the head's
upper partials. The design intent:

- Shell ring mode of drum-1 (300 mm) ≈ 1620 Hz — sits a sixth above the head's third
  partial (2 z_11/z_01 · 110 ≈ 350 Hz). Mostly decoupled.
- Shell ring modes scale roughly inversely with diameter, so drum-5 (100 mm)
  ≈ 4900 Hz — well above any head partial of interest. Decoupled.
- Bearing edge chamfered 45° inward to shorten head-shell contact and reduce ring-mode
  excitation. See `tuning-notes.md`.

## 4. Pedestal column

- **Pole:** 25 mm OD × 1.5 mm wall stainless tube, 1350 mm long (centre-to-base).
- **Mounts:** Each drum has a welded internal bracket with two rubber-isolated set
  screws against the pole. Bracket is a 50 mm long folded U-channel of 1.2 mm steel,
  TIG-tacked to the shell interior at three points 120° apart.
- **Base:** 380 mm diameter × 6 mm steel plate, with a centre-welded socket for the
  pole and four levelling feet on the rim.
- **Spacing:** Drums are 50 mm apart edge-to-edge, with a rubber puck between each
  shell's lug-ring top and the next drum's bottom rim to damp inter-drum coupling.

## 5. Tuning mechanism

Standard snare-style external lug ring with 6 tension rods per drum, anchored to a
counter-hoop and pulling against an inverted-U claw that grabs the head's flesh hoop.
Bought stock from Pearl or Yamaha hardware lines (see `bom.csv`). Each drum is tuned
**independently** with a drum dial; pentatonic tuning is set by the fabricator at
final assembly.

## 6. Sheet-metal classification per part

| Part | Classification | Forming method |
|---|---|---|
| Drum shell (×5) | Cylinder | Slip-roll, butt-weld TIG seam |
| Bearing edge | Inward-roll on top edge | Bead roller or mill turn |
| Internal pole bracket | Folded U-channel | Press brake or finger brake |
| Base plate | Flat panel + welded socket | Plasma cut + lathe-turned socket |
| Counter hoop (×5) | Rolled ring | Slip-roll + butt-weld + dress |

## 7. Validation gates (see `validation.csv`)

- **Acoustic:** Each drum's fundamental within ±15 cents of target after tuning.
- **Mechanical:** Pedestal pole bends < 5 mm under 50 N lateral load at top drum.
- **Ergonomic:** Top drum head height ≥ 1350 mm for standing play.
- **Manufacturability:** Slip-roll minimum radius achievable on 1.2 mm cold-rolled
  steel (≈ 38 mm — well under the 50 mm minimum radius of drum-5).
- **Safety:** All bearing edges deburred and chamfered; no exposed lug-rod tips at
  player-facing height.

## 8. Open questions / punt to next round

- Are the predicted membrane frequencies stable under temperature swings of a
  rehearsal-room environment? (Mylar has ~3 cents/°C drift.)
- Would a **double-headed** variant of drum-1 give a deeper bass? Probably yes —
  consider as a v0.2 fork.
- Is a foot-pedal "select" mechanism (kick the pedestal to rotate the top drum into
  reach) feasible? Out of scope for blueprint.
