// Stand Assembly — Step 1: Parts Inventory
//
// Before you start: lay your cut pieces out on the floor (or a workbench)
// roughly like this, and confirm you have all 15 pieces. This is your
// "parts page" — same idea as the first page of a LEGO booklet.
//
// Open in OpenSCAD → press F5 to preview.

/* --- Lumber dimensions (actual, not nominal) --- */
t   = 1.5;     // 2x4 narrow face
w   = 3.5;     // 2x4 wide face
ply = 0.719;   // 3/4" plywood (actual 23/32")

/* --- Cut list --- */
leg_len     = 32.25;
fb_rail_len = 9;    // front/back rails (short)
lr_rail_len = 13;   // left/right rails (longer)
panel_size  = 16;

/* --- Colors (raw, unpainted wood — so pieces read clearly) --- */
c_leg    = [0.78, 0.60, 0.38];   // pine
c_fbrail = [0.82, 0.55, 0.30];   // slightly warmer — visually distinct
c_lrrail = [0.70, 0.52, 0.32];   // slightly cooler
c_ply    = [0.90, 0.76, 0.50];   // plywood, lighter
c_text   = [0.05, 0.05, 0.05];

/* --- Helpers --- */
module board(length, col) {
    color(col) cube([length, w, t]);
}

module plywood_sq() {
    color(c_ply) cube([panel_size, panel_size, ply]);
}

module label(txt, size = 1.3) {
    color(c_text)
        linear_extrude(0.08)
            text(txt, size = size, halign = "left", valign = "bottom");
}

/* --- Layout --- */
pitch   = w + 0.75;   // spacing between stacked boards in a row
row_gap = 4;          // gap between different part groups
tag_gap = 0.6;        // gap between pieces and their label

// ---- Row 1: four legs (the tallest pieces) ----
row1_y = 0;
for (i = [0:3])
    translate([0, row1_y + i * pitch, 0]) board(leg_len, c_leg);
translate([0, row1_y + 4 * pitch + tag_gap, 0])
    label("4x  LEG  —  32.25 in");

// ---- Row 2: four front/back rails (short; will get pocket holes later) ----
row2_y = row1_y + 4 * pitch + row_gap;
for (i = [0:3])
    translate([0, row2_y + i * pitch, 0]) board(fb_rail_len, c_fbrail);
translate([0, row2_y + 4 * pitch + tag_gap, 0])
    label("4x  FRONT/BACK RAIL  —  9 in");

// ---- Row 3: four left/right rails (longer) ----
row3_y = row2_y + 4 * pitch + row_gap;
for (i = [0:3])
    translate([0, row3_y + i * pitch, 0]) board(lr_rail_len, c_lrrail);
translate([0, row3_y + 4 * pitch + tag_gap, 0])
    label("4x  LEFT/RIGHT RAIL  —  13 in");

// ---- Row 4: three plywood squares ----
row4_y = row3_y + 4 * pitch + row_gap;
for (i = [0:2])
    translate([i * (panel_size + 2), row4_y, 0]) plywood_sq();
translate([0, row4_y + panel_size + tag_gap, 0])
    label("3x  PLYWOOD SQUARE  —  16 x 16 in x 3/4 in");
