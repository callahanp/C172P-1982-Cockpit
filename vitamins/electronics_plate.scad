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

function electronics_plate_description(spec) = spec[0];
function electronics_plate_overall_size(spec) = spec[1];
function electronics_plate_nominal_size(spec) = spec[2]; 
// TODO: Create new accessor functions for additional electronics_plate specs
function electronics_plate_overall_size(spec) = spec[3];

function electronics_plate_constructor (
  description, 
  overall_size, nominal_size,
  other_specifications) = 
    [description, 
    overall_size, nominal_size,
    other_specifications];
// TODO: Replace electronics_plate_constructor "other_specifcations" with 
//        real parameters for electronics_plates
module electronics_plate (spec){
// TODO: Replace cube construct with electronics_plate part construction
cube(electronics_plate_overall_size(spec));

}