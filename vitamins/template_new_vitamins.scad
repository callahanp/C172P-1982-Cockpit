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

include <new_vitamin_template.scad>
// TO_DO: Update with parts representing actual new_vitamins
//                       Manufacturer  Model            Part Number    Description  Bounding Cube  spec
new_vitamin_123 =     ["1-2-3 Block", [1,2,3], 3, [1,2,3]];
new_vitamin_10_10_10 = ["10 cube" , [10,10,10], 10, [10,10,10]];
// TO_DO: Update new_vitamins list with new parts defined above
new_vitamins = [new_vitamin_123, new_vitamin_123,];
