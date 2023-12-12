/***********************************************************************************************************************
MMBasic

Version.h

Copyright 2011 - 2021 Geoff Graham.  All Rights Reserved.

This file and modified versions of this file are supplied to specific individuals or organisations under the following
provisions:

- This file, or any files that comprise the MMBasic source (modified or not), may not be distributed or copied to any other
  person or organisation without written permission.

- Object files (.o and .hex files) generated using this file (modified or not) may not be distributed or copied to any other
  person or organisation without written permission.

- This file is provided in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 ************************************************************************************************************************/

#if !defined(VERSION_INCLUDED)
    #define VERSION_INCLUDED

    #define VERSION         "5.05.05"
    #define YEAR            "2011-2021"
    #define COPYRIGHT       "Copyright " YEAR " Geoff Graham\r\n"


    // Uncomment the following line if you want the "Lite" version of the MX170 code
    // #define LITE


    #include <stdlib.h>
    #include <setjmp.h>
    #include <string.h>
    #include <ctype.h>
    #include <limits.h>
    #include <math.h>
    #include <float.h>

    // define the device/platform, include the appropriate hardware defines and set the startup message
    //  #elif defined(__32MX470F512L__) || defined(__32MX470F512H__)
        #define MX470
        #define MICROMITE
        #define MES_SIGNON  "Micromite Plus MMBasic Ver " VERSION "\r\n"

    // define the device/platform, include the appropriate hardware defines
    // #if defined(MICROMITE)
    //    #include "Micromite/Hardware_Includes.h"
    //#endif

    #include "MMBasic_Includes.h"

#endif

