//
// CockpitSCADlib Copyright Patrick A. Callahan 2021
// Framingham, Ma U.S.A.

// This file is part of CockpitSCADlib.
//
// CockpitSCADlib is free software: you can redistribute it and/or modify it under the terms of the
// GNU General Public License as published by the Free Software Foundation, either version 3 of
// the License, or (at your option) any later version.
//
// CockpitSCADlib is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along with CockpitSCADlib.
// If not, see <https://www.gnu.org/licenses/>.
//
// rounded_rectangle
include <../../utils/core/core.scad>
module rounded_rectangle_die ( position, width, length, thickness, radius, $fn=100){
    x1=width-2*radius;
    y1=length;
    x2=width;
    y2=length-2*radius;
    x_left  = -(width/2-radius);
    x_right = -x_left;
    y_lower = -(length/2-radius);
    y_upper = -y_lower;
    h=thickness+2*eps;
    translate(position+[0,0,h/2-eps]) 
        union() {
            cube([x1,y1,h], center=true);
            cube([x2,y2,h], center=true);
            translate ([x_left,  y_lower,0]) cylinder(r=radius, h=h, $fn=$fn, center=true);
            translate ([x_right, y_lower,0]) cylinder(r=radius, h=h, $fn=$fn, center=true);
            translate ([x_left,  y_upper,0]) cylinder(r=radius, h=h, $fn=$fn, center=true);
            translate ([x_right, y_upper,0]) cylinder(r=radius, h=h, $fn=$fn, center=true);
     }
 }
