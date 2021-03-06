width = 30;
boardSize = 3.6;

thick1t = 0.4;
thick2t = 12;
thick3t = 2;

eps = 0.0001;

height1 = boardSize;
height2 = 1;

$fn = 65;
radius = 1.5;

r = 2;

thick1 = thick1t;
thick2 = thick2t - r;
thick3 = thick3t - r + eps;

module base() {

    translate([0, -(height1 + height2), 0]) {
        translate([0, height1/2, thick1/2]) 
            cube([width + r*2, height1, thick1], true);

        translate([0, height1 + height2/2, thick2/2]) 
            cube([width, height2, thick2], true);
    }

    h = width / sqrt(2);
    translate([0, 0, thick3/2])  {
        
        intersection() {
            difference() {
                rotate([0, 0, 45])
                    cube([h, h , thick3], true);
               
            }
            translate([0, width/2, 0])
                cube([width, width, thick3], true);
        }
    }
}


difference() {
    union() {
        base();
        minkowski() {
            intersection() {
                base();
                translate([0, width/2 - height2 + 0.01, ])
            cube([width * 2, width, 50], true);
            }
            intersection() {
                translate([0, r, r])
                    cube(r*2, center = true);
                sphere(r);
            }
        }
    }
    union() {
        translate([0, width/3.2, 0]) {
            cylinder(h = (thick3 + r) * 2, r = radius, center = true);
            translate([0, 0, thick3 + r + radius/1.3])
                sphere(r = radius*1.8); 
        }
    }
}