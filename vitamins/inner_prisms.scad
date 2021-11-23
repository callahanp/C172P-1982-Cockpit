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

include <inner_prism.scad>
//                       Manufacturer  Model            Part Number    Description  Bounding Cube  spec
inner_prism_3_inch =  inner_prism_constructor(
                        "3 inch inner prism", 
                        [3, 3+1/64, 23/128], 3.0, 
                        min_thickness=1/32,
                        top_width=2+7/32,
                        side_chamfer_angle=112.5);
inner_prism_2_inch =  inner_prism_constructor(
                "2 inch inner prism", 
                        [2, 2+1/64, 23/128], 2.0, 
                        min_thickness=1/32,
                        top_width=1+7/32,
                        side_chamfer_angle=112.5);
inner_prisms = [inner_prism_2_inch, inner_prism_3_inch ];
