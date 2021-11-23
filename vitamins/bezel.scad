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
include <../utils/core/core.scad>
use <../utils/eps_cylinder.scad>
include <../utils/eps_cube.scad>
use <../utils/move.scad>

function bezel_description(spec)  = spec[0];
function bezel_overall_size(spec) = spec[1];
function bezel_nominal_size(spec) = spec[2]; 
function bezel_mounts_spec(spec)=spec[3];
function bezel_adjusters_spec(spec)=spec[4];
function bezel_face_plate_mounts_spec(spec)=spec[5];
function bezel_compass_points_mounts_spec(spec)=spec[6];
function bezel_ring_spec(spec)=spec[7];
function bezel_lens_well_spec(spec)=spec[8];
function bezel_prism_well_spec(spec)=spec[9];

function bezel_mounts_spec_constructor(
  description="",
  hole_dia=5/32,
  radius=1.75, 
  angles=[45,135,225,315])
  =[description,hole_dia, radius, angles];
function bezel_mounts_hole_dia(spec) = spec[1];
function bezel_mounts_radius(spec) = spec[2];
function bezel_mounts_angles(spec) = spec[3];


function bezel_constructor (
  description, 
  overall_size, nominal_size,
    bezel_mounts=[],
    adjusters=[],
    face_plate_mounts=[],
    compass_points_mounts=[],
    bezel_ring_spec=[],
    lens_well_spec=[],
    prism_well_spec=[],
    center_adjust_shroud_spec=[]) = 
    [description, 
    overall_size, nominal_size,
    bezel_mounts,
    adjusters,
    face_plate_mounts,
    compass_points_mounts,
    bezel_ring_spec,
    lens_well_spec,
    prism_well_spec,
    center_adjust_shroud_spec
    ];



module face_mounts (spec,size){
  dia=spec[0];
  points=spec[1];
  depth=size.z*.75;
  x=-size.x/2;
  y=-size.y/2;
  color("white") 
    for (p=points){
      translate(p+[x,y,-eps]) cylinder(d=dia, h=depth+eps, $fn=75);
      }
}
module corner_cuts(spec){
  // TODO: Complete the bezel corner cuts feature
  echo("corner_cuts");
}
module case_rabbet(spec){
  // TODO: Complete the bezel case rabbet feature
  echo("case_rabbet");
}
module compass_points_mounts (spec){
  echo("compass_points_mounts", spec);
  // TODO: complete the bezel compass points mounts feature
}
module bezel_ring(spec, size){
  ring_height         = spec[0];
  ring_od             = spec[1];
  ring_chamfer_od     = spec[2];
  ring_id             = spec[3];
  ring_chamfer_height = spec[4];
  difference() {
    translate([0,0,size.z-eps])
    cylinder(d=ring_od, h=ring_height, $fn=200);
    translate([0,0,size.z+ring_height-ring_chamfer_height]) cylinder(d2=ring_chamfer_od, d1=ring_id, h=ring_chamfer_height,$fn=200);
  }
}
module bezel_mounts (spec,size){
 
  dia=spec[0];
  radius=spec[1];
  angles=spec[2];
  for (a=angles){
    x=sin(a)*radius;
    y=cos(a)*radius;
    translate([x,y,-eps]) cylinder(d=dia, h=size.z+2*eps, $fn=150);
  }
}

module adjusters (spec,size){
  //[ 3/8, 3/16, 1/8,(3+3/16)/2,[135,225]];
  od      = spec[0];
  md      = spec[1];
  id      = spec[2];
  radius  = spec[3];
  angles  = spec[4];
}
module lens_well(spec){
  echo ("lens_well(spec): ", spec);
lens_well_dia=spec[0];
lens_well_depth=spec[1];
move(position=[0,0,-eps])
  cylinder(d=lens_well_dia, h=lens_well_depth+eps, $fn=200);
}

function bezel_prism_well_constructor( 
    well_dia, 
    well_depth,
    trapezoid_top_width, 
    trapezoid_bottom_width,
    round_rectangle_width,
    round_rectangle_corner_dia)=[
    well_dia,
    well_depth,
    trapezoid_top_width,
    trapezoid_bottom_width, 
    round_rectangle_width,
    round_rectangle_corner_dia];
 

module prism_well(spec,size) {
  well_dia                   =spec[0];
  well_depth                 =spec[1];
  trapezoid_top_width        =spec[2];
  trapezoid_bottom_width     =spec[3];
  round_rectangle_width      =spec[4];
  round_rectangle_corner_dia =spec[5];



// Hang on to your hat. 

// the points used to define the location of the mounts screws for the compass points
// insert on the ADF and other instruments with compass dials are 70 degrees 
// on either side of vertical. The mounts tabs are 7/32 wide.  
// 
// The flat part of the inner prism extends to just below the tab.
// At that point the chord connecting the two points measures 2.8 inches.
// 
// From this we calculate the x and y distance from the center for these two points.
// We want a trapezoid above and a rectangle below the chord to remove material.

// We use the points to define two vectors, one of points, and a second of
// faces formed by the points.

// Numbering of the points starts with zero in the lower left of the rectangle and 
// proceeds in a clockwise manner.  points on the shape above are also numbered clockwise.
// combining the points to form faces must be listed in clockwise order.  The top and bottom
// each have 6 points.  The points on the bottom are listed 5,4,3,2,1,0 which is clockwise
// if you look from the perspective of the outside of the shape, and anti-clockwise if you
// are looking from the inside.  The top is listed 6,7,8,9,10 which is clockwise from outside.
//
// the remaining faces, the sides are easy.  pick the lower two points in ascending order,
// then the upper two in descending order and we have our viewed from outside faces.



y0=size.y/2; //The center is [y0,y0]
y1=y0+sqrt(((well_dia/2)^2-(trapezoid_bottom_width/2)^2));
y2=y0+well_dia/2-1/16;

x0=y0-trapezoid_bottom_width/2;
x1=y0-trapezoid_top_width/2;
x2=y0+trapezoid_top_width/2;
x3=y0+trapezoid_bottom_width/2;
z1=well_depth+eps;

p=[[x0,y0,0],
   [x0,y1,0],
   [x1,y2,0],
   [x2,y2,0],
   [x3,y1,0],
   [x3,y0,0],
   [x0,y0,z1],
   [x0,y1,z1],
   [x1,y2,z1],
   [x2,y2,z1],
   [x3,y1,z1],
   [x3,y0,z1]];

f=[ [5,4,3,2,1,0], [6,7,8,9,10,11],
    [0,1,7,6], [1,2,8,7], [2,3,9,8] ,[3,4,10,9],[4,5,11,10],
    [5,0,6,11]];
echo(p,f);

rectangle_length=y2-y1;
  move([-round_rectangle_width/2,
        well_dia/2+1/64-rectangle_length,-eps]) 

    eps_cube(
      [round_rectangle_width, rectangle_length, well_depth], 
      eps_size=[0,0,eps],
      round_xy_radius=round_rectangle_corner_dia, $fn=100);
  translate([-y0,-y0,-eps]) polyhedron(p,f);
    
}
 
module bezel (spec){

/*
// The height above the center of these points is labeled] y1.
difference() {
*/
size=bezel_overall_size(spec);
bezel_ring_spec=bezel_ring_spec(spec);
adjusters_spec           =bezel_adjusters_spec(spec);
prism_well_spec          =bezel_prism_well_spec(spec);
bezel_mounts_spec      =bezel_mounts_spec(spec);
face_mounts_spec       =bezel_face_plate_mounts_spec(spec);
compass_points_spec      =bezel_compass_points_mounts_spec(spec);
lens_well_spec           =bezel_lens_well_spec(spec);
difference(){
  union() {
    translate([0,0,size.z/2]) cube(size,center=true);
    bezel_ring(bezel_ring_spec, size);
  }

  ring_id=bezel_ring_spec[3];
  ring_height=bezel_ring_spec[4];
  translate([0,0,-eps]) cylinder( d=ring_id, h=size.z+ring_height+2*eps, $fn=200);
  color("black") lens_well(lens_well_spec);
  echo("Prism well spec: ", prism_well_spec);
  color("white") prism_well(prism_well_spec, size);
  bezel_mounts(bezel_mounts_spec, size);
  face_mounts(face_mounts_spec,size);
  compass_points_mounts(compass_points_spec);
  adjusters(adjusters_spec);
  }
}
 