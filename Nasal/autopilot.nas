##############################################################################
####    autopilot.nas  VC10 autopilot mode section logic                  ####
####    Author: Alan Teeder                                               ####
####    This file is licenced under the terms of the GNU General Public   ####
####    Licence V2 or later    											  ####
##############################################################################
##                                                                          ##
## AP - routines for 'Bendix PB 20' autopilot system                        ##
##                                                                          ##
##############################################################################

print ("autopilot.nas");

var last_time = getprop("/sim/time/elapsed-sec");
var current_time = getprop("/sim/time/elapsed-sec");
var dt = 0.0;

### Bendix PB 20 ###
# Switches and Knobs:

#--------------------------------------------------------------------	
#AFCS initialise switch positions and settings	
#--------------------------------------------------------------------


	props.globals.initNode("autopilot/internal/AT_IAS_error",0.0,"DOUBLE");	
	props.globals.initNode("autopilot/internal/AT_IAS_error_integ",0.0,"DOUBLE");
	props.globals.initNode("autopilot/internal/AT_throttlec_deg",0.0,"DOUBLE");
	
	props.globals.initNode("autopilot/logic/NAV-sw",0,"BOOL");			# true/false	
	props.globals.initNode("autopilot/logic/AP1-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/logic/YD1-sw",0,"BOOL");			# true/false	
	props.globals.initNode("autopilot/logic/YD2-sw",0,"BOOL");			# true/false	
	props.globals.initNode("autopilot/logic/AP2-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/logic/ALT-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/logic/IAS-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/logic/MACH-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/logic/PITCH-HOLD",0,"BOOL");
	props.globals.initNode("autopilot/logic/GS-CAPT",0,"BOOL");
	props.globals.initNode("autopilot/logic/HdgHold",0,"BOOL");
	props.globals.initNode("autopilot/logic/TurnMode",0,"BOOL");
	

	props.globals.initNode("autopilot/gain/Khdg_phi",-1.5,"DOUBLE");		## used in Flight director	

	props.globals.initNode("autopilot/gain/Kloc_Loc",-5.0,"DOUBLE");		## used in Flight director
	props.globals.initNode("autopilot/gain/Kloc_Phi",0.,"DOUBLE");		## used in Flight director	
	
	props.globals.initNode("autopilot/LATSTB/LA1",0.5,"DOUBLE");
	props.globals.initNode("autopilot/LATSTB/ULK7",1.0,"DOUBLE");

	props.globals.initNode("autopilot/LGUIDE/PHICOM",0.0,"DOUBLE");

	props.globals.initNode("autopilot/LGUIDE/Beta_Deg",0.0,"DOUBLE");	
	props.globals.initNode("autopilot/LGUIDE/Beta_Deg_abs",0.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/Beta_Deg_Lag",0.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/Beta_Deg_Lag_abs",0.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/Beta_Deg_Lag_limited",0.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/Beta_Deg_Washout",0.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/Beta_Deg_Washout_abs",0.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/Beta_Integ",0.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/Beta_E_sum",0.0,"DOUBLE");
#	props.globals.initNode("autopilot/LGUIDE/a_psi",1.0,"DOUBLE");
#	props.globals.initNode("autopilot/LGUIDE/ALG1",5.0,"DOUBLE");	
#	props.globals.initNode("autopilot/LGUIDE/ALG2",2.0,"DOUBLE");
##	props.globals.initNode("autopilot/LGUIDE/ALG3",0.3,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/KLOCT",0.3,"DOUBLE");
	
	props.globals.initNode("autopilot/LGUIDE/a1",5.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/a2",18.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/a3",0.5,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/b1",1.5,"DOUBLE");	
	props.globals.initNode("autopilot/LGUIDE/c1",2.5,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/a1",5.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/c2",7.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/c3",1.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/c1",2.5,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/e1",0.25,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/e2",0.013,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/e3",3.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/t1",30.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/t2",1.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/t3",0.2,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/t4",0.25,"DOUBLE");	
	props.globals.initNode("autopilot/LGUIDE/K",1.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/L1",1.5,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/L2",0.2,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/L3",25.0,"DOUBLE");	
	props.globals.initNode("autopilot/LGUIDE/L4",10.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/L4R",7.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/Beta_Max",3.6,"DOUBLE"); 
	
	props.globals.initNode("autopilot/LGUIDE/TESTI",0,"INT");
	props.globals.initNode("autopilot/LGUIDE/TESTD",0.0,"DOUBLE");
	
	props.globals.initNode("autopilot/logic/CB",0,"BOOL");   # capture VOR radial or localiser beam
	props.globals.initNode("autopilot/logic/CBtest",0,"BOOL");
	props.globals.initNode("autopilot/logic/HH",0,"BOOL");   # VOR/LOC intercept Course hold
	props.globals.initNode("autopilot/logic/HHtest",0,"BOOL");
	props.globals.initNode("autopilot/logic/ONC",0,"BOOL");  # on course
	props.globals.initNode("autopilot/logic/ONCtest",0,"BOOL");  # test on course		

	props.globals.initNode("autopilot/logic/AP1orAP2-sw",0,"BOOL");

	
	props.globals.initNode("autopilot/logic/LOClimited",0,"BOOL");  # Localiser off scale
	
	props.globals.initNode("autopilot/switches/mode-knob",0,"DOUBLE");      # -1 HDG : 0 MAN : 1 VOR/LOC : 2 GS AUTO : 3 GS MAN : 4 FLARE :
	props.globals.initNode("autopilot/settings/Mode","MAN","STRING");
	props.globals.initNode("autopilot/settings/pitch-wheel-deg",1,"DOUBLE");# -14 .. 0 .. +14
	props.globals.initNode("autopilot/settings/TurnKnob",0,"DOUBLE");		# -25 .. 0 .. +25
	props.globals.initNode("autopilot/switches/datum_norm",1,"DOUBLE");		#  -1 .. 0 .. +1
	props.globals.initNode("autopilot/settings/heading-knob",0,"DOUBLE");  # HDG knob on compass
	props.globals.initNode("instrumentation/nav[0]/radials/selected-deg",0,"DOUBLE");# CRS knob on compass
	
	props.globals.initNode("autopilot/controls/AP1_haspower", 0,"BOOL");
	props.globals.initNode("autopilot/controls/AP2_haspower", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YD1_engaged", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YD2_engaged", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YDStby_engaged", 0,"BOOL");
	
	props.globals.initNode("autopilot/settings/TurnKnobInDetent",0,"BOOL");	

	props.globals.initNode("autopilot/gain/Gtheta",2.0,"DOUBLE");
	props.globals.initNode("autopilot/gain/Gq",-0.2,"DOUBLE");
		
	props.globals.initNode("autopilot/internal/AT1_Datum",0.0,"DOUBLE");
	props.globals.initNode("autopilot/internal/AT2_Datum",0.0,"DOUBLE");	
	props.globals.initNode("autopilot/internal/AT3_Datum",0.0,"DOUBLE");	
	props.globals.initNode("autopilot/internal/AT4_Datum",0.0,"DOUBLE");
	
var initAFCS_FCSinputs = func() {
    print("initAFCS_FCSinputs");
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-elevator-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-aileron-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-rudder-cmd-deg", 1).setDoubleValue(0);
#	props.globals.getNode("/fdm/jsbsim/fcs/afcs-throttle-cmd-norm", 1).setDoubleValue(0);
	}



# init
var listenerApInitFunc = func {

    print("listenerApInitFunc");
	setprop("autopilot/switches/AT_powerswitch", 1);
	setprop("autopilot/switches/AT_engageswitch", 0);
	setprop("autopilot/switches/AT_1switch", 1);
	setprop("autopilot/switches/AT_2switch", 1);
	setprop("autopilot/switches/AT_3switch", 1);
	setprop("autopilot/switches/AT_4switch", 1);
	setprop("autopilot/internal/AT_setknots",140.0);

	setprop("autopilot/switches/YDStby-sw", 1);
	
	setprop("autopilot/switches/AP_MasterL_switch", 1);
	setprop("autopilot/switches/AP_MasterR_switch", 1);
	setprop("autopilot/switches/AP_MasterNuisance_bar", 0);
	
	setprop("autopilot/logic/CB", false);
	setprop("autopilot/logic/HH", false);
	setprop("autopilot/logic/ONC", false);
	setprop("autopilot/logic/CBtest", false);
	setprop("autopilot/logic/HHtest", false);
	setprop("autopilot/logic/ONCtest", false);
}
setlistener("sim/signals/fdm-initialized", listenerApInitFunc);


# Mode-selector
#
#
var listenerModeKnobFunc = func {
	print ("-> listenerModeKnobFunc -> Mode-selector = ", getprop("autopilot/switches/mode-knob"));

	if (getprop("autopilot/logic/AP1orAP2-sw")) {
		print ("-> listenerModeKnobFunc -> Mode-selector = ", getprop("autopilot/switches/mode-knob"));
		}

		
		#if (getprop("autopilot/switches/mode-knob") == -1) {  #HDG
			# HDG - Mode
			#setprop("autopilot/locks/lateral", "HDG");

			# resets
			#if (getprop("autopilot/logic/ALT-sw") == 0) {
			#	setprop("autopilot/locks/pitch", "");
			#}
		#}
		if (getprop("autopilot/switches/mode-knob") == 0) {
			# MAN - Mode
			var TurnKnobDeg = 0.0;
			setprop("autopilot/settings/TurnKnob", TurnKnobDeg);
			#listenerTurnKnobFunc();

			#if (getprop("autopilot/logic/ALT-sw") == 0) {
			#	setprop("autopilot/settings/pitch-wheel-deg", getprop("orientation/pitch-deg"));
			#	listenerApMANPitchFunc();
			#	setprop("autopilot/locks/pitch", "pitch-hold");
			#}
		}
		#if (getprop("autopilot/switches/mode-knob") == 1) {
			# LOC VOR - Mode
			#setprop("autopilot/locks/lateral", "nav1-hold");

			# resets
			#if (getprop("autopilot/logic/ALT-sw") == 0) {
			#	setprop("autopilot/locks/pitch", "");
		#	}
		#}
		#if (getprop("autopilot/switches/mode-knob") == 2) {
			# GS AUTO - Mode
			#setprop("autopilot/locks/lateral", "nav1-hold");
			#setprop("autopilot/locks/pitch", "gs1-hold");

			#setprop("autopilot/logic/ALT-sw", 0);
		#}
		#if (getprop("autopilot/switches/mode-knob") == 3) {
			# GS MAN - Mode
			#setprop("autopilot/locks/lateral", "nav1-hold");
			#if (getprop("autopilot/logic/ALT-sw") == 0) {
			#	setprop("autopilot/locks/pitch", "");
			#}

			#gsMANAltControl();

		#}
		#if (getprop("autopilot/switches/mode-knob") == 4) {
			# FLARE - Mode
			#}
	#}
	#else {
		# switched off
		#setprop("autopilot/locks/lateral", "");
		#setprop("autopilot/locks/pitch", "");

	#}
#}

# MAN - Mode - roll-selector
var listenerTurnKnobFunc = func {
	if(getprop("autopilot/settings/TurnKnobInDetent") == 0) {
##		print (" if TurnKnob turn, the mode selector jumps to mode 0");
		setprop("autopilot/switches/mode-knob", 0);   # MAN
		}

	if (getprop("autopilot/logic/AP1orAP2-sw") and

		(getprop("autopilot/switches/mode-knob") == 0) ){   # MAN

##		setprop("autopilot/internal/wing-leveler-target-roll-deg", getprop("autopilot/settings/TurnKnob"));
	}
}
setlistener("autopilot/settings/TurnKnob", listenerTurnKnobFunc);

# MAN - Mode - pitch-wheel selector
var listenerApMANPitchFunc = func {
	if (getprop("autopilot/logic/AP1orAP2-sw") and (getprop("autopilot/switches/mode-knob") == 0) )
		{   # MAN
		if (getprop("autopilot/logic/ALT-sw") == 0) 
			{
			var pitchDeg = getprop("autopilot/settings/pitch-wheel-deg");
			pitchDeg = (pitchDeg > 14 ? 14 : pitchDeg);   # limit +14deg
			pitchDeg = (pitchDeg < -14 ? -14 : pitchDeg); # limit -14deg
			setprop("autopilot/settings/target-pitch-deg", pitchDeg);
			}
		}
	}


var menuSwitchAp = func {

	#if (getprop("autopilot/locks/lateral") == "wing-leveler") {
	#    print (" if heading lock = wing-leveler, the mode selector springs back to mode 0");
	#	setprop("autopilot/logic/AP1orAP2-sw", true);
	#	setprop("autopilot/switches/mode-knob", 0);  # MAN
	#}
	#elsif (getprop("autopilot/locks/lateral") == "dg-heading-hold") {
##		setprop("autopilot/logic/AP1orAP2-sw", true);
	#}
	#elsif (	getprop("autopilot/locks/lateral") == "nav1-hold") {
	#	if (getprop("autopilot/locks/pitch") == "gs1-hold") {
##			setprop("autopilot/logic/AP1orAP2-sw", true);
	#		setprop("autopilot/switches/mode-knob", 2);  # GS AUTO
	#	}
##		else {setprop("autopilot/logic/AP1orAP2-sw", true);}
	#}
	#elsif (getprop("autopilot/locks/lateral") == "") {
	#	if (getprop("autopilot/locks/pitch") == "") {
	#		setprop("autopilot/logic/AP1-sw", 0);
	#		setprop("autopilot/logic/AP2-sw", 0);
	#		setprop("autopilot/logic/AP1orAP2-sw", 0);
	#		setprop("autopilot/logic/ALT-sw", 0);
	#		setprop("autopilot/switches/mode-knob", 0);  # MAN
	#	}
	}
}


setlistener("controls/special/yoke-switch1", func (s1){
    var s1 = s1.getBoolValue();
    if (s1 == 1){
		setprop("autopilot/logic/AP1-sw", 0);
		setprop("autopilot/logic/AP2-sw", 0);
		setprop("autopilot/logic/AP1orAP2-sw", 0);
		setprop("autopilot/logic/ALT-sw", 0);
		setprop("autopilot/logic/IAS-sw", 0);
		setprop("autopilot/logic/MACH-sw", 0);
		print (" AP disconnect sw");
		setprop("autopilot/switches/mode-knob", 0);   # MAN
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/target-pitch-deg", 0);
	#	setprop("autopilot/locks/pitch", "");
	#	setprop("autopilot/locks/lateral", "");
##		setprop("autopilot/locks/speed", "");
		setprop("autopilot/settings/TurnKnob",0);
		setprop("autopilot/settings/datum_norm", 0);
    }
});
##############################################################################################

## Basic Pitch modes (Attitude, IAS, MACH and Altitude hold) selection
	
PitchSwCommon = func {
	var  altsw = getprop("autopilot/logic/ALT-sw") != 0;
	var  iassw = getprop("autopilot/logic/IAS-sw") != 0;
	var  machsw = getprop("autopilot/logic/MACH-sw") != 0;
	var  pitchsw = getprop("autopilot/logic/PITCH-HOLD") != 0;
	##print ("altsw ", altsw,"  iassw ", iassw,"  machsw ", machsw,"  pitchsw ", pitchsw);
	if (!altsw and !iassw and !machsw)(
		setprop("autopilot/logic/PITCH-HOLD", 1)
		);
	pitchsw = getprop("autopilot/logic/PITCH-HOLD") != 0;
	##print ("altsw ", altsw,"  iassw ", iassw,"  machsw ", machsw,"  pitchsw ", pitchsw);
	}

	

listenerPitchhHoldFunc = func {
	if(getprop("autopilot/logic/PITCH-HOLD") == 1){
		print ("Pitch Hold mode");
		setprop("autopilot/logic/ALT-sw", 0);
		setprop("autopilot/logic/IAS-sw", 0);
		setprop("autopilot/logic/MACH-sw", 0);
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/datum_norm", 0);
##		setprop("autopilot/PitchHold/thetaRef_deg",getprop("fdm/jsbsim/attitude/theta-deg"));
		}
	PitchSwCommon();
	}
	
listenerAltSwFunc = func {
	if(getprop("autopilot/logic/ALT-sw") == 1){
		print ("ALT mode");
		setprop("autopilot/logic/IAS-sw", 0);
		setprop("autopilot/logic/MACH-sw", 0);
		setprop("autopilot/logic/PITCH-HOLD", 0);
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/datum_norm", 0);
##		setprop("autopilot/AltHold/thetaRef_deg",getprop("fdm/jsbsim/attitude/theta-deg"));
##		setprop("autopilot/settings/AltRef",getprop("instrumentation/altimeter/indicated-altitude-ft"));
		}
	PitchSwCommon();
	}
	
listenerIasSwFunc = func {
	if(getprop("autopilot/logic/IAS-sw") == 1) {
		print ("IAS mode");
		setprop("autopilot/logic/ALT-sw", 0);
		setprop("autopilot/logic/MACH-sw", 0);
		setprop("autopilot/logic/PITCH-HOLD", 0);
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/datum_norm", 0);
##		setprop("autopilot/IAS/thetaRef_deg",getprop("fdm/jsbsim/attitude/theta-deg"));
##		setprop("autopilot/IAS/IASref",getprop("instrumentation/airspeed-indicator/indicated-speed-kt"));
		}
	PitchSwCommon();
	}
	
listenerMachSwFunc = func {
	if(getprop("autopilot/logic/MACH-sw") == 1){
		print ("Mach mode");
		setprop("autopilot/logic/ALT-sw", 0);
		setprop("autopilot/logic/IAS-sw", 0);
		setprop("autopilot/logic/PITCH-HOLD", 0);
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/datum_norm", 0);
##		setprop("autopilot/Mach/thetaRef_deg",getprop("fdm/jsbsim/attitude/theta-deg"));
##		setprop("autopilot/Mach/Machref",getprop("instrumentation/airspeed-indicator/indicated-mach"));
		}
	PitchSwCommon();
	}
	
listenerGSCaptFunc = func {
	if(getprop("autopilot/logic/GS-CAPT") == 1){
		print ("GS capture");
		setprop("autopilot/logic/ALT-sw", 0);
		setprop("autopilot/logic/IAS-sw", 0);
		setprop("autopilot/logic/MACH-sw", 0);
		setprop("autopilot/logic/PITCH-HOLD", 0);
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/datum_norm", 0);
		setprop("autopilot/GS/thetaRef_deg",getprop("fdm/jsbsim/attitude/theta-deg"));
		}
	PitchSwCommon();
	}
	
listenerAP_EngageFunc = func {
	if (getprop("autopilot/logic/AP1orAP2-sw")){
	print ("AP engage - set Pitch hold");
		setprop("autopilot/logic/ALT-sw", 0);
		setprop("autopilot/logic/IAS-sw", 0);
		setprop("autopilot/logic/MACH-sw", 0);
		setprop("autopilot/logic/PITCH-HOLD", 1);
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/datum_norm", 0);
##		setprop("autopilot/PitchHold/thetaRef_deg",getprop("fdm/jsbsim/attitude/theta-deg"));
		}
	PitchSwCommon();
	}
	
listenerONCtestFunc = func {
	if (getprop("autopilot/logic/AP1orAP2-sw")){
		if (getprop("autopilot/logic/ONCtest")){
			print ("Localiser On course, set ONC");
			setprop("autopilot/logic/ONC",true );
			}
		}
##	PitchSwCommon();
	}

	setlistener("autopilot/logic/PITCH-HOLD", listenerPitchhHoldFunc,1,0); 	
	setlistener("autopilot/logic/ALT-sw", listenerAltSwFunc,1,0);
	setlistener("autopilot/logic/IAS-sw", listenerIasSwFunc,1,0);
	setlistener("autopilot/logic/MACH-sw",listenerMachSwFunc,1,0);
	setlistener("autopilot/logic/GS-CAPT",listenerGSCaptFunc,1,0);
	setlistener("autopilot/logic/AP1orAP2-sw",listenerAP_EngageFunc,1,0);
	
##############################################################################################

##	Autopilot main control loop

var update_autopilot = func {

    current_time = getprop("/sim/time/elapsed-sec");
    dt = current_time - last_time;  # Note current_time is time in millisec since sim started.
    last_time = current_time;

	var AP_m_L_sw = getprop("autopilot/switches/AP_MasterL_switch") or 0;
	var AP_m_R_sw = getprop("autopilot/switches/AP_MasterR_switch") or 0;
	var No1GenBusVolts = getprop("VC10/electric/ac/No1GenBusbarVolts") or 0;
	var No2GenBusVolts = getprop("VC10/electric/ac/No2GenBusbarVolts") or 0;
	var No1GenBusLive  = 0;
	var No2GenBusLive  = 0;
	if( No1GenBusVolts > 100.0) No1GenBusLive  = 1;
	if( No2GenBusVolts > 100.0) No2GenBusLive  = 1;	

	var AP1_haspower  = getprop("Autopilot/controls/AP1_haspower") or 0;
	var AP2_haspower  = getprop("Autopilot/controls/AP2_haspower") or 0;	
##	var AP1_haspower  = 0;
##	var AP2_haspower  = 0;		
	if (AP_m_L_sw and No1GenBusLive) AP1_haspower = 1;
	if (AP_m_R_sw and No1GenBusLive) AP2_haspower = 1;
	setprop("autopilot/controls/AP1_haspower", AP1_haspower);
	setprop("autopilot/controls/AP2_haspower", AP2_haspower);
		
	var YD1_engaged  = 0;
	var YD2_engaged  = 0;
	var YDStby_engaged  = 0;
	if (AP1_haspower and getprop("autopilot/logic/YD1-sw")) YD1_engaged  = 1;
	if (AP2_haspower and getprop("autopilot/logic/YD2-sw")) YD2_engaged  = 1;
	setprop("autopilot/controls/YD1_engaged", YD1_engaged);
	setprop("autopilot/controls/YD2_engaged", YD2_engaged);

	var ACAuxBusvolts = getprop("VC10/electric/ac/ACAux-bus-volts") or 0;	
	var ACAuxBusLive  = 0;
	if( ACAuxBusvolts > 100.0) ACAuxBusLive  = 1;
	if (ACAuxBusLive and getprop("autopilot/switches/YDStby-sw")) YDStby_engaged  = 1;
	setprop("autopilot/controls/YDStby_engaged", YDStby_engaged);

## disconect Autopilot no1 or no2 if the associated power is lost	
	if (AP1_haspower == 0){
		setprop("autopilot/logic/AP1-sw",0);
		setprop("autopilot/logic/YD1-sw",0);
		}	

	if (AP2_haspower == 0){
		setprop("autopilot/logic/AP2-sw",0);
		setprop("autopilot/logic/YD2-sw",0);
		}

## disconect Autopilot no1 or no2 if the associated Yawdamper is not engaged.	
	if (YD1_engaged == 0){
		setprop("autopilot/logic/AP1-sw",0);
		}	

	if (YD2_engaged == 0){
		setprop("autopilot/logic/AP2-sw",0);
		}		

	setprop("autopilot/logic/AP1orAP2-sw", (getprop("autopilot/logic/AP1-sw") or getprop("autopilot/logic/AP2-sw")));
	
	## both Autopilots are needed for autoland
	setprop("autopilot/switches/AP1andAP2-sw", (getprop("autopilot/logic/AP1-sw") and getprop("autopilot/logic/AP2-sw")));
	
	var APengaged = getprop("autopilot/logic/AP1orAP2-sw");
	
	setprop("autopilot/internal/BarometricModeSelected",(
			getprop("autopilot/logic/Mach-sw") 
			or getprop("autopilot/logic/IAS-sw")
			or getprop("autopilot/logic/ALT-sw") 		
			));

##	setprop("autopilot/settings/TurnKnobInDetent",
##	(getprop("autopilot/settings/TurnKnob") < 0.11) and (getprop("autopilot/settings/TurnKnob") > -0.11));
	
	if (APengaged){   # Auto pitch-trim
		var APelevator_deg =  getprop("autopilot/commands/APelevator-deg");
		if (APelevator_deg > -0.1) controls.slewProp("controls/flight/elevator-trim", dt*0.5);
		if (APelevator_deg < 0.0)  controls.slewProp("controls/flight/elevator-trim", -dt*0.5);
	}
	
	if (getprop("autopilot/switches/mode-knob") == -1)
		{
		setprop("autopilot/settings/Mode", "HDG");
		}
 	elsif (getprop("autopilot/switches/mode-knob") ==  0)
		{
		setprop("autopilot/settings/Mode", "MAN");
		if (abs(getprop("autopilot/settings/TurnKnob")) < 3.0)
			{
			setprop("autopilot/logic/HdgHold", true);
			setprop("autopilot/logic/TurnMode", false);
			}
			else 
			{
			setprop("autopilot/logic/HdgHold", false);
			setprop("autopilot/logic/TurnMode", true);
			}
##		}	
##		else
##		{
##		setprop("autopilot/logic/HdgHold", false);
##		setprop("autopilot/logic/TurnMode", false);
		}
 	elsif (getprop("autopilot/switches/mode-knob") ==  1)
		{
		setprop("autopilot/settings/Mode", "LOC VOR");
		}
  	elsif (getprop("autopilot/switches/mode-knob") ==  2)
		{
		setprop("autopilot/settings/Mode", "GS AUTO");
		}
  	elsif (getprop("autopilot/switches/mode-knob") ==  3)
		{
		setprop("autopilot/settings/Mode", "GS MAN");
		}
  	elsif (getprop("autopilot/switches/mode-knob") ==  4)
		{
		setprop("autopilot/settings/Mode", "FLARE");
		}
  	else{
		setprop("autopilot/settings/Mode", "");
		}
## disable all modes if autopilot is not engaged		
	if (APengaged == 0) { 
		setprop("autopilot/settings/TurnKnob",0);
		setprop("autopilot/settings/Mode", "");
		setprop("autopilot/logic/ALT-sw", 0);
		setprop("autopilot/logic/IAS-sw", 0);
		setprop("autopilot/logic/MACH-sw", 0);
		setprop("autopilot/switches/mode-knob", 0);
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/target-pitch-deg", 0);
		setprop("autopilot/settings/datum_norm", 0);
	}
	
## HDG hold mode


## TURN mode

## Localiser On-Course Test
		var beta = getprop("autopilot/LGUIDE/Beta_Deg");
		var betadot = getprop("autopilot/LGUIDE/Beta_Deg_Washout");
		var betamax = getprop("autopilot/LGUIDE/Beta_Max");	
		var phi = getprop("orientation/roll-deg");
		var e1 = getprop("autopilot/LGUIDE/e1");
		var e2 = getprop("autopilot/LGUIDE/e2"); 
		var e3 = getprop("autopilot/LGUIDE/e3"); 
		var eBeta = abs(beta/betamax);
		var eBetadot = abs(betadot/betamax);
		var ePhi = abs(phi);
		var apengaged = getprop("autopilot/logic/AP1orAP2-sw");
		var ONCtest = (eBeta < e1) and (eBetadot < e2) and (ePhi < e3) and apengaged;
		
##		print ("ONCtest ", ONCtest, " eBeta ",eBeta , " eBetadot ", eBetadot, " ePhi ", ePhi);
		setprop ("autopilot/logic/ONCtest", ONCtest);

		
		
## Autothrottle
	
	var AT_P = getprop("autopilot/switches/AT_powerswitch");
	var AT_E = getprop("autopilot/switches/AT_engageswitch") != 0;
	var AT_1sw = getprop("autopilot/switches/AT_1switch");
	var AT_2sw = getprop("autopilot/switches/AT_2switch");
	var AT_3sw = getprop("autopilot/switches/AT_3switch");
	var AT_4sw = getprop("autopilot/switches/AT_4switch");
	
	var AT1 = AT_1sw and AT_P and AT_E;
	var AT2 = AT_2sw and AT_P and AT_E;
	var AT3 = AT_3sw and AT_P and AT_E;
	var AT4 = AT_4sw and AT_P and AT_E;
	
	setprop("autopilot/internal/AT1_engage",AT1);
	setprop("autopilot/internal/AT2_engage",AT2);
	setprop("autopilot/internal/AT3_engage",AT3);
	setprop("autopilot/internal/AT4_engage",AT4);
	
	settimer(update_autopilot,0);   ## run loop 
};


##############################################################################################
## this should be moved to PCU.nas when PCU´s (i.e. individual control surface servos) are simulated.
var update_flight_controls = func {
	setprop("/fdm/jsbsim/fcs/afcs-elevator-cmd-deg", getprop("autopilot/commands/afcs-elevator-deg"));
	setprop("/fdm/jsbsim/fcs/afcs-aileron-cmd-deg", getprop("autopilot/commands/afcs-aileron-deg"));
	settimer(update_flight_controls,0);   ## loop 
};

##############################################################################################

setlistener("sim/signals/fdm-initialized", func {

    settimer(update_autopilot,5);
    settimer(update_flight_controls,5);
	setlistener("autopilot/switches/mode-knob", listenerModeKnobFunc, 1,0);
	setlistener("autopilot/logic/ONCtest",listenerONCtestFunc,1,0);
##	setlistener("autopilot/logic/ALT-sw", listenerAltSwFunc,1,0);
##	setlistener("autopilot/logic/IAS-sw", listenerIasSwFunc,1,0);
##	setlistener("autopilot/logic/MACH-sw",listenerMachSwFunc,1,0);
	}
);
