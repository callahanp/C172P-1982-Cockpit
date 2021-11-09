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
//corner_rounded_triangle_die.scad
include <../core/core.scad>
include <bezier_curve.scad>
module bezier_triangle_die(position, xyPath, tStep, path_closure, height){
//  echo("xypath", xyPath);
//  echo("tStep", tStep);
//  echo ("path_closure",path_closure);
//  echo ("height",height);
  pathb=bezier_curve(tStep,xyPath);
  //echo("pathb",pathb);
  translate(position+[0,0,-eps])
    linear_extrude (height=height+2*eps)
      polygon(concat(pathb,path_closure));
}
