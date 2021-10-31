use <panel.scad>
eps=1/128;
module C172P_1982_Panel(){
upper_right=315;
upper_left = 45;
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
fuel_and_oil_mounting_hole_dia=.1430;
corner_radius=0.25;
yoke_corner_radius=0.75;
left_yoke_edge=9+9/16;
right_yoke_edge=11+5/16;
yoke_slot_width=1.75;                                                                   ;
no_adjusters=[];
one_adjuster = [lower_left];
two_adjusters = [lower_left, lower_right];
three_mounts = [upper_left, upper_right, lower_right, above_lower_left,];
two_adjuster_mounts =[upper_left, upper_right, above_lower_left, below_lower_right];
four_mounts = [upper_left, upper_right, lower_left, lower_right];
lower_center_adjuster = [lower_center];
eps_lower_left=[-eps, -eps, -eps];
eps_lower_right=[-eps, eps, -eps];
eps_upper_right=[eps,  eps, -eps];
instrument_mount_dia=0.1695;
instrument_adjust_dia=3/8;
pt=panel_thickness;
iad=instrument_adjust_dia;
imd=instrument_mount_dia;
h=12 + 3/16;
w=19 + 13/16;
//      Description             Operation      Measures
  p=[ ["Overall Measurement", "Height & Width", [w, h, panel_thickness]],  
    [ ["Lower Left Corner", "Corner Cut",[corner_radius,[0,0,0],[corner_radius, corner_radius,0],eps_lower_left]],
      ["Lower Right Corner","Corner Cut",[corner_radius,[w-corner_radius, 0,0],[w-corner_radius,corner_radius,0],eps_lower_right]],
      ["Upper Right Corner","Corner Cut",[corner_radius,[w-corner_radius, h-corner_radius,0],[w-corner_radius,h-corner_radius,0],
                                           eps_upper_right]],
      ["Left Yoke Corner", "Corner Cut",[yoke_corner_radius,[left_yoke_edge-yoke_corner_radius, 0,0],
                                          [left_yoke_edge - yoke_corner_radius, 
                                          yoke_corner_radius,0],eps_lower_right]], 
      ["Right Yoke Corner", "Corner Cut",[yoke_corner_radius, [right_yoke_edge,0,0], 
                                          [right_yoke_edge+yoke_corner_radius, yoke_corner_radius,0],eps_lower_left]], 
      ["Yoke Circle",        "Round",[[left_yoke_edge+yoke_slot_width/2, 3+7/16-yoke_slot_width/2, -eps],yoke_slot_width, panel_thickness]],
      ["Yoke Slot",          "Rectangle",[left_yoke_edge, 0, yoke_slot_width, 3+7/16-yoke_slot_width/2]],
      ["Panel Mounting Hole","Round",[[5/16, 0.5, -eps], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[9+1/16, 0.25, -eps], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[11+13/16, 0.25, -eps], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[w-5/16, 0.25, -eps], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[w-5/16, h-5/16, -eps], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[13+7/16, 11+13/16, -eps], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[7+1/2, 11+5/8, -eps], panel_mounting_hole_dia, pt]],
      ["Panel Mounting Hole","Round",[[15/16, 9, -eps], panel_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges - Upper Left Mount", "Round",[[    7/8, 6.000, -eps],fuel_and_oil_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges - Upper Right Mount","Round",[[5 + 1/8, 6.000, -eps],fuel_and_oil_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges - Lower Left Mount", "Round",[[5 + 1/8, 3+15/16, -eps],fuel_and_oil_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges - Lower Right Mount","Round",[[    7/8, 3+15/16, -eps],fuel_and_oil_mounting_hole_dia, pt]],
      ["Fuel & Oil Gauges","Rounded Rectangle",[1+3/32,2+7/8,3.875, 4.1755, 1/8]],
      ["Suction","Round",[[1.75, 8.25, -eps], 1.00,   panel_thickness]],
      ["Amps",   "Round",[[2.875, 1.5, -eps], 2+1/16, panel_thickness]],
      ["Voltage","Round",[[4.5,  7/16, -eps], 0.5,    panel_thickness]],
      ["Clock","Instrument",            [[ 4, 9, -eps], 2.25, 2.3125, 2.625, one_adjuster, three_mounts, imd,iad,pt]],
      ["Airspeed","Instrument",         [[c1,r1, -eps], 3.125, 3.16, 3.50,   no_adjusters, four_mounts, imd,iad,pt ]],
      ["Attitude","Instrument",         [[c2,r1, -eps], 3.125, 3.16, 3.50,   lower_center_adjuster, four_mounts, imd,iad,pt]],
      ["Altimeter","Instrument",        [[c3,r1, -eps], 3.125, 3.16, 3.50,   one_adjuster, three_mounts, imd,iad,pt]],
      ["CDI1","Instrument",             [[c4,r1, -eps], 3.125, 3.16, 3.50,   one_adjuster, three_mounts, imd,iad,pt ]],
      ["Turn Coordinator","Instrument", [[c1,r2, -eps], 3.125, 3.16, 3.50,   no_adjusters, four_mounts, imd,iad,pt]],
      ["Heading Indicator","Instrument",[[c2,r2, -eps], 3.125, 3.16, 3.50,   two_adjusters, two_adjuster_mounts, imd,iad,pt]],
      ["Vertical Speed","Instrument",   [[c3,r2, -eps], 3.125, 3.16, 3.50,   no_adjusters, four_mounts, imd,iad,pt]],
      ["CDI2","Instrument",             [[c4,r2, -eps], 3.125, 3.16, 3.50,   one_adjuster, three_mounts, imd,iad,pt]],
      ["Tachometer","Instrument",       [[c1,r3, -eps], 3.125, 3.16, 3.50,   no_adjusters, four_mounts, imd,iad,pt]],
      ["EGT","Instrument",              [[c3,r3, -eps], 2.25, 2.3125, 2.625, no_adjusters, four_mounts, imd,iad,pt]],
      ["ADF","Instrument",              [[c4,r3, -eps], 3.125, 3.16, 3.50,   one_adjuster, three_mounts, imd,iad,pt]],  
      ["Upper Left Curve", "Bezier Edge", 
       [[[0,       7.0],       
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
        [13,      12.1875]], [[0,12.1880],[0,7]],0.02]]
    ]];
    panel(p);
}
C172P_1982_Panel();