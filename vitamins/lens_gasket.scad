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

function lens_gasket_description(spec)  = spec[0];
function lens_gasket_overall_size(spec) = spec[1];
function lens_gasket_nominal_size(spec) = spec[2]; 
function lens_gasket_OD(spec)           = spec[3][0];
function lens_gasket_ID(spec)           = spec[3][1];
function lens_gasket_thickness(spec)    = spec[3][2];

function lens_gasket_constructor (
  description, 
  overall_size, nominal_size,
  other_specifications) = 
    [description, 
    overall_size, nominal_size,
    gasket_specification];

module lens_gasket (spec){
  difference(){
    color("brown") 
    cylinder(d=lens_gasket_OD(spec), h=lens_gasket_thickness(spec),$fn=200);
    translate([0,0,-eps]) cylinder(d=lens_gasket_ID(spec), h=lens_gasket_thickness(spec)+2*eps,$fn=200);
  }
}
