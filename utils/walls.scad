// A library for small wikihouse build
// Walls

// global variables
w = 318;
l = 318;
h = 2100;

lFloor = 600;
hFloor = 380;
thickness = 18;

module walls() {
    for (i = [0, 1, 3, 4]) {
        translate([l + (i * lFloor), 0, hFloor + thickness])
        if (i == 1) {
            window();
        } else if (i == 4) {
            door();
        } else {
            wall(); 
        }
    }
    for (i = [0, 1, 2, 4, 5]) {
        translate([0, (l + lFloor) + (i * lFloor), hFloor + thickness]) rotate([0, 0, -90])
        if (i == 2) {
            translate([-lFloor,0,0])
            window();
        } else {
            wall(); 
        }
    }

    for (i = [0:5]){
        translate([(l + w) + (6 * lFloor), w + (i * lFloor), hFloor+thickness]) rotate([0,0,90]) wall();
    }

    for (i = [0, 1, 2, 4, 5]){
        translate([(lFloor+w) + (i*lFloor), (l+w)+(6*lFloor), hFloor+thickness]) rotate([0, 0, 180])
        if (i == 2){
            translate([-lFloor, 0, 0])
                window();
        } else {
            wall();
        }
    }
}

module corners() {
    translate([w, 0, hFloor + thickness]) rotate([0, 0, 90])
        corner();

    translate([0, w + (6 * lFloor), hFloor + thickness]) rotate([0,0,0])
        corner();

    translate([w + (6 * lFloor), (2 * w) + (6 * lFloor), hFloor + thickness]) rotate([0,0,-90])
        corner();


    translate([(2 * w) + (6 * lFloor), w, hFloor + thickness]) rotate([0,0,180])
        corner();
}

module corner(){
    import("test-stls/corner-s.stl");
}

module door() {
    import("test-stls/door-s.stl");
}

module wall() {
    import("test-stls/wall-s.stl");
}

module window() {
    import("test-stls/window-s.stl");
}