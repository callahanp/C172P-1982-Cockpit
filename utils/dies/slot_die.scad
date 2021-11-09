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
// slot_die.scad
include <../core/core.scad>
use <round_corner_die.scad>

module slot_die(position, width, length, height, round_top=false, round_bottom=false, flare_bottom =0, $fn=100){
  l= length -(round_top ? width/2:0) - (round_bottom ? width/2 : 0);
  h1=length -(round_top ? width/2:0); 
  slot_pos=[-width/2,0,0];
  cube_pos=round_bottom ? [0,width/2,0] : [0,0,0];
  translate(position+slot_pos+[0,0,-eps]){
    if (round_top) 
        translate([width/2,h1,0]) 
        difference() {
          color("pink") cylinder(d=width, h=height+2*eps,$fn=$fn);
          translate([-width/2,-width,-eps]) 
          translate([0,0,-2*eps])  cube([width,width-eps, height+4*eps ]);
        }
    if (round_bottom) 
        translate([width/2,width/2,-eps]) cylinder(d=width, h=height2*eps,$fn=$fn);
    if (flare_bottom != 0)
    { translate([0,0,eps]){
      round_corner_die([width,0,0],flare_bottom,height, 225);
      round_corner_die([0,0,0],flare_bottom,height, 135);
      }
    }
   translate(cube_pos) cube([width, l, height+2*eps]);
   }
}