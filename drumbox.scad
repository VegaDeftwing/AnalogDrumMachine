include <lasercut/lasercut.scad>;

// 1 unit = .01"
thickness = 25;
x = 1675 + 2*thickness;
// Height = 2*.25" boarder + 4" Top + 2.5" Bottom + 1.5" switches == 8.5"
y = 850 + 2*thickness; //8.5"
z = 200 + 2*thickness; //2.0" thick should be fine?

color("Gold",0.75) translate([(6-4),0,0]) 
    lasercutoutBox(thickness = thickness, x=x, y=y, z=z, 
    sides=6, num_fingers=4);

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

// Cut out hole for keyboard - ~6.65"x2.5"
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

