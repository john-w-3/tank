// Stand Assembly — Step 4: Back Ladder (2 legs + 2 rails)
//
// Identical build to the front ladder (Step 3), using the remaining
// 2 legs and 2 prepped 9" rails.  View shows both ladders standing
// at their final spacing — a preview of what Step 5 will connect
// with the four 13" side rails.
//
// Front ladder (Step 3) shown translucent — already built.
// Back ladder (Step 4) shown solid — just built.
//
// Open in OpenSCAD → press F5 to preview.

/* --- Lumber dimensions (actual, not nominal) --- */
t           = 1.5;     // 2x4 narrow face
w           = 3.5;     // 2x4 wide face

leg_len     = 32.25;
fb_rail_len = 9;       // 16 - 2*3.5 = 9" between legs
panel       = 16;      // outer width, leg-edge to leg-edge

/* --- Vertical positions (relative to bottom of leg) --- */
btm_rail_z  = 10;
top_rail_z  = leg_len - w;

/* --- Pocket hole geometry (matches Steps 2–3) --- */
pkt_angle   = 15;
pkt_inset   = 2.0;
pocket_dia  = 0.375;
pocket_len  = 0.9;
pilot_dia   = 0.20;
tunnel_len  = 2.5;

/* --- Colors --- */
c_front_leg  = [0.78, 0.60, 0.38, 0.35];   // translucent (already built)
c_front_rail = [0.82, 0.55, 0.30, 0.35];
c_back_leg   = [0.78, 0.60, 0.38];          // solid (just built)
c_back_rail  = [0.82, 0.55, 0.30];
c_screw      = [0.85, 0.10, 0.10];
c_screw_dim  = [0.85, 0.10, 0.10, 0.35];
c_text       = [0.05, 0.05, 0.05];

/* --- Modules --- */

module pocket_hole_tunnel_onedge(dir) {
    rotate([0, 0, dir * (90 - pkt_angle)])
        rotate([90, 0, 0]) {
            cylinder(h = pocket_len, d = pocket_dia, $fn = 28);
            cylinder(h = tunnel_len, d = pilot_dia, $fn = 24);
        }
}

module rail_with_pockets(rail_color) {
    difference() {
        color(rail_color) cube([fb_rail_len, t, w]);
        translate([pkt_inset, t + 0.01, w/2])
            pocket_hole_tunnel_onedge(-1);
        translate([fb_rail_len - pkt_inset, t + 0.01, w/2])
            pocket_hole_tunnel_onedge(+1);
    }
}

module ladder(leg_color, rail_color) {
    // Left leg
    color(leg_color) cube([w, t, leg_len]);
    // Right leg
    color(leg_color) translate([panel - w, 0, 0]) cube([w, t, leg_len]);
    // Top rail — flush with leg tops
    translate([w, 0, top_rail_z]) rail_with_pockets(rail_color);
    // Bottom rail — bottom edge at the 10" mark
    translate([w, 0, btm_rail_z]) rail_with_pockets(rail_color);
}

module screw_markers(clr) {
    for (rz = [top_rail_z, btm_rail_z])
        for (ex = [w + pkt_inset, w + fb_rail_len - pkt_inset])
            color(clr)
                translate([ex, t + 0.05, rz + w/2])
                    sphere(0.18, $fn = 18);
}

// Upright text facing the viewer. The ladders stand in the XZ plane
// with the front of the scene at -Y, so labels rotate up to match and
// extrude slightly toward -Y (toward the camera). Depth (y) placement
// still says which ladder a label belongs to.
module label(txt, size = 1.2, halign = "left") {
    color(c_text)
        rotate([90, 0, 0])
            linear_extrude(0.08)
                text(txt, size = size, halign = halign, valign = "bottom");
}

/* --- Assembly: both ladders at final spacing --- */

// Front ladder (Step 3 — already built, translucent)
ladder(c_front_leg, c_front_rail);
screw_markers(c_screw_dim);

// Back ladder (Step 4 — just built, full color)
// Mirrored in Y so pocket holes face inward, placed at final depth
translate([0, panel, 0])
    mirror([0, 1, 0]) {
        ladder(c_back_leg, c_back_rail);
        screw_markers(c_screw);
    }

/* --- Annotations --- */

// Ladder labels — centered under each ladder, at that ladder's depth
translate([panel/2, -0.5, -2.5])
    label("FRONT (Step 3)", 0.9, halign = "center");

translate([panel/2, panel + 0.5, -2.5])
    label("BACK (Step 4)", 0.9, halign = "center");

// Gap dimension — where side rails will go
translate([panel/2, panel/2, -4.5])
    label("← 13 in gap — side rails (Step 5) →", 0.7, halign = "center");

// Title
translate([panel/2, -0.5, -6.5])
    label("TWO IDENTICAL LADDERS  —  8 pocket screws total  →  ready for Step 5", 1.0, halign = "center");
