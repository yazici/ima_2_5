/*********************************************************************
*
* Example program: 
*    STCcountWithHWDirControl.c
*
* Description: 
*    Counts the number of digital pulses (or events) going into the
*     clock input of general purpose counter 0 in a loop, with digital
*     count direction control, so that the counter will count UP when
*     the direction signal is HIGH, and DOWN when the direction signal
*     is LOW. (for devices with the DAQ-STC counter/timer)
*
* Example Category: 
*    CTR
*
* Example Task Types: 
*    EVENTCNT, 1PT
*
* List of key parameters: 
*    ulGpctrNum, ulCount
*
*    [Since variables are hardcoded, there is no guarantee that this
*     program will work for your setup.  This example is simply
*     presented as a code snippet of how you can use NI-DAQ functions
*     to perform a task.]
*
* List of NI-DAQ Functions used in this example: 
*    GPCTR_Control, NIDAQErrorHandler, GPCTR_Set_Application,
*     GPCTR_Change_Parameter, NIDAQDelay, GPCTR_Watch, NIDAQYield
*
*    [NOTE: For further details on each NI-DAQ function, please refer
*     to the NI-DAQ On-Line Help (NIDAQPC.HLP).]
*
* Pin Connection Information: 
*    Connect your digital pulse train to the SOURCE pin of your
*     counter.  Connect your digital direction control signal to DIO6
*     (for GPCTR0 on DAQ-STC) or PFI37 (for Counter 0 on NI-TIO based
*     devices). Connect the ground reference to the DIG GND pin.
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
    u32 ulGpctrNum = ND_COUNTER_0;
    u32 ulCount = 10000;
    u32 ulTCReached = 0;
    u32 iLoopCount = 10;
    i16 iIgnoreWarning = 0;
    i16 iYieldON = 1;

    iStatus = GPCTR_Control(iDevice, ulGpctrNum, ND_RESET);

    iRetVal = NIDAQErrorHandler(iStatus, "GPCTR_Control/RESET",
     iIgnoreWarning);

    iStatus = GPCTR_Set_Application(iDevice, ulGpctrNum,
     ND_SIMPLE_EVENT_CNT);

    iRetVal = NIDAQErrorHandler(iStatus, "GPCTR_Set_Application",
     iIgnoreWarning);

    iStatus = GPCTR_Change_Parameter(iDevice, ulGpctrNum, ND_SOURCE,
     ND_DEFAULT_PFI_LINE);

    iRetVal = NIDAQErrorHandler(iStatus,
     "GPCTR_Change_Parameter/SOURCE", iIgnoreWarning);

    /* Load initial count. Start counting from 10000 to avoid
     overflow. */

    iStatus = GPCTR_Change_Parameter(iDevice, ulGpctrNum,
     ND_INITIAL_COUNT, ulCount);

    iRetVal = NIDAQErrorHandler(iStatus,
     "GPCTR_Change_Parameter/INITCOUNT", iIgnoreWarning);

    /* NOTE: If you want to control the count direction in software,
     use ND_COUNT_UP or ND_COUNT_DOWN. */

    iStatus = GPCTR_Change_Parameter(iDevice, ulGpctrNum, ND_UP_DOWN,
     ND_HARDWARE);

    iRetVal = NIDAQErrorHandler(iStatus,
     "GPCTR_Change_Parameter/UPDOWN", iIgnoreWarning);

    printf(" Apply your digital pulse train to the SOURCE of your counter.\n");

    printf(" Notice the counting direction changes as you change the digital state of the direction control signal.\n");

    iStatus = GPCTR_Control(iDevice, ulGpctrNum, ND_PROGRAM);

    iRetVal = NIDAQErrorHandler(iStatus, "GPCTR_Control/PROGRAM",
     iIgnoreWarning);

    /* Loop 10 times. */

    do {


        iRetVal = NIDAQDelay(1.0);

        iStatus = GPCTR_Watch(iDevice, ulGpctrNum, ND_COUNT,
         &ulCount);

        iRetVal = NIDAQErrorHandler(iStatus, "GPCTR_Watch/COUNT",
         iIgnoreWarning);

        printf(" The current count is %lu\n", ulCount);

        --iLoopCount;

        iStatus = GPCTR_Watch(iDevice, ulGpctrNum, ND_TC_REACHED,
         &ulTCReached);

        if (ulTCReached == ND_YES) {


            printf(" Counter reached terminal count! - The count may be incorrect.\n");

        }


        iRetVal = NIDAQYield(iYieldON);

    } while ((iLoopCount > 0) && (iStatus == 0));


    iRetVal = NIDAQErrorHandler(iStatus, "GPCTR_Watch",
     iIgnoreWarning);

    /* CLEANUP - Don't check for errors on purpose. */

    /* Reset GPCTR. */

    iStatus = GPCTR_Control(iDevice, ulGpctrNum, ND_RESET);

    printf(" Done with event counting with digital count direction control!\n");


}

/* End of program */
