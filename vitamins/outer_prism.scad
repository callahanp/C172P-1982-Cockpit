function outer_prism_manufacturer(spec) = spec[0];
function outer_prism_model(spec) = spec[1];
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

function outer_prism_description(spec) = spec[0];
function outer_prism_overall_size(spec) = spec[1];
function outer_prism_nominal_size(spec) = spec[2]; 
function outer_prism_min_thickness(spec) = spec[3];
function alignment_semicircle_dia(spec) = spec[4];

function outer_prism_constructor (
  description, 
  overall_size, nominal_size,
    min_thickness,
    alignment_semicircle_dia) = 
    [description, 
    overall_size, nominal_size,
    min_thickness,
    alignment_semicircle_dia];
module outer_prism (spec){

min_thickness=outer_prism_min_thickness(spec);
nominal_size=outer_prism_nominal_size(spec);
size=outer_prism_overall_size(spec);
a=atan((size.z-min_thickness)/size.y);
echo("a",a);
echo("size.z", size.z);

// Turn the cylinder into a prism
%difference(){
  union(){
    cylinder(d=nominal_size, h=size.z, $fn=200);
  }
  rotate([a,0,0]) 
    translate([-eps,-eps,size.z+min_thickness-1.5*eps])
      cube([size.x+2*eps, size.y+2*eps,size.z+eps],center=true);
  }
}
