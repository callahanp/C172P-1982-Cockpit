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
use <../../utils/dies/round_corner_die.scad>
w=12; 
h=12;
d=1;
r=3;

difference(){
cube([w, h, d]);
round_corner_die([w,h,0],r,d,45);
round_corner_die([w,0,0],r,d,135);
round_corner_die([0,0,0],r,d,225);
round_corner_die([0,h,0],r,d,315);
}
p=[w+3,0,0];
difference(){
translate(p) cube([w*2, h, d]);
round_corner_die(p+[w*2,h,0],r,d,45);
round_corner_die(p+[w*2,0,0],r,d,135);
round_corner_die(p+[0,0,0],r,d,225);
round_corner_die(p+[0,h,0],r,d,315);

}