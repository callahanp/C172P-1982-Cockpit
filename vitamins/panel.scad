use <bezier_curve.scad>;
module panel_differences(panel_difference_list,panel_thickness) {
  eps=1/128;
for (item=panel_difference_list){
      echo (item[0],item[1]);
      operation=item[1];
      spec=item[2];
      
      if (operation == "Circle") {

        translate([spec[0],spec[1], -eps]) cylinder(h=panel_thickness+2*eps, d=spec[2],$fn=100 );
      }
      if (operation == "Round") {
        translate(spec[0]) cylinder(h=spec[2]+2*eps, d=spec[1],$fn=100 );
      }
      if (operation == "Instrument") {
        echo(spec);
        let( 
          position=spec[0],
          size=spec[1],
          dia=spec[2],
          mount_centers=spec[3],
          adjusters=spec[4],
          mounts=spec[5],
          mount_dia=spec[6],
          mount_position_radius=spec[3]/2,
          adjust_dia=spec[7],
          panel_thickness=spec[8]){
          echo(mount_position_radius);
          echo(adjust_dia);
          echo(mount_position_radius-(adjust_dia/2));
          translate(position) cylinder(h=panel_thickness+2*eps, d=dia,$fn=100 );
          for (angle_a=adjusters) {
            let ( x=mount_position_radius*sin(angle_a), y=mount_position_radius*cos(angle_a),
                  x1=(mount_position_radius-(adjust_dia/4))*sin(angle_a),
                  y1=(mount_position_radius-(adjust_dia/4))*cos(angle_a)) {
              echo (angle_a, x,y,x1,y1);
              translate(position+[x,y,0]) cylinder(h=panel_thickness+2*eps, d=adjust_dia, $fn=50);
              translate(position+[x1,y1,panel_thickness-2*eps]) rotate([0,0,angle_a]) cube([adjust_dia, adjust_dia,panel_thickness+3*eps],center=true);
            }
            }
          for (angle_m=mounts) { 
            let ( x=mount_position_radius*sin(angle_m), y=mount_position_radius*cos(angle_m)){

              translate(position+[x,y,0]) cylinder(h=panel_thickness+2*eps, d=mount_dia, $fn=50);
            }
          }
          }
      }
      if (operation == "Rectangle") {
        echo(spec);
        translate([spec[0],spec[1], -eps]) cube([spec[2],spec[3], panel_thickness+2*eps] );
      }
      if (operation =="Rounded Rectangle") {
        echo(spec);
        translate([spec[0],spec[1], -eps]) cube([spec[2],spec[3], panel_thickness+2*eps] );
      }
      if (operation == "Corner Cut") {
        echo(spec);
        radiuscc=spec[0];
        cube_pos=spec[1];
        cyl_pos=spec[2];
        epsilon=spec[3];
        translate(epsilon) 
        difference(){
          translate(cube_pos) cube([radiuscc+eps,radiuscc+eps,panel_thickness+2*eps]);
          translate(cyl_pos) cylinder(r=radiuscc, h=panel_thickness+2*eps, $fn=100);
        }
      }
      if (operation == "Bezier Edge"){
        echo(spec);
        bpath=spec[0];
        shape_completion=spec[1];
        tStep=spec[2];
        pathb=bezier_curve(tStep, bpath);
        translate([0,0,-eps])
          linear_extrude (height=panel_thickness+2*eps)polygon(concat(pathb,shape_completion));
      }
    }
}
module panel(panel_spec){
  panel_outline=panel_spec[0];
  panel_difference_list=panel_spec[1];
  echo (panel_outline);
  echo (panel_spec);
  panel_cube=panel_outline[2];
  echo (panel_cube);
  panel_thickness=panel_cube[2];
  difference() {
    cube(panel_outline[2]);
    panel_differences(panel_difference_list,panel_thickness);
  }
  }