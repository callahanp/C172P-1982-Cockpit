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
include <../utils/core/core.scad>
include <../utils/layout.scad>
include <bezels.scad>
include <lens_gaskets.scad>
include <lenses.scad>
include <outer_prisms.scad>
include <inner_prisms.scad>
include <dials.scad>
include <face_plate.scad>
include <motor_plate.scad>
include <motor.scad>
include <electronics_plate.scad>
include <connector_plate.scad>
include <case.scad>

// Airspeed Indicators
Bezel=airspeed_bezel;
LensGasket=lens_gasket_3_inch;
LensAssembly=[LensGasket,3_inch_lens,inner_prism_3_inch, outer_prism_3_inch];
LEDs=["LEDs TBS"];
Dial=["]Dial TBS"];
Faceplate="Faceplate TBS";
Needle="Needle TBS";
Motor="Motor TBS";
MotorPlate="Motor Plate TBS";
ElectronicsPlate="ElectronicsPlate TBS";
ConnectorPlate="ConnectorPlate TBS";
Case="Case TBS";
include <airspeed_indicator.scad>
Airspeed     = ["Airspeed Indicator", [3.25,3.25,3.25], 3.25, Bezel, LensAssembly, 
                                      LEDs, Dial, Faceplate, Needle, 
                                      Motor, MotorPlate, ElectronicsPlate, ConnectorPlate, 
                                      Case];
AirspeedA    = ["Adjustable Airspeed Indicator",   [3.25,3.25,3.25], 3.25,   Bezel, LensAssembly, 
                                      LEDs, Dial, Faceplate, Needle, 
                                      Motor, MotorPlate, ElectronicsPlate, ConnectorPlate, 
                                      Case];

airspeed_indicators = [Airspeed, AirspeedA];

