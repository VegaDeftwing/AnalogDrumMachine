use <lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)



lasercutout(thickness = 0.125, 
          points = [[0, 0], [16.75, 0], [16.75, 2], [0, 2], [0, 0]]
        , simple_tabs = [[0, -0.125, 2], [180, 16.875, 0]]
        , finger_joints = [[0, 1, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[0.1875, 0.5, 1.75], [0.1875, 2, 1.75]]
        , cutouts = [[0.25, 0.25, 2, 1], [6, 0.25, 3.875, 1]]
        ) 

;
}

flat();
