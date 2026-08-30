// Stand Assembly — Step 5: Connect the Ladders (4 × 13" side rails)
//
// The two flat ladders from Steps 3 and 4 stand parallel, 13" apart,
// and four 13" rails bridge the gap — two at the top frame, two at
// the bottom frame. Each rail end takes one 3" screw driven through
// the leg's wide face from outside.
//
// Ladders shown translucent (already built in Steps 3-4).
// Side rails shown solid — the pieces you're adding now.
//
// Note the assembly order the guide recommends: this box gets built
// lying on its side, not standing up. The model shows the finished
// orientation because that's easier to read.
//
// Open in OpenSCAD → press F5 to preview.

/* --- Lumber dimensions (actual, not nominal) --- */
t           = 1.5;     // 2x4 narrow face
w           = 3.5;     // 2x4 wide face

leg_len     = 32.25;
fb_rail_len = 9;            // 16 - 2*3.5 — front/back rails (in the ladders)
lr_rail_len = 16 - 2*t;     // 13" — side rails, the pieces added this step
panel       = 16;           // outer width and depth

/* --- Vertical positions (relative to bottom of leg) --- */
btm_rail_z  = 10;                  // bottom edge of every bottom rail
top_rail_z  = leg_len - w;         // top rails flush with leg tops

/* --- Pocket hole geometry (matches Steps 2-4) --- */
pkt_angle   = 15;
pkt_inset   = 2.0;
pocket_dia  = 0.375;
pocket_len  = 0.9;
pilot_dia   = 0.20;
tunnel_len  = 2.5;

/* --- Through-screw geometry (this step) --- */
scr_inset   = 0.75;    // in from the leg's OUTER side edge, = half of t

/* --- Colors --- */
c_leg      = [0.78, 0.60, 0.38, 0.30];   // translucent — built in Steps 3-4
c_fbrail   = [0.82, 0.55, 0.30, 0.30];
c_lrrail   = [0.35, 0.55, 0.75];         // solid — added in Step 5
c_screw    = [0.85, 0.10, 0.10];         // this step's 3" through-screws
c_screw_d  = [0.85, 0.10, 0.10, 0.25];   // earlier pocket screws, dimmed
c_text     = [0.05, 0.05, 0.05];

/* --- Modules --- */

module pocket_hole_tunnel_onedge(dir) {
    rotate([0, 0, dir * (90 - pkt_angle)])
        rotate([90, 0, 0]) {
            cylinder(h = pocket_len, d = pocket_dia, $fn = 28);
            cylinder(h = tunnel_len, d = pilot_dia, $fn = 24);
        }
}

module rail_with_pockets() {
    difference() {
        color(c_fbrail) cube([fb_rail_len, t, w]);
        translate([pkt_inset, t + 0.01, w/2])
            pocket_hole_tunnel_onedge(-1);
        translate([fb_rail_len - pkt_inset, t + 0.01, w/2])
            pocket_hole_tunnel_onedge(+1);
    }
}

// One flat ladder: 2 legs + 2 pocket-holed 9" rails, lying in the XZ
// plane with its outer face at y = 0 and pocket holes on y = t.
module ladder() {
    color(c_leg) cube([w, t, leg_len]);
    color(c_leg) translate([panel - w, 0, 0]) cube([w, t, leg_len]);
    translate([w, 0, top_rail_z]) rail_with_pockets();
    translate([w, 0, btm_rail_z]) rail_with_pockets();
}

module pocket_screw_markers() {
    for (rz = [top_rail_z, btm_rail_z])
        for (ex = [w + pkt_inset, w + fb_rail_len - pkt_inset])
            color(c_screw_d)
                translate([ex, t + 0.05, rz + w/2]) sphere(0.18, $fn = 18);
}

// A 13" side rail: long axis along Y (bridging the two ladders),
// 1.5" thickness along X, 3.5" on edge along Z. Sits flush with the
// stand's outer face so the through-screw lands 3/4" in from the
// leg's outer side edge.
module side_rail(z) {
    color(c_lrrail) translate([0, t, z]) cube([t, lr_rail_len, w]);
}

// Upright text facing the viewer, matching Steps 3-4.
module label(txt, size = 1.2, halign = "left", valign = "bottom") {
    color(c_text)
        rotate([90, 0, 0])
            linear_extrude(0.08)
                text(txt, size = size, halign = halign, valign = valign);
}

// Step banner — same format in every step model, so a preview always
// says which step you're looking at even when opened on its own.
// Stands upright above the assembly, facing the viewer like label().
c_step = [0.10, 0.30, 0.55];
module step_banner(txt) {
    color(c_step)
        rotate([90, 0, 0])
            linear_extrude(0.10)
                text(txt, size = 2.0, halign = "center", valign = "bottom");
}

/* --- Assembly --- */

// Front ladder — outer face at y = 0, pockets facing +Y (inward)
ladder();
pocket_screw_markers();

// Back ladder — mirrored so its pockets also face inward, outer face at y = 16
translate([0, panel, 0])
    mirror([0, 1, 0]) {
        ladder();
        pocket_screw_markers();
    }

// The four 13" side rails: left and right, at both frame heights
for (rz = [top_rail_z, btm_rail_z]) {
    side_rail(rz);                             // left  — x = 0 .. 1.5
    translate([panel - t, 0, 0]) side_rail(rz); // right — x = 14.5 .. 16
}

// Through-screws: 8 total. Driven through the leg's WIDE face, from
// the outside of each ladder, 3/4" in from the leg's outer side edge,
// centered on the rail's height.
for (rz = [top_rail_z, btm_rail_z])
    for (sx = [scr_inset, panel - scr_inset])
        for (sy = [-0.22, panel + 0.22])
            color(c_screw)
                translate([sx, sy, rz + w/2]) sphere(0.22, $fn = 18);

/* --- Annotations --- */

// The 13" gap the side rails set
translate([panel/2, panel/2, -2.2])
    label("4 x 13-in SIDE RAILS  —  1 screw per end  =  8 through-screws", 1.0, halign = "center");
translate([panel/2, panel/2, -3.7])
    label("screws enter the leg's wide face, 3/4 in from its outer side edge", 0.8, halign = "center");
translate([panel/2, panel/2, -5.2])
    label("check both frames for square: the two diagonals must match", 0.8, halign = "center");

// Step banner, above the frame
translate([panel/2, -0.5, leg_len + 2.0])
    step_banner("STEP 5 of 8  —  SIDE RAILS");
