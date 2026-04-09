# 6-Gallon Cube Stand (16×16) — Cut List & Build Plan

Design: Solid legs at the corners with rails between them, shelf with corner notches, ~34" tall, 16×16" top. Clean, simple look.

[3D model (OpenSCAD)](stand-model.scad)

## Shopping List — One Trip to Lowe's / Home Depot

- [ ] 3× 2×4 × 8' studs — sight down each board and reject any that are bowed or twisted
- [ ] 3/4" plywood — ask staff to cut three 16×16" squares (free, they have a panel saw)
- [ ] Box of 2.5" wood screws (#8 or #9, ~25 count is plenty)
- [ ] Titebond II or III wood glue (small bottle)
- [ ] Can of black spray paint (paint+primer combo)
- [ ] Can of water-based polyurethane (satin or semi-gloss) — clear coat goes over the paint (water-based won't react with spray paint like oil-based can)
- [ ] Sandpaper — one sheet of 120 grit, one sheet of 220 grit
- [ ] Cheap foam mat or yoga mat (dollar store works too)
- [ ] Plastic boot tray or waterproof mat (~$5-10, goes under the stand on carpet)

### Confirm tool access (brother-in-law)

- [ ] Saw (miter saw ideal, circular saw or hand saw fine)
- [ ] Jigsaw (for shelf corner notches — or use a hand saw)
- [ ] Drill/driver
- [ ] Drill bit set (need one bit slightly thinner than the screws, for pre-drilling)
- [ ] 2+ clamps (makes squaring frames much easier — hold pieces in place while glue sets)

If no drill available, buy a basic cordless drill/driver (~$40-60) — useful to own regardless.

---

## Materials (~$25-35)

| Qty | Material | Purpose |
|-----|----------|---------|
| 3 | 2×4 × 8' studs | Legs + rails |
| 1 | 3/4" plywood, 2×4' piece (or have a 4×8 sheet cut at the store) | Top, shelf + base board |
| 1 | Box of 2.5" wood screws (#8 or #9) | Assembly |
| 1 | Wood glue (Titebond II or III — water resistant) | Joints |
| 1 | Can of black spray paint (paint+primer combo) | Color coat |
| 1 | Can of water-based polyurethane | Seal against water (water-based is safe over spray paint) |
| 2 | Sandpaper — 120 grit + 220 grit (one sheet each) | Smoothing before paint |
| 1 | Thin foam mat or yoga mat scrap | Goes between stand top and tank |
| 1 | Plastic boot tray or waterproof mat | Goes under the stand to protect carpet from drips |

Home Depot / Lowe's will cut the plywood for you at the store for free — ask them to cut three 16×16" squares (top, shelf, and base board for carpet). Three 16" pieces fit exactly across a 48" board.

## Cut List

### From the 2×4s:

| Piece | Length | Qty | Purpose |
|-------|--------|-----|---------|
| Legs | 32.25" | 4 | Solid vertical legs, flush with outside corners |
| Front/back rails | 9" | 4 | Span between legs along the front and back (2 top + 2 bottom) |
| Left/right rails | 13" | 4 | Span between legs along the sides (2 top + 2 bottom) |

That's 12 cuts total from three 8' studs.

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
  front view                          side view (thin leg edge faces front)

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

### Step 1 — Cut four legs

- Cut four 32.25" pieces from the 2×4s
- These run the full height of the stand — no breaks at the shelf

### Step 2 — Cut eight rails

- Four 9" pieces (front/back rails, top + bottom)
- Four 13" pieces (left/right rails, top + bottom)

### Step 3 — Attach rails to legs (top frame first)

- Stand two front legs upright, spaced 16" apart (outside edge to outside edge)
- Glue + screw the 9" front rail between them, flush with the top of the legs
- The rail sits between the legs — its ends butt against the inside faces of the legs
- Pre-drill to avoid splitting, then two screws through each leg into the rail end
- Repeat for the back rail with the two back legs
- Connect front and back assemblies with the two 13" side rails
- Check for square — measure diagonals, they should be equal

### Step 4 — Attach bottom rails

- Measure 10" up from the bottom of each leg, mark it
- Attach all four bottom rails the same way as the top
- These support the shelf

### Step 5 — Attach plywood panels

- Set the 16×16 top panel on the top frame, flush with the leg tops
- Glue + screw down every 4-5 inches around the edge
- Notch the shelf panel corners (3.5" × 1.5" at each corner)
- Drop the shelf panel onto the bottom rails — it fits around the legs
- Glue + screw the shelf to the rails

### Step 6 — Finish

- Sand everything smooth (120 grit, then 220)
- Apply 2-3 light coats of black spray paint, letting each coat dry before the next
- Once paint is fully dry, apply 2-3 coats of polyurethane over the paint — this seals and protects
- Pay extra attention to the top — that's where water will drip
- Give plywood edges an extra coat or two — cut edges absorb water like a sponge

### Step 7 — Place (on carpet)

- Lay a plastic boot tray or waterproof mat where the stand will go — catches drips before they hit carpet
- Set the base board (third plywood square) on top of the tray — this gives the legs a flat, solid surface so they don't sink unevenly into the carpet pad
- Set the stand on the base board
- Check level with a phone level app or a real level — shim between base board and stand legs if needed
- Cut a piece of foam mat to ~14×14", place on top, set tank on foam

## Tips for a First-Timer

- **Pre-drill everything.** 2×4s split easily near the ends. Use a drill bit slightly thinner than your screws
- **Glue + screws > screws alone.** The glue is doing most of the structural work; screws just hold things while it dries
- **Check for square.** After assembling each frame, measure diagonals — if they're equal, it's square. If not, nudge it before the glue sets
- **Don't rush the poly.** Two thin coats beats one thick coat. Thick coats drip and stay tacky
- **If it feels wobbly, add a back panel.** Tack a scrap of 1/4" plywood across the back of the frame — eliminates any side-to-side racking. Not strictly necessary for a light tank, but cheap insurance

The actual hands-on time is maybe 2-3 hours. The polyurethane drying is the slow part (overnight between coats).
