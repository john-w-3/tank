// 6-Gallon Cube Aquarium Stand — OpenSCAD Model
// All dimensions in inches (actual lumber sizes, not nominal)
//
// To view:  Open in OpenSCAD → press F5 (preview) or F6 (full render)
// To export: F6 to render, then File → Export as STL

/* --- Actual lumber dimensions --- */
t   = 1.5;     // 2x4 thickness (narrow face)
w   = 3.5;     // 2x4 width (wide face)
ply = 0.719;   // 3/4" plywood (actual 23/32")

/* --- Cut list lengths --- */
leg_len    = 32.25;
long_side  = 14;      // front/back frame pieces
short_side = 11;       // left/right frame pieces (fit between long sides)
panel      = 14;       // plywood squares

/* --- Z positions (from floor) --- */
base_z      = 0;
leg_z       = ply;                     // legs rest on base board
btm_frame_z = 10;                      // bottom frame ~10" from floor
shelf_z     = btm_frame_z + w;         // shelf sits on top of bottom frame
top_frame_z = leg_z + leg_len - w;     // top frame flush with leg tops
top_ply_z   = leg_z + leg_len;         // top panel on legs/frame

/* --- Colors --- */
c_wood = [0.76, 0.60, 0.42];
c_ply  = [0.82, 0.71, 0.55];

/* --- Modules --- */

module frame(z) {
    color(c_wood) {
        // Front long side (14" along X)
        translate([0, 0, z])
            cube([long_side, t, w]);
        // Back long side
        translate([0, panel - t, z])
            cube([long_side, t, w]);
        // Left short side (11" along Y, between long sides)
        translate([0, t, z])
            cube([t, short_side, w]);
        // Right short side
        translate([panel - t, t, z])
            cube([t, short_side, w]);
    }
}

module leg(x, y) {
    color(c_wood)
        translate([x, y, leg_z])
            cube([w, t, leg_len]);
}

module plywood_panel(z) {
    color(c_ply)
        translate([0, 0, z])
            cube([panel, panel, ply]);
}

/* --- Assembly --- */

// Base board (on floor, under everything)
plywood_panel(base_z);

// Legs (flush with outside corners, 3.5" along X, 1.5" along Y)
leg(0, 0);                              // front-left
leg(panel - w, 0);                      // front-right
leg(0, panel - t);                      // back-left
leg(panel - w, panel - t);              // back-right

// Top frame (flush with top of legs)
frame(top_frame_z);

// Bottom frame (~10" from floor)
frame(btm_frame_z);

// Top panel (tank sits here)
plywood_panel(top_ply_z);

// Shelf panel (on top of bottom frame)
plywood_panel(shelf_z);

// Computer desk (for scale reference, placed beside stand)
desk_x = panel + 14;   // 10" right of previous position
desk_l = 40;
desk_w = 15;
desk_h = 29.5;
desk_top_t = 1;
desk_leg_r = 0.75;     // leg radius
desk_leg_h = desk_h - desk_top_t;
desk_inset = 1.5;      // leg inset from edges

// Tabletop
color([0.72, 0.53, 0.34])
    translate([desk_x, 0, desk_leg_h])
        cube([desk_l, desk_w, desk_top_t]);

// Legs (black cylinders)
color([0.15, 0.15, 0.15])
for (x = [desk_x + desk_inset, desk_x + desk_l - desk_inset])
    for (y = [desk_inset, desk_w - desk_inset])
        translate([x, y, 0])
            cylinder(h = desk_leg_h, r = desk_leg_r, $fn = 24);

// 6-gallon cube tank (11.5" cube, centered on top panel)
tank_size = 11.5;
tank_offset = (panel - tank_size) / 2;   // 1.25" overhang each side
color([0.6, 0.85, 1.0], 0.3)            // translucent blue
    translate([tank_offset, tank_offset, top_ply_z + ply])
        cube([tank_size, tank_size, tank_size]);
