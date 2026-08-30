// 6-Gallon Cube Aquarium Stand — OpenSCAD Model (16×16 version)
// All dimensions in inches (actual lumber sizes, not nominal)
//
// Design: solid full-height legs at outside corners, rails between legs,
//         shelf panel notched around legs.
//
// To view:  Open in OpenSCAD → press F5 (preview) or F6 (full render)
// To export: F6 to render, then File → Export as STL

/* --- Actual lumber dimensions --- */
t   = 1.5;     // 2x4 thickness (narrow face)
w   = 3.5;     // 2x4 width (wide face)
ply = 0.719;   // 3/4" plywood (actual 23/32")

/* --- Cut list lengths --- */
leg_len     = 32.25;
fb_rail_len = 16 - 2*w;   // 9"  — front/back rails (fit between legs along X)
lr_rail_len = 16 - 2*t;   // 13" — left/right rails (fit between legs along Y)
panel       = 16;          // plywood squares

/* --- Z positions (from floor) --- */
base_z      = 0;
leg_z       = ply;                     // legs rest on base board
btm_frame_z = leg_z + 10;              // bottom frame 10" up from leg bottom (matches build plan)
shelf_z     = btm_frame_z + w;         // shelf sits on top of bottom frame
top_frame_z = leg_z + leg_len - w;     // top frame flush with leg tops
top_ply_z   = leg_z + leg_len;         // top panel on legs/frame

/* --- Colors --- */
c_wood  = [0.1, 0.1, 0.1];
c_ply  = [0.1, 0.1, 0.1];

/* --- Modules --- */

module frame(z) {
    color(c_wood) {
        // Front rail (between FL and FR legs, along X)
        translate([w, 0, z])
            cube([fb_rail_len, t, w]);
        // Back rail
        translate([w, panel - t, z])
            cube([fb_rail_len, t, w]);
        // Left rail (between FL and BL legs, along Y)
        translate([0, t, z])
            cube([t, lr_rail_len, w]);
        // Right rail
        translate([panel - t, t, z])
            cube([t, lr_rail_len, w]);
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

// Shelf panel — 16×16 square with a w × t (3.5" × 1.5") notch at each
// corner so it drops around the legs and lands on the bottom frame.
// Notch positions are derived from the leg positions below, so the two
// can't drift apart.
module shelf_panel(z) {
    color(c_ply)
        translate([0, 0, z])
            difference() {
                cube([panel, panel, ply]);
                for (nx = [0, panel - w])
                    for (ny = [0, panel - t])
                        translate([nx, ny, -0.1])
                            cube([w, t, ply + 0.2]);
            }
}

/* --- Screw markers (red dots on outside surfaces) --- */
module screw_markers() {
    sr   = 0.25;                    // marker radius
    tp_z = top_ply_z + ply + sr;    // top panel top surface + offset
    sh_z = shelf_z + ply + sr;      // shelf top surface + offset

    color("red") {
        /* Rail-to-leg joints: 1 screw per joint × 8 joints × 2 frames.
           Pocket and through screws sit at the same height but never
           meet — the pocket screw stops ~1" short of the through-screw
           line inside the leg */
        for (fz = [btm_frame_z, top_frame_z]) {
            sz = fz + w / 2;  // centered in rail height
            po = 2.0;         // pocket hole inset from rail end (Kreg entry, matches step models)
            // Front/back rails — pocket screws on inside face of rail
            // Front rail inside face (y = t), near FL and FR ends
            translate([w + po,              t + sr,       sz]) sphere(sr, $fn=12);
            translate([w + fb_rail_len - po, t + sr,       sz]) sphere(sr, $fn=12);
            // Back rail inside face (y = panel - t), near BL and BR ends
            translate([w + po,              panel-t-sr,   sz]) sphere(sr, $fn=12);
            translate([w + fb_rail_len - po, panel-t-sr,   sz]) sphere(sr, $fn=12);
            // Left/right rails — screws through ±Y leg faces
            translate([t/2,       -sr,       sz]) sphere(sr, $fn=12);
            translate([panel-t/2, -sr,       sz]) sphere(sr, $fn=12);
            translate([t/2,       panel+sr,  sz]) sphere(sr, $fn=12);
            translate([panel-t/2, panel+sr,  sz]) sphere(sr, $fn=12);
        }

        /* Top panel → top frame rails (8 screws, down from top) */
        for (fx = [w + fb_rail_len*0.33, w + fb_rail_len*0.67]) {
            translate([fx, t/2,       tp_z]) sphere(sr, $fn=12);
            translate([fx, panel-t/2, tp_z]) sphere(sr, $fn=12);
        }
        for (fy = [t + lr_rail_len*0.33, t + lr_rail_len*0.67]) {
            translate([t/2,       fy, tp_z]) sphere(sr, $fn=12);
            translate([panel-t/2, fy, tp_z]) sphere(sr, $fn=12);
        }

        /* Shelf → bottom frame rails (8 screws, down from top of shelf) */
        for (fx = [w + fb_rail_len*0.33, w + fb_rail_len*0.67]) {
            translate([fx, t/2,       sh_z]) sphere(sr, $fn=12);
            translate([fx, panel-t/2, sh_z]) sphere(sr, $fn=12);
        }
        for (fy = [t + lr_rail_len*0.33, t + lr_rail_len*0.67]) {
            translate([t/2,       fy, sh_z]) sphere(sr, $fn=12);
            translate([panel-t/2, fy, sh_z]) sphere(sr, $fn=12);
        }
    }
}

/* --- Assembly --- */

// Stand rotated 90° so thin leg edges face front
translate([panel/2, panel/2, 0])
rotate([0, 0, 90])
translate([-panel/2, -panel/2, 0])
{
    // Base board (on floor, under everything)
    plywood_panel(base_z);

    // Legs (solid full-height, flush with outside corners)
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

    // Shelf panel (notched around legs, sits on bottom frame)
    shelf_panel(shelf_z);

    // Screw markers
    screw_markers();

    // 6-gallon cube tank (11.5" cube, centered on top panel)
    tank_size = 11.5;
    tank_offset = (panel - tank_size) / 2;
    color([0.6, 0.85, 1.0], 0.3)
        translate([tank_offset, tank_offset, top_ply_z + ply])
            cube([tank_size, tank_size, tank_size]);
}

// Banner — matches the per-step models in steps/*.scad, so any preview
// says what you're looking at when opened on its own.
translate([panel/2, -0.5, 48])
    color([0.10, 0.30, 0.55])
        rotate([90, 0, 0])
            linear_extrude(0.10)
                text("COMPLETE STAND  —  all 8 steps", size = 2.0,
                     halign = "center", valign = "bottom");

// Computer desk (for scale reference, placed beside stand)
desk_x = panel + 14;   // gap right of stand
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
