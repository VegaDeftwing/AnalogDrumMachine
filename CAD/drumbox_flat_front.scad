use <lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)



lasercutout(thickness = 0.125, 
          points = [[0, 0], [16.75, 0], [16.75, 2], [0, 2], [0, 0]]
        , finger_joints = [[0, 1, 4], [180, 0, 4], [90, 1, 4], [270, 0, 4]]
        ) 

;
}

flat();
