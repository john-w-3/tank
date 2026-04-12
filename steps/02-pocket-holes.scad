// Stand Assembly — Step 2: Pocket Holes in the 9" Rails
//
// Grab the four 9" front/back rails from Step 1 (the shortest 2x4
// pieces). Each end gets ONE pocket hole drilled from the "inside"
// face at ~15 degrees, so a pocket screw can exit the end grain and
// bite into the leg later. 4 rails x 2 ends = 8 pocket holes total.
//
// This preview shows the four rails laid out as you'd work them,
// with the pocket hole tunnels cut through for visualization. No
// assembly happens in this step — we're just prepping the joinery
// while the pieces are still loose.
//
// Open in OpenSCAD → press F5 to preview.

/* --- Lumber dimensions (actual, not nominal) --- */
t           = 1.5;    // 2x4 narrow face
w           = 3.5;    // 2x4 wide face
fb_rail_len = 9;      // front/back rail length

/* --- Pocket hole geometry (approximate — for visualization) --- */
pkt_angle = 15;       // Kreg jig angle from vertical
pkt_dia   = 0.375;    // ~3/8" stepped bit
pkt_inset = 0.75;     // distance from end where the bit enters the face
pkt_depth = 3.0;      // bit travel — long enough to punch through end grain

/* --- Colors (match Step 1 so the rails read as the same pieces) --- */
c_fbrail = [0.82, 0.55, 0.30];
c_text   = [0.05, 0.05, 0.05];

/* --- Modules --- */

// Pocket hole tunnel, entering the top (+Z) face and heading down
// and toward +X (dir = +1) or -X (dir = -1), at pkt_angle from vertical.
// Derivation: rotate([0, 180 - dir*pkt_angle, 0]) maps the default
// cylinder axis (+Z) to (dir*sin(a), 0, -cos(a)).
module pocket_hole_tunnel(dir) {
    rotate([0, 180 - dir * pkt_angle, 0])
        cylinder(h = pkt_depth, d = pkt_dia, $fn = 28);
}

module rail_with_pockets() {
    difference() {
        color(c_fbrail) cube([fb_rail_len, w, t]);

        // Hole at the x = 0 end — tunnel tilts toward -X
        translate([pkt_inset, w/2, t + 0.01])
            pocket_hole_tunnel(-1);

        // Hole at the x = fb_rail_len end — tunnel tilts toward +X
        translate([fb_rail_len - pkt_inset, w/2, t + 0.01])
            pocket_hole_tunnel(+1);
    }
}

module label(txt, size = 1.2) {
    color(c_text)
        linear_extrude(0.08)
            text(txt, size = size, halign = "left", valign = "bottom");
}

/* --- Layout: the four prepped rails, stacked like an exploded parts page --- */
pitch   = w + 1.0;   // extra gap so the holes are easy to see
tag_gap = 0.6;

for (i = [0:3])
    translate([0, i * pitch, 0]) rail_with_pockets();

translate([0, 4 * pitch + tag_gap, 0])
    label("4x  FRONT/BACK RAIL  —  9 in  —  1 pocket hole per end");

translate([0, 4 * pitch + tag_gap + 2.0, 0])
    label("holes all on the SAME wide face of each rail", 0.9);
