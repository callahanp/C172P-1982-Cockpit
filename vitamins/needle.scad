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

function needle_description(spec) = spec[0];
function needle_overall_size(spec) = spec[1];
function needle_nominal_size(spec) = spec[2]; 
// TODO: Create new accessor functions for additional needle specs
function needle_spec(spec) = spec[3];

function needle_constructor (
  description, 
  overall_size, nominal_size,
  other_specifications) = 
    [description, 
    overall_size, nominal_size,
    other_specifications];
// TODO: Replace needle_constructor "other_specifcations" with 
//        real parameters for needles
module needle (spec){
// TODO: Replace cube construct with needle part construction
echo (needle_overall_size(spec));
cube(needle_overall_size(spec));

}
