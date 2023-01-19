// small wikihouse

// global variables

w2 = 1818;
l2 = 18;
h2 = 510;

w3 = 2418;
l3 = 18;
h3 = 510;

offset = 125;

module combs() {
    translate([0, offset, 0])
        combX();
    translate([l2 + l3 + offset, 0, 0]) rotate([0, 0, 90])
        combY();
    translate([0, w2 + w3 - (offset + l2 + l3), 0])
        combX();
    translate([w2 + w3 - (offset + l2 + l3), 0, 0]) rotate([0, 0, 90])
        combY();
}

module combX() {
    translate([w2, l2, 0]) rotate([0, 0, 180])
        import("test-stls/comb-a-end-x2.stl"); // span = 2.5

    translate([w3, 2*l3, 0]) rotate([0, 0, 180])
        import("test-stls/comb-a-end-x3.stl"); // span = 3.5

    translate([w2, 0, 0])
        import("test-stls/comb-a-end-x3.stl");
    
    translate([w3, l2, 0])
        import("test-stls/comb-a-end-x2.stl"); 
}

module combY() {
    translate([w2, l2, 0]) rotate([0, 0, 180])
        import("test-stls/comb-a-end-y2.stl"); // span = 2.5

    translate([w3, 2 * l3, 0]) rotate([0, 0, 180])
        import("test-stls/comb-a-end-y3.stl"); // span = 3.5

    translate([w2, 0, 0])
        import("test-stls/comb-a-end-y3.stl");
    
    translate([w3, l2, 0])
        import("test-stls/comb-a-end-y2.stl"); 
}