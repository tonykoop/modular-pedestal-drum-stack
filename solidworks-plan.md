<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# SolidWorks Plan — Modular Pedestal Drum Stack

## Approach

Drive the assembly from a single **master layout part** holding all driving
dimensions. Five drum-shell configurations are derived from one parametric
sheet-metal part using a design table. Counter hoops and internal brackets are
likewise configuration-driven. The base plate and pedestal pole are single-config
parts. Assembly is mate-driven from the master layout.

## Feature tree

```
modular-pedestal-drum-stack.sldasm
├── 00-master-layout.sldprt  (skeleton: pole axis, drum positions, base)
├── 10-pedestal-pole.sldprt  (single config)
├── 20-base-plate.sldprt     (single config; subassy with pole socket)
├── 30-drum-shell.sldprt     (sheet-metal; 5 configs: drum-1 .. drum-5)
├── 40-counter-hoop.sldprt   (5 configs)
├── 50-internal-bracket.sldprt (sheet-metal; 1 flat-pattern; instantiated 15x)
├── 60-lug-and-rod.sldprt    (purchased part; library component)
└── 70-mallet.sldprt         (purchased part; library component; reference only)
```

## Global variables (driving dimensions, declared in master layout)

| Name | Value | Role |
|---|---|---|
| `pole_OD` | 25 mm | pedestal pole outer diameter |
| `pole_wall` | 1.5 mm | pole wall thickness |
| `pole_length` | 1350 mm | base socket top to highest mount |
| `base_OD` | 380 mm | base plate diameter |
| `base_thk` | 6 mm | base plate thickness |
| `shell_thk` | 1.2 mm | drum shell thickness (sheet-metal global) |
| `drum1_OD` | 300 mm | drum-1 shell outer diameter |
| `drum1_H` | 180 mm | drum-1 shell height |
| `drum2_OD` | 250 mm | drum-2 shell outer diameter |
| `drum2_H` | 160 mm | drum-2 shell height |
| ... | ... | ... |
| `drum5_OD` | 100 mm | drum-5 shell outer diameter |
| `drum5_H` | 100 mm | drum-5 shell height |
| `drum1_Z` | 720 mm | drum-1 head Z above base plate |
| `drum2_Z` | 890 mm | drum-2 head Z |
| `drum3_Z` | 1050 mm | drum-3 head Z |
| `drum4_Z` | 1200 mm | drum-4 head Z |
| `drum5_Z` | 1380 mm | drum-5 head Z |
| `bearing_chamfer_deg` | 45 | inward chamfer at top of shell |
| `bearing_chamfer_w` | 1.5 mm | width of bearing contact patch |

## Drum shell — sheet-metal feature recipe

1. Sketch a single straight line of length `drum_H` on the right plane, with a
   vertical reference plane offset `drum_OD/2` from origin.
2. Revolved boss/base → fully revolved → produces a thin-wall cylinder.
3. Use the **Insert Bends** feature with `shell_thk` as fixed face thickness,
   k-factor 0.44, default inside radius 1.5 mm.
4. Add the inward bearing-edge chamfer with a `Sheet-Metal → Edge Flange` →
   negative bend at `bearing_chamfer_deg` over `bearing_chamfer_w`.
5. Add the welded seam-line as a sketch on the rolled-out flat (not a feature,
   just for flat-pattern export).
6. Pattern the lug-hole pair (2 holes per lug × 6 lugs = 12 holes per shell)
   around the circumference, 35 mm above the bottom edge. Hole diameter 5.5 mm
   for M6 lug anchor screws.

## Configurations (design table)

| Config | drum_OD | drum_H |
|---|---|---|
| drum-1 | 300 | 180 |
| drum-2 | 250 | 160 |
| drum-3 | 200 | 140 |
| drum-4 | 150 | 120 |
| drum-5 | 100 | 100 |

## Flat-pattern export

For each config:
1. Right-click flat-pattern → unsuppress.
2. File → Save As → DXF.
3. In DXF Export options:
   - units: **mm**
   - bend lines on layer `BENDS`
   - cuts on layer `CUT`
   - text on layer `ANNO`
   - origin at lower-left corner of flat
4. Save as `drawings/drum-N-flat.dxf`.

## Base plate

- Plasma-cut 380 mm circle from 6 mm 1018.
- Centre socket: 40 mm OD, 30 mm tall, lathe-turned with 25.2 mm bore. TIG-weld
  to base plate centre with a 3 mm fillet all around.
- Four M8 levelling-foot threaded holes at 175 mm from centre, at 0/90/180/270°.

## Internal bracket (×15)

Flat pattern: 20 mm + 20 mm + 20 mm with two 90° bends. Set screw clearance holes
(M4) on the central flat, two holes 12 mm apart on the bracket centerline. Brick
edges to the shell inner wall at 3 tack-weld points.

## Drawings (PDF) — minimum set

- `drawings/00-assembly-overview.pdf` — orthographic + isometric
- `drawings/10-pole-detail.pdf` — pole length, end conditions
- `drawings/20-base-detail.pdf` — plate + socket + foot-hole locations
- `drawings/30-drum-N-detail.pdf` (×5) — shell OD, height, lug-hole pattern,
  bearing-edge section view
- `drawings/40-counter-hoop-N.pdf` (×5) — ring OD, ID, claw-engagement
- `drawings/50-bracket-flat.pdf` — flat pattern with bend lines

PDFs ship as **placeholders** in this blueprint round — no CAD seat was driven.
A future agent with SolidWorks access can populate the directory.
