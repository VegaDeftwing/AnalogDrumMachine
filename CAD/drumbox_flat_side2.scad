use <lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)



lasercutout(thickness = 0.125, 
          points = [[0, 0], [2, 0], [2, 8.5], [0, 8.5], [0, 0]]
        , simple_tabs = [[0, 2.125, 8.5]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 0, 4], [270, 1, 4]]
        ) 


;
}

flat();
