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
use <bezier_curve.scad>;
/* Panels are used in Aircraft Instrument Panels and individual radios.
// They are mounted on the Aircraft Console, or to radio enclosures.
// Radio enclosures are mounted to an area of the console called the 
// Radio Stack.

// A panel starts as a rectangular flat plate.

// Remove Corners and edge curves and place
// circular and rectangular shapes to be remove
// the needed holes for the various instruments, 
// gauges, controls, switches and displays.
*/
include <../utils/core/core.scad>

use <../utils/eps_cylinder.scad>
use <../utils/move.scad>
use <../utils/eps_slot.scad>
use <../utils/eps_cube.scad>
use <../utils/eps_corner_cut.scad>
use <../utils/eps_triangle_curved_hypotenuse.scad>


function panel_width(type)= type[0][2][0];
module instrument_slot ( size, thickness, angles, slot_width, center_distance, flare_radius) {
  chord_length=slot_width+2*flare_radius;
  for (a=angles) {
    let (x=sin(a)*(sqrt((size/2)^2-(chord_length/2)^2)),
          y=cos(a)*(sqrt((size/2)^2-(chord_length/2)^2)),
          slot_length=slot_width/2+((center_distance-size)/2)
                    +(size/2-sqrt((size/2)^2-(slot_width+2*flare_radius)^2))/4){
        move(position=[x,y,0], rotation=[0,0,-a]) 
        eps_slot(slot_width, slot_length, thickness, round_top=true, flare_bottom=flare_radius);
    }
  }
}  

//use <../../utils/dies/instrument_die.scad>
// slot(width, length, height, round_top=false, round_bottom=false, flare_bottom =0, $fn=100)
// slot_specs: [[angles],slot_width, center_distance, flare_radius]
//                [x,y,z]    3.125 panel_thickness
//                           2.25               [slot_specs]            [slot_specs]
//                           1                
module instrument_opening( size,  thickness, mounting_slots=[], adjuster_slots=[], $fn=$fn ){
  
  instrument_slot(size=size, thickness=thickness+4*eps, angles=mounting_slots[0], 
      slot_width=mounting_slots[1], 
      center_distance=mounting_slots[2], 
       flare_radius=mounting_slots[3]);
  
  instrument_slot(size=size,thickness=thickness+4*eps,angles=adjuster_slots[0], 
      slot_width=adjuster_slots[1], 
      center_distance=adjuster_slots[2], 
       flare_radius=adjuster_slots[3]);
  cylinder(d=size, h=thickness+4*eps, $fn=$fn);
}

module panel_differences(panel_difference_list,panel_thickness) {
for (item = panel_difference_list){
     echo (item);
      operation=item[1];
      spec=item[2];
      eps_z = [0,0,-eps];
      if (operation == "Corner Cut") {
        move(position=spec[0],eps_position=[0,0,-eps]) 
        eps_corner_cut ( eps_corner_cut_constructor(radius=spec[1], height=spec[2]+2*eps, angle=spec[3]));
      }
      if (operation == "Round") {
        move(position=spec[0],eps_position=[0,0,-eps])  eps_cylinder( diameter=spec[1], height=spec[2], eps_size=[0,0,2*eps]);
      }
      if (operation == "Slot") {
        echo(spec);
        move(spec[0],eps_position=eps_z)
        eps_slot(width=spec[1], length=spec[2], height=spec[3]+2*eps,
                 round_top=spec[4]==1?true:false, round_bottom=spec[5]==1?true:false, flare_bottom =spec[6]);
      }
      if (operation == "Instrument") {

        move(spec[0],eps_z) instrument_opening( size=spec[1],  thickness=spec[2], mounting_slots=spec[3], adjuster_slots=spec[4]);
      }
      if (operation =="Rounded Rectangle") {
         echo(spec);
         move(spec[0],[-spec[1]/2,-spec[2]/2,-eps])
         eps_cube ( [spec[1], spec[2],spec[3]], eps_size=[0,0,2*eps], round_xy_radius=spec[4]);
      }
      if (operation == "Bezier Edge"){
      //  echo(spec);
       move(spec[0], eps_position=[0,0,-eps]) 
        eps_triangle_curved_hypotenuse( xyPath=spec[1], tStep=spec[2], path_closure=spec[3], height=spec[4],
                  eps_size=[0,0,2*eps]);
      }
    }
}
module panel(panel_spec){
  panel_outline=panel_spec[0];
  panel_difference_list=panel_spec[1];
  panel_cube=panel_outline[2];
  panel_thickness=panel_cube[2];
  difference() {
    cube(panel_outline[2]);
    panel_differences(panel_difference_list,panel_thickness);
  }
}