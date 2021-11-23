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

include <core/core.scad>
module eps_cube( 
               cube_spec_size=[0,0,0], 
               eps_size=[0,0,0],
               round_xy_radius=0,
               $fn=$fn) {
cube_size=cube_spec_size+eps_size;
if ( round_xy_radius==0 )
  cube(cube_size);
else
  let ( r=round_xy_radius,
        height=cube_size[2],
        width = cube_size[0],
        length = cube_size[1]){
    translate([0,r,0])
      cube(cube_size+[0,-r*2,0]);
    translate([r,0,0])
      cube(cube_size+[-r*2,0,0]);
    translate([r,r,0])
      cylinder(r=r, h=height, $fn=$fn);
    translate([width-r,r,0])
      cylinder(r=r, h=height, $fn=$fn);
    translate([r,length-r,0])
      cylinder(r=r, h=height, $fn=$fn);
    translate([width-r,length-r,0])
      cylinder(r=r, h=height, $fn=$fn);
  }
}

