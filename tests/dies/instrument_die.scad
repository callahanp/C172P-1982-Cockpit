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
include <../../utils/core/core.scad>
use <../../utils/dies/instrument_die.scad>
//                [x,y,z]    3.125      panel_thickness
//                           2.25               [angles]            [angles]
//                           1                
instrument_die([0,0,0], 3.125,  1/16,    [[45, 135, 225, 315],5/32, 3.5, 1/16],[[],0,0,0], $fn=100);
instrument_die([3.5,0,0], 3.125,  1/16,  [[45, 135,  315],    5/32, 3.5, 1/16],[[225],     11/32,  3.375, 1/16], $fn=100);
instrument_die([7,0,0], 3.125,  1/16,    [[45, 315],          5/32, 3.5, 1/16],[[135,225], 11/32,  3.375, 1/16], $fn=100);
instrument_die([0,3.5,0], 3.125,  1/16,  [[45],               5/32, 3.5, 1/16],[[0,0,0],0,0,0], $fn=100);
instrument_die([3.5,3.5,0], 3.125, 1/16, [[135],              5/32, 3.5, 1/16],[[0,0,0],0,0,0], $fn=100);
instrument_die([7,3.5,0], 3.125,  1/16,  [[225],              5/32, 3.5, 1/16],[[0,0,0],0,0,0], $fn=100);
instrument_die([10.5,3.5,0], 3.125,  1/16, [[45,135,225,315],   5/32, 3.5, 1/16],[[180],    1/2, 3.125, 1/16], $fn=100);
  rotate([0,0,45]) translate([0,0, 3/16])

  color("blue") cube([3.5,.25,.3+2*eps],center=true);