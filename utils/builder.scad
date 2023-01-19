l = 600;
w = 318;

units_l = 8;
units_w = 8;

total_l = l * units_l;
total_w = w * units_w;

// ground floor
{
combs_a();
    {
        translate([5436,300+18,0])
        rotate([0, 0, 180])
        floors_m_end();
    }
    for (i = [0: units_l-1]){
        translate([0, 318 + (i * l), 0])
        floor_m();
    }
    translate([0, 318 + total_l]) floors_m_end();

    // ground floor corners
    {
        translate([0,318,380+18]) rotate([0,0,270]) corner_m();
        translate([318,(2*318)+total_l,380+18]) rotate([0,0,180]) corner_m();
        translate([(2*318+total_l),(318+total_l), 380+18]) rotate([0,0,90]) corner_m();
        translate([(318+total_l),(0), 380+18]) rotate([0,0,0]) corner_m();
    }

    // ground floor walls
    {
        for (i = [0: units_l - 1]) {
            translate([318+ (i * l), 0, 380 + 18])
                wall_m();
        }
        for(i = [1:units_l]) {
            translate([0, 318 + (i * l), 380 + 18]) rotate([0, 0, -90])
                wall_m();
        }
    }
}

/*
corner_s();
translate([w, 0, 0]) gable_end();
translate([w+(8 * l), 0, 0]) corner_s();

translate([0, 20 * w, 0])
    mirror([0, 1, 0]) gable_end();
*/

module wall_m() {
    import("test-stls/wall-m.stl");
    //echo("wall_m");
}

module floor_m() {
    import("test-stls/floor-m.stl");
    //echo("floor_m");
}

module floors_m_end() {
    import("test-stls/floors-m-end.stl");
    //echo("floor_m_end");
}

module combs_a() {
    translate([0,125,0]) combs_y();
    translate([0,1218+2400+1818-36-125,0]) combs_y();
    
    translate([36+125, 0, 0]) rotate([0, 0, 90]) combs_x();
    translate([1218+2400+1818-125, 0, 0]) rotate([0, 0, 90]) combs_x();
}

module combs_y(){
        translate([0, 18,0]) union(){
        translate([1218, 0, 0]) mirror([1, 0, 0]) import("test-stls/comb-a-end-y1.stl");
        translate([1218, 0, 0]) import("test-stls/comb-a-mid.stl");
        translate([1218+2400, 0, 0]) import("test-stls/comb-a-end-y2.stl");
    }
    translate([1218+2400+1818,18,0]) rotate([0,0,180])union(){
        translate([1218, 0, 0]) mirror([1, 0, 0]) import("test-stls/comb-a-end-y1.stl");
        translate([1218, 0, 0]) import("test-stls/comb-a-mid.stl");
        translate([1218+2400, 0, 0]) import("test-stls/comb-a-end-y2.stl");
    }
}

module combs_x(){
    translate([0, 18,0]) union(){
        translate([1218, 0, 0]) mirror([1, 0, 0]) import("test-stls/comb-a-end-x1.stl");
        translate([1218, 0, 0]) import("test-stls/comb-a-mid.stl");
        translate([1218+2400, 0, 0]) import("test-stls/comb-a-end-x2.stl");
    }
    translate([1218+2400+1818,18,0]) rotate([0,0,180])union(){
        translate([1218, 0, 0]) mirror([1, 0, 0]) import("test-stls/comb-a-end-x1.stl");
        translate([1218, 0, 0]) import("test-stls/comb-a-mid.stl");
        translate([1218+2400, 0, 0]) import("test-stls/comb-a-end-x2.stl");
    }
}

module corner_m(){
    import("test-stls/corner-m.stl");
}

module gable_end() {   
    wall_g();
    translate([8 * l, 0, 0]) mirror([1,0,0])
        wall_g();
}

module wall_g() {
    import("test-stls/wall-g1.stl");
    translate([l, 0, 0]) import("test-stls/wall-g2.stl");
    translate([2 * l, 0, 0]) import("test-stls/wall-g3.stl");
    translate([3 * l, 0, 0]) import("test-stls/wall-g4.stl");
}