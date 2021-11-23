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
module eps_cylinder( 
               diameter, height, 
               eps_size=[0,0,0],
               $fn=$fn) {
    cylinder(d=diameter 
              + eps_size[0] + eps_size[1], 
             h=height+2*eps_size[2], 
             $fn=$fn);

  // its a circle so rotation doesn't matter much.
}

