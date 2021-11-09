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
use <../utils/core/core.scad>
use <../utils/dies/circle_die.scad>
use <../utils/dies/slot_die.scad>
use <../utils/dies/rounded_rectangle_die.scad>
use <../utils/dies/round_corner_die.scad>
use <../utils/dies/instrument_die.scad>
use <../utils/dies/bezier_triangle_die.scad>


function panel_width(type)= type[0][2][0];

module panel_differences(panel_difference_list,panel_thickness) {
for (item = panel_difference_list){
     echo (item);
      operation=item[1];
      spec=item[2];
      
      if (operation == "Corner Cut") {
        round_corner_die (corner_position=spec[0], radius=spec[1], height=spec[2], angle=spec[3]);
      }
      if (operation == "Round") {
        circle_die(position=spec[0], diameter=spec[1], height=spec[2]);
      }
      if (operation == "Slot") {
        echo(spec);
        slot_die(position=spec[0], width=spec[1], length=spec[2], height=spec[3],
                 round_top=spec[4]==1?true:false, round_bottom=spec[5]==1?true:false, flare_bottom =spec[6]);
      }
      if (operation == "Instrument") {

        instrument_die(position=spec[0], size=spec[1],  thickness=spec[2], mounting_slots=spec[3], adjuster_slots=spec[4]);
      }
      if (operation =="Rounded Rectangle") {
         echo(spec);
         rounded_rectangle_die ( position=spec[0], width=spec[1], length=spec[2], thickness=spec[3], radius=spec[4]);
      }
      if (operation == "Bezier Edge"){
      //  echo(spec);
        bezier_triangle_die(position=spec[0], xyPath=spec[1], tStep=spec[2], path_closure=spec[3], height=spec[4]);
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