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

/* --- Pocket hole geometry (approximate — for visualization) ---
 *
 * Kreg pocket hole for 1.5" stock:
 *   - bit enters the wide face about 2" from the end
 *   - bit travels at ~15 degrees from the face (i.e., nearly along
 *     the board, tipped slightly down into it), NOT 15 from vertical
 *   - with that geometry the bit exits the end grain near the middle
 *     of the board's thickness — which is the whole point of the jig
 *
 * I model the hole as a stepped tunnel: a short fat counterbore (the
 * "pocket" where the screw head sits) followed by a long skinny pilot
 * that continues out through the end grain. */
pkt_angle  = 15;      // bit tilt from the board's face (degrees)
pkt_inset  = 2.0;     // distance from end where the bit enters the face

pocket_dia = 0.375;   // counterbore / "pocket" diameter (~3/8")
pocket_len = 0.9;     // counterbore depth along the bit axis

pilot_dia  = 0.20;    // pilot hole diameter
tunnel_len = 2.5;     // total tunnel length — punches through end grain

/* --- Colors (match Step 1 so the rails read as the same pieces) --- */
c_fbrail = [0.82, 0.55, 0.30];
c_text   = [0.05, 0.05, 0.05];

/* --- Modules --- */

// Pocket hole tunnel, entering the top (+Z) face and heading mostly
// along the rail (toward +X if dir=+1, toward -X if dir=-1), tipped
// pkt_angle degrees down from horizontal. This is the real Kreg
// geometry: bit nearly parallel to the face, exiting at the end grain.
//
// Derivation: rotate([0, dir*(90+pkt_angle), 0]) maps the default
// +Z cylinder axis to (dir*cos(a), 0, -sin(a)).  That gives a
// tunnel that goes cos(15)≈0.97 along the rail for every sin(15)≈0.26
// it drops into the board.
module pocket_hole_tunnel(dir) {
    rotate([0, dir * (90 + pkt_angle), 0]) {
        // 3/8" counterbore — the "pocket" where the screw head sits
        cylinder(h = pocket_len, d = pocket_dia, $fn = 28);
        // narrower pilot hole — continues out through the end grain
        cylinder(h = tunnel_len, d = pilot_dia, $fn = 24);
    }
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
