
width = 98;
length = 128;
thickness = 1;
gap = 0.5;

open = "nowhere"; // might be top|bottom|left|right

outerWidth = width + (2 * thickness) + (2 * gap);
outerLength = length + (2 * thickness) + (2 * gap);


module lowerNotch(exact = false) {
    // lower negative notch
    stretch = exact ? thickness : 10;
    move = stretch / 2;

    translate([0, -thickness/2, thickness/2]) {
        rotate([45, 0, 0])
        translate([-move,0,0])
        cube([outerWidth+stretch,thickness,thickness]);
    }

    // upper negative notch
    translate([0, outerLength+thickness/2, thickness/2]) {
        rotate([45, 0, 0])
        translate([-move,0,0])
        cube([outerWidth+stretch,thickness,thickness]);
    }

    // left negative notch
    rotate([0, 0, 90]) {
        translate([0, thickness/2, thickness/2]) {
            rotate([45, 0, 0])
            translate([-move,0,0])
            cube([outerLength+stretch,thickness,thickness]);
        }
    }

    // left negative notch
    rotate([0, 0, 90]) {
        translate([0, -outerWidth-(thickness/2), thickness/2]) {
            rotate([45, 0, 0])
            translate([-move,0,0])
            cube([outerLength+stretch,thickness,thickness]);
        }
    }
}


module lowerPlate() {
    difference() {
        union() {
            // lower plate
            cube([outerWidth, outerLength, thickness]);

            // all lower borders
            translate([0, 0, thickness]) {
                if (open != "bottom"){
                    // lower border
                    cube([outerWidth,thickness,thickness]);
                }

                if (open != "top"){
                    // upper border
                    translate([0, outerLength - thickness, 0]) {
                        cube([outerWidth,thickness,thickness]);
                    }
                }

                if (open != "left"){
                    // left border
                    cube([thickness,outerLength,thickness]);
                }

                if (open != "rigth"){
                    // right border
                    translate([outerWidth - thickness, 0, 0]) {
                        cube([thickness,outerLength,thickness]);
                    }
                }
            }
        };
        lowerNotch();
    }
}


module upperPlate() {
    upperGap = 0.5;
    frameBorder = 10;
    totalAddition = (2*thickness) + upperGap;

    upperOuterWidth = outerWidth + totalAddition;
    upperOuterLength = outerLength + totalAddition;
    
    
    translate([-totalAddition/2,-totalAddition/2,(thickness*2)+0.5]) {
        
        difference() {
            // upper plate
            cube([upperOuterWidth, upperOuterLength, thickness]);

            translate([frameBorder, frameBorder, -1])
            cube([upperOuterWidth-frameBorder*2, upperOuterLength-frameBorder*2, thickness+2]);
        }


    // all upper borders
    translate([0, 0, -thickness*2]) {
        if (open != "bottom"){
            // lower border
            cube([upperOuterWidth,thickness,thickness*2]);
        }


        if (open != "top"){
            // upper border
            translate([0, upperOuterLength - thickness, 0]) {
                cube([upperOuterWidth,thickness,thickness*2]);
            }
        }

        if (open != "left"){
            // left border
            cube([thickness,upperOuterLength,thickness*2]);
        }

        if (open != "rigth"){
            // right border
            translate([upperOuterWidth - thickness, 0, 0]) {
                cube([thickness,upperOuterLength,thickness*2]);
            }
        }
    }
    }



    lowerNotch(true);
}

lowerPlate();
!upperPlate();
