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

function inner_prism_description(spec) = spec[0];
function inner_prism_overall_size(spec) = spec[1];
function inner_prism_nominal_size(spec) = spec[2]; 
function inner_prism_min_thickness(spec) = spec[3];
function inner_prism_top_width(spec) = spec[4];
function inner_prism_side_chamfer_angle(spec) = spec[5];

function inner_prism_constructor (
  description, 
  overall_size, nominal_size,
  min_thickness,
  top_width,
  side_chamfer_angle) = 
    [description, 
    overall_size, nominal_size,
    min_thickness,
    top_width,
    side_chamfer_angle];
module inner_prism (spec){
// TODO: Construct upper polyhedral part of the inner prism

// TODO: spherical holes for lamps in upper part of the inner prism
nominal_size=inner_prism_nominal_size(spec);
min_thickness = inner_prism_min_thickness(spec);
size=inner_prism_overall_size(spec);
a=atan((size.z-min_thickness)/size.y);
echo("a",a);
echo("size.z", size.z);

// Turn the cylinder into a prism
difference(){
  union(){
    cylinder(d=nominal_size, h=size.z, $fn=200);
  }
  rotate([a,0,0]) 
    translate([0,0,size.z+min_thickness-1.5*eps])
      cube([size.x+eps, size.y+eps,size.z+eps],center=true);
  }
}
