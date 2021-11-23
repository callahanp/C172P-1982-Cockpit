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
function dial_description(spec) = spec[0];
function dial_overall_size(spec) = spec[1];
function dial_nominal_size(spec) = spec[2]; 
// TODO: Create new accessor functions for additional dial specs
function dial_radial_rectangles(spec) = spec[3];
function dial_radial_texts(spec) = spec[4];
function dial_horizontal_texts(spec) = spec[5];

function radial_center(spec)= spec[0];
function radial_distance(spec) = spec[1];
function radial_angle_start(spec) = spec[3];
function radial_angle_incr(spec) = spec[4];
function radial_angle_end(spec) = spec[5];
function radial_mark(spec) =spec[5];

function radial_text_font_size(spec) =spec[5];
function radial_texts(spec) =spec[6];

function horizontal_text_position(spec) =spec[0];
function horizontal_text_size(spec) =spec[1];
function horzontal_text(spec) =spec[2];

module round_dial(spec) {
size=dial_overall_size(spec);
dia=size.x;
difference() {
  color("black") 
    cylinder(d=dia, h=1/64, $fn=200);
    translate([0,0,-eps]) cylinder(d=3/16, h=1/64+2*eps, $fn=75);
  }
}
module dial_radial_rectangular_marks(spec) {
// TODO: radial rectangular marks implementation
}
module dial_radial_texts(spec) {
// TODO: radial Texts implementation
  
}
module dial_horizontal_texts(spec) {
// TODO: rhorizontal Texts implementation

}
module rectangular_dial(spec) {
size=dial_overall_size(spec);
color("black") cube(size);
}
function dial_constructor (
  description, 
  overall_size, nominal_size,
  radial_rectangles = [],
  radial_texts = [],
  horizontal_texts = []) = 
    [description, 
    overall_size, nominal_size,
    radial_rectangles,
    radial_texts,
    horizontal_texts];
function rectangular_dial_constructor (
  description, 
  overall_size, nominal_size,
  other_specifications) = 
    [description, 
    overall_size, nominal_size,
    other_specifications];
// TODO: Replace dial_constructor "other_specifcations" with 
//        real parameters for dials
module dial (spec){
// TODO: Replace cube construct with dial part construction
size=dial_overall_size(spec);
if (size.x == size.y)
  round_dial(spec);
else
  rectangular_dial(spec);
}
