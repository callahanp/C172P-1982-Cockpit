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

include <outer_prism.scad>
outer_prism_3_inch =  outer_prism_constructor(
                        "3 inch outer prism", 
                        [3, 3, 23/128], 3.0, 
                        min_thickness=1/32,
                        alignment_semicircle_dia=7/64);
outer_prism_2_inch =  outer_prism_constructor(
                "2 inch outer prism", 
                        [2, 2, 23/128], 2.0, 
                        min_thickness=1/32,
                        alignment_semicircle_dia=7/64);
outer_prisms = [outer_prism_2_inch, outer_prism_3_inch ];
