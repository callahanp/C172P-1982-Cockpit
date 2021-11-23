#new_vitamin.py 

**new_vitamin.py** produces three files for a new vitamin from template files 
see docs/new_vitamin.md for details.

A vitamin is named with one or two words.  The words are given singular and plural form as filenames
for example airspeed_indicator.scad and airspeed_indicators.scad

The singular form is used for the file that generates the 
shapes in a design. The file given the plural form is used to specify a list of the different types a particular vitamin may have and to specify parameters needed to build each type.

for example:
>./vitamins/airspeed_indicator.scad
>./vitamins/airspeed_indicators.scad

A test file is given the same plural form as a name and placed witin the tests/vitamins directory.

>./tests/vitamins/airspeed_indicators.scad

Raw data is always to be found in the vitamins/*.scad files with the plural form.

There are two main ways the project stores measurement information.

When the data is simple and not numerous and can be easily represented in tabular form, the data is placed directly
in vectors in the plural form file.  This follows the convention established in  NopScadlib.  Every measurement needed
to construct a vitamin is in the vector.

An alternative, when the data are complex or simply numerous, is to provide a function that constructs the vector from 
named parameters.  This provides no additional functionality, but makes the specification of measurements for a complex
part easier to read without reference to table column headings.

Regardless of how the vectors for distinct parts are constructed, each one is assigned to a variable and placed in a vector representing all the parts in one vector.  

The vitamin files with singular names are the implementation for the vitamins.

Accessor functions provide access to each of the items in the specification vectors by name.
Modules in the singular file do the work of constructing the part.




