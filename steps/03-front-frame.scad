// Stand Assembly — Step 3: Front Ladder (2 legs + 2 rails)
//
// Two legs joined by two of the prepped 9" rails — the front face of
// the stand. This is a flat sub-assembly; you build it lying on its
// back on the floor, glue + clamp + drive pocket screws, then leave
// it alone while the glue sets.
//
// Step 4 will be the same thing again with the other 2 legs and the
// other 2 prepped rails (the back ladder). Step 5 ties the two
// ladders together with the 13" side rails.
//
// View shows the ladder standing up — easier to read at a glance.
// In real life you assemble it lying flat with the pocket holes
// facing up.
//
// Open in OpenSCAD → press F5 to preview.

/* --- Lumber dimensions (actual, not nominal) --- */
t           = 1.5;     // 2x4 narrow face
w           = 3.5;     // 2x4 wide face

leg_len     = 32.25;
fb_rail_len = 9;       // 16" outer width − 2 × 3.5" leg = 9" between
panel       = 16;      // outer width of the ladder, leg-edge to leg-edge

/* --- Vertical positions (relative to bottom of leg) --- */
btm_rail_z  = 10;                     // bottom of bottom rail = 10" mark
top_rail_z  = leg_len - w;            // top of top rail flush with leg top

/* --- Pocket hole geometry (matches Step 2) --- */
pkt_angle   = 15;
pkt_inset   = 2.0;
pocket_dia  = 0.375;
pocket_len  = 0.9;
pilot_dia   = 0.20;
tunnel_len  = 2.5;

/* --- Colors --- */
c_leg    = [0.78, 0.60, 0.38];
c_fbrail = [0.82, 0.55, 0.30];
c_screw  = [0.85, 0.10, 0.10];   // pocket screws (red, so they're easy to spot)
c_text   = [0.05, 0.05, 0.05];

/* --- Modules --- */

// Pocket hole tunnel — same geometry as Step 2. Tunnel enters the
// rail's "inside" face (the face pointing toward the back of the
// stand) and exits the end grain.
module pocket_hole_tunnel(dir) {
    rotate([0, dir * (90 + pkt_angle), 0]) {
        cylinder(h = pocket_len, d = pocket_dia, $fn = 28);
        cylinder(h = tunnel_len, d = pilot_dia, $fn = 24);
    }
}

// One front-frame rail with both pocket holes drilled, oriented as
// it sits in the assembled ladder: long axis along X (between the
// legs), 1.5" thickness along Y (front-to-back), 3.5" along Z
// (vertical, on edge).
module front_rail() {
    difference() {
        color(c_fbrail) cube([fb_rail_len, t, w]);

        // Pocket holes drilled from the BACK face of the rail (y = t),
        // angled toward each end so the screw exits the end grain
        // and bites into the leg.
        translate([pkt_inset, t, w])
            rotate([180, 0, 0])      // flip tunnel so it enters from +Y face
                pocket_hole_tunnel(-1);

        translate([fb_rail_len - pkt_inset, t, w])
            rotate([180, 0, 0])
                pocket_hole_tunnel(+1);
    }
}

// A leg standing upright. Wide (3.5") face points toward viewer (-Y),
// narrow (1.5") face is the depth.
module leg() {
    color(c_leg) cube([w, t, leg_len]);
}

// Visualize a driven pocket screw as a small red sphere on the
// inside face of the rail, near each end (where the screw head
// seats in the counterbore).
module pocket_screw_marker(x, y, z) {
    color(c_screw) translate([x, y, z]) sphere(0.18, $fn = 18);
}

module label(txt, size = 1.2) {
    color(c_text)
        linear_extrude(0.08)
            text(txt, size = size, halign = "left", valign = "bottom");
}

/* --- Assembly --- */

// Left leg at x = 0, right leg at x = panel - w. Both legs sit with
// their wide face along X (3.5" wide as you look at the front).
// Front face of the ladder is at y = 0; back face at y = t.

// Left leg
leg();

// Right leg
translate([panel - w, 0, 0]) leg();

// Top rail — between the legs, flush with leg tops
translate([w, 0, top_rail_z]) front_rail();

// Bottom rail — between the legs, bottom edge at the 10" mark
translate([w, 0, btm_rail_z]) front_rail();

// Pocket screw markers — one at each end of each rail, on the
// inside (back) face where the screw head seats.
for (rz = [top_rail_z, btm_rail_z])
    for (ex = [w + pkt_inset, w + fb_rail_len - pkt_inset])
        pocket_screw_marker(ex, t + 0.05, rz + w - 0.4);

/* --- Annotations --- */

// Height marker showing the 10" line where the bottom rail sits
color([0.2, 0.2, 0.2])
    translate([-1.2, -0.1, btm_rail_z - 0.04])
        cube([0.8, 0.05, 0.08]);
translate([-3.5, -0.1, btm_rail_z - 0.6])
    label("10 in", 0.8);

// Title strip below the ladder
translate([0, 0, -2.5])
    label("FRONT LADDER  —  2 legs + 2 prepped 9-in rails  +  4 pocket screws", 1.0);
translate([0, 0, -4.0])
    label("(Step 4 builds an identical back ladder with the other 2 legs + 2 rails)", 0.85);
