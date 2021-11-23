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

include <lens_gasket.scad>
//                       Manufacturer  Model            Part Number    Description  Bounding Cube  spec
lens_gasket_3_inch =     ["3 inch Lens Gasket", 
                          [3,3,.1], 3, [3.0,2.85,.1/64]];
lens_gasket_2_inch =     ["2 inch Lens Gasket", 
                          [2,2,.1], 2, [2.0,1.85,.1/64]];
lens_gaskets = [lens_gasket_3_inch, lens_gasket_2_inch];
