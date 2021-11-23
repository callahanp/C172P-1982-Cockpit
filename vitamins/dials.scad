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

include <dial.scad>
// TODO: Update with actual dials
//                       Manufacturer  Model            Part Number    Description  Bounding Cube  spec
Airspeed_C172P_1982 = dial_constructor(
                                        "Airspeed Indicator Dial", [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Turn_Coordinator  = dial_constructor(
                                        "Turn Coordinator Dial",   [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Tachometer_300_3500 = dial_constructor(
                                        "Turn Coordinator Dial",   [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Attitude_indicator  = dial_constructor(
                                        "Attitude_indicator Dial", [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Heading_indicator   = dial_constructor(
                                        "Heading Indicator Dial",  [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Altimiter           = dial_constructor(
                                        "Altimeter Dial",          [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Altimeter_Baro_in   = dial_constructor(
                                        "Altimeter Baro Inch Dial", [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Altimeter_Baro_mm   = dial_constructor(
                                        "Altimeter Baro MM Dial",   [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Vertical_Speed      = dial_constructor(
                                        "Vertical Speed Dial",      [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
EGT                 = dial_constructor(
                                        "EGT Dial",                 [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
CDI_Heading_Ring    = dial_constructor(
                                        "CDI Heading Ring Dial",    [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
CDI_H_V             = dial_constructor(
                                        "CDI H-V Dial",             [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
ADF                 = dial_constructor(
                                        "ADF Dial",                 [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Clock               = dial_constructor(
                                        "Clock Dial",               [2.85, 2.85, 1/64], 3.125, [2.85, 2.85, 1/64,[],[],[]]);
Fuel_Left   = rectangular_dial_constructor(
                                        "Left Fuel Dial",           [1.75, 1.00, 1/64], 1.75, [1.75, 1.00, 1/64,[],[],[]]);
Fuel_Right  = rectangular_dial_constructor(
                                        "Right Fuel Dial",          [1.75, 1.00, 1/64], 1.75, [1.75, 1.00, 1/64,[],[],[]]);
Oil_Temp    = rectangular_dial_constructor(
                                        "Oil Temperature Dial",     [1.75, 1.00, 1/64], 1.75, [1.75, 1.00, 1/64,[],[],[]]);
Oil_Pressure= rectangular_dial_constructor(
                                        "Oil Pressure Dial",        [1.75, 1.00, 1/64], 1.75, [1.75, 1.00, 1/64,[],[],[]]);
// TODO: Provide markings for each gauge
dials = [Airspeed_C172P_1982, Turn_Coordinator, Tachometer_300_3500, Attitude_indicator,
        Heading_indicator, Altimiter, Altimeter_Baro_in,Altimeter_Baro_mm,
        Vertical_Speed, EGT, CDI_Heading_Ring,CDI_H_V, ADF, Clock, 
        Fuel_Left, Fuel_Right, Oil_Temp, Oil_Pressure];
