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

// Generic Parts:
//   Bezel
//   Lens
//   Front Prism
//   Rear Prism
//   Illumination LEDs
//   Face
//   Faceplate
//   Needle
//   Motor
//   Motor Plate
//   Electronics Plate
//   Connector Plate
//   Case
//   Standoffs
include <utils/standard_part_data.scad>

function airspeed_indicator_manufacturer (type) = type[0];
function airspeed_indicator_model        (type) = type[1];
function airspeed_indicator_part_no      (type) = type[2];
function airspeed_indicator_size         (type) = type[3]; // 3.125, 2.25, 1.0 etc.
function airspeed_indicator_mountings    (type) = 4;
function airspeed_indicator_adjusters    (type) = 0;
     
module airspeed_indicator

