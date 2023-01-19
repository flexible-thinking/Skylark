// A library for small wikihouse build
// Floors

// global variables

w = 4236;
lEnd = 318;
lFloor = 600;
h = 380;

offset = 0;

module floors() {
    translate([w, lEnd, 0]) rotate([0, 0, 180])
        end();

    for (i = [0:5]) {
        translate([0, (i * lFloor) + lEnd, 0])
            floor();
    }

    translate([0, (6 * lFloor) + lEnd, 0])
        end();
    }

module end() {
    import("test-stls/floor-end-s.stl");
}

module floor(){
    import("test-stls/floor-s.stl");
}
