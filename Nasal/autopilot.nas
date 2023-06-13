####    autopilot.nas help-functions adapted for VC10                                ####
####    Author: Markus Bulik                                                                   ####
####    This file is licenced under the terms of the GNU General Public Licence V2 or later    ####
##############################################################################
##                                                                          ##
## AP - routines for 'Bendix PB 20' autopilot system                        ##
##                                                                          ##
##############################################################################

print ("autopilot.nas");


var initAFCS_FCSinputs = func() {
    print("initAFCS_FCSinputs");
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-elevator-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-aileron-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-rudder-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-throttle-cmd-norm", 1).setDoubleValue(0);
	}

#--------------------------------------------------------------------	
#AFCS initialise switch positions and settings	
#--------------------------------------------------------------------

### Bendix PB 20 ###
# Knobs:
# /autopilot/switches/active : true/false
# /autopilot/switches/ALT-sw : true/false
# /autopilot/switches/mode-knob : 0: NAV, 1: HDG, 2: MAN, 3: LOC VOR, 4: GS AUTO, 5: GS MAN
# /autopilot/settings/pitch-wheel-deg : -30 .. 30
# /autopilot/settings/roll-knob-deg : -35 .. 35

# init
var listenerApInitFunc = func {

	props.globals.getNode("/fdm/jsbsim/fcs/afcs-elevator-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-aileron-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-rudder-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-throttle-cmd-norm", 1).setDoubleValue(0);
	
	setprop("autopilot/switches/mode-knob", 0);
	setprop("autopilot/switches/ALT-sw", 0);
	setprop("autopilot/switches/IAS-sw", 0);
	setprop("autopilot/switches/MACH-sw", 0);
	setprop("autopilot/switches/NAV-sw", 0);
	
	setprop("autopilot/switches/AP1-sw", 0);
	setprop("autopilot/switches/AP2-sw", 0);
	
	setprop("autopilot/switches/AP_MasterL_switch", 0);
	setprop("autopilot/switches/AP_MasterR_switch", 0);
	setprop("autopilot/switches/AP_MasterNuisance_bar", 0);
	
	setprop("autopilot/switches/AT_1switch", 0);
	setprop("autopilot/switches/AT_2switch", 0);
	setprop("autopilot/switches/AT_3switch", 0);
	setprop("autopilot/switches/AT_4switch", 0);
	
	setprop("autopilot/switches/AT_powerswitch", 0);
	setprop("autopilot/switches/AT_engageswitch", 0);

	setprop("autopilot/switches/YawDamper1-sw", 0);
	setprop("autopilot/switches/YawDamper2-sw", 0);
	setprop("autopilot/switches/YawDamper-Stbyactive", 1);
}
###setlistener("sim/signals/fdm-initialized", listenerApInitFunc);

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
		if (getprop("autopilot/switches/active") == 1) {
			if (getprop("autopilot/mutex") == "") {
				setprop("autopilot/switches/mode-knob", 1);
			}
		}
	}
	ApActive = getprop("autopilot/switches/active");
}
setlistener("autopilot/switches/active", listenerApActiveFunc);

# Mode-selector
#
# !!! FEHLER: bei zurückschalten von Mode 4,5 auf 3,2,1 bleibt GS eingeschaltet anstatt ALT (bei eingeschaltetem Alt-Switch) !!!
# !!! BUG: when switching back from mode 3 or 4 to 2,1or 0 GS remains switched on instead of ALT (with the alt switch switched on) !!!
var listenerApModeFunc = func {

	if (	getprop("autopilot/mutex") == "" or
		getprop("autopilot/mutex") == "MODE") {
		ApMutexSet("MODE");
	}
	else {
		return;
	}

	if (getprop("autopilot/switches/active") == 1) {
		#print ("-> listenerApModeFunc -> Mode-selector=", getprop("autopilot/switches/mode-knob"));

		if (	getprop("autopilot/switches/mode-knob") == -1) {
			# NAV - Mode

			if (getprop("autopilot/route-manager/active") == 1 and getprop("autopilot/route-manager/airborne") == 1) {
				setprop("autopilot/locks/passive-mode", 1);

				# resets
				setprop("autopilot/locks/altitude", "");
				setprop("autopilot/locks/heading", "");
			}
			else {
				gui.popupTip("You must be airborne and a route must be active to activate this mode !");
			}
		}
		if (getprop("autopilot/switches/mode-knob") == 0) {
			# HDG - Mode

			setprop("autopilot/locks/heading", "dg-heading-hold");

			# resets
			if (getprop("autopilot/switches/ALT-sw") == 0) {
				setprop("autopilot/locks/altitude", "");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}
			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") ==1) {
			# MAN - Mode

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
			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 2) {
			# LOC VOR - Mode

			setprop("autopilot/locks/heading", "nav1-hold");

			# resets
			if (getprop("autopilot/switches/ALT-sw") == 0) {
				setprop("autopilot/locks/altitude", "");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}
			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 3) {
			# GS AUTO - Mode

			setprop("autopilot/locks/heading", "nav1-hold");
			setprop("autopilot/locks/altitude", "gs1-hold");

			# resets
			setprop("autopilot/locks/passive-mode", 0);
			setprop("autopilot/switches/ALT-sw", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 4) {
			# GS MAN - Mode

			setprop("autopilot/locks/heading", "nav1-hold");
			if (getprop("autopilot/switches/ALT-sw") == 0) {
				setprop("autopilot/locks/altitude", "");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}

			gsMANAltControl();

			# resets
			setprop("autopilot/locks/passive-mode", 0);
		}
	}
	else {
		# switched off
		setprop("autopilot/locks/heading", "");
		setprop("autopilot/locks/altitude", "");
		setprop("autopilot/internal/wing-leveler-target-roll-deg", 0.0);
		setprop("autopilot/locks/passive-mode", 0);
		setprop("autopilot/locks/speed", "");
	}
}
setlistener("autopilot/switches/active", listenerApModeFunc);
setlistener("autopilot/switches/mode-knob", listenerApModeFunc, 1,0);

# switches off 'altitude-hold' if GS is in range and all other conditions are satisfied
var gsMANAltControl = func {
	if (	getprop("autopilot/switches/active") == 1 and
		getprop("autopilot/switches/mode-knob") == 4) {
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
    # if roll-knob-deg turn, the mode selector jump to mode 1
	setprop("autopilot/switches/mode-knob", 1);

	if (	getprop("autopilot/switches/active") == 1 and
		getprop("autopilot/switches/mode-knob") == 1) {

		setprop("autopilot/internal/wing-leveler-target-roll-deg", getprop("autopilot/settings/roll-knob-deg"));
	}
}
setlistener("autopilot/settings/roll-knob-deg", listenerApMANRollFunc);

# MAN - Mode - pitch-selector
var listenerApMANPitchFunc = func {

	if (	getprop("autopilot/switches/active") == 1 and
		getprop("autopilot/switches/mode-knob") == 1) {
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

	if (getprop("autopilot/switches/active") == 1) {
		if (getprop("autopilot/switches/ALT-sw") == 1) {

			# set altitude-hold-value to the actual altitude plus an offset dependent on vspeed

			var vspeed = getprop("velocities/vertical-speed-fps");
			var altOffset = vspeed * 5;	# ft climed/falled in 5 seconds

			var altitudeFt = getprop("instrumentation/altimeter/indicated-altitude-ft") + altOffset;
			setprop("autopilot/settings/target-altitude-ft", altitudeFt);

			setprop("autopilot/locks/altitude", "altitude-hold");
		}
		else {
			if (getprop("autopilot/switches/mode-knob") == 1) {
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

listenerApSetPassiveModeFunc = func {

	# unfortunalety 'passive-mode' is triggered many times, we only need to act if it's wsitched to '1'
	if (	getprop("autopilot/mutex") == "" and
		getprop("autopilot/locks/passive-mode") == 1) {
		ApMutexSet("PASSIVE");
	}
	else {
		return;
	}

	if (getprop("autopilot/locks/passive-mode") == 1) {
		if (getprop("autopilot/route-manager/active") == 1 and getprop("autopilot/route-manager/airborne") == 1) {
			setprop("autopilot/switches/active", 1);
			setprop("autopilot/switches/mode-knob", -1);
		}
		else {
			gui.popupTip("You must be airborne and a route must be active to activate this mode !");
			setprop("autopilot/locks/passive-mode", 0);
		}

		setprop("autopilot/switches/active", 1);
		setprop("autopilot/switches/mode-knob", -1);
	}
}
setlistener("autopilot/locks/passive-mode", listenerApSetPassiveModeFunc);

listenerApSetAltitudeFunc = func {

	if (	getprop("autopilot/mutex") == "" or
		getprop("autopilot/mutex") == "PASSIVE") {
		ApMutexSet("ALT");
	}
	else {
		return;
	}

	if (getprop("autopilot/locks/altitude") == "altitude-hold") {
		setprop("autopilot/switches/active", 1);
		setprop("autopilot/switches/ALT-sw", 1);
		if (getprop("autopilot/switches/mode-knob") == 1) {
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
		setprop("autopilot/switches/active", 1);
		setprop("autopilot/switches/mode-knob", 1);
	}
	elsif (getprop("autopilot/locks/heading") == "dg-heading-hold") {
		setprop("autopilot/switches/active", 1);
		setprop("autopilot/switches/mode-knob", 0);
	}
	elsif (	getprop("autopilot/locks/heading") == "nav1-hold") {
		if (getprop("autopilot/locks/altitude") == "gs1-hold") {
			setprop("autopilot/switches/active", 1);
			setprop("autopilot/switches/mode-knob", 3);
		}
		else {
			setprop("autopilot/switches/active", 1);
			setprop("autopilot/switches/mode-knob", 2);
		}
	}
	elsif (getprop("autopilot/locks/heading") == "") {
		if (getprop("autopilot/locks/altitude") == "") {
			setprop("autopilot/switches/active", 0);
			setprop("autopilot/switches/ALT-sw", 0);
			setprop("autopilot/switches/mode-knob", 1);
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
      setprop("autopilot/switches/active", 0);
      setprop("autopilot/switches/ALT-sw", 0);
		  setprop("autopilot/switches/mode-knob", 1);
      setprop("autopilot/settings/pitch-wheel-deg", 0);
			setprop("autopilot/settings/target-pitch-deg", 0);
			setprop("autopilot/locks/altitude", "");
			setprop("autopilot/locks/speed", "");
    }
});

