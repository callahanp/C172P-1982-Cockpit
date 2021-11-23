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
// dial_plates.scad
//
// Dial Plates support moving dials in instruments.
// 
include <../utils/core/core.scad>

include <dial_plate.scad>
// full dial plates for ADF, Heading Indicator
full_dial_rotating_plate =    dial_plate_constructor(
                              
                              "Full Dial Rotating Plate", [2.8,2.8,4/32], 3.25, 
                              dial_plate_od=2+25/32, 
                              dial_plate_rd=2.65,
                              dial_plate_id=3/16,
                              dial_plate_rabbet_height=3/32);
ring_dial_rotating_plate =    dial_plate_constructor(
                              
                              "Ring Dial Rotating Plate", [2.8,2.8,4/32], 3.25, 
                              dial_plate_od=2+25/32, 
                              dial_plate_rd=2.65,
                              dial_plate_id=1+13/16,
                              dial_plate_rabbet_height=3/32);
barometer_dial_rotating_Plate=dial_plate_constructor(
                              
                              "Barometer Dial Rotating Plate", 
                              [1,1,4/32], 3.25, 
                              dial_plate_od=1, 
                              dial_plate_rd=0.85,
                              dial_plate_id=0,
                              dial_plate_rabbet_height=3/32);
dial_plates = [full_dial_rotating_plate, ring_dial_rotating_plate, barometer_dial_rotating_Plate];
