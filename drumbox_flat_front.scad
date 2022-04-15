use <lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)



lasercutout(thickness = 25, 
          points = [[0, 0], [1675, 0], [1675, 200], [0, 200], [0, 0]]
        , finger_joints = [[0, 1, 4], [180, 0, 4], [90, 1, 4], [270, 0, 4]]
        ) 


;
}

flat();
