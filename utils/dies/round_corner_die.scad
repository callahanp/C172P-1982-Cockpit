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
// round_corner_die.scad

include <../core/core.scad>

module round_corner_die (corner_position, radius, height, angle,$fn=100) {
  // position is the x,y,0 position of the corner you want rounded
  // it is not the center of the rounding
  // This limits the usage to right angle corners oriented on x and y
  //echo("corner_position",corner_position);
  //echo("radius",radius);
  //echo("height",height);
  //echo("angle",angle);

  translate(corner_position)
   rotate([0,0,-(angle+135)])
  difference(){
    translate([-eps, -eps, -eps] )cube([radius+eps,radius+eps,height+2*eps]);
    translate([radius, radius, -2*eps]) cylinder(r=radius, h=height+4*eps, $fn);
  }
}
