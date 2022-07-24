// To add more horn types to this horn size:
//  1) Create a type-specific file in the subdirectory for this horn size (e.g. "20t" for size 20T)
//  2) Enter the parameters for the horn type (copy the format from an existing horn type file)
//  3) Add the file to the list of includes below
//  4) Add the horn type parameter list to the horn size parameter declaration below

include<3f/i.scad>
include<3f/o.scad>
include<3f/t.scad>
include<3f/star.scad>



SERVOHORNLIB_SIZE_3F_PARAMETERS =
[
    [
        "3F",  // The name of this servo horn size

        [
            // Parameters common to all servo horns of this size
            "global parameters",
            [
                ["center diameter", 8.90],  // The outer diameter of the center cap of the servo horn
                ["thickness", 2.66], // The thickness of the servo horn arms (not including the center cap)
                ["cap height", 6.70], // The overall thickness of the servo horn, including arm and center cap
                ["screw hole diameter", 2.88], // The diameter of the screw hole in the center cap
                ["socket depth", 3.30], // The depth of the inside socket of the center cap
                ["socket diameter", 5.20], // The diameter of the inside socket of the center cap
            ]
        ],

        [
            "horn types",
            [
                // Add additional horn types here
                3F_TYPE_I,
                //3F_TYPE_O,
                //3F_TYPE_T,
                //3F_TYPE_STAR,
            ]
        ],
    ],
];
