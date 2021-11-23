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
function case_part_id(spec)        = spec[0];
function case_description(spec)    = spec[1];
function case_overall_size(spec)   = spec[2];
function case_nominal_size(spec)   = spec[3]; 
function case_wall_thickness(spec) = spec[4];
function case_corner_chamfer(spec) = spec[5];
function case_mounting_holes(spec) = spec[6];
function case_rear_connector_holes(spec) = spec[7];
function case_constructor (
   part_id,
   description, 
  overall_size, nominal_size, 
  case_wall_thickness, corner_chamfer,
  rear_mounting_holes=[],
  rear_connector_holes=[]
  ) = 
    [part_id,
    description, 
    overall_size, nominal_size,
    case_wall_thickness, corner_chamfer,
    rear_mounting_holes,
    rear_connector_holes];

module case (spec){
// TODO: Replace cube construct with case part construction
thickness=case_wall_thickness(spec);
size=case_overall_size(spec);
// TODO: Chamfer 4 edges
// TODO: Rear connector holes
// TODO: Rear Mounting holes
difference(){
color("black") cube(size);
translate([thickness,thickness,thickness])
 color(grey(40)) cube(size-[2*thickness,2*thickness,0]);
}
}
