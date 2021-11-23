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

include <needle.scad>
// TODO: Update to form actual needle shapes instead of rectangles
//                       Manufacturer  Model            Part Number    Description  Bounding Cube  spec
Airspeed_Needle         =     ["Airspeed Needle",     [0.3, 1.75, 3/128], 2, []];
Tachometer_Needle       = ["Tachometer Needle",       [0.3, 1.75, 3/128], 2, []];
Turn_Coordinator_Needle = ["Turn Coordinator Needle", [0.3, 1.75, 3/128], 2, []];
Vertical_Speed_Needle   = ["Vertical SpeedNeedle",    [0.3, 1.75, 3/128], 2, []];
Altimeter_100s_Needle   = ["Altimeter_100s_Needle",   [0.3, 1.75, 3/128], 2, []];
Altimeter_1000s_Needle  = ["Altimeter_1000s_Needle",  [0.3, 1.75, 3/128], 2, []];
Altimeter_10000s_Needle = ["Altimeter_10000s_Needle", [0.3, 1.75, 3/128], 2, []];
CDI_Needle              = ["CDI Needle", [0.2, 1.05, 3/128], 1, []];
ADF_Needle              = ["ADF Needle", [0.3, 2.0, 3/128], 2, []];
EGT_Needle              = ["EGT Needle", [0.2, 0.75, 3/128], 1, []];
needles = [Airspeed_Needle, Tachometer_Needle, Turn_Coordinator_Needle, Vertical_Speed_Needle,
           Altimeter_100s_Needle, Altimeter_1000s_Needle, Altimeter_1000s_Needle, 
           CDI_Needle,CDI_Needle,CDI_Needle,CDI_Needle, ADF_Needle, EGT_Needle];
