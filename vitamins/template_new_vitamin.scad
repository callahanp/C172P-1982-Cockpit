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
function new_vitamin_part_id(spec)      = spec[0];
function new_vitamin_description(spec)  = spec[1];
function new_vitamin_overall_size(spec) = spec[2];
function new_vitamin_nominal_size(spec) = spec[3]; 
// TO_DO: Create new accessor functions for additional new_vitamin specs
function new_vitamin_feature(spec) = spec[4];
function new_vitamin_feature(spec) = spec[5];
function new_vitamin_feature(spec) = spec[6];

function new_vitamin_constructor (
  description, 
  overall_size, nominal_size,
  other_specifications) = 
    [description, 
    overall_size, nominal_size,
    other_specifications];
// TO_DO: Replace new_vitamin_constructor "other_specifcations" with 
//        real parameters for new_vitamins
module new_vitamin (spec){
// TO_DO: Replace cube construct with new_vitamin part construction
cube(new_vitamin_overall_size(spec));

}
