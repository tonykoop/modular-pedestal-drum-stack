<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Flat-Pattern Checklist — Modular Pedestal Drum Stack

## DXF export conventions

- **Units:** millimeters. Declare in DXF header.
- **Layers:**
  - `CUT` — outer profile + holes. Color: black. Line: solid.
  - `BENDS` — bend lines. Color: red. Line: dashed.
  - `ETCH` — datum marks, alignment notches. Color: blue. Line: dotted.
  - `ANNO` — text, labels. Color: green. Excluded from CAM nesting.
- **Origin:** lower-left of bounding rectangle.
- **File naming:** `drawings/<part>-flat.dxf` — exact part name from
  `cut-list.csv`.

## Per-part checklist

### Drum shells (drums 1-5)

- [ ] Cut: outer rectangle of size from `cut-list.csv`
- [ ] Cut: 12 lug-anchor holes ⌀5.5 mm at 35 mm above bottom edge, evenly spaced
      around the circumference (6 lug positions × 2 holes each)
- [ ] Etch: bend-line for the inward bearing-edge chamfer (top edge, 1.5 mm
      down from top)
- [ ] Etch: seam reference mark at the rolled-cylinder butt joint
- [ ] Etch: drum-N label in `ANNO`

### Internal bracket (×15 instances; one flat pattern)

- [ ] Cut: 60 mm × 60 mm blank
- [ ] Cut: 2× M4 clearance holes on central flat, 12 mm apart, centred
- [ ] Bend: 90° at 20 mm from left edge
- [ ] Bend: 90° at 40 mm from left edge (same direction, forming U)
- [ ] Etch: bracket label

### Counter hoops (drums 1-5)

- [ ] Cut: rolled-flat blank of `circumference × 18 mm`
- [ ] Cut: 6× ⌀7 mm holes for tension-rod claws, evenly spaced
- [ ] Etch: butt-weld reference

### Base plate

- [ ] Cut: 380 mm OD circle
- [ ] Cut: centre 25.2 mm hole (pole pass-through, before socket weld)
- [ ] Cut: 4× M8 tapped-hole pilot ⌀6.8 mm at 175 mm radius, 90° apart
- [ ] Etch: alignment cross at centre + 4 cardinal direction marks at OD

## Nesting

5 shells + 5 counter-hoop blanks + 15 bracket blanks fit comfortably on a single
24" × 48" sheet of 1.2 mm CRS with ~30% utilization. The base plate cuts from a
separate 6 mm plate. Nest the bracket blanks in the negative space between shell
blanks; orient all bend lines parallel to the rolling direction of the sheet
(if known) for cleaner bends.

## Tab-and-slot strategy

Not used — every joint is welded. No mechanical interlocks.

## Validation before CAM

- [ ] All bend allowances per `bend-table.csv` match the DXF flat dimensions
      (within 0.2 mm)
- [ ] No closed paths missing on `CUT` layer
- [ ] No `BENDS` lines extending past the part profile
- [ ] Drum-5 shell blank fits the slip-roll min-radius coupon test (see
      `risks.md`)
