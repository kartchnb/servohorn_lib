# Servo Horn Library for OpenSCAD
Created by Brad Kartchner (kartchnb@gmail.com)

This library is designed to make it easier to create designs incorporting standard servos horns and is intended to be used with my servo_lib library.

Methods are provided to access dimensions for each servo horn and to generate models of them.

Servo horns are organized into sizes, and each size has one or more horn type. The horn size corresponds to the spline type defined for each servo in my servo_lib library.

This is still very much a work in progress and only a very small number of servo horns have been defined.

-------------------------------------------------------------------------------
## METHODS
### ServoHornLib_GenerateHornModel(horn_size, horn_type, vcenter)
   This method generates a basic model of the specified servo horn type.
   The generated model is intended to a basic guide rather than a fully-realistic rendering.

   The following parameters are supported:
   * `horn_size` - the size of the horn to generate

   * `horn_type` - the type of horn to generate (must be defined for the selected size)

### ServoHornLib_GenerateOutline(horn_size, horn_type)
   Generates 2D outline of the servo horn. This can be extruded to cutout a slot for the horn.

   The following parameters are supported:
   * `horn_size` - the size of the horn to generate

   * `horn_type` - the type of horn to generate (must be defined for the selected size)

### ServoHornLib_GenerateHornHoleOutline(servo_model)
   Generates a 2D outline of the screw holes in the servo horn.

   The following parameters are supported:
   * `horn_size` - the size of the horn to generate

   * `horn_type` - the type of horn to generate (must be defined for the selected size)

-------------------------------------------------------------------------------
## FUNCTIONS
### ServoHornLib_HornSizeIsValid(horn_size)
   Returns true if the horn size is recognized by the library.
   
   The function accepts the following parameters:
   * `horn_size` - the size of the horn

### ServoHornLib_GetValidTypeNamesForSize(horn_size)
   Returns a list of valid horn types for the given horn size
   
   The function accepts the following parameters:
   * `horn_size` - the size of the horn

### ServoHornLib_HornTypeIsValid(horn_size, horn_type)
   Returns true if the horn type is valid for the given horn size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` - the type of horn (must be defined for the selected size)

### ServoHornLib_CenterDiameter(horn_size, horn_type)
   Returns the diameter of the central shaft of the given horn size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` (optional and unused) - the type of horn

### ServoHornLib_Thickness(horn_size, horn_type)
   Returns the thickness of the non-shaft portion of the given horn size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` (optional and unused) - the type of horn 

### ServoHornLib_CapHeight(horn_size, horn_type)
   Returns the hight of the servo horn "cap" for a given size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn 

   * `horn_type` (optional and unused) - the type of horn

### ServoHornLib_SocketDepth(horn_size, horn_type)
   Returns the depth of the shaft socket for a given horn size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` (optional and unused) - the type of horn

### ServoHornLib_FrontHeight(horn_size, horn_type)
   Returns the amount a given servo horn size extends beyond the end of the servo axle when connected.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` (optional and unused) - the type of horn

### ServoHornLib_SocketDiameter(horn_size, horn_type)
   Returns the diameter of the socket for a given horn size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` (optional and unused) - the type of horn

### ServoHornLib_ScrewHoleDiameter(horn_size, horn_type)
   Returns the diameter of the screw holes for a given horn size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` (optional and unused) - the type of horn

### ServoHornLib_ArmCount(horn_size, horn_type)
   Returns the number of "arms" that the given horn type has

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` - the type of horn

### ServoHornLib_ArmAngle(horn_size, horn_type, arm_number)
   Returns the rotational angle of the requested arm number for the given horn type and size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` - the type of horn

   * `arm_number` - the arm number to retrieve

### ServoHornLib_ArmEndDiameter(horn_size, horn_type, arm_number)
   Returns the diameter of the far end of the requested arm number for the given horn type and size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` - the type of horn

   * `arm_number` - the arm number to retrieve

### ServoHornLib_ArmHoleCount(horn_size, horn_type, arm_number)
   Returns the number of screw holes in the requested arm number for the given horn type and size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` - the type of horn

   * `arm_number` - the arm number to retrieve

### ServoHornLib_ArmHoleDiameter(horn_size, horn_type, arm_number_ hole_number)
   Returns the diameter of the requested screw hole for the requested arm number, horn type, and horn size.
   These functions are getting a bit ridiculous at this point.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` - the type of horn

   * `arm_number` - the arm number to retrieve

   * `hole_number` - the hole number to request

### ServoHornLib_ArmHoleOffset(horn_size, horn_type, arm_number_ hole_number)
   Returns the offset of the requested screw hole for the requested arm number, horn type, and horn size.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` - the type of horn

   * `arm_number` - the arm number to retrieve

   * `hole_number` - the hole number to request

### ServoHornLib_ServoHornDiameter(horn_size, horn_type)
   Returns the diameter of the envelope of the requested servo horn type and size. This is twice the diameter of the longest arm.

   The function accepts the following parameters:
   * `horn_size` - the size of the horn

   * `horn_type` - the type of horn



-------------------------------------------------------------------------------
Diagram of servo measurements:

![servo diagram](https://user-images.githubusercontent.com/54730012/158481400-c6d95aa7-3db0-4da5-b4b7-e66df4bb73a3.png)
