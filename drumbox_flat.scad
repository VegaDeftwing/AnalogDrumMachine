use <lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)

lasercutout(thickness = 25, 
          points = [[0, 0], [1675, 0], [1675, 850], [0, 850], [0, 0]]
        , simple_tabs = [[180, -12.5, 0], [180, -12.5, 875], [270, 1675, -12.5]]
        , finger_joints = [[0, 1, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        ) 

lasercutout(thickness = 25, 
          points = [[0, 0], [1675, 0], [1675, 850], [0, 850], [0, 0]]
        , simple_tabs = [[180, -12.5, 0], [270, 1675, -12.5]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[12.5, 1550, 50], [12.5, 1550, 150], [12.5, 1550, 250]]
        , cutouts = [[25, 425, 200, 400], [250, 425, 200, 400], [475, 425, 200, 400], [700, 425, 200, 400], [950, 425, 200, 400], [1225, 425, 200, 400], [1440, 425, 200, 400], [25, 25, 775, 275], [850, 25, 250, 250], [1150, 25, 256.25, 237.5]]
        ) 



lasercutout(thickness = 25, 
          points = [[0, 0], [1675, 0], [1675, 200], [0, 200], [0, 0]]
        , simple_tabs = [[0, -12.5, 200], [180, 1687.5, 0]]
        , finger_joints = [[0, 1, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[18.75, 50, 175], [18.75, 200, 175]]
        , cutouts = [[25, 25, 200, 100], [600, 25, 387.5, 100]]
        ) 

lasercutout(thickness = 25, 
          points = [[0, 0], [200, 0], [200, 850], [0, 850], [0, 0]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 0, 4], [270, 1, 4]]
        ) 

lasercutout(thickness = 25, 
          points = [[0, 0], [200, 0], [200, 850], [0, 850], [0, 0]]
        , simple_tabs = [[0, 212.5, 850]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 0, 4], [270, 1, 4]]
        ) 

;
}

flat();
