<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CNC Setup Sheet — Modular Pedestal Drum Stack

## Plasma — shell + bracket nest

- **Stock:** 24" × 48" × 1.2 mm cold-rolled steel
- **Material file:** "Mild Steel 18 ga, Hypertherm Powermax 45XP, 45A consumable"
- **Pierce delay:** 0.3 s
- **Cut speed:** 4500 mm/min
- **Kerf:** 1.2 mm
- **Lead-in:** 5 mm tangent
- **Lead-out:** 3 mm
- **Hold-down:** magnetic clamps at 4 corners, do not clamp over part profiles

## Plasma — base plate

- **Stock:** 16" × 16" × 6 mm 1018 plate
- **Pierce delay:** 0.6 s
- **Cut speed:** 1800 mm/min
- **Kerf:** 1.5 mm
- **Special:** for 4 M8 tapped holes, cut pilot ⌀6.8 mm then tap manually
  (plasma struggles with small clean holes at 6 mm thickness)

## Slip-roll setup chart

| Part | Inside radius | Pre-bend setting | Full-curl setting |
|---|---|---|---|
| drum-1 shell | 150 mm | 4 turns from open | 6 turns |
| drum-2 shell | 125 mm | 5 turns | 7 turns |
| drum-3 shell | 100 mm | 6 turns | 8 turns |
| drum-4 shell | 75 mm | 7 turns | 9 turns |
| drum-5 shell | 50 mm | 8 turns | 10 turns (max) |
| hoops (all) | matches drum | same as shell | + 0.5 turn for 3 mm stock |

All settings are starting points for a Baileigh BR-1655 hobby-shop slip-roll;
calibrate against the actual machine before committing the real blank.

## Lathe — bearing edge

- **Chuck:** 4-jaw independent (for shells; cylinder centering)
- **Tool:** 45° V form tool, HSS, sharp edge
- **Speed:** 180 RPM for 300 mm shell, scale up inverse to diameter
- **Feed:** 0.05 mm/rev, manual
- **Depth of cut:** 0.3 mm per pass, finishing pass at 0.05 mm
- **Coolant:** none — light cuts on thin steel

## TIG — seam weld

- **Process:** DC, electrode negative
- **Tungsten:** 2% lanthanated, 1/16" (1.6 mm), ground to a sharp 30° point
- **Filler:** ER70S-2, 0.045" (1.1 mm) — match thickness for 1.2 mm shell
- **Amperage:** 60 A baseline, foot pedal modulation
- **Shielding:** argon, 15 cfh, gas lens
- **Sequence:** 4 tack welds at 0/90/180/270°, then continuous root pass
  closing the seam in a single direction
- **Backing:** copper backer block bowed to match curvature, prevents blow-through

## Pole end-finish

- Lathe-face both ends of pole to a clean 90° square cut
- Deburr inside and outside
- The bottom end seats in the base socket; the top end is open

## QC inspection

- Caliper-check all 5 shell ODs to ±0.5 mm
- Indicator-check shell roundness — max deviation 1.0 mm
- Visual inspect all welds for porosity, undercut
- Free-tap test each shell on a foam pad: listen for cracks, dead spots
