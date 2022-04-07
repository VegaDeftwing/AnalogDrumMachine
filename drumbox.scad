use <lasercut.scad>;

// 1 unit = .01"
thickness = 25;
x = 1675 + 2*thickness;
// Height = 2*.25" boarder + 4" Top + 2.5" Bottom + 1.5" switches == 8.5"
y = 850 + 2*thickness; //8.5"
z = 200 + 2*thickness; //2.0" thick should be fine?

module mainBox() {
{
color("Gold",0.75) translate([(6-4),0,0]) 
    lasercutoutBox(thickness = thickness, x=x, y=y, z=z, 
    sides=6, num_fingers=4);
}
}


module drumAndEffectModules() {   //All 5 Drum Modules + 2 Effect Modules
 difference() {mainBox();
               translate([50,450,100]){cube([200,400,300]);}
               translate([275,450,100]){cube([200,400,300]);}
               translate([500,450,100]){cube([200,400,300]);}
               translate([725,450,100]){cube([200,400,300]);}
               translate([950,450,100]){cube([200,400,300]);}
               translate([1250,450,100]){cube([200,400,300]);}
               translate([1475,450,100]){cube([200,400,300]);}
}
}

module keyBoards() {     //BDN9 + 3x10 Keyboard
  difference() {drumAndEffectModules();
               translate([50,50,100]){cube([665,250,300]);}
               translate([50+665+50,50,100]){cube([250,250,300]);}
}   
}

module piHats() {      //Pi Hat + Master Volume & Filter Knobs
  difference() {keyBoards();
               translate([50+665+50+250+50,50+6.25,100]){cube([256.25,237.5,300]);}
               translate([50+665+50+250+50+256.25+100+50,125,100]){cylinder(h=1000,d=50);}
               translate([50+665+50+250+50+256.25+100+50,325,100]){cylinder(h=1000,d=50);}
               translate([50+665+50+250+50+256.25+100+50+125,225,100]){cylinder(h=1000,d=50);}
}     
}

module backStuff(){    //Power Cords, Cooling Fan, Audio Out Ports
    difference() {piHats();
        translate ([100, 850, 200])rotate([-90,0,0]){cylinder(h=1000, d=37.5);}   //d = 3/8"
        translate ([200, 850, 200])rotate([-90,0,0]){cylinder(h=1000, d=37.5);}   
        translate ([50, 850, 50]){cube([200,100,100]);}    //Power Cords
        translate ([650, 850, 50]){cube([387.5,62.5,100]);}
    }
    
}
module view() {
   difference() {piHats();
       translate([0,0,-100]){cube([10000,10000,300]);}
   }
}

backStuff();

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

