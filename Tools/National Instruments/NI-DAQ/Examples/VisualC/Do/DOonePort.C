/*********************************************************************
*
* Example program: 
*    DOonePort.c
*
* Description: 
*    Outputs digital data from a single digital port
*
* Example Category: 
*    DO
*
* Example Task Types: 
*    1PT, 1CH, IMMED
*
* List of key parameters: 
*    iMode, iDir
*
*    [Since variables are hardcoded, there is no guarantee that this
*     program will work for your setup.  This example is simply
*     presented as a code snippet of how you can use NI-DAQ functions
*     to perform a task.]
*
* List of NI-DAQ Functions used in this example: 
*    DIG_Prt_Config, NIDAQErrorHandler, DIG_Out_Prt, NIDAQDelay,
*     NIDAQYield
*
*    [NOTE: For further details on each NI-DAQ function, please refer
*     to the NI-DAQ On-Line Help (NIDAQPC.HLP).]
*
* Pin Connection Information: 
*    The digital signals will be on port 0. Connect the ground
*     reference to the DIG GND pin.
*
*    [For further I/O connection details, please refer to your hardware
*     User Manual.]
*
*    [For further details on how to run this example, please refer to
*     the NI-DAQ Examples On-Line Help (NIDAQEx.HLP).]
*
*********************************************************************/
/*
 * Includes: 
 */

#include "nidaqex.h"


/*
 * Main: 
 */

void main(void)
{
    /*
     * Local Variable Declarations: 
     */

    i16 iStatus = 0;
    i16 iRetVal = 0;
    i16 iDevice = 1;
    i16 iPort = 0;
    i16 iMode = 0;
    i16 iDir = 1;
    i32 iPattern = 0;
    i32 iNumLoops = 16;
    i16 iIgnoreWarning = 0;
    i16 iYieldON = 1;

    /* Configure port as output, no handshaking. */

    iStatus = DIG_Prt_Config(iDevice, iPort, iMode, iDir);

    iRetVal = NIDAQErrorHandler(iStatus, "DIG_Prt_Config",
     iIgnoreWarning);

    while ((iPattern < iNumLoops) && (iStatus == 0)) {


        iStatus = DIG_Out_Prt(iDevice, iPort, iPattern);

        iRetVal = NIDAQErrorHandler(iStatus, "DIG_Out_Prt",
         iIgnoreWarning);

        printf(" The digital pattern on port %d is set to (DECIMAL) %ld\n", iPort, iPattern);

        iRetVal = NIDAQDelay(1.0);

        ++iPattern;

        iRetVal = NIDAQYield(iYieldON);

    }



}

/* End of program */
