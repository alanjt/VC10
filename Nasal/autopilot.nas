####    autopilot/BendixPB20.nas help-functions adapted for VC10                                ####
####    Author: Markus Bulik                                                                   ####
####    This file is licenced under the terms of the GNU General Public Licence V2 or later    ####
##############################################################################
##                                                                          ##
## AP - routines for 'Bendix PB 20' autopilot system                        ##
##                                                                          ##
##############################################################################

print ("autopilot-Bendix-PB-20.nas");


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
# /autopilot/controls/active : true/false
# /autopilot/controls/alt-active : true/false
# /autopilot/controls/mode-selector : 0: NAV, 1: HDG, 2: MAN, 3: LOC VOR, 4: GS AUTO, 5: GS MAN
# /autopilot/settings/pitch-wheel-deg : -30 .. 30
# /autopilot/settings/roll-knob-deg : -35 .. 35

# init
var listenerApPB20InitFunc = func {

	props.globals.getNode("/fdm/jsbsim/fcs/afcs-elevator-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-aileron-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-rudder-cmd-deg", 1).setDoubleValue(0);
	props.globals.getNode("/fdm/jsbsim/fcs/afcs-throttle-cmd-norm", 1).setDoubleValue(0);
	
	setprop("autopilot/controls/mode-selector", 0);
	setprop("autopilot/controls/ALT-active", 0);
	setprop("autopilot/controls/IAS-active", 0);
	setprop("autopilot/controls/MACH-active", 0);
	setprop("autopilot/controls/NAV-active", 0);
	setprop("autopilot/controls/mode-selector", 0);
	
	setprop("autopilot/controls/AP-1active", 0);
	setprop("autopilot/controls/AP-2active", 0);
	
	setprop("autopilot/controls/AP_MasterL_switch", 0);
	setprop("autopilot/controls/AP_MasterR_switch", 0);
	setprop("autopilot/controls/AP_MasterNuisance_bar", 0);
	
	setprop("autopilot/controls/AT_1switch", 0);
	setprop("autopilot/controls/AT_2switch", 0);
	setprop("autopilot/controls/AT_3switch", 0);
	setprop("autopilot/controls/AT_4switch", 0);
	
	setprop("autopilot/controls/AT_powerswitch", 0);
	setprop("autopilot/controls/AT_engageswitch", 0);

	setprop("autopilot/controls/Damper-1active", 0);
	setprop("autopilot/controls/Damper-2active", 0);
	setprop("autopilot/controls/Damper-Stbyactive", 1);
}
###setlistener("sim/signals/fdm-initialized", listenerApPB20InitFunc);

# Mutex - for synchronization of the listener-events
var bendixPB20MutexSet = func(value) {
	setprop("autopilot/mutex", value);
}
var bendixPB20MutexReset = func {
	setprop("autopilot/mutex", "");
}
var bendixPB20MutexResetFunc = func {
	if (getprop("autopilot/mutex") != "") {
		settimer(bendixPB20MutexReset, 0.2);
	}
}
setlistener("autopilot/mutex", bendixPB20MutexResetFunc);

# Active-switch
var bendixPB20ActivePrev = 0;
var listenerApPB20ActiveFunc = func {
	if (bendixPB20ActivePrev == 0) {
		if (getprop("autopilot/controls/active") == 1) {
			if (getprop("autopilot/mutex") == "") {
				setprop("autopilot/controls/mode-selector", 2);
			}
		}
	}
	bendixPB20Active = getprop("autopilot/controls/active");
}
setlistener("autopilot/controls/active", listenerApPB20ActiveFunc);

# Mode-selector
#
# !!! FEHLER: bei zurückschalten von Mode 4,5 auf 3,2,1 bleibt GS eingeschaltet anstatt ALT (bei eingeschaltetem Alt-Switch) !!!
#
var listenerApPB20ModeFunc = func {

	if (	getprop("autopilot/mutex") == "" or
		getprop("autopilot/mutex") == "MODE") {
		bendixPB20MutexSet("MODE");
	}
	else {
		return;
	}

	if (getprop("autopilot/controls/active") == 1) {
		#print ("-> listenerApPB20ModeFunc -> Mode-selector=", getprop("autopilot/controls/mode-selector"));

		if (	getprop("autopilot/controls/mode-selector") == 0) {
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
		if (getprop("autopilot/controls/mode-selector") == 1) {
			# HDG - Mode

			setprop("autopilot/locks/heading", "dg-heading-hold");

			# resets
			if (getprop("autopilot/controls/alt-active") == 0) {
				setprop("autopilot/locks/altitude", "");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}
			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/controls/mode-selector") == 2) {
			# MAN - Mode

			#var rollKnobDeg = getprop("instrumentation/turn-indicator/indicated-turn-rate") * 36.63;
			var rollKnobDeg = 0.0;
			setprop("autopilot/settings/roll-knob-deg", rollKnobDeg);
			listenerApPB20MANRollFunc();

			setprop("autopilot/locks/heading", "wing-leveler");

			if (getprop("autopilot/controls/alt-active") == 0) {
				setprop("autopilot/settings/pitch-wheel-deg", getprop("orientation/pitch-deg"));
				listenerApPB20MANPitchFunc();

				setprop("autopilot/locks/altitude", "pitch-hold");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}

			# resets
			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/controls/mode-selector") == 3) {
			# LOC VOR - Mode

			setprop("autopilot/locks/heading", "nav1-hold");

			# resets
			if (getprop("autopilot/controls/alt-active") == 0) {
				setprop("autopilot/locks/altitude", "");
			}
			else {
				setprop("autopilot/locks/altitude", "altitude-hold");
			}
			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/controls/mode-selector") == 4) {
			# GS AUTO - Mode

			setprop("autopilot/locks/heading", "nav1-hold");
			setprop("autopilot/locks/altitude", "gs1-hold");

			# resets
			setprop("autopilot/locks/passive-mode", 0);
			setprop("autopilot/controls/alt-active", 0);
		}
		if (getprop("autopilot/controls/mode-selector") == 5) {
			# GS MAN - Mode

			setprop("autopilot/locks/heading", "nav1-hold");
			if (getprop("autopilot/controls/alt-active") == 0) {
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
		setprop("autopilot/locks/speed", "");	# for compatibility only (Bendix-PB-20 don't have speed-mode)
	}
}
setlistener("autopilot/controls/active", listenerApPB20ModeFunc);
setlistener("autopilot/controls/mode-selector", listenerApPB20ModeFunc, 1,0);

# switches off 'altitude-hold' if GS is in range and all other conditions are satisfied
var gsMANAltControl = func {
	if (	getprop("autopilot/controls/active") == 1 and
		getprop("autopilot/controls/mode-selector") == 5) {
		if (getprop("instrumentation/nav[0]/gs-in-range") == 0) {
			settimer(gsMANAltControl, 0.2);
		}
		else {
			setprop("autopilot/locks/altitude", "");
		}
	}
}


# MAN - Mode - roll-selector
var listenerApPB20MANRollFunc = func {
    # if roll-knob-deg turn, the mode selector jump to mode 2
	setprop("autopilot/controls/mode-selector", 2);

	if (	getprop("autopilot/controls/active") == 1 and
		getprop("autopilot/controls/mode-selector") == 2) {

		setprop("autopilot/internal/wing-leveler-target-roll-deg", getprop("autopilot/settings/roll-knob-deg"));
	}
}
setlistener("autopilot/settings/roll-knob-deg", listenerApPB20MANRollFunc);

# MAN - Mode - pitch-selector
var listenerApPB20MANPitchFunc = func {

	if (	getprop("autopilot/controls/active") == 1 and
		getprop("autopilot/controls/mode-selector") == 2) {
		if (getprop("autopilot/controls/alt-active") == 0) {

			var pitchDeg = getprop("autopilot/settings/pitch-wheel-deg");
			pitchDeg = (pitchDeg > 30 ? 30 : pitchDeg);
			pitchDeg = (pitchDeg < -30 ? -30 : pitchDeg);
			setprop("autopilot/settings/target-pitch-deg", pitchDeg);
		}
	}
}
setlistener("autopilot/settings/pitch-wheel-deg", listenerApPB20MANPitchFunc);

# ALT switch
var listenerApPB20AltFunc = func {

	if (getprop("autopilot/mutex") == "") {
		bendixPB20MutexSet("PB20-ALT");
	}
	else {
		return;
	}

	if (getprop("autopilot/controls/active") == 1) {
		if (getprop("autopilot/controls/alt-active") == 1) {

			# set altitude-hold-value to the actual altitude plus an offset dependent on vspeed

			var vspeed = getprop("velocities/vertical-speed-fps");
			var altOffset = vspeed * 5;	# ft climed/falled in 5 seconds

			var altitudeFt = getprop("instrumentation/altimeter/indicated-altitude-ft") + altOffset;
			setprop("autopilot/settings/target-altitude-ft", altitudeFt);

			setprop("autopilot/locks/altitude", "altitude-hold");
		}
		else {
			if (getprop("autopilot/controls/mode-selector") == 2) {
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
setlistener("autopilot/controls/alt-active", listenerApPB20AltFunc);


# settings from FG-menu (F11)

listenerApPB20SetHeadingFunc = func {

	if (	getprop("autopilot/mutex") == "" or
		getprop("autopilot/mutex") == "PASSIVE") {
		bendixPB20MutexSet("HEADING");
	}
	else {
		return;
	}

	menuSwitchBendixPB20();
}
setlistener("autopilot/locks/heading", listenerApPB20SetHeadingFunc);

listenerApPB20SetPassiveModeFunc = func {

	# unfortunalety 'passive-mode' is triggered many times, we only need to act if it's wsitched to '1'
	if (	getprop("autopilot/mutex") == "" and
		getprop("autopilot/locks/passive-mode") == 1) {
		bendixPB20MutexSet("PASSIVE");
	}
	else {
		return;
	}

	if (getprop("autopilot/locks/passive-mode") == 1) {
		if (getprop("autopilot/route-manager/active") == 1 and getprop("autopilot/route-manager/airborne") == 1) {
			setprop("autopilot/controls/active", 1);
			setprop("autopilot/controls/mode-selector", 0);
		}
		else {
			gui.popupTip("You must be airborne and a route must be active to activate this mode !");
			setprop("autopilot/locks/passive-mode", 0);
		}

		setprop("autopilot/controls/active", 1);
		setprop("autopilot/controls/mode-selector", 0);
	}
}
setlistener("autopilot/locks/passive-mode", listenerApPB20SetPassiveModeFunc);

listenerApPB20SetAltitudeFunc = func {

	if (	getprop("autopilot/mutex") == "" or
		getprop("autopilot/mutex") == "PASSIVE") {
		bendixPB20MutexSet("ALT");
	}
	else {
		return;
	}

	if (getprop("autopilot/locks/altitude") == "altitude-hold") {
		setprop("autopilot/controls/active", 1);
		setprop("autopilot/controls/alt-active", 1);
		if (getprop("autopilot/controls/mode-selector") == 2) {
			setprop("autopilot/locks/heading", "wing-leveler");
		}
	}
	else {
		setprop("autopilot/controls/alt-active", 0);
	}

	menuSwitchBendixPB20();
}
setlistener("autopilot/locks/altitude", listenerApPB20SetAltitudeFunc);

var menuSwitchBendixPB20 = func {

	if (getprop("autopilot/locks/heading") == "wing-leveler") {
		setprop("autopilot/controls/active", 1);
		setprop("autopilot/controls/mode-selector", 2);
	}
	elsif (getprop("autopilot/locks/heading") == "dg-heading-hold") {
		setprop("autopilot/controls/active", 1);
		setprop("autopilot/controls/mode-selector", 1);
	}
	elsif (	getprop("autopilot/locks/heading") == "nav1-hold") {
		if (getprop("autopilot/locks/altitude") == "gs1-hold") {
			setprop("autopilot/controls/active", 1);
			setprop("autopilot/controls/mode-selector", 4);
		}
		else {
			setprop("autopilot/controls/active", 1);
			setprop("autopilot/controls/mode-selector", 3);
		}
	}
	elsif (getprop("autopilot/locks/heading") == "") {
		if (getprop("autopilot/locks/altitude") == "") {
			setprop("autopilot/controls/active", 0);
			setprop("autopilot/controls/alt-active", 0);
			setprop("autopilot/controls/mode-selector", 2);
		}
	}
}

listenerApPB20SetPitchFunc = func {

	setprop("autopilot/settings/pitch-wheel-deg", getprop("autopilot/settings/target-pitch-deg"));
}
setlistener("autopilot/locks/altitude", listenerApPB20SetPitchFunc);
setlistener("autopilot/settings/pitch-hold", listenerApPB20SetPitchFunc);

### Bendix PB 20 ###

setlistener("controls/special/yoke-switch1", func (s1){
    var s1 = s1.getBoolValue();
    if (s1 == 1){
      setprop("autopilot/controls/active", 0);
      setprop("autopilot/controls/alt-active", 0);
		  setprop("autopilot/controls/mode-selector", 2);
      setprop("autopilot/settings/pitch-wheel-deg", 0);
			setprop("autopilot/settings/target-pitch-deg", 0);
			setprop("autopilot/locks/altitude", "");
			setprop("autopilot/locks/speed", "");
    }
});

