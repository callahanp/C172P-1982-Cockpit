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
// instrument_die.scad

include <../core/core.scad>
include <../dies/slot_die.scad>
module instrument_slot ( size, thickness, angles, slot_width, center_distance, flare_radius) {
  chord_length=slot_width+2*flare_radius;
  for (a=angles) {
    let (x=sin(a)*(sqrt((size/2)^2-(chord_length/2)^2)),
          y=cos(a)*(sqrt((size/2)^2-(chord_length/2)^2)),
          slot_length=slot_width/2+((center_distance-size)/2)
                    +(size/2-sqrt((size/2)^2-(slot_width+2*flare_radius)^2))/4){
    translate([x,y,0]) 
      rotate([0,0,-a]) 
        slot_die([0,0,0],slot_width, slot_length, thickness, round_top=true, flare_bottom=flare_radius);
    }
  }
}  

//use <../../utils/dies/instrument_die.scad>
// slot(width, length, height, round_top=false, round_bottom=false, flare_bottom =0, $fn=100)
// slot_specs: [[angles],slot_width, center_distance, flare_radius]
//                [x,y,z]    3.125 panel_thickness
//                           2.25               [slot_specs]            [slot_specs]
//                           1                
module instrument_die(position, size,  thickness, mounting_slots=[], adjuster_slots=[], $fn=$fn ){

translate(position+[0,0,-2*eps]){
  
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
}

