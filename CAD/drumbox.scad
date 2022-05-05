include <lasercut.scad>; 

// 1 unit = .01"

thickness = .25;
x = 16.75 + 2*thickness;
// Height = 2*.25" boarder + 4" Top + 2.5" Bottom + 1.5" switches == 8.5"
y = 8.50 + 2*thickness; //8.5"
z = 2.00 + 2*thickness; //2.0" thick should be fine?

circles1 = [];   //Bottom

circles2 = [[.125,15.50,.50],[.125,15.50,1.50],[.125,15.50,2.50]];  //Top

circles3 = [];

circles4 = [[.1875,.50,1.75],[.1875,2.00,1.75]];

circles5 = [];

circles6 = [];
            
slits1 = [];  //Bottom

slits2 = [[.25, 4.25, 2.00, 4.00],[2.50, 4.25, 2.00, 4.00],[4.75, 4.25, 2.00, 4.00],[7.00, 4.25, 2.00, 4.00],[9.50, 4.25, 2.00, 4.00],[12.25, 4.25, 2.00, 4.00],[14.40, 4.25, 2.00, 4.00],[.25,.25,7.75,2.75],[8.50,.25,2.50,2.50],[11.50,.25,2.5625,2.375]];   //Top

slits3 = [];   //Front

slits4 = [[.25,.25,2.00,1.00],[6.00,.25,3.875,1.00]];  //Back

slits5 = [];  //Small Side 1

slits6 = [];   //Small Side 2


circles_remove_a = [
        circles1,
        circles2,
        circles3,
        circles4,
        circles5,
        circles6
];
cutouts_a = [
        slits1,
        slits2,
        slits3,
        slits4,
        slits5,
        slits6
];

lasercutoutBox(thickness=thickness, x=x, y=y, z=z, sides=6, num_fingers=4,
        simple_tab_holes_a=[], 
        captive_nuts_a=[], captive_nut_holes_a=[],
        screw_tab_holes_a=[],
        twist_holes_a=[],
        clip_holes_a=[],
        circles_add_a=[],
        circles_remove_a=circles_remove_a,
        slits_a = [],
        cutouts_a = cutouts_a,
        milling_bit = 0.0
);



//// TOP ROW

// Cut out holes for each Drum (5) - 2"x4", 1/4" spacing between each drum
// This is the FULL hole size, so needs to include tollerance for mounting
// Total len = (2"*5) + (1/4"*4) = 11"

// Inch spacing to effect modules, give some room to breathe
// Cut out holes for each Effect (2) - 2"x4", 1/4" spacing between
// Total len w/ 1" gap = 5.25"

// == 16.25 + (.25" * 2)(Edge) = 16.75"

//// MIDDLE

// Switches

//// BOTTOM

// Cut out hole for keyboard - ~8"x2.75"
// == 6.9 (with .25 left boarder)

// Cut out hole for BDN9 - ~2.5"x2.5", .5 gap between BDN9 & keep
// == 10.4

// .5" gap to the pi hats
// Cut out hole for PI HATs (rest can be hidden) - 2&9/16" x 2&3/8"

// Pi needs another 1.5" for IO (covered)
// -> total len for pi = 4.5625"
// == 14.8625 + .25 right boarder == 15.11

// This leaves 16.75 - 15.11 ~= 1.5" for the Filter and master volume
// knobs. If this doesn't work, we can always have them poke out the front face.

// BACK

// Cut out 2 holes for audio out - 1/4" jacks

// Cut out a hole for the power wires to run into
// This does me we need a second encosure to protect from
// the exposed 120V connections.

// The pi has two hats, and the analog modules draw some current
// too, so it's probably best to have some ventallation & airflow
// -> Cut out hole for blower fan - 3&7/8" x 5/8" - This can either be in the back
// or either side.

