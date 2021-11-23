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
module move(position=[0,0,0], 
            eps_position=[0,0,0],
            radial=[0,0,0],
            rotation=[0,0,0]) {
  radial_position=([sin(radial[0])*radial[1],cos(radial[0])*radial[1],radial[2]]);
  translate(position+eps_position+radial_position)
    rotate(rotation)
      children();
}
move(position=[1,1,1],eps_position=[1,1,1],rotation=[45,45,45],radial=[30,20,-2]) cube([1,2,3]);