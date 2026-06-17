/*PROGRAM_NAME='WCC-046-Ctrl-Tsy'
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 04/09/2026  AT: 09:00:25        *)

(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
/*
    Hamlin Creative Space WCC-M005
   nx3200- 
	DNS: wcc-m005-ctrl
	IP:  10.130.19.210
	
    MST701-
	DNS: wcc-m005-tsy
	IP:  10.130.19.224
*/

DEFINE_DEVICE

(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)

//NX3200
dvTSY		=	10001:1:0	// Touch panel in recording booth Device:Port:System

dvAMP		=	5001:8:0	// DENON DN-A7100 AV Surround Preamplifier


define_constant
TL_TPFEEDBACK = 1
TL_DEBUG      = 2
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)

DEFINE_VARIABLE

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)

integer AMPpower 	// AMP Power Status
integer SourceAux 	// Aux Source Status
integer SourceHDMI // HDMI Source Status
integer Muted	// Mute Status of Outputs

SINTEGER nAmpLevel          // Value for the UI Bar Graph (-99 to +18)

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


DATA_EVENT[dvAMP] // boot up initialization
{
    ONLINE:
    {
        SEND_COMMAND DATA.DEVICE, 'SET BAUD 9600,N,8,1 485 DISABLE'
        
        // Initial Query on boot
        send_string dvAMP, "'@VOL:0-99',$0D"
	nAmpLevel = -99
	send_level dvTSY, 1, nAmpLevel
        
        // Power and Mute initialization
        send_string dvAMP, "'@PWR:2',$0D"
        AMPpower = 1
        send_string dvAMP, "'@AMT:1',$0D"
        Muted = 0
    }
}


button_event[dvTSY,45]
{ // Audio Mute
Push:{
    Muted = !Muted
    if(Muted)
    {
	send_string dvAMP, "'@AMT:2',$0D"
    }
    Else
    {
	send_string dvAMP, "'@AMT:1',$0D"
    }
    }
}


/*
button_event[dvTSY,41] //volumn down
{
Push:
    {
        send_string dvAMP, "'@VOL:2',$0D"
	nAmpLevel = nAmpLevel - 1
	send_level dvTSY, 1, nAmpLevel
    }
}

button_event[dvTSY,40] //volumn up
{
Push:
    {
        send_string dvAMP, "'@VOL:1',$0D"
	nAmpLevel = nAmpLevel + 1
	send_level dvTSY, 1, nAmpLevel
    }
}
*/

button_event[dvTSY,41] // Volume Down
{
    Push: {
        if (nAmpLevel > -99) { // Prevent going below min
            nAmpLevel--
            send_string dvAMP, "'@VOL:2',$0D"
            send_level dvTSY, 1, nAmpLevel
        }
    }
}

button_event[dvTSY,40] // Volume Up
{
    Push: {
        if (nAmpLevel < 18) { // Prevent going above max (safety!)
            nAmpLevel++
            send_string dvAMP, "'@VOL:1',$0D"
            send_level dvTSY, 1, nAmpLevel
        }
    }
}


button_event[dvTSY,15]  // AMP Power On & Source to Aux 2
{
    Push:
    {
        send_string dvAMP, "'@PWR:2',$0D"
        AMPpower = 1
	
	send_string dvAMP, "'@SRC:A',$0D"
	SourceAux = 1
	SourceHDMI = 0
	
	send_string dvAMP, "'@SUR:00',$0D"
	
	
	// Force the Amp to a specific startup volume so we ARE in sync
        nAmpLevel = -99 
        send_string dvAMP, "'@VOL:0-99',$0D" 
	send_level dvTSY, 1, nAmpLevel
    }
}

button_event[dvTSY,16]  // AMP Power On & Source to HDMI 1
{
    Push:
    {
        send_string dvAMP, "'@PWR:2',$0D"
        AMPpower = 1
	
	send_string dvAMP, "'@SRC:2',$0D"
	SourceAux = 0
	SourceHDMI = 1
	
	send_string dvAMP, "'@SUR:00',$0D"
	
	
	// Force the Amp to a specific startup volume so we ARE in sync
        nAmpLevel = -99 
        send_string dvAMP, "'@VOL:0-99',$0D" 
	send_level dvTSY, 1, nAmpLevel
	
	send_string dvAMP, "'@SRC:2',$0D"
	SourceAux = 0
	SourceHDMI = 1
    }
}

button_event[dvTSY,7]  // System Shut down
{
    Push:
    {
        send_string dvAMP, "'@PWR:1',$0D"
        AMPpower = 0
	SourceAux = 0
	SourceHDMI = 0
	
	// Force the Amp to a specific startup volume so we ARE in sync
        nAmpLevel = -99 
        send_string dvAMP, "'@VOL:0-99',$0D" 
	send_level dvTSY, 1, nAmpLevel
    }
}


LEVEL_EVENT[dvTSY, 1]  
{
    nAmpLevel = LEVEL.VALUE  
    
    IF (nAmpLevel > 0)
    {
        // Result: @VOL:0+12
        SEND_STRING dvAMP, "FORMAT('@VOL:0+%02d', nAmpLevel), $0D"
    }
    ELSE IF (nAmpLevel < 0)
    {
        // Result: @VOL:0-45 
        // We use ABS_VALUE so the '-' doesn't clash with our manual '-'
        SEND_STRING dvAMP, "FORMAT('@VOL:0-%02d', ABS_VALUE(nAmpLevel)), $0D"
    }
    ELSE
    {
        // Result: @VOL: 00 (or 0+00 depending on the amp's mood)
        SEND_STRING dvAMP, "'@VOL: 00', $0D"
    }
}

timeline_event[TL_TPFEEDBACK]
{
    [dvTSY,45] = Muted
    [dvTSY,15] = SourceAux   
    [dvTSY,16] = SourceHDMI  
  
    }


DEFINE_PROGRAM

(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)
*/

PROGRAM_NAME='WCC-046-Ctrl-Tsy'
(***********************************************************)
(* FILE_LAST_MODIFIED_ON: 06/13/2026   AT: 09:00:25       *)
(***********************************************************)

/*
    Hamlin Creative Space WCC-M005
    nx3200- 
    DNS: wcc-m005-ctrl
    IP:  10.130.19.210
    
    MST701-
    DNS: wcc-m005-tsy
    IP:  10.130.19.224
*/

DEFINE_DEVICE

//NX3200
dvTSY        =    10001:1:0    // Touch panel in recording booth Device:Port:System
dvAMP        =    5001:8:0     // DENON DN-A7100 AV Surround Preamplifier

DEFINE_CONSTANT
TL_TPFEEDBACK = 1
TL_DEBUG      = 2

DEFINE_TYPE

DEFINE_VARIABLE
INTEGER AMPpower     // AMP Power Status
INTEGER SourceAux    // Aux Source Status
INTEGER SourceHDMI   // HDMI Source Status
INTEGER Muted        // Mute Status of Outputs

SINTEGER nAmpLevel          // Value for the UI Bar Graph (-99 to +18)

LONG     TPFEEDBACK_TIME[] = {500}
LONG     DEBUG_TIME[] = {5000}

DEFINE_LATCHING

DEFINE_MUTUALLY_EXCLUSIVE

DEFINE_START
TIMELINE_CREATE(TL_TPFEEDBACK,TPFEEDBACK_TIME,LENGTH_ARRAY(TPFEEDBACK_TIME),TIMELINE_ABSOLUTE,TIMELINE_REPEAT)    // TP Panel Feedback

DEFINE_EVENT

DATA_EVENT[dvAMP] // boot up initialization
{
    ONLINE:
    {
        SEND_COMMAND DATA.DEVICE, 'SET BAUD 9600,N,8,1 485 DISABLE'
        
        // Initial Query on boot
        SEND_STRING dvAMP, "'@VOL:0-99',$0D"
        nAmpLevel = -99
        SEND_LEVEL dvTSY, 1, nAmpLevel
        
        // Power and Mute initialization
        SEND_STRING dvAMP, "'@PWR:2',$0D"
        AMPpower = 1
        SEND_STRING dvAMP, "'@AMT:1',$0D"
        Muted = 0
    }
}

BUTTON_EVENT[dvTSY,45] // Audio Mute
{
    PUSH: {
        Muted = !Muted
        IF(Muted)
        {
            SEND_STRING dvAMP, "'@AMT:2',$0D"
        }
        ELSE
        {
            SEND_STRING dvAMP, "'@AMT:1',$0D"
        }
    }
}

BUTTON_EVENT[dvTSY,41] // Volume Down
{
    PUSH: {
        IF (nAmpLevel > -99) { // Prevent going below min
            nAmpLevel--
            SEND_STRING dvAMP, "'@VOL:2',$0D"
            SEND_LEVEL dvTSY, 1, nAmpLevel
        }
    }
}

BUTTON_EVENT[dvTSY,40] // Volume Up
{
    PUSH: {
        IF (nAmpLevel < 18) { // Prevent going above max (safety!)
            nAmpLevel++
            SEND_STRING dvAMP, "'@VOL:1',$0D"
            SEND_LEVEL dvTSY, 1, nAmpLevel
        }
    }
}

BUTTON_EVENT[dvTSY,15]  // AMP Power On & Source to Aux 2
{
    PUSH:
    {
    
	IF (AMPpower == 0) {
	    SEND_STRING dvAMP, "'@PWR:2',$0D"
	    AMPpower = 1
	}
        
        // Minor delay or sequential logic if Denon drops commands while powering up
        SEND_STRING dvAMP, "'@SRC:A',$0D"
        SourceAux = 1
        SourceHDMI = 0
        
        SEND_STRING dvAMP, "'@SUR:00',$0D"
        
	If (nAmpLevel != -99) {
	    // Force sync level
	    SEND_STRING dvAMP, "'@VOL:0-99',$0D"
	    nAmpLevel = -99
	    SEND_LEVEL dvTSY, 1, nAmpLevel
	}
    }
}

BUTTON_EVENT[dvTSY,16]  // AMP Power On & Source to HDMI 1
{
    PUSH:
    {
	IF (AMPpower == 0) {
	    SEND_STRING dvAMP, "'@PWR:2',$0D"
	    AMPpower = 1
        }
	
        SEND_STRING dvAMP, "'@SRC:2',$0D"
        SourceAux = 0
        SourceHDMI = 1
        
        SEND_STRING dvAMP, "'@SUR:00',$0D"
        
	If (nAmpLevel != -99) {
	    // Force sync level
	    SEND_STRING dvAMP, "'@VOL:0-99',$0D"
	    nAmpLevel = -99
	    SEND_LEVEL dvTSY, 1, nAmpLevel
	}
    }
}

BUTTON_EVENT[dvTSY,7]  // System Shut down
{
    PUSH:
    {
        SEND_STRING dvAMP, "'@PWR:1',$0D"
        AMPpower = 0
        SourceAux = 0
        SourceHDMI = 0
        
	// Force sync level
	SEND_STRING dvAMP, "'@VOL:0-99',$0D"
	nAmpLevel = -99
	SEND_LEVEL dvTSY, 1, nAmpLevel
    }
}

LEVEL_EVENT[dvTSY, 1]  
{
    nAmpLevel = LEVEL.VALUE  
    
    IF (nAmpLevel > 0)
    {
        SEND_STRING dvAMP, "FORMAT('@VOL:0+%02d', nAmpLevel), $0D"
    }
    ELSE IF (nAmpLevel < 0)
    {
        SEND_STRING dvAMP, "FORMAT('@VOL:0-%02d', ABS_VALUE(nAmpLevel)), $0D"
    }
    ELSE
    {
        SEND_STRING dvAMP, "'@VOL:000',$0D" // Cleaned string formatting literal
    }
}

TIMELINE_EVENT[TL_TPFEEDBACK]
{
    [dvTSY,45] = Muted
    [dvTSY,15] = SourceAux   
    [dvTSY,16] = SourceHDMI  
}

DEFINE_PROGRAM
(*****************************************************************)
(* END OF PROGRAM                          *)
(*****************************************************************)

