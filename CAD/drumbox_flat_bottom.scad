use <lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)



lasercutout(thickness = 0.125, 
          points = [[0, 0], [16.75, 0], [16.75, 8.5], [0, 8.5], [0, 0]]
        , simple_tabs = [[180, -0.125, 0], [180, -0.125, 8.75], [270, 16.75, -0.125]]
        , finger_joints = [[0, 1, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        ) 

;
}

flat();
