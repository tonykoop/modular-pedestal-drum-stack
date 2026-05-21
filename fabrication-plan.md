<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Fabrication Plan — Modular Pedestal Drum Stack

Keyed to Maker Nexus tooling. Total estimated shop time: 18–22 hours including
finishing and final assembly.

## Sequence overview

```
[1] CUT         → plasma + shear
    ↓
[2] DEBURR      → bench (edge sander, scotch-brite)
    ↓
[3] FORM        → slip-roll + finger brake + lathe
    ↓
[4] JOIN        → TIG weld
    ↓
[5] DRESS       → bench grinder + flap disc + polish
    ↓
[6] DRILL       → drill press (lug holes)
    ↓
[7] FINISH      → spray booth (clear or matte black)
    ↓
[8] ASSEMBLE    → hardware install, head + hoop, tension to target Hz
    ↓
[9] INSPECT     → acoustic + ergonomic + safety per validation.csv
```

## Phase 1 — Cut (plasma, ~3 h including queue)

- Mount 24" × 48" × 1.2 mm CRS sheet on plasma bed.
- Load `cnc/shells-and-brackets.dxf` nest.
- Verify origin and material file ("Mild Steel 18 ga, Hypertherm 45A").
- Run nest — 5 shell blanks + 15 bracket blanks.
- Reload bed with 16" × 16" × 6 mm 1018 plate.
- Cut base plate disc + tapped-hole pilots.
- Reload bed with five 1 m lengths of 3 mm × 18 mm flat bar OR shear strips
  from a 3 mm sheet.

## Phase 2 — Deburr (~1 h)

- Edge-sander all blank perimeters.
- Scotch-brite all faces.
- Light file on hole perimeters.
- **Stop and inspect:** No burrs. No corners > 0.3 mm radius. Mark each blank
  with part name in marker.

## Phase 3 — Form (~5 h)

### 3a. Roll shells

Refer to `cnc/setup-sheet.md` slip-roll chart.

1. Calibrate slip-roll: bend a test scrap of 1.2 mm CRS to a 50 mm radius
   (drum-5 spec). Check spring-back. Adjust roller pre-load until spring-back
   < 5°. **If spring-back exceeds 5° on the test, drop drum-5 to 1.0 mm
   stock and re-cut that blank.**
2. Roll drum-1 first (easiest): 3 pre-bend passes, then full curl. Cylinder
   should close with a 3 mm overlap; trim to butt fit.
3. Roll drums 2-5 in order, smaller = trickier.

### 3b. Roll counter hoops

Same procedure for 3 mm × 18 mm flat bar. Roll to drum OD, trim to butt fit.

### 3c. Bend internal brackets

Finger brake, 90° bends at 20 mm and 40 mm marks. Make 1 test piece first to
verify bend allowance from `bend-table.csv` (~3 mm BA per 90° bend in 1.2 mm
CRS).

### 3d. Turn pole socket

50 mm round bar 1018, ~50 mm length. In 3-jaw chuck:
1. Face one end.
2. Drill ⌀25.2 mm bore through.
3. Turn OD to 40 mm.
4. Part off to 30 mm length.
5. File chamfer top and bottom.

## Phase 4 — Join (TIG, ~5 h)

### 4a. Shell seams (5×)

Per `cnc/setup-sheet.md` TIG settings.

1. Tack at 4 points (12, 3, 6, 9 o'clock) — clamp in a V-block fixture.
2. Inspect tack alignment — gap should be 0–0.3 mm with no overlap.
3. Continuous root pass closing the seam in a single direction.
4. **Stop and inspect:** No porosity visible. Weld height ≤ 1.5 mm. Shell
   roundness deviation < 1.0 mm (indicator-check on a surface plate).

### 4b. Counter hoop seams (5×)

Same as shells but smaller. Faster — these can be lap-or-butt depending on
slip-roll precision.

### 4c. Internal brackets to shells (15×)

Each shell gets 3 brackets at 120° spacing inside, set at the shell mid-height.
Tack each bracket at 3 points (top, bottom, middle of the U-channel back) using
a fixture to hold the bracket flush to the inner shell wall.

### 4d. Base plate to socket

Tack socket centred on base plate, gap-check 0 mm. Run continuous 3 mm fillet
all the way around the socket-plate joint. Flip plate, run a partial fillet on
the underside (3-5 mm tacks every 60°) for redundancy.

## Phase 5 — Dress (~2 h)

- Grind shell seams flush with parent material using a bench grinder + flap disc.
- Sand inside of shell to remove weld spatter.
- File any sharp edges on the inward bearing-edge chamfer.

## Phase 6 — Drill lug holes (~1 h)

- Use a laser-cut paper template wrapped around each shell to mark 6 lug
  positions evenly at 35 mm above the bottom edge.
- Drill ⌀5.5 mm holes with a drill press; back the hole with a wood block
  inside the shell to prevent burring.
- Each lug needs 2 holes 25 mm apart vertically — drill the second row 25 mm
  below the first.
- Total: 12 holes per drum × 5 drums = 60 holes.

## Phase 7 — Finish (~2 h work + 24 h cure)

- Wipe all parts with acetone.
- Hang in spray booth.
- Apply 2 coats of satin-clear urethane OR matte-black 2K. The clear lets the
  weld lines and steel texture show; the black hides imperfections and matches
  professional drum-kit aesthetics. Pick one.
- Cure 24 h at room temp before assembly.

## Phase 8 — Assemble (~2 h)

1. Slide pole through base socket; tighten setscrews on a flat lower mount.
2. Slide drum-1 (largest) onto pole at the lowest position; align with rubber
   puck below; tighten the 2 bracket setscrews into the pole.
3. Repeat for drums 2-5 in ascending order.
4. For each drum:
   - Install 6 lugs with M6 screws (use Loctite blue on threads).
   - Drop head onto bearing edge.
   - Drop counter hoop over head flesh-hoop.
   - Hook the 6 claws over the counter hoop.
   - Install 6 tension rods with nylon washers.
   - Hand-tighten + 1/4 turn per rod, star pattern.
5. Tune each drum per `tuning-notes.md` procedure.

## Phase 9 — Inspect

Run through `validation.csv` row by row. Fill the `measured` column. Anything
in `pending` state is a gate the next round must satisfy before the instrument
is declared v0.2-physical.

## Tool-skill matrix

| Tool | Skill required | Alternative |
|---|---|---|
| Plasma CNC | basic operator | manual shear + jigsaw (slow) |
| Slip-roll | intermediate | small ring-roll for hoops; shells need slip-roll |
| TIG welder | intermediate-advanced | MIG ok for shell seams if cleaned up; TIG for brackets |
| Lathe | basic | hand-file the bearing edge (much slower, less consistent) |
| Drill press | basic | hand drill with guide |
| Spray booth | basic | brush-on enamel (lower finish quality) |

If TIG access is unavailable: the entire welded-seam architecture can be swapped
for **lap-and-rivet** construction (sheet-metal screws or pop rivets at the
seam), with a polymer sealant in the lap to prevent rattle. This is a v0.2
fabrication alternative; document if substituted.
