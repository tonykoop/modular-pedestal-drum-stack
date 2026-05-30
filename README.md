<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Modular Pedestal Drum Stack

**Family:** Membranophone (struck single-headed cylindrical drums)
**Class:** Sheet-metal greenfield instrument
**Sprint:** 2026-05-20 sheet-metal-instruments Round 5, Lane 08
**Status:** `v0.1.0-blueprint`
**Readiness:** L1 — concept packet (design intent complete; no fabricated CAD, no DXF flat patterns, no physical build)

A vertical stack of five single-headed sheet-metal drums sharing a central pedestal pole.
Drum diameters step down 300 → 250 → 200 → 150 → 100 mm from bottom to top, giving an
ascending five-pitch chromatic-ish array. Played top-down with a pair of mallets, the
instrument occupies the same footprint as a single floor tom but offers the melodic range
of a kit's worth of toms in one compact column.

## Design thesis

The pedestal column is a structural and acoustic axis: it carries the load of five drums,
isolates each shell from its neighbours via vibration-damped rubber pucks, and ends in a
weighted base that resists the lateral kick of a hard mallet stroke. Each shell is a
**rolled-and-welded sheet-steel cylinder** with a single batter head (synthetic mylar,
bought) tensioned by an external snare-style lug ring. The five shells are deliberately
tuned to a pentatonic-friendly interval set rather than chromatic — the player gets fast
melodic phrases without per-stroke aim, and the visual progression of diameters reinforces
the pitch map. The instrument splits the difference between an octoban tower (single-pole
mounted toms) and a stack of frame drums, with sheet-metal aesthetics throughout.

## Ergonomic envelope

- Total height: 1450 mm (base plate to top drum rim)
- Footprint: 380 mm circular base plate
- Drum-1 (bottom, 300 mm OD) batter head height: 720 mm — standing or stool play
- Drum-5 (top, 100 mm OD) batter head height: 1380 mm — chest level when standing
- Weight: ~14 kg total (base 5 kg, pole 1.5 kg, drums 5×1.4 kg, hardware 0.5 kg)

## Target pitches

Pentatonic ascending — A2 (drum-1), C3 (drum-2), E3 (drum-3), G3 (drum-4), A3 (drum-5).
See `design.md` frontmatter and `validation.csv` for predicted-vs-measured.

## What's in this repo

This is a **blueprint** repo — design intent, parametric model, fabrication plan, and
acoustic predictions. No CAD seat has been driven yet; the `cad/` and `drawings/`
folders ship as placeholders. A competent sheet-metal fabricator with a slip-roll, a TIG
station, and a small mill or lathe should be able to start cutting blanks from
`cut-list.csv` and `bend-table.csv`. See `fabrication-plan.md` for the cut → form → join →
finish sequence keyed to Maker Nexus tooling.

See also `explorer.html` for the studio explorer view.

## Licensing

Dual licensed. See `LICENSE`, `LICENSE-HARDWARE.md` (CERN-OHL-W 2.0 for hardware), and
`LICENSE-DOCS.md` (CC BY 4.0 for documentation).
