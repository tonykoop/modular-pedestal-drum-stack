<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Risks — Modular Pedestal Drum Stack

## Acoustic / tuning

- **Smallest drum (drum-5, 100 mm) tunes very loose.** Predicted tension is 215 N/m,
  which is below the typical "tight crack" range and may cause head wrinkles or
  uneven seating. Mitigation: try a thinner 7-mil head (Remo Ambassador X-Thin) —
  tension drops further, but the head stays flatter. Or accept a higher pitch
  (B3 or C4) for drum-5 and re-derive in `wolfram-starter.wl`.
- **Inter-drum sympathetic ringing.** Five drums in close proximity will excite each
  other when one is struck. The rubber pucks between counter hoops help, but if the
  effect is musically distracting, add a felt damping strip inside each shell.
- **Pentatonic vs chromatic tradeoff.** Players expecting a fully chromatic tom
  array will find this instrument limiting. Document the design choice clearly in
  README and on the explorer page.

## Manufacturability

- **Slip-roll minimum radius.** Drum-5 (100 mm OD = 50 mm radius) approaches the
  practical floor for a hobby-shop slip-roll with 1.2 mm CRS. Coupon test
  required: roll a 1.2 mm strip to a 50 mm radius before committing the real
  blank. If the roll springs back too far, drop to 1.0 mm steel for drum-5 only.
- **Bearing edge consistency.** Five identical 45° chamfers on five different
  diameters means setting the lathe or bead-roller up five times. Document the
  setup in `fabrication-plan.md` with a setup chart.
- **TIG seam quality.** Five circumferential butt-welds on rolled cylinders are the
  most-skilled operation in the build. Expect 1 of 5 to need re-work on a first
  attempt. Order 6 shell blanks if possible (1 spare).

## Safety

- **Lug-rod tips exposed.** Tension-rod tips protrude ~5 mm beyond the lugs after
  installation. At eye level (drum-5 is 1380 mm above the base plate) this is a
  poke hazard. Mitigation: cap each rod tip with a rubber cap, or shorten the
  rods to flush + 1 thread.
- **Heavy base plate, head-heavy instrument.** With 14 kg concentrated on a 380 mm
  base, the stack is stable but not bulletproof. A child grabbing drum-5 could
  tip the whole thing. Mitigation: optionally add a counterweight ring inside
  the base socket, or anchor the base to a riser platform.
- **Hot work hazards.** TIG welding 5 seams + base socket + bracket tacks means
  ~1 hour of arc-time. Standard PPE (helmet, gloves, leathers, fume extraction)
  required. Mark in `fabrication-plan.md`.

## Schedule / supply

- **Drumheads:** 100 mm and 150 mm Remo Ambassadors are non-stock for some
  retailers; expect 1–2 week lead time. Order early.
- **Snare lugs:** Generic-brand lugs vary in thread quality. Source from a
  reputable drum-parts retailer (Drum Supply House, Pearl direct).
- **Base plate plasma cut:** Maker Nexus plasma table can cut the 380 mm disc in
  ~3 minutes once nested; queue time may add 1–2 days.

## Sandbox / publishing

- This blueprint was authored by a Codex CLI / Claude pane that may not have
  full network access. If `gh repo create` failed silently, the manager will
  retro-push the repo from outside the sandbox.
- The instrument-showcase library card was added in this same workspace; if the
  showcase repo push fails, the card lives at `card-for-showcase.html` for
  manual install.
