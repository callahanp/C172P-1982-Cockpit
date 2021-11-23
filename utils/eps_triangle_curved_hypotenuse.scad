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
include <core/core.scad>
include <bezier_curve.scad>
module eps_triangle_curved_hypotenuse( xyPath, tStep, path_closure, height, eps_size=[0,0,0]){
  pathb=bezier_curve(tStep,xyPath);
    linear_extrude (height=height+eps_size[2])
      polygon(concat(pathb,path_closure));
}
