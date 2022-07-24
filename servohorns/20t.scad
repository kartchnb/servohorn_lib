// To add more horn types to this horn size:
//  1) Create a type-specific file in the subdirectory for this horn size (e.g. "20t" for size 20T)
//  2) Enter the parameters for the horn type (copy the format from an existing horn type file)
//  3) Add the file to the list of includes below
//  4) Add the horn type parameter list to the horn size parameter declaration below

include<20t/i.scad>
include<20t/l.scad>
include<20t/t.scad>



SERVOHORNLIB_SIZE_20T_PARAMETERS =
[
    [
        "20T",  // The name of this servo horn size

        [
            // Parameters common to all servo horns of this size
            "global parameters",
            [
                ["center diameter", 6.92],  // The outer diameter of the center cap of the servo horn
                ["thickness", 1.43], // The thickness of the servo horn arms (not including the center cap)
                ["cap height", 3.73], // The overall thickness of the servo horn, including arm and center cap
                ["screw hole diameter", 2.50], // The diameter of the screw hole in the center cap
                ["socket depth", 2.00], // The depth of the inside socket of the center cap
                ["socket diameter", 4.60], // The diameter of the inside socket of the center cap
            ]
        ],

        [
            "horn types",
            [
                // Add additional horn types here
                20T_TYPE_I,
                20T_TYPE_L,
                20T_TYPE_T,
            ]
        ],
    ],
];
