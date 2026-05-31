<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Agent Record — Modular Pedestal Drum Stack

- **Runtime:** Claude Opus 4.7 (1M context), Claude Code CLI, sonnet-round-5 lane
- **Skills loaded:** sheet-metal, instrument-maker (per dispatch contract)
- **Sprint:** 2026-05-20 sheet-metal-instruments Round 5 (percussion), Lane 08
- **Date:** 2026-05-21

## qmd queries run + key citations

```bash
qmd search "drum stack pedestal" -c instrument-builds   # no direct hits — fully greenfield
qmd search "snare drum sheet metal" -c instrument-builds
qmd vector-search "drum membrane vibration mode"
qmd vector-search "drum kit shell sheet metal"
```

Top citations consulted:

- `qmd://instrument-builds/docs/textbook/chapters/01-acoustics-foundations.md:348` —
  "Drumheads obey a 2D wave equation; their normal modes are Bessel functions, not
  sines. The fundamental of an ideal circular membrane of radius `a`, areal density
  `σ`, and tension `T` per unit ..." — used as the basis for the Bessel-function
  membrane model in `modular-pedestal-drum-stack-starter.wl`.
- `qmd://instrument-builds/docs/textbook/chapters/03-instrument-families.md:304` —
  drum-family catalogue (djembe, ashiko, conga, dundun, bodhran, frame drums,
  snare/tom) and 12" djembe head sample geometry — used to anchor the diameter
  steps and target tension range.
- `qmd://instrument-wiki/synthesis/wolfram-model-patterns.md:131` — repo-wide list
  of existing Wolfram starters for vessel-flute Helmholtz, ceramic vessel-lab,
  duntong/instrument-m... — modeled the layout of this repo's modular-pedestal-drum-stack-starter.wl
  after these patterns (header, ClearAll, dataset output).
- `qmd://instrument-wiki/index.md:27` — wiki pointers to ceramic-hang,
  ceramic-tongue-drum, wood-shell-tongue-drum entries for adjacent percussion
  designs.
- `qmd://instrument-builds/skills/v3/instrument-maker-v3/build-packets/2026-05-02-tng-001-tongue-drum/assembly-manual.md`
  — reference for assembly-manual format and step granularity.
- `/mnt/c/Users/Tony/Documents/GitHub/handpan/explorer.html` — explorer template
  for Heifer Zephyr design tokens, sidebar TOC, CSV/MD fetch viewers.
- `~/.claude/skills/sheet-metal/SKILL.md` (referenced by SHARED.md) — authority
  chain for cylinder rolling, K-factor, bend allowance, seam strategy.
- `~/.claude/skills/instrument-maker/SKILL.md` (referenced by SHARED.md) —
  authority chain for family/tuning, bore-vs-membrane geometry, validation gates.

No existing Heifer Zephyr build covers a 5-drum pedestal stack — this is a
fully greenfield contribution to the portfolio.

## Major assumptions

- **Pentatonic A-minor as default scale.** A2-C3-E3-G3-A3 chosen over a chromatic
  array to favour fast melodic phrases and reduce per-stroke aim. Tuning can be
  changed at fabricator level with no shell-dimension changes.
- **1.2 mm cold-rolled steel for shells.** Within slip-roll capability for all 5
  diameters (50 mm minimum radius on drum-5 is at the practical floor; a coupon
  test is called out in `risks.md`).
- **Bessel-membrane ideal model with 3% air-load correction.** Predicted
  frequencies do not include shell-membrane coupling beyond a Love thin-cylinder
  ring-mode sanity check. Future agents with FEM access should refine.
- **Standard snare-style lug hardware.** Bought lugs, claws, rods — non-novel,
  reduces fabrication scope to shells + pole + base.
- **Single-head open-shell construction.** Open bottom radiates downward; if
  v0.2 wants more bass on drum-1, consider double-headed conversion.

## Unknowns I'd punt to next round

- DXF flat-pattern files — placeholder `drawings/README.md` only. Needs a
  SolidWorks pass.
- SLDPRT/STEP files in `cad/` — placeholder only.
- Actual photographs — `images/` is empty; `photo-shotlist.md` lists intended
  shots.
- Full FEM coupling between shell and membrane — current model assumes shell is
  acoustically inert below the head's third partial. May not hold for drum-1.
- Pole bending under lateral mallet impact at the top drum — quoted at 5 mm max
  in `validation.csv` based on cantilever beam estimate; needs measurement.
- The 100 mm drum (drum-5) has loose tension and may favor a 7-mil head;
  `modular-pedestal-drum-stack-starter.wl` sensitivity check shows this drops tension below 110 N/m
  which is at the low end of useful — alternative tuning to B3 or C4 is a
  possible v0.2 fork.

## Files produced

23 files across the repo root and `drawings/`, `cad/`, `cnc/`, `wolfram/`,
`learn-to-play/{,fingerings/,scales/,tunes/}`, `images/`:

```
LICENSE
LICENSE-HARDWARE.md
LICENSE-DOCS.md
.gitignore
README.md
design.md
parameters.csv
modular-pedestal-drum-stack-starter.wl
validation.csv
tuning-notes.md
bom.csv
sourcing.csv
cut-list.csv
bend-table.csv
hardware.csv
risks.md
solidworks-plan.md
flat-pattern-checklist.md
fabrication-plan.md
assembly-manual.md
photo-shotlist.md
supplier-rfq.md
visual-bom-brief.md
explorer.html
agent-record.md
card-for-showcase.html
cnc/cnc-plan.json
cnc/operations.csv
cnc/setup-sheet.md
drawings/README.md
cad/README.md
wolfram/README.md
learn-to-play/README.md
learn-to-play/fingerings/strike-zones.md
learn-to-play/scales/pentatonic-warmups.md
learn-to-play/tunes/first-melody.md
```

## Coupon tests recommended

- **Slip-roll minimum radius** — bend a 1.2 mm × 320 mm × 100 mm CRS strip to
  50 mm radius before committing the drum-5 shell blank. If spring-back > 5°,
  drop drum-5 to 1.0 mm stock.
- **Bend allowance verification** — bend one bracket blank (60 × 60 × 1.2 mm)
  with two 90° folds at 20 mm and 40 mm; verify final dimensions match the
  bend-table.csv prediction within 0.3 mm.
- **TIG seam on a shell offcut** — practice the butt-weld seam on a 100 mm
  rolled section of scrap before committing to a shell.
- **Bearing-edge chamfer on lathe** — set up the 4-jaw chuck on one offcut and
  cut a 45° chamfer; verify finish quality and contact-patch width.

## Confidence

- Acoustic targets: **medium** — Bessel model is sound; air-load and stiffness
  corrections roughly cancel; expect ±20 cents from prediction to first tuning.
- Flat patterns: **medium-high** — circumference math is exact; bend allowance
  matches a competent shop's expectations. DXF files are not produced.
- Fabrication plan: **medium-high** — sequence is conventional sheet-metal +
  TIG work; the slip-roll min-radius on drum-5 is the only soft spot.
- BOM: **medium** — sources verified by name; SKU details and pricing are
  ballpark.

## Suggested next-round task

A natural follow-up is **CAD authority**: drive the SolidWorks model with the
design table here, export DXF flat patterns for all 5 shells + brackets + base,
and generate the STEP kit. Also: a `sheet-music` skill pass to extend the
`learn-to-play/tunes/` content with proper notation and audio renderings.

A v0.2-physical round would be the build itself — order materials per
`supplier-rfq.md`, fabricate per `fabrication-plan.md`, fill the `measured`
column of `validation.csv`, and capture photos from `photo-shotlist.md`.
