// To add new servo horns to this library:
// 1) add a new source file for the servo horn in the "servohorns" folder
// 2) In the new source file, define the servo horn parameters
// 2) Include the file in the include list below
// 3) Add the servo parameters defined in the new source file to the SERVOHORNLIB_HORN_PARAMETERS list below

// Include the horn-specific files
include<servohorns/20t.scad>
include<servohorns/3f.scad>

// Combine all of the servo models into a single list
SERVOHORNLIB_HORN_PARAMETERS =
concat
(
    SERVOHORNLIB_SIZE_20T_PARAMETERS,
	SERVOHORNLIB_SIZE_3F_PARAMETERS
);

// List of valid servo horn sizes:
SERVOHORNLIB_VALID_HORN_SIZES = [for (x = SERVOHORNLIB_HORN_PARAMETERS) x[0] ];



// Check if the specified servo horn size is valid.
function ServoHornLib_HornSizeIsValid(horn_size) =
	let
	(
		horn_size_index = search([horn_size], SERVOHORNLIB_HORN_PARAMETERS) [0]
	)
	horn_size_index != [];



// Return a list of valid horn types for a given horn size
function ServoHornLib_GetValidTypeNamesForSize(horn_size) =
	let
	(
		type_parameters = _ServoHornLib_RetrieveHornSize_ParametersSection(horn_size, "horn types"),
		type_names =
		[
			for (i = type_parameters) 
				i[0]
		]
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, undef, undef, undef, type_names);



// Check if the specified servo horn size and type is valid
function ServoHornLib_HornTypeIsValid(horn_size, horn_type) =
	let
	(
		horn_size_valid = ServoHornLib_HornSizeIsValid(horn_size),
		horn_types_section = _ServoHornLib_RetrieveHornSize_ParametersSection(horn_size, "horn types"),
		horn_type_index = search([horn_type], horn_types_section) [0]
	)
	horn_size_valid && horn_type_index != [];



// Query the center diameter of the specified servo horn size
function ServoHornLib_CenterDiameter(horn_size, horn_type=undef) =
	let
	(
		value = _ServoHornLib_RetrieveHornParameter(horn_size, horn_type, "center diameter")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, undef, undef, value);



// Query the thickness of the specified servo horn size
function ServoHornLib_Thickness(horn_size, horn_type=undef) =
	let
	(
		value = _ServoHornLib_RetrieveHornParameter(horn_size, horn_type, "thickness")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, undef, undef, value);



// Query the cap height of the specified servo horn size
function ServoHornLib_CapHeight(horn_size, horn_type=undef) =
	let
	(
		value = _ServoHornLib_RetrieveHornParameter(horn_size, horn_type, "cap height")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, undef, undef, value);
    



// Query the socket depth of the specified servo horn size
function ServoHornLib_SocketDepth(horn_size, horn_type=undef) = 
	let
	(
		value = _ServoHornLib_RetrieveHornParameter(horn_size, horn_type, "socket depth")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, undef, undef, value);



// Calculate the front height of the specified servo horn size
// This is the amount the horn extends beyond the servo when connected
function ServoHornLib_FrontHeight(horn_size, horn_type=undef) =
	let
	(
		cap_height = ServoHornLib_CapHeight(horn_size, horn_type),
		socket_depth = ServoHornLib_SocketDepth(horn_size, horn_type),
		front_height = cap_height - socket_depth
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, undef, undef, front_height);



// Query the socket diameter of the specified servo horn size
function ServoHornLib_SocketDiameter(horn_size, horn_type=undef) = 
	let
	(
		value = _ServoHornLib_RetrieveHornParameter(horn_size, horn_type, "socket diameter")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, undef, undef, value);



// Query the screw hole diameter of the specified servo horn size
function ServoHornLib_ScrewHoleDiameter(horn_size, horn_type=undef) = 
	let
	(
		value = _ServoHornLib_RetrieveHornParameter(horn_size, horn_type, "screw hole diameter")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, undef, undef, value);



// Query the number of arms on a specified servo horn type
function ServoHornLib_ArmCount(horn_size, horn_type) =
	let
	(
		all_arm_parameters = _ServoHornLib_RetrieveAllArmParameters(horn_size, horn_type),
		arm_count = len(all_arm_parameters)
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, undef, undef, arm_count);



// Query the angle of the requested horn arm for a specified horn size and type
function ServoHornLib_ArmAngle(horn_size, horn_type, arm_number) =
	let
	(
		angle = _ServoHornLib_RetrieveArmParameter(horn_size, horn_type, arm_number, "angle")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, arm_number, undef, angle);



// Query the length of the requested horn arm for a specified horn size and type
function ServoHornLib_ArmLength(horn_size, horn_type, arm_number) =
	let
	(
		length = _ServoHornLib_RetrieveArmParameter(horn_size, horn_type, arm_number, "length")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, arm_number, undef, length);



// Query the end diameter of the requested horn arm for a specified horn size and type
function ServoHornLib_ArmEndDiameter(horn_size, horn_type, arm_number) =
	let
	(
		end_diameter = _ServoHornLib_RetrieveArmParameter(horn_size, horn_type, arm_number, "end diameter")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, arm_number, undef, end_diameter);



// Query the number of holes in the requested arm for a specified horn size and type
function ServoHornLib_ArmHoleCount(horn_size, horn_type, arm_number) =
	let
	(
		hole_list = _ServoHornLib_RetrieveHoleList(horn_size, horn_type, arm_number),
		hole_count = len(hole_list)
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, arm_number, undef, hole_count);



// Query the diameter of a requested hole on a requested arm for a specified horn size and type
function ServoHornLib_ArmHoleDiameter(horn_size, horn_type, arm_number, hole_number) =
	let 
	(
		hole_diameter = _ServoHornLib_RetrieveHoleParameter(horn_size, horn_type, arm_number, hole_number, "diameter")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, arm_number, hole_number, hole_diameter);



// Query the offset of a requested hole on a requested arm for a specified horn size and type
function ServoHornLib_ArmHoleOffset(horn_size, horn_type, arm_number, hole_number) =
	let 
	(
		offset = _ServoHornLib_RetrieveHoleParameter(horn_size, horn_type, arm_number, hole_number, "offset")
	)
	_ServoHornLib_ReturnValueIfValid(horn_size, horn_type, arm_number, hole_number, offset);



// Query the outer diameter of the servo horn (twice the length of the longest arm)
function ServoHornLib_ServoHornDiameter(horn_size, horn_type) =
	let
	(
		arm_count = ServoHornLib_ArmCount(horn_size, horn_type),
		arm_lengths = [for (arm_number = [0: arm_count-1]) ServoHornLib_ArmLength(horn_size, horn_type, arm_number)],
		longest_arm_length = max(arm_lengths)
	)
	longest_arm_length*2;



// Generate a model of the specified servo horn
module ServoHornLib_GenerateHornModel(horn_size, horn_type)
{
	iota = 0.001;
	center_diameter = ServoHornLib_CenterDiameter(horn_size, horn_type);
	thickness = ServoHornLib_Thickness(horn_size, horn_type);
	cap_height = ServoHornLib_CapHeight(horn_size, horn_type);
	screw_hole_diameter = ServoHornLib_ScrewHoleDiameter(horn_size, horn_type);
	socket_depth = ServoHornLib_SocketDepth(horn_size, horn_type);
	socket_diameter = ServoHornLib_SocketDiameter(horn_size, horn_type);
	front_height = ServoHornLib_FrontHeight(horn_size, horn_type);

	z_offset = front_height;

	translate([0, 0, z_offset])
	rotate([180, 0, 0])
	difference()
	{
		union()
		{
			linear_extrude(thickness)
				ServoHornLib_GenerateOutline(horn_size, horn_type);
			cylinder(d=center_diameter, cap_height);
		}

		translate([0, 0, -iota])
			cylinder(d=screw_hole_diameter, cap_height + iota*2);

		translate([0, 0, front_height])
			cylinder(d=socket_diameter, socket_depth + iota);
	}
}



// Generate an outline of the requested servo horn
module ServoHornLib_GenerateOutline(horn_size, horn_type)
{
	center_diameter = ServoHornLib_CenterDiameter(horn_size, horn_type);
	arm_count = ServoHornLib_ArmCount(horn_size, horn_type);

	difference()
	{
		for (arm_number = [0: arm_count - 1])
		{
			angle = ServoHornLib_ArmAngle(horn_size, horn_type, arm_number);
			length = ServoHornLib_ArmLength(horn_size, horn_type, arm_number);
			end_diameter = ServoHornLib_ArmEndDiameter(horn_size, horn_type, arm_number);

			hull()
			{
				circle(d=center_diameter);
				rotate([0, 0, angle])
				translate([0, length - end_diameter/2])
					circle(d=end_diameter);
			}
		}

		ServoHornLib_GenerateHornHoleOutline(horn_size, horn_type);
	}
}



// Generate an outline of the holes in the requested servo horn
module ServoHornLib_GenerateHornHoleOutline(horn_size, horn_type)
{
	arm_count = ServoHornLib_ArmCount(horn_size, horn_type);

	for (arm_number = [0: arm_count - 1])
	{
		angle = ServoHornLib_ArmAngle(horn_size, horn_type, arm_number);
		hole_count = ServoHornLib_ArmHoleCount(horn_size, horn_type, arm_number);

		rotate([0, 0, angle])
		for (hole_number = [0: hole_count - 1])
		{
			diameter = ServoHornLib_ArmHoleDiameter(horn_size, horn_type, arm_number, hole_number);
			offset = ServoHornLib_ArmHoleOffset(horn_size, horn_type, arm_number, hole_number);
			translate([0, offset])
				circle(d=diameter);
		}
	}
}





//-----------------------------------------------------------------------------
// "Private" functions are listed below 
//-----------------------------------------------------------------------------

// Return the specified value if the horn size, horn type, and arm number are valid
function _ServoHornLib_ReturnValueIfValid(horn_size, horn_type, arm_number, hole_number, value) =
	let
	(
		horn_size_valid = ServoHornLib_HornSizeIsValid(horn_size),
		horn_type_valid = horn_type != undef
			? ServoHornLib_HornTypeIsValid(horn_size, horn_type)
			: true,
		arm_count = arm_number != undef
			? ServoHornLib_ArmCount(horn_size, horn_type)
			: undef,
		arm_number_valid = arm_count != undef
			? arm_number < arm_count
			: true,
		hole_count = hole_number != undef
			? ServoHornLib_ArmHoleCount(horn_size, horn_type, arm_number)
			: undef,
		hole_number_valid = hole_count != undef
			? hole_number < hole_count
			: true
	)
	horn_size_valid == false ? assert(false, str("Horn size \"", horn_size, "\" is not currently supported by servohorn_lib")) :
	horn_type_valid == false ? assert(false, str("Horn type \"", horn_type, "\" is not defined for horn size \"", horn_size, "\"")) :
	arm_number_valid == false ? assert(false, str("Horn size \"", horn_size, "\" and type \"", horn_type, "\" has ", arm_count, " arms, but arm number ", arm_number, " was requeted")) :
	hole_number_valid == false ? assert(false, str("Horn size \"", horn_size, "\" and type \"", horn_type, "\" and arm number ", arm_number, " has ", hole_count, " holes but hole number ", hole_number, " was requested")) :
	value;

	

// Retrieve the requested parameter section for the given horn size
function _ServoHornLib_RetrieveHornSize_ParametersSection(horn_size, section_name) =
	let
	(
		horn_size_index = search([horn_size], SERVOHORNLIB_HORN_PARAMETERS) [0],
		horn_size_section_index = search([section_name], SERVOHORNLIB_HORN_PARAMETERS [horn_size_index]) [0],
		horn_size_section = SERVOHORNLIB_HORN_PARAMETERS [horn_size_index] [horn_size_section_index] [1]
	)
	horn_size_section == undef
		? assert(false, str("Horn size \"", horn_size, "\" is missing a \"", section_name, "\" section"))
		: horn_size_section;



// Retrieve the parameters for a specified horn size and type
function _ServoHornLib_RetrieveHornTypeParameters(horn_size, horn_type) =
	let
	(
		horn_types_section = _ServoHornLib_RetrieveHornSize_ParametersSection(horn_size, "horn types"),
		horn_type_index = search([horn_type], horn_types_section) [0],
		horn_type_parameters = horn_types_section[horn_type_index] [1]
	)
	horn_type_parameters;
	


// Retrieve a global parameters for a specified servo horn size
function _ServoHornLib_RetrieveHornSizeGlobalParameter(horn_size, key) =
	let
	(
		global_parameters_section = _ServoHornLib_RetrieveHornSize_ParametersSection(horn_size, "global parameters"),
		value_index = search([key], global_parameters_section) [0],
		value = global_parameters_section[value_index] [1]
	)
	value;



// Retrieve a parameter for a specified servo horn size and type
function _ServoHornLib_RetrieveHornTypeParameter(horn_size, horn_type, key) =
	let
	(
		horn_types_section = _ServoHornLib_RetrieveHornTypeParameters(horn_size, horn_type),
		value_index = search([key], horn_types_section) [0],
		value = horn_types_section [value_index] [1]		
	)
	value;



// Retrieve either a global parameter or the type-specific overridden value
function _ServoHornLib_RetrieveHornParameter(horn_size, horn_type, key) =
	let
	(
		global_value = _ServoHornLib_RetrieveHornSizeGlobalParameter(horn_size, key),
		type_value = horn_type != undef
			? _ServoHornLib_RetrieveHornTypeParameter(horn_size, horn_type, key)
			: undef
	)
	type_value != undef 
		? type_value
		: global_value;



// Retrieve the arm parameters for a specified servo horn size and type
function _ServoHornLib_RetrieveAllArmParameters(horn_size, horn_type) = 
	let
	(
		all_arm_parameters = _ServoHornLib_RetrieveHornTypeParameter(horn_size, horn_type, "arms")
	)
	all_arm_parameters;



// Retrieve all parameters for the specified arm of a specified servo horn type
function _ServoHornLib_RetrieveArmParameters(horn_size, horn_type, arm_number) =
	let
	(
		all_arm_parameters = _ServoHornLib_RetrieveAllArmParameters(horn_size, horn_type),
		arm_parameters = all_arm_parameters[arm_number]
	)
	arm_parameters;



// Retrieve a particular parameter for a specified arm number, horn size, and type
function _ServoHornLib_RetrieveArmParameter(horn_size, horn_type, arm_number, key) =
	let
	(
		arm_parameters = _ServoHornLib_RetrieveArmParameters(horn_size, horn_type, arm_number),
		value_index = search([key], arm_parameters) [0],
		value = arm_parameters[value_index] [1]
	)
	value;



// Retrieve the holes defined for a specified arm number, horn size, and type
function _ServoHornLib_RetrieveHoleList(horn_size, horn_type, arm_number) =
	let
	(
		hole_list = _ServoHornLib_RetrieveArmParameter(horn_size, horn_type, arm_number, "holes")
	)
	hole_list;



// Retrieve all parameters for the specified hole of a specified arm and servo horn type
function _ServoHornLib_RetrieveArmHoleParameters(horn_size, horn_type, arm_number, hole_number) =
	let
	(
		hole_list = _ServoHornLib_RetrieveHoleList(horn_size, horn_type, arm_number),
		hole_parameters = hole_list[hole_number]
	)
	hole_parameters;



// Retrieve a particular parameter for a specified hole number, arm number, horn size, and type
function _ServoHornLib_RetrieveHoleParameter(horn_size, horn_type, arm_number, hole_number, key) =
	let
	(
		hole_parameters = _ServoHornLib_RetrieveArmHoleParameters(horn_size, horn_type, arm_number, hole_number),
		value_index = search([key], hole_parameters) [0],
		value = hole_parameters[value_index] [1]
	)
	value;
