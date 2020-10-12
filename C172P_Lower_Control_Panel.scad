use <bezier_curve.scad>;
module panel (name, position, panel_width, panel_height, panel_thickness) {
    translate(position) cube ([panel_width, panel_height, panel_thickness]);
    
}


module circular  (name ,position, diameter){
    echo(name);
    translate(position) 
    cylinder (d=diameter, $fn=720,center=true);
}

module slot ( name, position, width, length){
    translate(position) { 
        cube([width, length-width, panel_thickness+1], center=true);
        translate([0,(length-width)/2]) cylinder(d=width, h=panel_thickness+1, $fn=720, center=true);
        translate([0,-(length-width)/2]) cylinder(d=width,h=panel_thickness+1,  $fn=720, center=true);
    } 
} 
module rectangular  (name ,position,  width, length, rotation=0){
    echo(name);
    translate(position) rotate( [0,0,rotation]) cube ([ width, length, panel_thickness+1],center=true);}
module rounded_rectangular  (name ,position,  width, length, radius, rotation=0){
    echo(name);
    upper_left  =  [-(width/2) + radius,  (length/2) - radius];
    upper_right =  [ (width/2) - radius,  (length/2) - radius];
    lower_left  =  [-(width/2) + radius, -(length/2) + radius];
    lower_right =  [ (width/2) - radius, -(length/2) + radius];
    
    translate(position) rotate( [0,0,rotation]) {
        cube ([ width-2*radius, length, panel_thickness+1],center=true);
        cube ([ width, length-2*radius, panel_thickness+1],center=true);
        translate(upper_left)  cylinder (d=radius*2, $fn=720,center=true);
        translate(upper_right) cylinder (d=radius*2, $fn=720,center=true);
        translate(lower_left)  cylinder (d=radius*2, $fn=720,center=true);
        translate(lower_right) cylinder (d=radius*2, $fn=720,center=true);
        }
}
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
panel_width=40.75;
panel_height=5+3/16;
panel_thickness=0.092;
panel_y_offset= -1.0625;



module cut(){

    radio_cutout_width = 6.75;
    radio_cutout_height = 0.5;
    radio_cutout_x_offset = 5/16;
    radio_cutout_y_offset = 3 + 5/16;

    tab_height= -panel_y_offset;
    xa=3.00;
    xb=4.75;
    ya = -panel_y_offset;
    yb = 0;
    ya1 = -tab_height+.03;
    ya2 = -tab_height+.1;
    ya3 = -0.1;
    ya4 = -0.03;
    xa1 = xa + 0.25;
    xa2 = xa + .5;
    xa3 = xb-.5;
    xa4 = xb-.25;

    tab_right_points = [
    [xa, -tab_height], // 3, -1.0625
    [xa1, ya1],           // 3.25 -1.0325
    [xa2, ya2],           // 3.5   -0.9625
    [xa3, ya3],           // 4.25 -.1
    [xa4, ya4],           // 4.5   -0.03
    [xb, yb]                // 4.75 0
    ];
    tab_left_points = [
    [-xb,  0],              // -4.75 0
    [-xa4, ya4],         // -4.5 0.03
    [-xa3, ya3],
    [-xa2, ya2],
    [-xa1, ya1],
    [-xa, -tab_height]
    ];
    echo (tab_left_points);
    echo (tab_right_points);
    left_curve=bezier_curve(0.01, tab_left_points);
    right_curve=bezier_curve(0.01, tab_right_points);
    poly_points = concat(right_curve, [
    [panel_width/2, 0],
    [panel_width/2, -tab_height-.5],
    [-panel_width/2, -tab_height-.5],
    [-panel_width/2, 0]], 
    left_curve, [[xa,-tab_height]]);

    primer_x = -18;
    primer_y = 1.375;
    primer_diameter = 0.75;
    master_switch_x = -16.6875;
    master_switch_y = 2.5;
    master_switch_corner_radius = 0.0625;
    master_switch_width = 0.8;
    master_switch_height = 1.45;
    starter_switch_x = -15.3125;
    starter_switch_y = 1.125;
    starter_switch_width = 0.64;
    starter_switch_diameter = 0.74;
    avionics_circuit_breaker_x = -12.5875;
    avionics_circuit_breaker_y = 1.5;
    avionics_circuit_breaker_diameter = 0.5;
    circuit_breaker_upper_x = -12.825;
    circuit_breaker_upper_y = 2.9375;
    circuit_breaker_upper_repeat = 11;
    circuit_breaker_lower_x = -11.825;
    circuit_breaker_lower_y = 1.5;
    circuit_breaker_lower_repeat = 8;
    circuit_breaker_diameter = 0.5;
    circuit_breaker_repeat_length = 0.75;
    carb_heat_x = -2.25;
    carb_heat_y = 2.25;
    carb_heat_diameter = 0.75;
    throttle_x = 0;
    throttle_y = 2.25;
    throttle_diameter = 0.75;
    mixture_x = 2.25;
    mixture_y = 2.25;
    mixture_diameter = 0.75;
    panel_lights_x = -1.125;
    panel_lights_y = 0.5;
    panel_lights_diameter = 0.375;
    alt_static_x = 1.125;
    alt_static_y = 0.5;
    alt_static_diameter = 0.375;
    flaps_top_mounting_screw_x = 6.6875;
    flaps_top_mounting_screw_y = 2.75;
    flaps_bottom_mounting_screw_x = 6.875;
    flaps_bottom_mounting_screw_y = 0.90625;
    flaps_mounting_screw_diameter = 0.1285;
    flaps_indicator_slot_width = 0.125;
    flaps_indicator_x = 6.625;
    flaps_indicator_slot_top_y = 2.5;
    flaps_indicator_slot_length = 1.625;
    flaps_indicator_y = flaps_indicator_slot_top_y - flaps_indicator_slot_length/2;
    flaps_10_pct_y = 2.25;
    flaps_20_pct_y = 1.625;
    flaps_30_pct_y = 1.09375;
    flaps_10_pct_width = 0.25;
    flaps_20_pct_width = 0.1875;
    flaps_30_pct_width = 0.125;
    flaps_10_pct_x = 7;
    flaps_20_pct_x = 7.03125;
    flaps_30_pct_x = 7.0625;
    flaps_10_pct_height = 0.875;
    flaps_20_pct_height = 0.375;
    flaps_30_pct_height = 0.75;


    cabin_air_and_heat_x = 10.75;
    cabin_air_y = 1.375;
    cabin_heat_y = 2.875;
    cabin_air_and_heat_diameter = 0.375;
    light_switch_width = 0.53125;
    light_switch_height = 1.375;
    light_switch_upper_x = -4.25;
    light_switch_upper_y = 2.9375;
    light_switch_upper_repeat = 2;
    light_switch_lower_x = -5.75;
    light_switch_lower_y = 1.375;
    light_switch_lower_repeat = 4;
    light_switch_lower_repeat_length = 0.6875;
    map_pocket_x = 15.0625;
    map_pocket_y = 1.8125;
    map_pocket_width = 6.625;
    map_pocket_height = 3;
    map_pocket_radius = 0.125;

    polygon(poly_points);
    rounded_rectangular("Radio Cutout", 
        [(11/32)+6.75/2, panel_height+panel_y_offset-0.75/2 ], 6.75, 0.75, .125, 0); 
    rectangular("Radio Cutout", 
        [(11/32)+6.75/2, panel_height+panel_y_offset ], 6.75, 0.5,  0); 
    circular("Primer", [primer_x, primer_y ], primer_diameter);
    rounded_rectangular("Master Switch", 
        [master_switch_x, master_switch_y], 
        master_switch_width, master_switch_height, master_switch_corner_radius, 0); 
    difference() { circular("Starter", [starter_switch_x, starter_switch_y], starter_switch_diameter);
        rectangular("side_cut left", [ starter_switch_x-starter_switch_width, starter_switch_y],
        starter_switch_width,starter_switch_diameter, 0);
        rectangular("side_cut right", [ starter_switch_x+starter_switch_width, starter_switch_y],
        starter_switch_width,starter_switch_diameter, 0);
    } 
    
    circular("Avionics Circuit Breaker", [avionics_circuit_breaker_x, avionics_circuit_breaker_y], avionics_circuit_breaker_diameter);

    for (i = [0: circuit_breaker_upper_repeat-1])
        circular("Lower Circuit_breaker",[circuit_breaker_upper_x+ i* circuit_breaker_repeat_length, circuit_breaker_upper_y], circuit_breaker_diameter);

   
    for (i = [0: circuit_breaker_lower_repeat-1])
        circular("Lower Circuit_breaker",[circuit_breaker_lower_x+ i* circuit_breaker_repeat_length, circuit_breaker_lower_y], circuit_breaker_diameter);

    circular("Carb Heat", [-2.25, 2.25 ], .75);
    circular("Throttle", [0, 2.25], .75);
    circular("Mixture", [2.25, 2.25 ], .75);
    circular("Panel Lights", [panel_lights_x, panel_lights_y], panel_lights_diameter);
    circular("Alt-static", [alt_static_x, alt_static_y], alt_static_diameter);
    slot("Flaps Indicator", [flaps_indicator_x, flaps_indicator_y], 
            flaps_indicator_slot_width, flaps_indicator_slot_length);
    
    rectangular("Flaps 30% slot", [flaps_30_pct_x, flaps_30_pct_y+flaps_30_pct_width/2], 
    flaps_30_pct_width, flaps_30_pct_height);
    slot("Flaps 30% slot", [flaps_30_pct_x, flaps_30_pct_y], 
    flaps_30_pct_width, flaps_30_pct_height);
    rectangular("Flaps 20% slot", [flaps_20_pct_x, flaps_20_pct_y], flaps_20_pct_width, flaps_20_pct_height);
    rectangular("Flaps 20% slot", [flaps_20_pct_x, flaps_20_pct_y+.1], flaps_20_pct_width, flaps_20_pct_height);
    rectangular("Flaps 10% slot", [flaps_10_pct_x, flaps_10_pct_y], flaps_10_pct_width, flaps_10_pct_height);
    circular("Flaps Top Mounting Screw",
            [flaps_top_mounting_screw_x, flaps_top_mounting_screw_y], flaps_mounting_screw_diameter);
    circular("Flaps Bottom Mounting Screw",
            [flaps_bottom_mounting_screw_x, flaps_bottom_mounting_screw_y], flaps_mounting_screw_diameter);

    circular("Cabin Heat", [cabin_air_and_heat_x, cabin_heat_y], cabin_air_and_heat_diameter);
    circular("Cabin Heat", [cabin_air_and_heat_x, cabin_air_y], cabin_air_and_heat_diameter);
    rounded_rectangular("Map Pocket", [map_pocket_x, map_pocket_y], map_pocket_width, map_pocket_height, map_pocket_radius, 0);
}
difference() {panel("Panel Outline", [-panel_width/2, panel_y_offset-0.5], panel_width, panel_height+.5, panel_thickness);
    cut();
}