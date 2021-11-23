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

function dial_plate_description(spec) = spec[0];
function dial_plate_overall_size(spec) = spec[1];
function dial_plate_nominal_size(spec) = spec[2]; 
function dial_plate_od(spec) = spec[3];
function dial_plate_rd(spec) = spec[4];
function dial_plate_id(spec) = spec[5];
function dial_plate_rabbet_height(spec) = spec[6];

function dial_plate_constructor (
  description, 
  overall_size, nominal_size,
  dial_plate_od, 
  dial_plate_rd,
  dial_plate_id,
  dial_plate_rabbet_height) = 
    [description, 
    overall_size, nominal_size,
    dial_plate_od, 
  dial_plate_rd,
  dial_plate_id,
  dial_plate_rabbet_height];

module dial_plate (spec){
size=dial_plate_overall_size(spec);
outside_dia=dial_plate_od(spec);
rabbet_dia=dial_plate_rd(spec);
inside_dia=dial_plate_id(spec);
rabbet_height=dial_plate_rabbet_height(spec);
echo("rabbet_dia",rabbet_dia);
echo("outside_dia",outside_dia);
echo("rabbet_height",rabbet_height);
echo("size.z",size.z);


  difference(){
    union(){
      color("black")cylinder(d=rabbet_dia, h=size.z, $fn=200);
      color(grey(30)) cylinder(d=outside_dia, h=rabbet_height, $fn=200);
    }
    translate([0,0,eps]) 
      cylinder(d=inside_dia, h=size.z+2*eps, $fn=200);
  }
}