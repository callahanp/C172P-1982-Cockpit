#
# CockpitSCADlib Copyright Patrick A. Callahan 2021
# Framingham, Ma U.S.A.

# This file is part of CockpitSCADlib.
#
# CockpitSCADlib is free software: you can redistribute it and/or modify it under the terms of the
# GNU General Public License as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# CockpitSCADlib is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with CockpitSCADlib.
# If not, see <https:#www.gnu.org/licenses/>.
#
# new_vitamin.py produces three files for a new vitamin from template files
# see docs/new_vitamin.md for details.
#
# a vitamin is named with one or two words.  The words are given singular and plural form.
# a test file is given the plural form as a name and placed witin the tests/vitamins directory.
# the vitamins directory contains the singular and plural form file names
# for example:
# ./vitamins/airspeed_indicator.scad
# ./vitamins/airspeed_indicators.scad
# ./tests/vitamins/airspeed_indicators.scad

# new_vitamin.py is intended for use at points in the project where a new vitamin is needed.

# the variables singulars and plurals are lists of the singular and plural forms of
# the desired vitamins and the associated test file.  The generated files build cubes

# It generates three files with TO_DO items for the activities needed to customize the
# vitamin template into somthing usable. Unmodified, the new vitamins will produce cubes


import os
import sys


def write_list(list, filename):
    """write_list(list, filename) writes an output file from a list"""
    print(filename)
    f = open(filename, "w")
    for line in list:
        f.write(line)
    f.close()
    return 0


instrument_part_singulars = [
    "bezel",
    "lens",
    "lens_gasket",
    "outer_prism",
    "inner_prism",
    "dial",
    "dial_plate",
    "face_plate",
    "needle",
    "motor",
    "motor_plate",
    "electronics_plate",
    "connector_plate",
    "case",
]
instrument_part_plurals = [
    "bezels",
    "lenses",
    "lens_gaskets",
    "outer_prisms",
    "inner_prisms",
    "dials",
    "dial_plates",
    "face_plates",
    "needles",
    "motors",
    "motor_plates",
    "electronics_plates",
    "connector_plates",
    "cases",
]
# change singulars and plurals lists to add new vitamins
# You can add more than one at a time, but keep the singulars
# and plurals in the same order.

# When finished be sure to revert changes to new_vitamin.py
#               -------------------------

singulars = ["my_new_vitamin"]
plurals = ["my_new_vitamins"]

# Check for existing files before starting

found_files = []
for name in singulars:
    filename = "./vitamins/" + name + ".scad"
    if os.path.exists(filename):
        found_files.append(filename)
for name in plurals:
    filename = "./vitamins/" + name + ".scad"
    if os.path.exists(filename):
        found_files.append(filename)
print(found_files)
if len(found_files) > 0:
    print("WARNING - The files listed above already exist.")
    print("          They will be overwritten with templates")
    print("          And TO DO lists if you continue with this nonsense")
    print("          ")
    response = input("Enter Y to overwrite previous vitamins: ")
    if response != "Y":
        sys.exit(0)

template_new_vitamins_test = []
template_new_vitamins = []
template_new_vitamin = []

# Read the templates

with open("./tests/vitamins/template_new_vitamins.scad", "r", encoding="UTF-8") as file:
    while line := file.readline():
        template_new_vitamins_test.append(line)
with open("./vitamins/template_new_vitamins.scad", "r", encoding="UTF-8") as file:
    while line := file.readline():
        template_new_vitamins.append(line)
with open("./vitamins/template_new_vitamin.scad", "r", encoding="UTF-8") as file:
    while line := file.readline():
        template_new_vitamin.append(line)

for i in range(len(singulars)):
    singular = singulars[i]
    plural = plurals[i]
    print(singular, plural)
    new_vitamins_test = []
    new_vitamins = []
    new_vitamin = []
    for j in range(len(template_new_vitamins_test)):
        new_vitamins_test.append(
            template_new_vitamins_test[j]
            .replace("_template", "")
            .replace("new_vitamins", plural)
            .replace("new_vitamin", singular)
            .replace("TO_DO", "TO" + "DO")
        )
    for k in range(len(template_new_vitamins)):
        new_vitamins.append(
            template_new_vitamins[k]
            .replace("_template", "")
            .replace("new_vitamins", plural)
            .replace("new_vitamin", singular)
            .replace("TO_DO", "TO" + "DO")
        )
    for l in range(len(template_new_vitamin)):
        new_vitamin.append(
            template_new_vitamin[l]
            .replace("_template", "")
            .replace("new_vitamins", plural)
            .replace("new_vitamin", singular)
            .replace("TO_DO", "TO" + "DO")
        )
    new_vitamin_file = "./vitamins/" + singular + ".scad"
    new_vitamins_file = "./vitamins/" + plural + ".scad"
    new_vitamins_test_file = "./tests/vitamins/" + plural + ".scad"
    write_list(new_vitamin, new_vitamin_file)
    write_list(new_vitamins, new_vitamins_file)
    write_list(new_vitamins_test, new_vitamins_test_file)
