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

include <../utils/core/core.scad>

include <case.scad>
//                       Manufacturer  Model            Part Number    Description  Bounding Cube  spec
3_125_inch_case_PI_Zero = case_constructor("1",
                      "3.125 inch case Pi-Zero", 
                      [3.25,3.25,3.25], 
                      nominal_size=3.25, 
                      case_wall_thickness=3/128,
                      corner_chamfer=5/8,
                      rear_mounting_holes=[3/32, 
                          [9/16,      1+21/32, 5/128],
                          [3.25-9/16, 1+21/32, 5/128]],
                      rear_connector_holes=
                        [[[2+9/16, .5,0],  [13/32, 9/32, 5/128]],
                         [[1+13/16,.5,0],  [13/32, 9/32, 5/128]],
                         [[1/2,    7/32,0],[37/64, 23/64, 5/128]]]);
2_25_inch_case = case_constructor("2",
                      "2_25_inch_case",
                      [2.25,2.25,2.25], 
                      nominal_size=2.25, 
                      case_wall_thickness=3/128,
                      corner_chamfer=3/8);
                    
cases = [3_125_inch_case_PI_Zero,2_25_inch_case];

