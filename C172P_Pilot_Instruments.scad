use <bezier_curve.scad>;
function addvec(v, av) = (len(v) == len(av)) ? [ for (i = [ 0 : len(v)-1 ]) v[i] + av[i] ] : [0,0,0]; 
function vecmultconst(v, constant) = [ for (i = [ 0 : len(v)-1 ]) v[i] *constant ] ; 
column_1=7;
column_2=column_1+3.5;
column_3=column_2+3.5;
column_4=column_3+3.5;
row_1=9.5;
row_2=5.75;
row_3=2;
cut_height = .25;
upper_right=135;
upper_left = 45;
lower_left = 225;
lower_right = 315;
above_lower_left = 213;
no_adjusters = [];
echo(len(no_adjusters=no_adjusters));
one_adjuster = [lower_left];
two_adjusters = [lower_left, lower_right];
three_mounts = [upper_left, upper_right, lower_right];
two_adjuster_mounts =[upper_left, upper_right, above_lower_left];
four_mounts = [upper_left, upper_right, lower_left, lower_right];
yoke_slot_width=1 + 3/4;
yoke_slot_height=3 +3/8;
panel_width=19 + 7/8;
panel_height=12 + 3/16;
panel_mounting_hole_diameter=.1625;
panel_thickness=0.25;
corner_radius=0.25;
yoke_corner_radius=0.50;


    
module panel (panel_width, panel_height, panel_thickness) {
cube ([panel_width, panel_height, panel_thickness]);
}


module circular  (name ,position, diameter){
    echo(name);
    translate(position) 
    cylinder (d=diameter, $fn=720,center=true);
}

module rectangular  (name ,position,  width, length, rotation){
    echo(name);
    translate(position) rotate( [0,0,rotation]) cube ([ width, length, panel_thickness+1],center=true);}
    
module cut_slots( position, slot_positions, slot_width, slot_diameter) {

    if (len(slot_positions) > 0) {
       for ( i = [ 0: len(slot_positions)-1 ]) {
           angle_vector=[cos(slot_positions[i]), sin(slot_positions[i]),0];
           v1=addvec(position,vecmultconst(angle_vector,slot_diameter/2));
           v2=addvec(position,vecmultconst(angle_vector,(slot_diameter/2)-slot_width/2-.05));
           circular("slot_half_circle",v1,  slot_width );
           rectangular("slot sides", v2, slot_width, slot_width+.1, slot_positions[i]-90);
    }
  }
}
module instrument(  name,  instrument_position, instrument_size, mounting_slots, adjuster_slots) {
    //   position [x,y]    Center of instrument
    //  mounting_hole_positions   vector of integers 1 through 4 representing 
    //                                            1 - Upper Left 45° 5/32 or 3/16
    //                                            2 - Upper Right 45° 5/32 or 3/16
    //                                            3 - Lower Right 45° 5/32 or 3/16
    //                                            4 - Lower Left 45° 5/32 or 3/16
    //                                            5 - Lower Left 33° 3/16
    //  Adjuster position                vector of integers 3 or 4
    //                                            3 - Lower Right 45° 1/2 
    //                                            4 - Lower Left 45° 1/2 
    
    if ( instrument_size == 3.5) {
        circular ( "center hole", instrument_position, 3.125);
        cut_slots(instrument_position, mounting_slots, 3/16, 3.50);
        cut_slots(instrument_position, adjuster_slots, 1/2, 3.50); 
        }
    if ( instrument_size == 2.25) {
        circular ( "center hole", instrument_position, 2.125);
        cut_slots(instrument_position, mounting_slots, 5/32, 2.25);
        cut_slots(instrument_position, adjuster_slots, 1/2, 2.25); 
        }
    
    // top right mounting("mounting", 
}

module round_corner( position, radius, angle, panel_thickness ){
offset=[radius*.5* cos(angle)/abs(cos(angle)), radius*.5*sin(angle)/abs(sin(angle)),0];
    echo (offset);
  cube_position=addvec(position, offset);
    echo (cube_position);
difference(){translate(cube_position) cube ([radius+.1, radius+.1,panel_thickness], center=true);
translate (position) cylinder(r=radius, $fn=720, h=panel_thickness+.20,center=true);}

}

module cut (){
    
rectangular ("Yoke Slot - Bottom", [10.5, ((yoke_slot_height-yoke_slot_width/2))/2,0],  
    yoke_slot_width,yoke_slot_height-yoke_slot_width/2, 0);
    
circular ("Yoke Slot - Top", [10.5, yoke_slot_height-yoke_slot_width/2, 0], yoke_slot_width);
round_corner([10.5 - yoke_slot_width/2 - yoke_corner_radius, yoke_corner_radius,0], yoke_corner_radius, 315, 1);
round_corner([10.5 + yoke_slot_width/2 + yoke_corner_radius, yoke_corner_radius,0], yoke_corner_radius, 225, 15);
    
circular ("Panel Mounting Holes", [ 5/16, 0.5,0], panel_mounting_hole_diameter);
circular ("Panel Mounting Holes", [ 9+1/16, 0.5,0], panel_mounting_hole_diameter);
circular ("Panel Mounting Holes", [ 11+13/16, 0.5,0], panel_mounting_hole_diameter);
circular ("Panel Mounting Holes", [ panel_width - 1/4, 0.5,0], panel_mounting_hole_diameter);
circular ("Panel Mounting Holes", [ panel_width - 1/4, panel_height-5/16,0], panel_mounting_hole_diameter);
circular ("Panel Mounting Holes", [ 13 + 7/16, 11 + 13/16,0], panel_mounting_hole_diameter);
circular ("Panel Mounting Holes", [ 7 + 1/2, 11 + 5/8,0 ], panel_mounting_hole_diameter);
circular ("Panel Mounting Holes", [ 15/16, 9.0,0], panel_mounting_hole_diameter);
rectangular ("Fuel and Oil Gauges", [ 3.0, 5.0, 0 ],  3.875,4.1755, 0);
circular("Fuel and Oil Gauges - Upper Left Mount", [ 7/8, 6 ],.1430);
circular("Fuel and Oil Gauges - Upper Right Mount", [ ( 5 + 1/8), 6 ],.1430);
circular("Fuel and Oil Gauges - Lower Left Mount", [ 7/8, 3+15/16 ],.1430);
circular("Fuel and Oil Gauges - Lower Right Mount", [ ( 5 + 1/8), 3+15/16 ],.1430);
circular       ( "Suction",                [1.75, 8.25 ,0],    1.00);
instrument ( "Clock",                   [4, 9, 0],    2.25, [],[]);
circular       ( "Amps",                   [2.875, 1.5 ,0],   2 + 1/16);
circular       ( "Voltage",                [4.5, 0.5, 0],   0.5);
instrument ( "Tachometer",         [column_1, row_3, 0], 3.5, four_mounts,no_adjusters);
instrument ( "Turn Coordinator", [column_1, row_2, 0], 3.5, four_mounts,no_adjusters);
instrument ( "Airspeed",              [column_1, row_1, 0], 3.5, four_mounts,no_adjusters);
instrument ( "Attitude",               [column_2, row_1, 0], 3.5, four_mounts,no_adjusters);
instrument ( "Heading",               [column_2, row_2, 0], 3.5, two_adjuster_mounts,two_adjusters);
instrument ( "Altimeter",             [column_3, row_1, 0], 3.5, three_mounts,one_adjuster);
instrument ( "Vertical Speed",     [column_3, row_2, 0], 3.5,  four_mounts,no_adjusters);
instrument ( "EGT",                     [column_3, row_3, 0], 2.25, four_mounts,no_adjusters);
instrument ( "CDI1",                    [column_4, row_1, 0], 3.5, three_mounts,one_adjuster);
instrument ( "CDI2",                    [column_4, row_2, 0], 3.5, three_mounts,one_adjuster);
instrument ( "ADF",                     [column_4, row_3, 0], 3.5, three_mounts,one_adjuster);
instrument ( "CDI2",                    [column_4, row_2, 0], 3.5,  three_mounts,one_adjuster);
    path= [
        [0,       7.0],       
        [.03,  7.5],  
        [.125,    8] ,       
        [.3125, 8.5],
        [.54 ,    9] ,   
        [.95,     9.875  ],  
       [ 1+11/32, 10.1],
        [2,          10.8] ,   
        [3,         11.0925],
        [4,        11.375],  
        [5,         11.625],
        [6,        11.8125] ,   
        [7 ,      12.03125],   
        [8 ,      12.03125],   
        [9 ,      12.0925],   
        [10 ,    12.125],   
        [11 ,    12.166],   
        [12 ,    12.179],   
        [13,     12.1875],   
 ];
 pathb=bezier_curve(.02, path);
polygon(concat(pathb,[ [0,12.5],[0,7]]));

round_corner([panel_width-.5, panel_height-.5, 0], .5, 45, 1);
round_corner([.5, .5, 0], .5, 225, 1);
round_corner([panel_width-.5, .5, 0], .5, 315, 1);

   }
    
difference(){
  panel (panel_width, panel_height, .25);
  cut();
}
