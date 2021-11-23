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
// eps_slot.scad
include <core/core.scad>

use <../utils/move.scad>
module eps_slot(  width, length, height, eps_size=[0,0,0],
                adjust_length_for_chord_radius=0,
                round_top=false, round_bottom=false, round_corner_bottom=0,flare_bottom =0, $fn=100){
  // slots are constructed from a cube, with possibly a rounded top, a rounded bottom or a flared bottom.
  // the resulting slot is in the xy plane, extruded to height along the z axis.

  // position of the slot is determined by the center position of the slot at y=0, and rotation is then applied.
  // a second positioning using a radius moves the top of the slot, determined by the center of the top if it is flat,
  // or by the center of the rounded top if rounded.  Movement is calculated radially based on the position of bottom of the slot

  l= length -(round_top ? width/2:0) - (round_bottom ? width/2 : 0);
  h1=length -(round_top ? width/2:0); 
  slot_initial_position=[-width/2,0,0];
  cube_initial_pos=round_bottom ? [-width/2,width/2,0] : [-width/2,0,0];
  z_size_eps=eps_size[2];
  z_height=height+z_size_eps;

  if (round_top) 
      translate([0,h1,0]) 
      difference() {
        cylinder(d=width, h=z_height,$fn=$fn);
        translate([-width/2,-width,-eps]) 
        translate([0,0,-eps])  cube([width,width-eps, z_height+4*eps ]);
      }
  if (round_bottom) 
      translate([width/2,width/2,-eps]) cylinder(d=width, h=z_height,$fn=$fn);
  if (flare_bottom != 0) {
    //flare right
    translate([width/2-eps/16,0,0]){
      difference(){
      cube([flare_bottom,flare_bottom, z_height]);
      color("red") translate([flare_bottom,flare_bottom,-eps]) cylinder(r=flare_bottom, h=z_height+2*eps);
      }
    }
    // flare left
    translate([-width/2-flare_bottom+eps/16,0,0]){
      difference(){
      cube([flare_bottom,flare_bottom, z_height]);
      color("red") translate([0,flare_bottom,-eps]) cylinder(r=flare_bottom, h=z_height+2*eps);
      }
    
    }
    

      translate(cube_initial_pos) cube([width, l, z_height]);
    }
  }

  translate([0,0,0])
  difference() {
    cube([3.25,3.25,.25]);
    { 
      translate([3.25/2,3.25/2,-eps]) 
        cylinder(d=2.8,h=.25+2*eps);
      move(position=[3.25/2,3.25/2,0],eps_position=[0,0,-1*eps],
           rotation=[0,0,-45], 
           radial=[45,1.39,-eps])
          eps_slot( 7/32, 7/64+1/16+1/64,.125, 
          eps_size=[0,0,2*eps],
          round_top=true,flare_bottom=0.0375); 
 
    }         
  }
