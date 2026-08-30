---
title: "Cut List & Build Plan (16×16)"
---

# 6-Gallon Cube Stand (16×16) — Cut List & Build Plan

Design: Solid legs at the corners with rails between them, shelf with corner notches, ~34" tall, 16×16" top. Clean, simple look.

[3D model (OpenSCAD)](stand-model.scad)

## Shopping List — One Trip to Lowe's / Home Depot

- [ ] 3× 2×4 × 8' studs — sight down each board and reject any that are bowed or twisted
- [ ] 3/4" plywood — ask staff to cut three 16×16" squares (free, they have a panel saw). Saw kerf means the third square comes out ~15¾" — that's fine, that one becomes the base board
- [ ] 1-lb box of 3" wood screws (#8 or #9, ~50 count) — for side rails and plywood panels (uses ~24; the rest are good to have)
- [ ] Small box of 2.5" coarse-thread pocket hole screws (~25 count) — for front/back rails (uses 8). Confirm the box ships with a #2 square (Robertson) driver bit, or grab one separately
- [ ] Titebond II or III wood glue (small bottle)
- [ ] Can of black spray paint (paint+primer combo)
- [ ] Can of water-based polyurethane (satin or semi-gloss) — clear coat goes over the paint (water-based won't react with spray paint like oil-based can). **Wipe-on poly is more forgiving for a beginner** — no brush, no visible brush marks
- [ ] Foam brush or chip brush (skip if you got wipe-on poly)
- [ ] Sandpaper — one sheet of 120 grit, one sheet of 220 grit
- [ ] Cheap foam mat or yoga mat (dollar store works too)
- [ ] Plastic boot tray or waterproof mat (~$5-10, goes under the stand on carpet)
- [ ] Bundle of tapered cedar shims (~$4) — for leveling the stand once it's in place

### Confirm tool access (brother-in-law)

- [ ] Saw (miter saw ideal, circular saw or hand saw fine)
- [ ] Jigsaw (for shelf corner notches — or use a hand saw)
- [ ] Drill/driver
- [ ] Drill bit set (need one bit slightly thinner than the screws, for pre-drilling)
- [ ] Pocket hole jig (Kreg makes a basic one for ~$25 — or borrow one)
- [ ] 1-2 clamps that open to ≥16" (makes squaring frames much easier — hold pieces in place while glue sets). One clamp spanning both legs closes both ends of a rail at once, so one is enough; a second is optional
- [ ] Speed square or framing square (for square-checking joints as you assemble)
- [ ] Tape measure and pencil

If no drill available, buy a basic cordless drill/driver (~$40-60) — useful to own regardless.

---

## Materials (~$25-35)

| Qty | Material | Purpose |
|-----|----------|---------|
| 3 | 2×4 × 8' studs | Legs + rails |
| 1 | 3/4" plywood, 2×4' piece (or have a 4×8 sheet cut at the store) | Top, shelf + base board |
| 1 | 1-lb box of 3" wood screws (#8 or #9, ~50 ct) | Side rails, plywood panels (uses ~24) |
| 1 | Box of 2.5" coarse-thread pocket hole screws (~25 ct) | Front/back rail-to-leg joints (uses 8) |
| 1 | Wood glue (Titebond II or III — water resistant) | Joints |
| 1 | Can of black spray paint (paint+primer combo) | Color coat |
| 1 | Can of water-based polyurethane | Seal against water (water-based is safe over spray paint) |
| 2 | Sandpaper — 120 grit + 220 grit (one sheet each) | Smoothing before paint |
| 1 | Thin foam mat or yoga mat scrap | Goes between stand top and tank |
| 1 | Plastic boot tray or waterproof mat | Goes under the stand to protect carpet from drips |
| 1 | Bundle of tapered cedar shims | Leveling the legs on an uneven floor |

Home Depot / Lowe's will cut the plywood for you at the store for free — ask them to cut three 16×16" squares (top, shelf, and base board for carpet). One kerf note: each saw cut eats about ⅛", so three full 16" squares don't quite fit across a 48" board — the third piece comes out around 15¾". That's fine: designate the short one as the base board, where the exact size never shows.

## Cut List

### From the 2×4s:

| Piece | Length | Qty | Purpose |
|-------|--------|-----|---------|
| Legs | 32.25" | 4 | Solid vertical legs, flush with outside corners |
| Front/back rails | 9" | 4 | Span between legs in the front and back ladders (2 top + 2 bottom) |
| Left/right rails | 13" | 4 | Connect the two ladders (2 top + 2 bottom) |

That's 12 cuts total from three 8' studs. The legs run the full height of the stand — no breaks at the shelf.

A leg is 32.25", so only two fit per 8' stud — that's what sets the count at three studs. Two studs give you the four legs plus ~31" of offcut each; the third covers the rails with plenty left over.

**A note on the rail names.** They describe the stand *as you assemble it*: the 9" rails go in the front and back ladders, the 13" rails run left-to-right between them. Step 8 then rotates the finished stand a quarter turn so the screw heads face sideways — so on the stand as it finally sits, the 9" rails are on the **left and right**, and the 13" rails face **front and back**. The names refer to assembly, not to the placed stand.

### From the plywood (3/4"):

| Piece | Size | Qty | Purpose |
|-------|------|-----|---------|
| Top panel | 16" × 16" | 1 | Tank sits on this |
| Shelf panel | 16" × 16" (with corner notches) | 1 | Lower shelf for supplies — notch each corner 3.5" × 1.5" to fit around the legs |
| Base board | 16" × 16" | 1 | Goes under the legs on carpet — prevents uneven sinking |

16" gives you ~2.25" of overhang on each side of the 11.5" tank — generous margin, more room for equipment on top.

### Shelf notch detail

Cut a 3.5" × 1.5" rectangle out of each corner so the shelf fits around the legs:

```
    3.5"
   ┌───┐
   │   │ 1.5"
   │   └──────────────────────────┐
   │                              │
   │                              │
   │         16" × 16"           │
   │       shelf panel            │
   │                              │
   │                              │
   │   ┌──────────────────────────┘
   │   │
   └───┘
   (other two corners same)
```

A jigsaw makes quick work of these. A hand saw works too — just two straight cuts per corner.

## Assembly

```
  ladder face (a side, once placed)    display face (thin leg edges; faces front)

  ┌──────────────────────┐            ┌──────────────────┐
  │     plywood top      │            │   plywood top    │
  ╞══╤════════════════╤══╡            ╞══╤════════════╤══╡
  │  │   top rails    │  │            │  │  top rails │  │
  │  ├────────────────┤  │            │  ├────────────┤  │
  │  │                │  │            │  │            │  │
  │  │                │  │            │  │            │  │
  │  │                │  │            │  │            │  │
  │  │                │  │            │  │            │  │
  ╞══╧═╤══════════╤═══╧══╡           │  │            │  │
  │    │ply shelf │       │           │  │            │  │
  ╞══╤═╧══════════╧═══╤══╡           ╞══╧═╤════════╤═╧══╡
  │  │   btm rails    │  │           │    │  shelf │    │
  │  ├────────────────┤  │           ╞══╤═╧════════╧═╤══╡
  │  │                │  │           │  │  btm rails │  │
  │  │                │  │           │  ├────────────┤  │
  │  │                │  │           │  │            │  │
  └──┴────────────────┴──┘           └──┴────────────┴──┘
  ┌──────────────────────┐           ┌──────────────────┐
  │     base board       │           │    base board    │
  └──────────────────────┘           └──────────────────┘

  ← legs are the outer │  │ pieces, continuous top to bottom →
```

```
  top-down view (rails between legs)

  ┌───┬─────────┬───┐
  │leg│  front  │leg│
  │   │  rail   │   │
  ├───┘         └───┤
  │left           rt│
  │rail          rail│
  │                  │
  │left           rt│
  │rail          rail│
  ├───┐         ┌───┤
  │leg│  back   │leg│
  │   │  rail   │   │
  └───┴─────────┴───┘
```

> **Approach:** make the 12 cuts from the Cut List first, then build the front and back as flat "ladder" sub-assemblies, stand them up, and connect them with the side rails. Doing it this way means each ladder lies flat on the floor while the glue sets — gravity holds the joints, clamping is easy, and you never have to assemble in 3D. Step numbers here match the [wizard](wizard.html), which walks each step in detail with a 3D preview; if one format ever needs finer granularity than the other, a step splits into lettered sub-steps (5a, 5b, …) instead of renumbering.

### Step 1 — Lay out and inventory the pieces

- All 15 cut pieces in front of you: 4 legs (32.25"), 4 front/back rails (9"), 4 left/right rails (13"), 3 plywood squares (16×16")
- Sort the 9s and 13s into separate piles — they look similar, and mixing them up mid-assembly costs time
- Check that pieces within each group match in length; the wizard's Step 1 has the full checklist

### Step 2 — Drill pocket holes in the four 9" rails

- Each 9" rail gets one pocket hole at each end (8 holes total) on the same wide face — that's the "inside" face when assembled
- Set the Kreg jig for 1½" stock, set the bit's stop collar at the 1½" mark
- The 13" rails, legs, and plywood squares get **no** pocket holes — only the 9s

### Step 3 — Build the front ladder (2 legs + 2 prepped 9" rails)

- Lay two legs flat on their wide faces, parallel, with their tops aligned
- The two prepped 9" rails go *between* the legs, on edge, pocket holes facing up
- **Top rail:** flush with the top ends of both legs
- **Bottom rail:** measure **10" up from the bottom end of each leg** and mark — the rail's bottom edge sits on that line
- Glue only the cut end grain of each rail where it butts into the leg — a thin spread-out bead on the 1½" × 3½" end face, enough for slight squeeze-out → slide rail into place → clamp *one* clamp across the full 16" width, jaws on the outer face of each leg (that closes both ends of the rail at once) → square-check → drive a 2.5" pocket screw into each pocket hole. 4 pocket screws total.
- Leave the ladder undisturbed for ~30 minutes while glue sets

### Step 4 — Build the back ladder

- Identical to Step 3, using the other 2 legs + the other 2 prepped 9" rails
- 4 more pocket screws (8 total across both ladders)

### Step 5 — Connect the two ladders with the 13" side rails

- Turn the ladders so their pocket-hole faces point at each other — spin one 180° about its **vertical** axis, not end over end. The 13" gap between them is set by the rail length; you never measure it
- **Build this one lying down, not standing up.** Lay one ladder flat with its pocket face up, stand the four 13" rails on end in position, lower the second ladder onto them, clamp, screw the four joints you can reach, then flip the assembly and do the other four. Dry-fit the whole stack once before any glue goes on
- **Left/right rails (13" pieces) — through-screws:** glue the rail's end grain, position it between the legs, then pre-drill and drive one 3" screw through the leg into the rail end. One screw per end.
- **Height: match the ladders, not the drawing.** Top side rails go flush with the top of the ladders' top rails. Bottom side rails line up with the **top edge of the ladders' bottom rails** — measure that edge on the ladder you already built rather than re-measuring 10" from the leg bottom. If your bottom rail landed a hair off 10", the side rails need to be off by the same hair: all four bottom rails have to sit in one plane or the shelf rocks. Lay a straightedge across from ladder to ladder to confirm before screwing.
- **Drill through the leg's wide (3½") face** — the same face the ladder rails sit on — ¾" in from the leg's outer side edge, centered on the rail's height. The screw passes through the leg's 1½" thickness into the rail's end grain. (Not the narrow 1½" side face — the rail isn't behind that one.)
- 4 side rails × 2 ends = **8 through-screws**. The heads land on the two ladder faces; that's expected — Step 8 turns those faces to the sides when the stand is placed
- Check for square — measure diagonals across the top frame; they should be equal. Same for the bottom frame.

### Step 6 — Attach plywood panels

- Set the 16×16 top panel on the top frame, flush with the leg tops
- Glue + screw down into the frame rails (two 3" screws per rail = 8 total)
- Notch the shelf panel corners (3.5" × 1.5" at each corner)
- Drop the shelf panel onto the bottom rails — it fits around the legs
- Glue + screw the shelf to the rails (two 3" screws per rail = 8 total)

### Step 7 — Finish

- Sand everything smooth (120 grit, then 220)
- Apply 2-3 light coats of black spray paint, letting each coat dry before the next
- Once paint is fully dry, apply 2-3 coats of polyurethane over the paint — this seals and protects
- Pay extra attention to the top — that's where water will drip
- Give plywood edges an extra coat or two — cut edges absorb water like a sponge

### Step 8 — Place (on carpet)

- Lay a plastic boot tray or waterproof mat where the stand will go — catches drips before they hit carpet
- Set the base board (third plywood square) on top of the tray — this gives the legs a flat, solid surface so they don't sink unevenly into the carpet pad
- **Don't screw the base board to the legs.** The stand's weight holds it in place — roughly 110 lbs all in (~35 lbs of stand, ~75 lbs of tank once it's filled and scaped). Leaving it loose lets you slide shims between the board and individual legs if the carpet compresses unevenly over time.
- Set the stand on the base board
- **Orientation:** turn the stand so the two ladder faces (the ones with the through-screw heads) point left/right. The face with the thin leg edges and a 13" rail faces front — no visible screw heads from the front (this is the orientation the 3D model shows)
- Level and shim the stand — see [Leveling & Shimming](#leveling--shimming) below
- Cut a piece of foam mat to ~14×14", place on top, set tank on foam

## Leveling & Shimming

Floors are never flat, and carpet makes it worse. Shimming is normal — it's how every stand gets set, not a sign you built it wrong.

There are two separate problems, and only one of them is structural.

**Rocking — fix this.** Three legs touch, the fourth floats. The whole load then rides on a diagonal and slowly racks the frame. Press down on each corner in turn: if any corner dips, it's rocking.

**Tilt — mostly cosmetic.** All four legs bear weight, but the stand leans. You'll see it in the water line more than anywhere else. Worth correcting for looks; it isn't hurting the joints.

### How to shim

- **Use tapered cedar shims** (or hardwood scraps). Not cardboard, not folded paper, not a magazine — they compress over a few months and the rocking comes back
- Shim **between the base board and the leg**, not under the base board. That's why the base board isn't screwed down (Step 8)
- Slide the shim under the **whole leg footprint**, not just the outer edge — a leg balanced on a wedge tip is still a rocking leg
- Two shims driven in from opposite sides give a flat, parallel pad instead of a wedge. This is the better way to do it
- Snap or cut the excess flush with the leg once you're happy
- Re-check: level on the **top panel**, both directions, then push each corner again to confirm zero rock

### Let carpet settle first

Carpet and pad compress under load. Set the stand up, put a couple gallons of water in the tank (or something equally heavy), and leave it a day. Then re-check level and re-shim. Doing it once at the start and once after settling saves you chasing it later.

### What shimming can't fix

If the **stand top itself** isn't flat — a twisted rail, a cupped plywood top — no amount of floor shimming helps. Lay a straightedge across the top before the tank goes on. That's what the foam mat is for: it absorbs small high spots so the tank bottom loads evenly instead of bearing on one ridge. Getting the frames square during assembly (Step 3-5 diagonal check) is what keeps this from being a problem.

## Tips for a First-Timer

- **Pre-drill everything.** 2×4s split easily near the ends. Use a drill bit slightly thinner than your screws
- **Glue + screws > screws alone.** The glue is doing most of the structural work; screws just hold things while it dries
- **Check for square.** After assembling each frame, measure diagonals — if they're equal, it's square. If not, nudge it before the glue sets
- **Don't rush the poly.** Two thin coats beats one thick coat. Thick coats drip and stay tacky
- **If it feels wobbly, add a back panel.** Tack a scrap of 1/4" plywood across the back of the frame — eliminates any side-to-side racking. Not strictly necessary for a light tank, but cheap insurance

The actual hands-on time is maybe 2-3 hours. The polyurethane drying is the slow part (overnight between coats).
