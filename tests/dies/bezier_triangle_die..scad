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
use <../../utils/dies/bezier_triangle_die.scad>
//bezier_triangle_die(position, xyPath, tStep, path_closure, height)
bezier_triangle_die([0,0,0], [[.3, .3], [1,1], [2,1.5], [3,1.75], [4,1.875], [5,2]], 0.01, [[5,0],[0,0]], 1.5);