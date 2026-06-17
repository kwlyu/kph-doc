PROGRAM_NAME='KracumPerformance'

/*
  M104 formerly Performance Hall
  
   nx3200- 
	DNS: wccm104csy63390
	IP:  137.22.71.108
	
    MST1001-
	DNS: wccm104tsn63391
	IP:  137.22.71.109

    MST1001-
	DNS: wccm103btsn63540
	IP:  137.22.71.110
	
    Symetrix 
	IP: 137.22.71.114
    D&B Amps
	IP: 137.22.71.116
	IP: 137.22.71.117
	IP: 137.22.71.118
	IP: 137.22.71.119


*/

DEFINE_DEVICE
//NX3200
dvTP		=	10001:1:0	//FOH
dvtp2		= 	10002:1:0	//Teaching Station
dvTP3		=       10128:1:0 	//Video Suite

dvPROJ		=	5001:3:0		// Epson Projector
dvSWITCH	=	5001:1:0	// Extron XTP II Crosspoint 1600
dvBLURAY	=	5001:2:0	// Bluray player

dvSamsung1	= 	5001:6:0
dvSamsung2	=	5001:7:0
dvSamsung3	=	5001:8:0

dvREL		=	5001:21:0	// Screen //does not work


dvAMP1		= 0:6:0
dvAMP2		= 0:7:0
dvAMP3		= 0:8:0
dvAMP4		= 0:9:0

vdvTP		= 33001:1:0	// VIRTUAL FOR TOUCH PANEL COMBINE


// virtual devices (and channels):
// amplifier 1:
vdvDBaudioAmp1ChannelA = 41001:1:0
vdvDBaudioAmp1ChannelB = 41001:2:0
vdvDBaudioAmp1ChannelC = 41001:3:0
vdvDBaudioAmp1ChannelD = 41001:4:0

// amplifier 2:
vdvDBaudioAmp2ChannelA = 41002:1:0
vdvDBaudioAmp2ChannelB = 41002:2:0
vdvDBaudioAmp2ChannelC = 41002:3:0
vdvDBaudioAmp2ChannelD = 41002:4:0

// virtual devices (and channels):
// amplifier 1:
vdvDBaudioAmp3ChannelA = 41003:1:0
vdvDBaudioAmp3ChannelB = 41003:2:0
vdvDBaudioAmp3ChannelC = 41003:3:0
vdvDBaudioAmp3ChannelD = 41003:4:0

// amplifier 2:
vdvDBaudioAmp4ChannelA = 41004:1:0
vdvDBaudioAmp4ChannelB = 41004:2:0
vdvDBaudioAmp4ChannelC = 41004:3:0
vdvDBaudioAmp4ChannelD = 41004:4:0


DEFINE_COMBINE
(vdvTP, dvTP, dvTP3)



define_variable 
integer ProjPower 	//Projector Power Status
integer ampMode 	//Amp  Status Tracking
integer SelSource 	//Source Selected to be outputted
integer SelDest
integer routedVideo[8]  //array for the number of video outputs on EXTRON
integer projMuted
integer yScreenControlState
integer SamsungPower[3]

LONG     TPFEEDBACK_TIME[] = {500}
LONG     DEBUG_TIME[] = {5000}
define_constant
TL_TPFEEDBACK = 1
TL_DEBUG      = 2


CHAR BLURAY_PLAY[]	=	{'#','P','L','A',' ',$0A,$0D}
CHAR BLURAY_STOP[]	=	{'#','S','T','P',' ',$0A,$0D}
char BLURAY_PAUSE[]	=	{'#','P','A','U',' ',$0A,$0D}
CHAR BLURAY_FFWD[]	=	{'#','F','W','D',' ',$0A,$0D}
CHAR BLURAY_REW[]	=	{'#','R','E','V',' ',$0A,$0D}
CHAR BLURAY_NEXT[]	=	{'#','N','X','T',' ',$0A,$0D}
CHAR BLURAY_PREV[]	=	{'#','P','R','E',' ',$0A,$0D}
CHAR BLURAY_UP[]	=	{'#','N','U','P',' ',$0A,$0D}
CHAR BLURAY_DOWN[]	= 	{'#','N','D','N',' ',$0A,$0D}
CHAR BLURAY_LEFT[]	=	{'#','N','L','T',' ',$0A,$0D}
CHAR BLURAY_RIGHT[]	=	{'#','N','R','T',' ',$0A,$0D}
CHAR BLURAY_OKAY[]	=	{'#','S','E','L',' ',$0A,$0D}
CHAR BLURAY_SUBTITLES[]	=	{'#','S','U','B',' ',$0A,$0D}
CHAR BLURAY_AUDIO[]	=	{'#','A','U','D',' ',$0A,$0D}
CHAR BLURAY_RETURN[]	=	{'#','R','E','T',' ',$0A,$0D}
CHAR BLURAY_POPUP[]	=	{'#','M','N','U',' ',$0A,$0D}
CHAR BLURAY_MENU[]	=	{'#','T','T','L',' ',$0A,$0D}

integer btnSources[] ={101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117}
integer btnDests[] = {90,91,92,93}


define_start
 TIMELINE_CREATE(TL_TPFEEDBACK,TPFEEDBACK_TIME,LENGTH_ARRAY(TPFEEDBACK_TIME),TIMELINE_ABSOLUTE,TIMELINE_REPEAT)	// TP Panel Feedback
 //TIMELINE_CREATE(tl_debug,DEBUG_TIME,LENGTH_ARRAY(DEBUG_TIME),TIMELINE_ABSOLUTE,TIMELINE_REPEAT)	//Debugging 

define_module 'DbAudiotechnik_OCA_Comm_dr1_0_0' mAmpDev1(vdvDBaudioAmp1ChannelA, dvAmp1)
define_module 'DbAudiotechnik_OCA_Comm_dr1_0_0' mAmpDev2(vdvDBaudioAmp2ChannelA, dvAmp2)
define_module 'DbAudiotechnik_OCA_Comm_dr1_0_0' mAmpDev3(vdvDBaudioAmp3ChannelA, dvAmp3)
define_module 'DbAudiotechnik_OCA_Comm_dr1_0_0' mAmpDev4(vdvDBaudioAmp4ChannelA, dvAmp4)



define_function fnRoute(integer s, integer d)
{
    send_string dvSWITCH, "itoa(s),'*',itoa(d),'!'" //patch av from input s to output d
    routedVideo[d] = s
    
    if(SelSource >= 9)
     send_string dvSWITCH, "itoa(s),'*6!',itoa(s),'*2!'"
     routedVideo[6] = s
     // if input is 9-16 (i.e., projector source, output av directly to 6 and 2.
     // to fix: instead of hardcoding 6 and 2, have them as variables.
    
}


define_event


DATA_EVENT[vdvDBaudioAmp1ChannelA]
{
    ONLINE:
    {
	SEND_STRING 0,"'### Device 1 online'" 
	
	SEND_COMMAND vdvDBaudioAmp1ChannelA, "'PROPERTY-IP_Address,', '137.22.71.116'"
	
	WAIT 10
	
	SEND_COMMAND vdvDBaudioAmp1ChannelA, "'REINIT'"
	
	SEND_STRING 0,"'### Reinit sent device 1'" 
    }
}

DATA_EVENT[vdvDBaudioAmp2ChannelA]
{
    ONLINE:
    {
	SEND_STRING 0,"'### Device 2 online'" 
	
	SEND_COMMAND vdvDBaudioAmp2ChannelA, "'PROPERTY-IP_Address,', '137.22.71.117'"
	// setting port might only be necessary for devices with old firmware
	//SEND_COMMAND vdvDBaudioAmp2ChannelA, "'PROPERTY-Port,', '51499'"
	
	WAIT 10
	
	SEND_COMMAND vdvDBaudioAmp2ChannelA, "'REINIT'"
	
	SEND_STRING 0,"'### Reinit sent device 2'" 
    }
}


DATA_EVENT[vdvDBaudioAmp3ChannelA]
{
    ONLINE:
    {
	SEND_STRING 0,"'### Device 1 online'" 
	
	SEND_COMMAND vdvDBaudioAmp3ChannelA, "'PROPERTY-IP_Address,', '137.22.71.118'"
	
	WAIT 10
	
	SEND_COMMAND vdvDBaudioAmp3ChannelA, "'REINIT'"
	
	SEND_STRING 0,"'### Reinit sent device 1'" 
    }
}

DATA_EVENT[vdvDBaudioAmp4ChannelA]
{
    ONLINE:
    {
	SEND_STRING 0,"'### Device 2 online'" 
	
	SEND_COMMAND vdvDBaudioAmp4ChannelA, "'PROPERTY-IP_Address,', '137.22.71.119'"
	// setting port might only be necessary for devices with old firmware
	//SEND_COMMAND vdvDBaudioAmp2ChannelA, "'PROPERTY-Port,', '51499'"
	
	WAIT 10
	
	SEND_COMMAND vdvDBaudioAmp4ChannelA, "'REINIT'"
	
	SEND_STRING 0,"'### Reinit sent device 2'" 
    }
}

BUTTON_EVENT[vdvTP, 26] // 
{
    PUSH:
    {
	ampMode = 1
	Pulse[vdvDBaudioAmp1ChannelA,321]
        Pulse[vdvDBaudioAmp1ChannelB,321]
	Pulse[vdvDBaudioAmp1ChannelC,321]
        Pulse[vdvDBaudioAmp1ChannelD,321]
        Pulse[vdvDBaudioAmp2ChannelA,321]
        Pulse[vdvDBaudioAmp2ChannelB,321]
	Pulse[vdvDBaudioAmp2ChannelC,321]
        Pulse[vdvDBaudioAmp2ChannelD,321]
	Pulse[vdvDBaudioAmp3ChannelA,321]
        Pulse[vdvDBaudioAmp3ChannelB,321]
	Pulse[vdvDBaudioAmp3ChannelC,321]
        Pulse[vdvDBaudioAmp3ChannelD,321]
        Pulse[vdvDBaudioAmp4ChannelA,321]
        Pulse[vdvDBaudioAmp4ChannelB,321]
	Pulse[vdvDBaudioAmp4ChannelC,321]
        Pulse[vdvDBaudioAmp4ChannelD,321]
    }
}


BUTTON_EVENT[vdvTP, 25] // Set MUTE On
{
    PUSH:
    {
	ampMode = 2
	Pulse[vdvDBaudioAmp1ChannelA,322]
        Pulse[vdvDBaudioAmp1ChannelB,322]
	Pulse[vdvDBaudioAmp1ChannelC,322]
        Pulse[vdvDBaudioAmp1ChannelD,322]
        Pulse[vdvDBaudioAmp2ChannelA,322]
        Pulse[vdvDBaudioAmp2ChannelB,322]
	Pulse[vdvDBaudioAmp2ChannelC,322]
        Pulse[vdvDBaudioAmp2ChannelD,322]
	Pulse[vdvDBaudioAmp3ChannelA,322]
        Pulse[vdvDBaudioAmp3ChannelB,322]
	Pulse[vdvDBaudioAmp3ChannelC,322]
        Pulse[vdvDBaudioAmp3ChannelD,322]
        Pulse[vdvDBaudioAmp4ChannelA,322]
        Pulse[vdvDBaudioAmp4ChannelB,322]
	Pulse[vdvDBaudioAmp4ChannelC,322]
        Pulse[vdvDBaudioAmp4ChannelD,322]
    }
}
BUTTON_EVENT[vdvTP, 27] // Set MUTE On
{
    PUSH:
    {
	ampMode = 3
        ON[vdvDBaudioAmp1ChannelA,199]
        ON[vdvDBaudioAmp1ChannelB,199]
	ON[vdvDBaudioAmp1ChannelC,199]
        ON[vdvDBaudioAmp1ChannelD,199]
        ON[vdvDBaudioAmp2ChannelA,199]
        ON[vdvDBaudioAmp2ChannelB,199]
	ON[vdvDBaudioAmp2ChannelC,199]
        ON[vdvDBaudioAmp2ChannelD,199]
	ON[vdvDBaudioAmp3ChannelA,199]
        ON[vdvDBaudioAmp3ChannelB,199]
	ON[vdvDBaudioAmp3ChannelC,199]
        ON[vdvDBaudioAmp3ChannelD,199]
        ON[vdvDBaudioAmp4ChannelA,199]
        ON[vdvDBaudioAmp4ChannelB,199]
	ON[vdvDBaudioAmp4ChannelC,199]
        ON[vdvDBaudioAmp4ChannelD,199]
    }
}
BUTTON_EVENT[vdvTP, 301] // Set MUTE Off
{
    PUSH:
    {
        OFF[vdvDBaudioAmp1ChannelA,199]
        OFF[vdvDBaudioAmp1ChannelB,199]
	OFF[vdvDBaudioAmp1ChannelC,199]
        OFF[vdvDBaudioAmp1ChannelD,199]
        OFF[vdvDBaudioAmp2ChannelA,199]
        OFF[vdvDBaudioAmp2ChannelB,199]
	OFF[vdvDBaudioAmp2ChannelC,199]
        OFF[vdvDBaudioAmp2ChannelD,199]
    }
}
//Serial Devices
DATA_EVENT[dvBLURAY]
{
    ONLINE:
    {
	SEND_COMMAND DATA.DEVICE, 'SET MODE DATA'
	SEND_COMMAND DATA.DEVICE, 'SET BAUD 9600,N,8,1 485 DISABLE'		// SETS UP SERIAL PORT FOR PROJECTOR
    }
}

DATA_EVENT[dvSWITCH]
{
    ONLINE:
    {
	SEND_COMMAND DATA.DEVICE, 'SET MODE DATA'
	SEND_COMMAND DATA.DEVICE, 'SET BAUD 9600,N,8,1 485 DISABLE'		// SETS UP SERIAL PORT FOR PROJECTOR
    }
}


DATA_EVENT[dvPROJ]
{
    ONLINE:
    {
	SEND_COMMAND DATA.DEVICE, 'SET MODE DATA'
	SEND_COMMAND DATA.DEVICE, 'SET BAUD 9600,N,8,1 485 DISABLE'		// SETS UP SERIAL PORT FOR PROJECTOR
    }
}

BUTTON_EVENT[vdvTP,5]
{
    Push:{ 
    send_command vdvTP,"'@PPA-MAIN'"
    send_command vdvTP,"'@PPN-TV Controls'"
}}

BUTTON_EVENT[vdvTP,6]
{
    Push:{ 
    send_command vdvTP,"'@PPA-MAIN'"
    send_command vdvTP,"'@PPN-Bluray Controls'"
}}
BUTTON_EVENT[vdvTP,7]
{
    Push:{ 
    send_command vdvTP,"'@PPA-MAIN'"
    send_command vdvTP,"'@PPN-Projector Controls'"
}}
BUTTON_EVENT[vdvTP,8]
{
    Push:{ 
    send_command vdvTP,"'@PPA-MAIN'"
    send_command vdvTP,"'@PPN-Routing'"
}}


BUTTON_EVENT[dvtp2,6]
{
    Push:{ 
    send_command dvTP2,"'@PPA-MAIN'"
    send_command dvTP2,"'@PPN-Bluray Controls'"
}}
BUTTON_EVENT[dvTP2,7]
{
    Push:{ 
    send_command dvTP2,"'@PPA-MAIN'"
    send_command dvTP2,"'@PPN-Projector Controls'"
}}
BUTTON_EVENT[dvTP2,8]
{
    Push:{ 
    send_command dvTP2,"'@PPA-MAIN'"
    send_command dvTP2,"'@PPN-Routing'"
}}

BUTTON_EVENT[vdvTP,9]
{
    Push:{ 
    send_command vdvTP,"'@PPA-MAIN'"
    send_command vdvTP,"'@PPN-Amp Controls'"
}}



button_event[vdvTP,14]
button_event[dvtp2,14]
{ //ImageBlank
Push:{
    projMuted = !projMuted
    if(projMuted)
    {
	send_string dvPROJ, "'MUTE ON',13"
    }
    Else
    {
	send_string dvPROJ, "'MUTE OFF',13"
    }
    }
}


//Bluray Controls
BUTTON_EVENT[vdvTP,80]	// PLAY
BUTTON_EVENT[vdvTP,81]	// STOP
BUTTON_EVENT[vdvTP,82]	// PAUSE
BUTTON_EVENT[vdvTP,83]	// FFWD
BUTTON_EVENT[vdvTP,84]	// REW
BUTTON_EVENT[vdvTP,85]	// NEXT
BUTTON_EVENT[vdvTP,86]	// PREV
BUTTON_EVENT[vdvTP,87]	// UP
BUTTON_EVENT[vdvTP,88]	// DOWN
BUTTON_EVENT[vdvTP,89]	// LEFT
BUTTON_EVENT[vdvTP,90]	// RIGHT
BUTTON_EVENT[vdvTP,91]	// ENTER
BUTTON_EVENT[vdvTP,92]	// MENU
BUTTON_EVENT[vdvTP,93]	// TOP MENU
BUTTON_EVENT[vdvTP,94]	// TITLE
BUTTON_EVENT[vdvTP,95]	// AUDIO
BUTTON_EVENT[vdvTP,96]	// RETURN   ----
BUTTON_EVENT[dvTP2,80]	// PLAY
BUTTON_EVENT[dvTP2,81]	// STOP
BUTTON_EVENT[dvTP2,82]	// PAUSE
BUTTON_EVENT[dvTP2,83]	// FFWD
BUTTON_EVENT[dvTP2,84]	// REW
BUTTON_EVENT[dvTP2,85]	// NEXT
BUTTON_EVENT[dvTP2,86]	// PREV
BUTTON_EVENT[dvTP2,87]	// UP
BUTTON_EVENT[dvTP2,88]	// DOWN
BUTTON_EVENT[dvTP2,89]	// LEFT
BUTTON_EVENT[dvTP2,90]	// RIGHT
BUTTON_EVENT[dvTP2,91]	// ENTER
BUTTON_EVENT[dvTP2,92]	// MENU
BUTTON_EVENT[dvTP2,93]	// TOP MENU
BUTTON_EVENT[dvTP2,94]	// TITLE
BUTTON_EVENT[dvTP2,95]	// AUDIO
BUTTON_EVENT[dvTP2,96]	// RETURN
{
    PUSH:
    {
	TO[vdvTP,BUTTON.INPUT.CHANNEL]
	SWITCH(BUTTON.INPUT.CHANNEL - 80)
	{
	    CASE 0:{SEND_STRING dvBLURAY, BLURAY_PLAY}
	    CASE 1:{SEND_STRING dvBLURAY, BLURAY_STOP}   
	    CASE 2:{SEND_STRING dvBLURAY, BLURAY_PAUSE}
	    CASE 3:{SEND_STRING dvBLURAY, BLURAY_FFWD}
	    CASE 4:{SEND_STRING dvBLURAY, BLURAY_REW}
	    CASE 5:{SEND_STRING dvBLURAY, BLURAY_NEXT}
	    CASE 6:{SEND_STRING dvBLURAY, BLURAY_PREV}
	    CASE 7:{SEND_STRING dvBLURAY, BLURAY_UP}
	    CASE 8:{SEND_STRING dvBLURAY, BLURAY_DOWN}
	    CASE 9:{SEND_STRING dvBLURAY, BLURAY_LEFT}
	    CASE 10:{SEND_STRING dvBLURAY, BLURAY_RIGHT}
	    CASE 11:{SEND_STRING dvBLURAY, BLURAY_OKAY}
	    CASE 12:{SEND_STRING dvBLURAY, BLURAY_POPUP}
	    CASE 13:{SEND_STRING dvBLURAY, BLURAY_MENU}
	    CASE 14:{SEND_STRING dvBLURAY, BLURAY_SUBTITLES}
	    CASE 15:{SEND_STRING dvBLURAY, BLURAY_AUDIO}
	    CASE 16:{SEND_STRING dvBLURAY, BLURAY_RETURN}	    
	}
    }
}

//Screen Dropping Buttons. Dead man style where they need to hold the button to acutate
BUTTON_EVENT [vdvTP, 15]
BUTTON_EVENT [vdvTP, 16]
BUTTON_EVENT [vdvTP, 17]
BUTTON_EVENT [vdvTP, 18]
{
    push: to[dvREL,button.input.channel-14]
}

//Emergency Stop. Since the dead man is setup this a placebo
button_event [vdvTP, 19]
{
    Push: {
	off[dvREL, 1]
	off[dvREL, 2]
        off[dvREL, 3]
	off[dvREL, 4]
}}

button_event[vdvTP,21]
{
    Push:
	{ //Recording Mics dropping
	   to[dvREL,5] 
	}
}
button_event[vdvTP,22]
{
    Push:
	{ //Recording Mics retract
	   to[dvREL,6] 
	}
}
BUTTON_EVENT[vdvTP,10]
BUTTON_EVENT[dvtp2,10]
{  //Projector On
    Push: 
    {
	ProjPower = 1
	send_string dvPROJ, "'PWR ON',13"
    }
}


BUTTON_EVENT[vdvTP,11]
BUTTON_EVENT[dvtp2,11]
{  //Projector Off
    Push: 
    {
	send_string dvPROJ, "'PWR OFF',13"
	ProjPower = 0
	projMuted = 0 //Automatically clears 
    }
}
BUTTON_EVENT[vdvTP,12]
{  //Lens Position 1
    Push: 
    {
	//send_string dvPROJ, "'ZOOM 9781',13"
	//send_string dvPROJ, "'LENS 31980',13"
	send_string dvPROJ, "'POPLP 01',13" // proj preset 1
	
    }
}

BUTTON_EVENT[vdvTP,13]
{  //Lens Position 2
    Push: 
    {
	//send_string dvPROJ, "'ZOOM 11009',13"
	//send_string dvPROJ, "'LENS 23864',13"
	send_string dvPROJ, "'POPLP 02',13" // proj preset 2
	
    }
}


button_event[vdvTP,btnDests]
{
Push:
    {
	SelDest = get_last(btnDests)
	Switch(SelDest)
	{
	    Case 1: 
	    {//Distributed Lose Room Inputs,Bluray,Room Feeds; Gain Signage
		SEND_COMMAND vdvTP,"'^SHO-105.114,0'"
		SEND_COMMAND vdvTP,"'^SHO-115,1'"
	    }
	    Case 2:
	    {//Projector Everything but signage
		SEND_COMMAND vdvTP,"'^SHO-105.114,1'"
		SEND_COMMAND vdvTP,"'^SHO-115,0'"
	    }
	    Case 3:
	    { //Streaming --Signage and itself
		SEND_COMMAND vdvTP,"'^SHO-105.113,1'"
		SEND_COMMAND vdvTP,"'^SHO-114.115,0'"
	    }
	    case 4:
	    { //Capture  --Signage
		SEND_COMMAND vdvTP,"'^SHO-105.114,1'"
		SEND_COMMAND vdvTP,"'^SHO-115,0'"
	    
	    }
	}
	
    }
}
button_event[vdvTP,btnSources]
{
Push:
    {
	SelSource = get_last(btnSources)
	if(SelSource == 17)
	    SelSource = 0
	fnRoute(SelSource,SelDest)
	
    }
}

button_event[dvtp2,btnSources]
{
Push:
    {
	SelSource = get_last(btnSources)
	if(SelSource == 17)
	    SelSource = 0
	fnRoute(SelSource,2)
    }
}


//Exterior facing monitor power
button_event[vdvTP,50]
{
    Push:
    { //Samsung Power On
	send_string dvSamsung1, "$AA,$11,$01,$01,$01,$14"
	SamsungPower[1] = 1
	wait 40 send_string dvSamsung1, "$AA,$14,$01,$01,$21,$37"					
    }
}

BUTTON_EVENT[vdvTP,51]
{
Push:{
    send_string dvSamsung1, "$AA,$11,$01,$01,$00,$13"
	SamsungPower[1] = 0   
    }
}

button_event[vdvTP,20]
{
    Push:
    {	
	yScreenControlState = !yScreenControlState
	if(yScreenControlState)
	{
	    off[dvREL,8]
	}
	else
	{
	    on[dvREL,8]
	}
    }
}

button_event[vdvTP,52]
{
    Push:
    { //Samsung Power On
	send_string dvSamsung2, "$AA,$11,$01,$01,$01,$14"
	SamsungPower[2] = 1
	wait 40 send_string dvSamsung2, "$AA,$14,$01,$01,$21,$37"					
    }
}

BUTTON_EVENT[vdvTP,53]
{
Push:{
    send_string dvSamsung2, "$AA,$11,$01,$01,$00,$13"
	SamsungPower[2] = 0   
    }
}

button_event[vdvTP,54]
{
    Push:
    { //Samsung Power On
	send_string dvSamsung3, "$AA,$11,$01,$01,$01,$14"
	SamsungPower[3] = 1
	wait 40 send_string dvSamsung3, "$AA,$14,$01,$01,$21,$37"					
    }
}

BUTTON_EVENT[vdvTP,55]
{
Push:{
    send_string dvSamsung3, "$AA,$11,$01,$01,$00,$13"
	SamsungPower[3] = 0   
    }
}





timeline_event[tl_debug]
{
    //send_string dvPROJ, "'PWR ON',13" \xAA\x11\xFE\x01\x01\x11
  //  send_string dvSamsung1, "$AA,$11,$01,$01,$01,$14"
 //wait 10 send_string dvSamsung2, "$AA,$11,$01,$01,$01,$14"
 //wait 20 send_string dvSamsung3, "$AA,$11,$01,$01,$01,$14"  
}



timeline_event[TL_TPFEEDBACK]
{

    
    [vdvTP,10] = ProjPower
    [vdvTP,11] = !ProjPower
    [vdvTP,14] = ProjMuted
    
    [dvTP2,10] = ProjPower
    [dvTP2,11] = !ProjPower
    [dvTP2,14] = ProjMuted
    
    [vdvTP,25] = ampMode = 2
    [vdvTP,26] = ampMode = 1
    [vdvTP,27] = ampMode = 3
    
    [vdvTP,20] = yScreenControlState
    
    [vdvTP,50] = SamsungPower[1]
    [vdvTP,51] = !SamsungPower[1]
    [vdvTP,52] = SamsungPower[2]
    [vdvTP,53] = !SamsungPower[2]
    [vdvTP,54] = SamsungPower[3]
    [vdvTP,55] = !SamsungPower[3]
    
    [vdvTP,btnDests[1]] = (SelDest == 1)
    [vdvTP,btnDests[2]] = (SelDest == 2)
    [vdvTP,btnDests[3]] = (SelDest == 3)
    [vdvTP,btnDests[4]] = (SelDest == 4)
    [vdvTP,btnDests[5]] = (SelDest == 5)
    [vdvTP,btnDests[6]] = (SelDest == 6)
    [vdvTP,btnDests[7]] = (SelDest == 7)
    [vdvTP,btnDests[8]] = (SelDest == 8)
    
    
    [vdvTP,btnSources[17]] = (routedVideo[SelDest] == 0)
    [vdvTP,btnSources[1]] = (routedVideo[SelDest] == 1)
    [vdvTP,btnSources[2]] = (routedVideo[SelDest] == 2)
    [vdvTP,btnSources[3]] = (routedVideo[SelDest] == 3)
    [vdvTP,btnSources[4]] = (routedVideo[SelDest] == 4)
    [vdvTP,btnSources[5]] = (routedVideo[SelDest] == 5)
    [vdvTP,btnSources[6]] = (routedVideo[SelDest] == 6)
    [vdvTP,btnSources[7]] = (routedVideo[SelDest] == 7)
    [vdvTP,btnSources[8]] = (routedVideo[SelDest] == 8)
    [vdvTP,btnSources[9]] = (routedVideo[SelDest] == 9)
    [vdvTP,btnSources[10]] = (routedVideo[SelDest] == 10)
    [vdvTP,btnSources[11]] = (routedVideo[SelDest] == 11)
    [vdvTP,btnSources[12]] = (routedVideo[SelDest] == 12)
    [vdvTP,btnSources[13]] = (routedVideo[SelDest] == 13)
    [vdvTP,btnSources[14]] = (routedVideo[SelDest] == 14)
    [vdvTP,btnSources[15]] = (routedVideo[SelDest] == 15)
    [vdvTP,btnSources[16]] = (routedVideo[SelDest] == 16)
    
    
    [dvTP2,btnSources[9]] = (routedVideo[2] == 9)
        [dvTP2,btnSources[17]] = (routedVideo[2] == 0)
    [dvTP2,btnSources[1]] = (routedVideo[2] == 1)
    [dvTP2,btnSources[2]] = (routedVideo[2] == 2)
    [dvTP2,btnSources[3]] = (routedVideo[2] == 3)
    [dvTP2,btnSources[4]] = (routedVideo[2] == 4)
    [dvTP2,btnSources[5]] = (routedVideo[2] == 5)
    [dvTP2,btnSources[6]] = (routedVideo[2] == 6)
    [dvTP2,btnSources[7]] = (routedVideo[2] == 7)
    [dvTP2,btnSources[8]] = (routedVideo[2] == 8)
   
    [dvTP2,btnSources[10]] = (routedVideo[2] == 10)
    [dvTP2,btnSources[11]] = (routedVideo[2] == 11)
    [dvTP2,btnSources[12]] = (routedVideo[2] == 12)
    [dvTP2,btnSources[13]] = (routedVideo[2] == 13)
    [dvTP2,btnSources[14]] = (routedVideo[2] == 14)
    [dvTP2,btnSources[15]] = (routedVideo[2] == 15)
    [dvTP2,btnSources[16]] = (routedVideo[2] == 16)
  
    }