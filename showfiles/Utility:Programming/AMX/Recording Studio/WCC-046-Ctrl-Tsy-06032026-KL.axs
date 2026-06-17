PROGRAM_NAME='WCC-046-Ctrl-Tsy'
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 03/16/2026  AT: 09:00:25        *)

(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
/*
    Weitz Recording Studio WCC 45-46
   nx3200- 
	DNS: wcc-046-ctrl
	IP:  10.136.3.12
	
    MST701-
	DNS: wcc-046-tsy
	IP:  10.136.3.40
    
    MST1001-
	DNS: wcc-045-tsy
	IP:  10.136.3.61
*/

DEFINE_DEVICE

(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)

//NX3200
dvTSY		=	10001:1:0	// Touch panel in recording booth Device:Port:System
dvTSY2		=	10002:1:0	// Touch panel in soundstage

dvSWITCH	=	5001:8:0	// Extron IN1606 Video Switcher
dvTV		=	5001:7:0	// LG 55” US340C Series UHD Commercial TV

vdvTP		=	33001:1:0		// VIRTUAL FOR TOUCH PANEL COMBINE

define_constant
TL_TPFEEDBACK = 1
TL_DEBUG      = 2
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)

DEFINE_COMBINE
(vdvTP, dvTSY, dvTSY2)

DEFINE_VARIABLE

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)

integer TVPower 	//TV Power Status
integer SourceMac 	//Mac Studio Source Status
integer SourceLap 	//Laptop Source Status
integer VidMuted	//Mute Status of Outputs
integer CurrentSource	//Current input source

char bMidnightTriggered = 0  // 0 = false, 1 = true

LONG     TPFEEDBACK_TIME[] = {500}
LONG     DEBUG_TIME[] = {5000}

DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE

(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
// DEFINE_START
define_start
 TIMELINE_CREATE(TL_TPFEEDBACK,TPFEEDBACK_TIME,LENGTH_ARRAY(TPFEEDBACK_TIME),TIMELINE_ABSOLUTE,TIMELINE_REPEAT)	// TP Panel Feedback
 //TIMELINE_CREATE(tl_debug,DEBUG_TIME,LENGTH_ARRAY(DEBUG_TIME),TIMELINE_ABSOLUTE,TIMELINE_REPEAT)	//Debugging 

DEFINE_EVENT


DATA_EVENT[dvSWITCH]
{
    ONLINE:
    {
	SEND_COMMAND DATA.DEVICE, 'SET MODE DATA'
	SEND_COMMAND DATA.DEVICE, 'SET BAUD 9600,N,8,1 485 DISABLE'
	// SETS UP SERIAL PORT FOR EXTRON
	// (9600 bps, no parity, 8-bit, 1 stop bit, RS-485 disabled)
	send_string dvSWITCH, "'3!', $0D, $0A" 
	SourceMac = 1
	SourceLap = 0
	send_string dvSWITCH, "'0B'" //Unmute all
	VidMuted = 0
    }                 
}
DATA_EVENT[dvTV]
{
    ONLINE:
    {
        SEND_COMMAND DATA.DEVICE, 'SET MODE DATA'
        SEND_COMMAND DATA.DEVICE, 'SET BAUD 9600,N,8,1 485 DISABLE' 		// SETS UP SERIAL PORT FOR TV
	send_string dvTV, "$6B,$61,$20,$30,$30,$20,$30,$31,$0D"			// Power On
	// https://www.reddit.com/r/CommercialAV/comments/s2bu8z/lg_tv_rs232_command_issue/
	// need to convert commands (ka 00 01) to hex in order to work (00 is ID)
        TVPower = 1
    }
}


button_event[vdvTP,45]

button_event[dvTSY,45]
{ //ImageBlank
Push:{
    VidMuted = !VidMuted
    if(VidMuted & SourceMac)
    {
	send_string dvSWITCH, "'2*1B'" //Mute TV
    }
    if(VidMuted & SourceLap)
    {
	send_string dvSWITCH, "'1*1B'" //Mute Control Room Monitor
    }
    if(!VidMuted & SourceMac)
    {
	send_string dvSWITCH, "'2*0B'" //Unmute TV
    }
    if(!VidMuted & SourceLap)
    {
	send_string dvSWITCH, "'1*0B'" //Unmute Control Room Monitor
    }
    }
}



button_event[vdvTP,5]
button_event[dvTSY,5]  // TV Power On
{
    Push:
    {
        send_string dvTV, "$6B,$61,$20,$30,$30,$20,$30,$31,$0D"
        TVPower = 1
    }
}


button_event[vdvTP,6]
button_event[dvTSY,6]  // TV Power Off
{
    Push:
    {
        send_string dvTV, "$6B,$61,$20,$30,$30,$20,$30,$30,$0D"
        TVPower = 0
    }
}



button_event[vdvTP,61]
button_event[dvTSY,61]
{
    Push:
    { //Input to Mac Studio
	send_string dvSWITCH, "'3!', $0D, $0A" 
	SourceMac = 1
	SourceLap = 0				
    }
}


button_event[vdvTP,62]
button_event[dvTSY,62]
{
    Push:
    { //Input to Laptop
	send_string dvSWITCH, "'4!', $0D, $0A" 
	SourceMac = 0
	SourceLap = 1				
    }
}

timeline_event[TL_TPFEEDBACK]
{

    
    [dvTSY,5] = TVPower
    [dvTSY,6] = !TVPower
    [dvTSY,45] = VidMuted
    [dvTSY,61] = SourceMac
    [dvTSY,62] = SourceLap
    
    [vdvTP,5] = TVPower
    [vdvTP,6] = !TVPower
    [vdvTP,45] = VidMuted
    [vdvTP,61] = SourceMac
    [vdvTP,62] = SourceLap
  
    }


DEFINE_PROGRAM

// --- Midnight Maintenance Routine ---
IF (TIME == '00:00:00')
{
    IF (!bMidnightTriggered)
    {
        // 1. Turn TV Off
        send_string dvTV, "$6B,$61,$20,$30,$30,$20,$30,$30,$0D"
        TVPower = 0

        // 2. Switch Input to Mac Studio (Input 3)
        send_string dvSWITCH, "'3!', $0D, $0A" 
        SourceMac = 1
        SourceLap = 0 

        // 3. Unmute Extron Switcher
        send_string dvSWITCH, "'0B'" 
        VidMuted = 0

        // Lock the trigger so it doesn't loop during this second
        bMidnightTriggered = 1
    }
}
ELSE
{
    // Reset the flag once the clock moves past midnight
    bMidnightTriggered = 0
}

(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)