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
include <panel.scad>
include <../utils/core/core.scad>

upper_right=45;
upper_left = 315;
lower_left = 225;
lower_right = 135;
above_lower_left=238;
below_lower_right=148;
lower_center = 180;
panel_thickness=1/16;
//  x and y for instruments in columns and rows
c1=7;
c2=c1+3.5;
c3=c2+3.5;
c4=c3+3.5;
r1=9.5;
r2=5.75;
r3=2;
panel_mounting_hole_dia=.1625;
instrument_mount_dia=0.1695;
fuel_and_oil_mounting_hole_dia=.1430;
corner_radius=0.25;
yoke_corner_radius=0.75;
left_yoke_edge=9+9/16;
right_yoke_edge=11+5/16;
yoke_slot_width=1.75;                                                                   ;
no_adjusters  = [[],0,0,0];
one_adjuster  = [[lower_left], 11/32,  3.375, 1/16];
two_adjusters = [[lower_left, lower_right], 11/32,  3.375, 1/16];
three_mounts  = [[upper_left, upper_right, lower_right],5/32, 3.5, 1/16];
two_adjuster_mounts =[[upper_left, upper_right, above_lower_left, below_lower_right],5/32, 3.5, 1/16];
four_mounts = [[upper_left, upper_right, lower_left, lower_right],5/32, 3.5, 1/16];
four_mounts_225 = [[upper_left, upper_right, lower_left, lower_right],5/32, 2.625, 1/16];
lower_center_adjuster = [[lower_center], 1/2, 3.125, 1/16];
eps_lower_left=[0, 0, 0];
eps_lower_right=[0, eps, 0];
eps_upper_right=[eps,  eps, 0];


h=12 + 3/16;
w=19 + 13/16;
// Abbreviations
pt=panel_thickness;

//      Description             Operation      Measures
C172P_1982_Pilot_panel=
  [ ["Overall Measurement", "Height & Width", [w, h, panel_thickness]],  
  //                                      position, radius, height, angle 
    [ ["Lower Left Corner", "Corner Cut",[[0,0,0],corner_radius, pt, lower_left]],
      ["Lower Right Corner","Corner Cut",[[w,0,0],corner_radius, pt, lower_right]],
      ["Upper Right Corner","Corner Cut",[[w,h,0],corner_radius, pt, upper_right]],
      ["Yoke Slot", "Slot",              [[10.5,0,0], 1.75, 3.375, pt, 1, 0, 0.75]], 
      ["Panel Mounting Hole","Round",    [[5/16, 0.5, 0], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",    [[9+1/16, 0.25, 0], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",    [[11+13/16, 0.25, 0], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",    [[w-5/16, 0.25, 0], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",    [[w-5/16, h-5/16, 0], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",    [[13+7/16, 11+13/16, 0], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[7+1/2, 11+5/8, 0], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[15/16, 9, 0], panel_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges - Upper Left Mount", "Round",[[    7/8, 6.000, 0],fuel_and_oil_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges - Upper Right Mount","Round",[[5 + 1/8, 6.000, 0],fuel_and_oil_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges - Lower Left Mount", "Round",[[5 + 1/8, 3+15/16, 0],fuel_and_oil_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges - Lower Right Mount","Round",[[    7/8, 3+15/16, 0],fuel_and_oil_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges","Rounded Rectangle",[[1+3/32+3.875/2,2+7/8+4.1755/2,0],3.875, 4.1755, pt, 1/8]],
      ["Suction","Round",[[1.75, 8.25, 0], 1.00,   panel_thickness]],
      ["Amps",   "Round",[[2.875, 1.5, 0], 2+1/16, panel_thickness]],
      ["Voltage","Round",[[4.5,  7/16, 0], 0.5,    panel_thickness]],
      ///instrument_die(position, size,  thickness, mounting_slots=[], adjuster_slots=[], $fn=$fn )
      ["Clock","Instrument",            [[ 4, 9, 0], 2.25,  pt,   four_mounts_225,  no_adjusters]],
      ["Airspeed","Instrument",         [[c1,r1, 0], 3.125, pt,   four_mounts, no_adjusters]],
      ["Attitude","Instrument",         [[c2,r1, 0], 3.125, pt,   four_mounts,lower_center_adjuster]],
      ["Altimeter","Instrument",        [[c3,r1, 0], 3.125, pt,   three_mounts, one_adjuster]],
      ["CDI1","Instrument",             [[c4,r1, 0], 3.125, pt,   three_mounts, one_adjuster ]],
      ["Turn Coordinator","Instrument", [[c1,r2, 0], 3.125, pt,   four_mounts,no_adjusters]],
      ["Heading Indicator","Instrument",[[c2,r2, 0], 3.125, pt,   two_adjuster_mounts,two_adjusters,]],
      ["Vertical Speed","Instrument",   [[c3,r2, 0], 3.125, pt,   four_mounts,  no_adjusters]],
      ["CDI2","Instrument",             [[c4,r2, 0], 3.125, pt,   three_mounts, one_adjuster]],
      ["Tachometer","Instrument",       [[c1,r3, 0], 3.125, pt,   four_mounts,  no_adjusters]],
      ["EGT","Instrument",              [[c3,r3, 0], 2.25,  pt,   four_mounts_225,  no_adjusters]],
      ["ADF","Instrument",              [[c4,r3, 0], 3.125, pt,   three_mounts, one_adjuster]],  
      ["Upper Left Curve", "Bezier Edge", 
       [[0,0,0],
        [[0,       7.0],       
        [.03,  7.5],  
        [.3125, 8.5],
        [.54 ,    9],   
        [.95,     9.875  ],  
        [1+11/32, 10.1],
        [2,       10.8] ,   
        [3,       11.0925],
        [4,       11.375],  
        [5,       11.625],
        [6,       11.8125] ,   
        [7,       12.03125],   
        [8,       12.03125],   
        [9,       12.0925],   
        [10,      12.125],   
        [11,      12.166],   
        [12,      12.179],   
        [13,      12.1875]], 0.02, [[0,12.1880],[0,7]],pt]]
    ]];

panels=[C172P_1982_Pilot_panel];
