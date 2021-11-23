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
// eps_corner_cut.scad

include <core/core.scad>
function eps_corner_cut_constructor( radius, height, angle, $fn=100)=["eps_corner_cut", radius,height,angle,$fn];
function eps_corner_cut_radius(spec)=spec[1];
function eps_corner_cut_height(spec)=spec[2];
function eps_corner_cut_angle(spec)=spec[3];
function eps_corner_cut_fn(spec)=spec[4];


module eps_corner_cut (spec) {
radius  = eps_corner_cut_radius(spec);
angle   = eps_corner_cut_angle(spec);
height  = eps_corner_cut_height(spec);
$fn     = eps_corner_cut_fn(spec);
rotate([0,0,-(angle+135)])
  difference(){
    translate([-eps, -eps, -eps] )cube([radius+eps,radius+eps,height+2*eps]);
    translate([radius, radius, -2*eps]) cylinder(r=radius, h=height+4*eps, $fn);
  }
}

spec=eps_corner_cut_constructor (radius=1, height=.25, angle=135);
echo(eps_corner_cut_fn(spec));
eps_corner_cut_show(spec);