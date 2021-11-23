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

include <bezel.scad>
std_2_25_scale = 2.25/3.125;
std_2_25_4_mounts        =[5/32, 2.625/2, [45,135,225,315]];
std_2_25_ring_spec       =[7/64, 2.25, 2.25-1/64,  1+7/8, 7/64];
std_2_25_egt_center_adjust_shroud =[1+13/16, "round", 3/4, 7/16];
std_2_25_prism_well_spec=bezel_prism_well_constructor(
    well_dia                   = 3.0 * std_2_25_scale, 
    well_depth                 = 11/32 * std_2_25_scale,
    trapezoid_top_width        = 2.025 * std_2_25_scale,
    trapezoid_bottom_width     = 2.8   * std_2_25_scale, 
    round_rectangle_width      = 2.25  * std_2_25_scale,
    round_rectangle_corner_dia = 1/4   * std_2_25_scale);
std_2_25_lens_well_spec=[2.125,13/32];
std_2_25_face_plate_mounts=[0.1065,[[.1875,1.875,0],[0.1875,0.5,0],[2.1875,1.875,0],[2.1875,0.5,0]]];

std_3_125_attidude_indicator_center_adjust_shroud =[1+13/16, "trapezoid", 11/32, 21/32, 5/16, 7/16];
std_3_125_ring_spec=[9/64, 3+1/8, 3+1/16, 2.8, 5/64]; //Height, outside Diameter, chamfer_od, inside dia, chamfer_height
std_3_125_4_mounts =[5/32, 3.5/2, [45,135,225,315]];
std_3_125_3_mounts =[5/32, 3.5/2, [45,135,315]];
std_3_125_2_mounts =[5/32, 3.5/2, [45,315]];
std_3_125_one_adjuster=[ 3/8, 3/16, 1/8, (3+3/16)/2,[225]]; // outer_ring, brass_fitting_od, brass_fitting_id, angles
std_3_125_two_adjusters=[ 3/8, 3/16, 1/8,(3+3/16)/2,[135,225]]; // outer_ring, brass_fitting_od, brass_fitting_id, angles
no_adjuster=[];
std_3_125_face_plate_mounts=[0.1065,[[7/32, 11/16, 0], [7/32, 2+9/16, 0],
                          [3+1/32, 11/16,0], [3+1/32, 2+9/16, 0 ]]];
std_3_125_compass_rose_mounts=[7/32, 1+9/16, 3/64,[70,160,290]]; // slot width, slot_center_radius drill size, slot angles.
attitude_indicator_ring_spec=[9/64, 3+1/8, 2.8, 2.25 ]; //Height, outside Diameter, chord_width, inside dia, 
std_3_125_lens_well_spec=[3.0+1/128, 13/32];// Diameter, depth
std_3_125_prism_well_spec=bezel_prism_well_constructor(
    well_dia=3.0, 
    well_depth=11/32,
    trapezoid_top_width=2.025,
    trapezoid_bottom_width=2.8, 
    round_rectangle_width=2.25,
    round_rectangle_corner_dia=1/4);
// TODO: Update with parts representing actual bezels
//                       Manufacturer  Model            Part Number    Description  Bounding Cube  spec

airspeed_bezel = bezel_constructor("Standard Bezel with 4 Mounting Holes", 
                  [3.25,3.25,3/8], 3.25,  
                  bezel_mounts=std_3_125_4_mounts,
                  adjusters=no_adjuster,
                  face_plate_mounts=std_3_125_face_plate_mounts,
                  compass_points_mounts=std_3_125_compass_rose_mounts, 
                  bezel_ring_spec=std_3_125_ring_spec,
                  lens_well_spec=std_3_125_lens_well_spec, 
                  prism_well_spec=std_3_125_prism_well_spec);
attitude_indicator_bezel = bezel_constructor("Standard Bezel with center_adjuster",
                  [3.25,3.25,3/8], 3.25, 
                  bezel_mounts=std_3_125_4_mounts,
                  adjusters=[],
                  face_plate_mounts=std_3_125_face_plate_mounts,
                  compass_points_mounts=std_3_125_compass_rose_mounts, 
                  bezel_ring_spec=std_3_125_ring_spec,
                  lens_well_spec=std_3_125_lens_well_spec, 
                  prism_well_spec=std_3_125_prism_well_spec,
                  center_adjust_shroud_spec=std_3_125_attidude_indicator_center_adjust_shroud);
altimeter_bezel =     bezel_constructor("Altimeter Indicator Bezel", 
                  [3.25,3.25,3/8], 3.25, 
                  bezel_mounts=std_3_125_3_mounts,
                  adjusters=std_3_125_one_adjuster,
                  face_plate_mounts=std_3_125_face_plate_mounts,
                  compass_points_mounts=std_3_125_compass_rose_mounts, 
                  bezel_ring_spec=std_3_125_ring_spec,
                  lens_well_spec=std_3_125_lens_well_spec, 
                  prism_well_spec=std_3_125_prism_well_spec);

turn_coordinator_bezel=airspeed_bezel; 

heading_bezel = bezel_constructor("Standard Bezel with 2 Adjusters", 
                  [3.25,3.25,3/8], 3.25,  
                  bezel_mounts=std_3_125_2_mounts,
                  adjusters=std_3_125_two_adjusters,
                  face_plate_mounts=std_3_125_face_plate_mounts,
                  compass_points_mounts=std_3_125_compass_rose_mounts, 
                  bezel_ring_spec=std_3_125_ring_spec,
                  lens_well_spec=std_3_125_lens_well_spec, 
                  prism_well_spec=std_3_125_prism_well_spec); 
vertical_speed_bezel = airspeed_bezel;
adf_bezel =     bezel_constructor("Bendix-King KI-225 ADF Indicator Bezel", 
                  [3.25,3.25,3/8], 3.25, 
                  bezel_mounts=std_3_125_3_mounts,
                  adjusters=std_3_125_one_adjuster,
                  face_plate_mounts=std_3_125_face_plate_mounts,
                  compass_points_mounts=std_3_125_compass_rose_mounts, 
                  bezel_ring_spec=std_3_125_ring_spec,
                  lens_well_spec=std_3_125_lens_well_spec, 
                  prism_well_spec=std_3_125_prism_well_spec);
vor_loc_glideslope_bezel =     
                bezel_constructor("Bendix-King KI-206 VOR/LOC/Glideslope Indicator Bezel", 
                  [3.25,3.25,3/8], 3.25, 
                  bezel_mounts=std_3_125_3_mounts,
                  adjusters=std_3_125_one_adjuster,
                  face_plate_mounts=std_3_125_face_plate_mounts,
                  compass_points_mounts=std_3_125_compass_rose_mounts, 
                  bezel_ring_spec=std_3_125_ring_spec,
                  lens_well_spec=std_3_125_lens_well_spec, 
                  prism_well_spec=std_3_125_prism_well_spec);

tachometer_bezel=airspeed_bezel;

egt_bezel =     
                bezel_constructor("Bendix-King KI-206 VOR/LOC/Glideslope Indicator Bezel", 
                  [2.375,2.375,3/8], 2.25, 
                  bezel_mounts=std_2_25_4_mounts,
                  adjusters=[],
                  face_plate_mounts=std_2_25_face_plate_mounts,
                  compass_points_mounts=[], 
                  bezel_ring_spec=std_2_25_ring_spec,
                  lens_well_spec=std_2_25_lens_well_spec, 
                  prism_well_spec=std_2_25_prism_well_spec,
                  center_adjust_shroud_spec=std_2_25_egt_center_adjust_shroud);

// TODO: Update bezels list with new parts defined above
bezels = [airspeed_bezel,attitude_indicator_bezel, altimeter_bezel,
          turn_coordinator_bezel, 
          heading_bezel, 
          vertical_speed_bezel,
          tachometer_bezel, egt_bezel,
          vor_loc_glideslope_bezel,vor_loc_glideslope_bezel,adf_bezel];
