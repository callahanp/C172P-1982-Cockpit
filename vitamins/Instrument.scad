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

// basic constructors accept named parameters and place them in a vector
// some constructors may do calculations and place the results into the vector
// accessor functions provide access to each of the members by name.

// scripts/new_instrument.py was used to generate the initial accessor functions and basic constructor.

function airspeed_indicator_description(type) = type[0];
function airspeed_indicator_overall_ize(type) = type[1];
function airspeed_indicator_nominal_size(type) = type[2];
function airspeed_indicator_width(type) = type[2];
function airspeed_indicator_mountings(type) = type[3];
function airspeed_indicator_adjusters(type) = type[4];
function airspeed_indicator_bezel(type) = type[5];
function airspeed_indicator_lens_assembly(type) = type[6];
function airspeed_indicator_face(type) = type[7];
function airspeed_indicator_faceplate(type) = type[8];
function airspeed_indicator_needle(type) = type[9];
function airspeed_indicator_motor(type) = type[10];
function airspeed_indicator_motorPlate(type) = type[11];
function airspeed_indicator_electronicsPlate(type) = type[12];
function airspeed_indicator_connector_plate(type) = type[13];
function airspeed_indicator_case(type) = type[14];

function airspeed_indicator_constructor ( 
     description,
     overall_size,
     nominal_size,
     mountings,
     adjusters,
     bezel,
     lens_assembly,
     face,
     faceplate,
     needle,
     motor,
     motorPlate,
     electronicsPlate,
     connector_plate,
     case) = [
     description,
     size,
     overall_size,
     nominal_size,
     mountings,
     adjusters,
     bezel,
     lens_assembly,
     face,
     faceplate,
     needle,
     motor,
     motorPlate,
     electronicsPlate,
     connector_plate,
     case];
     module airspeed_indicator(spec) {
          cube([3.25,3.25,3.25]);
     }
                     