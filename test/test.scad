/* [General Parameters] */
// Display all supported servo horn names?
Display_Servo_Horn_Names = true;

// Font size for labels
Font_Size = 5;



/* [Advanced] */
// The value to use for creating the model preview (lower is faster)
Preview_Quality_Value = 32;

// The value to use for creating the final model render (higher is more detailed)
Render_Quality_Value = 128;



include<../servohorn_lib.scad>



module Generate_HornSizes(index=0)
{
    horn_size = Size_Names[index];

    Generate_HornTypes(horn_size);

    if (Display_Servo_Horn_Names)
    {
        x_offset = -Max_Horn_Diameter/2;
        string = str("Size \"", horn_size, "\"");
        translate([x_offset, 0, ])
            text(string, size=Font_Size, valign="center", halign="right");
    }
    
    if (index < len(horn_size) - 1)
    {
        y_offset = Max_Horn_Diameter + Font_Size*2;
        translate([0, y_offset, 0])
            Generate_HornSizes(index + 1);
    }
}



module Generate_HornTypes(horn_size, index=0)
{
    horn_types = ServoHornLib_GetValidTypeNamesForSize(horn_size);
    horn_type = horn_types[index];
    
    if (horn_type != undef)
    {
        ServoHornLib_Generate(horn_size, horn_type);

        if (Display_Servo_Horn_Names)
        {
            y_offset = -Max_Horn_Diameter/2;
            string = str("Type \"", horn_type, "\"");
            translate([0, y_offset, 0])
                text(string, size=Font_Size, valign="top", halign="center");
        }
    }

    if (index < len(horn_types) - 1)
    {
        x_offset = ServoHornLib_ServoHornDiameter(horn_size, horn_type);
        translate([x_offset, 0, 0])
            Generate_HornTypes(horn_size, index + 1);
    }
}


// Global parameters
iota = 0.001;
$fn = $preview ? Preview_Quality_Value : Render_Quality_Value;

Size_Names = SERVOHORNLIB_VALID_HORN_SIZES;

Max_Horn_Diameter = max
(
    [
        for (size = SERVOHORNLIB_VALID_HORN_SIZES)
        for (type = ServoHornLib_GetValidTypeNamesForSize(size))
            ServoHornLib_ServoHornDiameter(size, type)
    ]
);


// Generate the model
Generate_HornSizes();
