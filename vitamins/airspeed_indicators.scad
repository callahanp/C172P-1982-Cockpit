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
include <../../utils/core/core.scad>
include <../../utils/layout.scad>
// Generic Parts:
//   Bezel
//   Lenses [Lens
//           Front Prism
//           Rear Prism]
//   Illumination LEDs
//   Face
//   Faceplate
//   Needle
//   Motor
//   Motor Plate
//   Electronics Plate
//   Connector Plate
//   Case


// Airspeed Indicators
BezelType="Bezel TBS";
Lenses_Type="Lenses TBS";
LEDs="LEDs TBS";
Dial="Dial TBS";
Faceplate="Faceplate TBS";
Needle="Needle TBS";
Motor="Motor TBS";
MotorPlate="Motor Plate TBS";
ElectronicsPlate="ElectronicsPlate TBS";
ConnectorPlate="ConnectorPlate TBS";
Case="Case TBS"
include <../../vitamins/airspeed_indicators.scad>
Airspeed     = ["Airspeed Indicator", Bezel, Lenses, 
                                      LEDs, Dial, Faceplate, Needle, 
                                      Motor, MotorPlate, ElectronicsPlate, ConnectorPlate, 
                                      Case];
AirspeedA    = ["Adjustable Airspeed Indicator",    Bezel, Lenses, 
                                      LEDs, Dial, Faceplate, Needle, 
                                      Motor, MotorPlate, ElectronicsPlate, ConnectorPlate, 
                                      Case];

airspeed_indicators = [Airspeed, AirspeedA];

use <airspeed_indicator.scad>