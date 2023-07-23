####    autopilot.nas help-functions adapted for VC10                                ####
####    Author: Markus Bulik                                                                   ####
####    This file is licenced under the terms of the GNU General Public Licence V2 or later    ####
##############################################################################
##                                                                          ##
## AP - routines for 'Bendix PB 20' autopilot system                        ##
##                                                                          ##
##############################################################################

print ("autopilot.nas");

### Bendix PB 20 ###
# Switches and Knobs:

#--------------------------------------------------------------------	
#AFCS initialise switch positions and settings	
#--------------------------------------------------------------------
	
	props.globals.initNode("autopilot/switches/NAV-sw",0,"BOOL");			# true/false	
	props.globals.initNode("autopilot/switches/AP1-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/switches/YawDamper1-sw",0,"BOOL");	# true/false	
	props.globals.initNode("autopilot/switches/YawDamper2-sw",0,"BOOL");	# true/false	
	props.globals.initNode("autopilot/switches/AP2-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/switches/ALT-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/switches/IAS-sw",0,"BOOL");			# true/false
	props.globals.initNode("autopilot/switches/MACH-sw",0,"BOOL");			# true/false	
	
	props.globals.initNode("autopilot/switches/mode-knob",0,"DOUBLE");      # -1 HEADING : 0 MAN : 1 LOC VOR : 2 GS AUTO : 3 GS MAN : 4 FLARE :
#	autopilot/Bendix-PB-20/controls/mode-selector (switches/mode-knob          0 NAV     : 1 HDG : 2 MAN     : 3 LOC VOR : 4 GS AUTO: 5 GS MAN:
	props.globals.initNode("autopilot/switches/pitch-wheel-deg",1,"DOUBLE");# -14 .. 0 .. +14
	props.globals.initNode("autopilot/settings/TurnKnob",0,"DOUBLE");		# -25 .. 0 .. +25
	props.globals.initNode("autopilot/switches/datum_norm",1,"DOUBLE");		#  -1 .. 0 .. +1

	props.globals.initNode("autopilot/controls/AP_1_haspower", 0,"BOOL");
	props.globals.initNode("autopilot/controls/AP_2_haspower", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YD_1_engaged", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YD_2_engaged", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YD_3_engaged", 0,"BOOL");
	props.globals.initNode("autopilot/settings/RollKnobInDetent",0,"BOOL");	
	 
	props.globals.initNode("autopilot/mutex","","STRING");

var initAFCS_FCSinputs = func() {
    print("initAFCS_FCSinputs");
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-elevator-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-aileron-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-rudder-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-throttle-cmd-norm", 1).setDoubleValue(0);
	}



# init
var listenerApInitFunc = func {

	props.globals.getNode("/fdm/jsbsim/fcs/afcs-elevator-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-aileron-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-rudder-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-throttle-cmd-norm", 1).setDoubleValue(0);

	setprop("autopilot/switches/AT_powerswitch", 0);
	setprop("autopilot/switches/AT_engageswitch", 0);
	setprop("autopilot/switches/AT_1switch", 0);
	setprop("autopilot/switches/AT_2switch", 0);
	setprop("autopilot/switches/AT_3switch", 0);
	setprop("autopilot/switches/AT_4switch", 0);

	setprop("autopilot/switches/YDStby-sw", 1);
	
	setprop("autopilot/switches/AP_MasterL_switch", 1);
	setprop("autopilot/switches/AP_MasterR_switch", 1);
	setprop("autopilot/switches/AP_MasterNuisance_bar", 0);
}
setlistener("sim/signals/fdm-initialized", listenerApInitFunc);

# Mutex - for synchronization of the listener-events
var ApMutexSet = func(value) {
	setprop("autopilot/mutex", value);
}
var ApMutexReset = func {
	setprop("autopilot/mutex", "");
}
var ApMutexResetFunc = func {
	if (getprop("autopilot/mutex") != "") {
		settimer(ApMutexReset, 0.2);
	}
}
setlistener("autopilot/mutex", ApMutexResetFunc);

# Active-switch
var ApActivePrev = 0;
var listenerApActiveFunc = func {
	if (ApActivePrev == 0) {
		if (getprop("autopilot/switches/AP1orAP2-sw") == 1) { 
			if (getprop("autopilot/mutex") == "") {
				setprop("autopilot/switches/mode-knob", 0);     ## MAN
			}
		}
	}
	ApActive = getprop("autopilot/switches/AP1orAP2-sw");
}
setlistener("autopilot/switches/AP1orAP2-sw", listenerApActiveFunc);

# Mode-selector
#
# !!! BUG: when switching back from mode 2 or 3 to 1, 0 or -1 GS remains switched on instead of ALT (with the alt switch switched on) !!!
var listenerApModeFunc = func {
	print ("-> listenerApModeFunc -> Mode-selector = ", getprop("autopilot/switches/mode-knob"));
	if (	getprop("autopilot/mutex") == "" or
		getprop("autopilot/mutex") == "MODE") {
		ApMutexSet("MODE");
		print ("->Mutex set =",getprop("autopilot/mutex"));

	}
	else {
		print ("->return, Mutex =",getprop("autopilot/mutex"));

		return;
}

	if (getprop("autopilot/switches/AP1orAP2-sw") == 1) {
		print ("-> listenerApModeFunc -> Mode-selector = ", getprop("autopilot/switches/mode-knob"));
		
		if (	getprop("autopilot/switches/NAV-sw") == 1) {
			# NAV - Mode

##			if (getprop("autopilot/route-manager/active") == 1 and getprop("autopilot/route-manager/airborne") == 1) {
##				setprop("autopilot/locks/passive-mode", 1);
##
##				# resets
##				setprop("autopilot/locks/altitude", "");
##				setprop("autopilot/locks/heading", "");
##			}
##			else {
##				gui.popupTip("You must be airborne and a route must be active to activate this mode !");
##			}
		}
		if (getprop("autopilot/switches/mode-knob") == -1) {  #HDG
			# HDG - Mode
			setprop("autopilot/switches/Mode", "HDG");
			setprop("autopilot/locks/heading", "dg-heading-hold");

			# resets
			if (getprop("autopilot/switches/ALT-sw") == 0) {
				setprop("autopilot/locks/altitude", "");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}
##			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 0) {
			# MAN - Mode
			setprop("autopilot/switches/Mode", "MAN");
			#var rollKnobDeg = getprop("instrumentation/turn-indicator/indicated-turn-rate") * 36.63;
			var rollKnobDeg = 0.0;
			setprop("autopilot/settings/roll-knob-deg", rollKnobDeg);
			listenerApMANRollFunc();

			setprop("autopilot/locks/heading", "wing-leveler");

			if (getprop("autopilot/switches/ALT-sw") == 0) {
				setprop("autopilot/settings/pitch-wheel-deg", getprop("orientation/pitch-deg"));
				listenerApMANPitchFunc();

				setprop("autopilot/locks/altitude", "pitch-hold");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}

			# resets
##			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 1) {
			# LOC VOR - Mode
			setprop("autopilot/switches/Mode", "LOC VOR");
			setprop("autopilot/locks/heading", "nav1-hold");

			# resets
			if (getprop("autopilot/switches/ALT-sw") == 0) {
				setprop("autopilot/locks/altitude", "");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}
##			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 2) {
			# GS AUTO - Mode
			setprop("autopilot/switches/Mode", "GS AUTO");
			setprop("autopilot/locks/heading", "nav1-hold");
			setprop("autopilot/locks/altitude", "gs1-hold");

			# resets
##			setprop("autopilot/locks/passive-mode", 0);
			setprop("autopilot/switches/ALT-sw", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 3) {
			# GS MAN - Mode
			setprop("autopilot/switches/Mode", "GS MAN");
			setprop("autopilot/locks/heading", "nav1-hold");
			if (getprop("autopilot/switches/ALT-sw") == 0) {
				setprop("autopilot/locks/altitude", "");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}

			gsMANAltControl();

			# resets
##			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 4) {
			# FLARE - Mode
			setprop("autopilot/switches/Mode", "FLARE");
			}
	}
	else {
		# switched off
		setprop("autopilot/locks/heading", "");
		setprop("autopilot/locks/altitude", "");
		setprop("autopilot/internal/wing-leveler-target-roll-deg", 0.0);
##		setprop("autopilot/locks/passive-mode", 0);
		setprop("autopilot/locks/speed", "");
	}
}
##setlistener("autopilot/switches/AP1orAP2-sw", listenerApModeFunc);
##print("setlistener(autopilot/switches/mode-knob)");
##setlistener("autopilot/switches/mode-knob", listenerApModeFunc, 1,0);

# switches off 'altitude-hold' if GS is in range and all other conditions are satisfied
var gsMANAltControl = func {
	if (	getprop("autopilot/switches/AP1orAP2-sw") == 1 and
		getprop("autopilot/switches/mode-knob") == 3) {      # GS-MAN
		if (getprop("instrumentation/nav[0]/gs-in-range") == 0) {
			settimer(gsMANAltControl, 0.2);
		}
		else {
			setprop("autopilot/locks/altitude", "");
		}
	}
}


# MAN - Mode - roll-selector
var listenerApMANRollFunc = func {
	if(getprop("autopilot/settings/RollKnobInDetent") == 0) {
		print (" if roll-knob-deg turn, the mode selector jump to mode 0");
		setprop("autopilot/switches/mode-knob", 0);   # MAN
		}

	if (	getprop("autopilot/switches/AP1orAP2-sw") == 1 and

		getprop("autopilot/switches/mode-knob") == 0) {   # MAN

		setprop("autopilot/internal/wing-leveler-target-roll-deg", getprop("autopilot/settings/roll-knob-deg"));
	}
}
setlistener("autopilot/settings/TurnKnob", listenerApMANRollFunc);

# MAN - Mode - pitch-selector
var listenerApMANPitchFunc = func {

	if (	getprop("autopilot/switches/AP1orAP2-sw") == 1 and
		getprop("autopilot/switches/mode-knob") == 0) {   # MAN
		if (getprop("autopilot/switches/ALT-sw") == 0) {

			var pitchDeg = getprop("autopilot/settings/pitch-wheel-deg");
			pitchDeg = (pitchDeg > 30 ? 30 : pitchDeg);
			pitchDeg = (pitchDeg < -30 ? -30 : pitchDeg);
			setprop("autopilot/settings/target-pitch-deg", pitchDeg);
		}
	}
}
setlistener("autopilot/settings/pitch-wheel-deg", listenerApMANPitchFunc);

# ALT switch
var listenerApAltFunc = func {

	if (getprop("autopilot/mutex") == "") {
		ApMutexSet("PB20-ALT");
	}
	else {
		return;
	}

	if (getprop("autopilot/switches/AP1orAP2-sw") == 1) {
		if (getprop("autopilot/switches/ALT-sw") == 1) {

			# set altitude-hold-value to the actual altitude plus an offset dependent on vspeed

			var vspeed = getprop("velocities/vertical-speed-fps");
			var altOffset = vspeed * 5;	# aircraft altitude change in 5 seconds

			var altitudeFt = getprop("instrumentation/altimeter/indicated-altitude-ft") + altOffset;
			setprop("autopilot/settings/target-altitude-ft", altitudeFt);

			setprop("autopilot/locks/altitude", "altitude-hold");
		}
		else {
			if (getprop("autopilot/switches/mode-knob") == 0) {   # MAN
				setprop("autopilot/locks/altitude", "pitch-hold");
			}
			else {
				if (getprop("autopilot/locks/altitude") == "altitude-hold") {
					setprop("autopilot/locks/altitude", "");
				}
			}
		}
	}
	else {
		setprop("autopilot/locks/altitude", "");
	}
}
setlistener("autopilot/switches/ALT-sw", listenerApAltFunc);


# settings from FG-menu (F11)

listenerApSetHeadingFunc = func {

	if (	getprop("autopilot/mutex") == "" or
		getprop("autopilot/mutex") == "PASSIVE") {
		ApMutexSet("HEADING");
	}
	else {
		return;
	}

	menuSwitchAp();
}
setlistener("autopilot/locks/heading", listenerApSetHeadingFunc);

##listenerApSetPassiveModeFunc = func {

	# unfortunately 'passive-mode' is triggered many times, we only need to act if it's switched to '1'
##	if (	getprop("autopilot/mutex") == "" and
##		getprop("autopilot/locks/passive-mode") == 1) {
##		ApMutexSet("PASSIVE");
##	}
##	else {
##		return;
##	}

##	if (getprop("autopilot/locks/passive-mode") == 1) {
##		if (getprop("autopilot/route-manager/active") == 1 and getprop("autopilot/route-manager/airborne") == 1) {
##			setprop("autopilot/switches/AP1orAP2-sw", 1);
##			setprop("autopilot/switches/NAV-sw", 0);
##		}
##		else {
			gui.popupTip("You must be airborne and a route must be active to activate this mode !");
##			setprop("autopilot/locks/passive-mode", 0);
##		}

##		setprop("autopilot/switches/AP1orAP2-sw", 1);
##		setprop("autopilot/switches/mode-knob", -1);
##	}
##}
##setlistener("autopilot/locks/passive-mode", listenerApSetPassiveModeFunc);

listenerApSetAltitudeFunc = func {

	if (	getprop("autopilot/mutex") == "" or
		getprop("autopilot/mutex") == "PASSIVE") {
		ApMutexSet("ALT");
	}
	else {
		return;
	}

	if (getprop("autopilot/locks/altitude") == "altitude-hold") {
##		setprop("autopilot/switches/AP1orAP2-sw", 1);
		setprop("autopilot/switches/ALT-sw", 1);
		if (getprop("autopilot/switches/mode-knob") == 0) {  # MAN
			setprop("autopilot/locks/heading", "wing-leveler");
		}
	}
	else {
		setprop("autopilot/switches/ALT-sw", 0);
	}

	menuSwitchAp();
}
setlistener("autopilot/locks/altitude", listenerApSetAltitudeFunc);

var menuSwitchAp = func {

	if (getprop("autopilot/locks/heading") == "wing-leveler") {
	    print (" if heading lock = win-leveler, the mode selector jump to mode 0");
		setprop("autopilot/switches/AP1orAP2-sw", 1);
		setprop("autopilot/switches/mode-knob", 0);  # MAN
	}
	elsif (getprop("autopilot/locks/heading") == "dg-heading-hold") {
##		setprop("autopilot/switches/AP1orAP2-sw", 1);
		setprop("autopilot/switches/mode-knob", -1);   # HDG
	}
	elsif (	getprop("autopilot/locks/heading") == "nav1-hold") {
		if (getprop("autopilot/locks/altitude") == "gs1-hold") {
##			setprop("autopilot/switches/AP1orAP2-sw", 1);
			setprop("autopilot/switches/mode-knob", 2);  # GS AUTO
		}
		else {
##			setprop("autopilot/switches/AP1orAP2-sw", 1);
			setprop("autopilot/switches/mode-knob", 1);  # LOC VOR
		}
	}
	elsif (getprop("autopilot/locks/heading") == "") {
		if (getprop("autopilot/locks/altitude") == "") {
			setprop("autopilot/switches/AP1-sw", 0);
			setprop("autopilot/switches/AP2-sw", 0);
			setprop("autopilot/switches/AP1orAP2-sw", 0);
			setprop("autopilot/switches/ALT-sw", 0);
			print (" if heading lock and alt lock not set, the mode selector jump to mode 0");
			setprop("autopilot/switches/mode-knob", 0);  # MAN
		}
	}
}

listenerApSetPitchFunc = func {

	setprop("autopilot/settings/pitch-wheel-deg", getprop("autopilot/settings/target-pitch-deg"));
}
setlistener("autopilot/locks/altitude", listenerApSetPitchFunc);
setlistener("autopilot/settings/pitch-hold", listenerApSetPitchFunc);

### Bendix PB 20 ###

setlistener("controls/special/yoke-switch1", func (s1){
    var s1 = s1.getBoolValue();
    if (s1 == 1){
		setprop("autopilot/switches/AP1-sw", 0);
		setprop("autopilot/switches/AP2-sw", 0);
		setprop("autopilot/switches/AP1orAP2-sw", 0);
		setprop("autopilot/switches/ALT-sw", 0);
		print (" AP disconnect sw");
		setprop("autopilot/switches/mode-knob", 0);   # MAN
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/target-pitch-deg", 0);
		setprop("autopilot/locks/altitude", "");
		setprop("autopilot/locks/speed", "");
    }
});

##############################################################################################
var update_autopilot = func {
##	Autopilot main control loop

	var AP_m_L_sw = getprop("autopilot/switches/AP_MasterL_switch") or 0;
	var AP_m_R_sw = getprop("autopilot/switches/AP_MasterR_switch") or 0;
	var No1GenBusVolts = getprop("VC10/electric/ac/No1GenBusbarVolts") or 0;
	var No2GenBusVolts = getprop("VC10/electric/ac/No2GenBusbarVolts") or 0;
	var No1GenBusLive  = 0;
	var No2GenBusLive  = 0;
	if( No1GenBusVolts > 100.0) No1GenBusLive  = 1;
	if( No2GenBusVolts > 100.0) No2GenBusLive  = 1;	
	
	var AP1_haspower  = 0;
	var AP2_haspower  = 0;		
	if (AP_m_L_sw and No1GenBusLive) AP1_haspower = 1;
	if (AP_m_R_sw and No1GenBusLive) AP2_haspower = 1;
	setprop("autopilot/controls/AP_1_haspower", AP1_haspower);
	setprop("autopilot/controls/AP_2_haspower", AP2_haspower);
		
	var YD1_engaged  = 0;
	var YD2_engaged  = 0;
	var YDStby_engaged  = 0;
	if (AP1_haspower and getprop("autopilot/switches/YawDamper1-sw")) YD1_engaged  = 1;
	if (AP1_haspower and getprop("autopilot/switches/YawDamper2-sw")) YD2_engaged  = 1;
	setprop("autopilot/controls/YD_1_engaged", YD1_engaged);
	setprop("autopilot/controls/YD_2_engaged", YD2_engaged);

	var ACAuxBusvolts = getprop("VC10/electric/ac/ACAux-bus-volts") or 0;	
	var ACAuxBusLive  = 0;
	if( ACAuxBusvolts > 100.0) ACAuxBusLive  = 1;
	if (ACAuxBusLive and getprop("autopilot/switches/YDStby-sw")) YDStby_engaged  = 1;
	setprop("autopilot/controls/YD_3_engaged", YDStby_engaged);

## disconect Autopilot and Yawdamper if power is lost	
	if (AP1_haspower == 0){
		setprop("autopilot/switches/AP1-sw",0);
		setprop("autopilot/switches/YawDamper1-sw",0);
		}	

	if (AP2_haspower == 0){
		setprop("autopilot/switches/AP2-sw",0);
		setprop("autopilot/switches/YawDamper2-sw",0);
		}

## disconect Autopilot if it´s Yawdamper if is not engaged.	
	if (YD1_engaged == 0){
		setprop("autopilot/switches/AP1-sw",0);
		}	

	if (YD2_engaged == 0){
		setprop("autopilot/switches/AP2-sw",0);
		}		

	setprop("autopilot/switches/AP1orAP2-sw", (getprop("autopilot/switches/AP1-sw") or getprop("autopilot/switches/AP2-sw")));
	
	setprop("autopilot/internal/BarometricModeSelected",(
			getprop("autopilot/settings/Mach-sw") 
			or getprop("autopilot/switches/IAS-sw")
			or getprop("autopilot/switches/ALT-sw") 		
			));

	setprop("autopilot/settings/RollKnobInDetent",
	(getprop("autopilot/settings/TurnKnob") < 0.11) and (getprop("autopilot/settings/TurnKnob") > -0.11));



	settimer(update_autopilot,0);   ## loop 
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
	setlistener("autopilot/switches/mode-knob", listenerApModeFunc, 1,0);

	}
);
