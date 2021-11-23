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

include <face_plate.scad>
// TODO: Update with parts representing actual face_plates
//                       Manufacturer  Model            Part Number    Description  Bounding Cube  spec
face_plate_123 =     ["1-2-3 Block", [1,2,3], 3, [1,2,3]];
face_plate_10_10_10 = ["10 cube" , [10,10,10], 10, [10,10,10]];
// TODO: Update face_plates list with new parts defined above
face_plates = [face_plate_123, face_plate_123, face_plate_123, face_plate_10_10_10,face_plate_10_10_10];
