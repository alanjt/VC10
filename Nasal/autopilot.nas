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

	props.globals.initNode("autopilot/gain/Gu",10.0,"DOUBLE");
	props.globals.initNode("autopilot/gain/Khdg_phi",-1.5,"DOUBLE");	
	props.globals.initNode("autopilot/LGUIDE/KPSI",-0.75,"DOUBLE");
	props.globals.initNode("autopilot/gain/Kloc_Loc",-5.0,"DOUBLE");		
	props.globals.initNode("autopilot/gain/Kloc_Phi",0.,"DOUBLE");	
	props.globals.initNode("autopilot/gain/Kp_r",0.25,"DOUBLE");
	props.globals.initNode("autopilot/gain/Kp_s",0.1,"DOUBLE");
	props.globals.initNode("autopilot/gain/Kphi",10.0,"DOUBLE");
	props.globals.initNode("autopilot/gain/gs-q",1000.0,"DOUBLE");
	props.globals.initNode("autopilot/LGUIDE/PHICOM",0.0,"DOUBLE");
	
	props.globals.initNode("autopilot/logic/CB",0,"BOOL");   # capture localiser beam
	props.globals.initNode("autopilot/logic/HH",0,"BOOL");   # heading hold
	props.globals.initNode("autopilot/logic/ONC",0,"BOOL");  # on course
	
	props.globals.initNode("autopilot/switches/mode-knob",0,"DOUBLE");      # -1 HEADING : 0 MAN : 1 LOC VOR : 2 GS AUTO : 3 GS MAN : 4 FLARE :
	props.globals.initNode("autopilot/settings/Mode","MAN","STRING");
	props.globals.initNode("autopilot/settings/pitch-wheel-deg",1,"DOUBLE");# -14 .. 0 .. +14
	props.globals.initNode("autopilot/settings/TurnKnob",0,"DOUBLE");		# -25 .. 0 .. +25
	props.globals.initNode("autopilot/switches/datum_norm",1,"DOUBLE");		#  -1 .. 0 .. +1

	props.globals.initNode("autopilot/controls/AP1_haspower", 0,"BOOL");
	props.globals.initNode("autopilot/controls/AP2_haspower", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YD1_engaged", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YD2_engaged", 0,"BOOL");
	props.globals.initNode("autopilot/controls/YDStby_engaged", 0,"BOOL");
	props.globals.initNode("autopilot/settings/RollKnobInDetent",0,"BOOL");	

	props.globals.initNode("autopilot/switches/auto-trim-cutout",0,"BOOL");
	
	props.globals.initNode("autopilot/gain/Gtheta",2.0,"DOUBLE");
	props.globals.initNode("autopilot/gain/Gq",-0.2,"DOUBLE");
	props.globals.initNode("autopilot/gain/GqIAS",-0.2,"DOUBLE");
	props.globals.initNode("autopilot/gain/GqMach",-0.2,"DOUBLE");
	props.globals.initNode("autopilot/gain/GqALT",-0.2,"DOUBLE");
	props.globals.initNode("autopilot/gain/GhdotALT",-10.0,"DOUBLE");

	props.globals.initNode("autopilot/gain/GAy",0.05,"DOUBLE");
	props.globals.initNode("autopilot/gain/GBetadot",0.25,"DOUBLE");
	props.globals.initNode("autopilot/gain/GIASInt",-0.005,"DOUBLE");
	props.globals.initNode("autopilot/gain/GStatic",0.1,"DOUBLE");
	props.globals.initNode("autopilot/gain/Gh",-0.15,"DOUBLE");
	props.globals.initNode("autopilot/gain/Ghint",-0.01,"DOUBLE");
	props.globals.initNode("autopilot/gain/Ghdot",-1.5,"DOUBLE");
	
	props.globals.initNode("autopilot/gain/Gqe",0.02,"DOUBLE");		
	props.globals.initNode("autopilot/gain/Gqr",2.25,"DOUBLE");

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
}
setlistener("sim/signals/fdm-initialized", listenerApInitFunc);


######var listenerApActiveFunc = func {
##	if (getprop("autopilot/switches/AP1orAP2Prev-sw") == 0) {
######	if (getprop("autopilot/switches/AP1orAP2-sw") == 1) { 
	# Autopilot has just been activated.
	# set autopilot to basic pitch hold and bank zero mode
######		setprop("autopilot/switches/mode-knob", 0);     ## MAN
######			}
##		}
######	}
######setlistener("autopilot/switches/AP1orAP2-sw", listenerApActiveFunc);

# Mode-selector
#
# !!! BUG: when switching back from mode 2 or 3 to 1, 0 or -1 GS remains switched on instead of ALT (with the alt switch switched on) !!!
var listenerApModeFunc = func {
	print ("-> listenerApModeFunc -> Mode-selector = ", getprop("autopilot/switches/mode-knob"));

	if (getprop("autopilot/switches/AP1orAP2-sw") == 1) {
		print ("-> listenerApModeFunc -> Mode-selector = ", getprop("autopilot/switches/mode-knob"));
		
		if (	getprop("autopilot/logic/NAV-sw") == 1) {
			# NAV - Mode

##			if (getprop("autopilot/route-manager/active") == 1 and getprop("autopilot/route-manager/airborne") == 1) {
##				setprop("autopilot/locks/passive-mode", 1);
##
##				# resets
##				setprop("autopilot/locks/pitch", "");
##				setprop("autopilot/locks/lateral", "");
##			}
##			else {
##				gui.popupTip("You must be airborne and a route must be active to activate this mode !");
##			}
		}
		if (getprop("autopilot/switches/mode-knob") == -1) {  #HDG
			# HDG - Mode
			setprop("autopilot/locks/lateral", "dg-heading-hold");

			# resets
			if (getprop("autopilot/logic/ALT-sw") == 0) {
				setprop("autopilot/locks/pitch", "");
			}
##			else {setprop("autopilot/locks/pitch", "altitude-hold");}
##			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 0) {
			# MAN - Mode
			#var rollKnobDeg = getprop("instrumentation/turn-indicator/indicated-turn-rate") * 36.63;
			var rollKnobDeg = 0.0;
			setprop("autopilot/settings/TurnKnob", rollKnobDeg);
			listenerApMANRollFunc();

##			setprop("autopilot/locks/lateral", "wing-leveler");

			if (getprop("autopilot/logic/ALT-sw") == 0) {
				setprop("autopilot/settings/pitch-wheel-deg", getprop("orientation/pitch-deg"));
				listenerApMANPitchFunc();

				setprop("autopilot/locks/pitch", "pitch-hold");
			}
##			else {setprop("autopilot/locks/pitch", "altitude-hold");}

			# resets
##			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 1) {
			# LOC VOR - Mode
			setprop("autopilot/locks/lateral", "nav1-hold");

			# resets
			if (getprop("autopilot/logic/ALT-sw") == 0) {
				setprop("autopilot/locks/pitch", "");
			}
##			else {setprop("autopilot/locks/pitch", "altitude-hold");}
##			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 2) {
			# GS AUTO - Mode
			setprop("autopilot/locks/lateral", "nav1-hold");
			setprop("autopilot/locks/pitch", "gs1-hold");

			# resets
##			setprop("autopilot/locks/passive-mode", 0);
			setprop("autopilot/logic/ALT-sw", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 3) {
			# GS MAN - Mode
			setprop("autopilot/locks/lateral", "nav1-hold");
			if (getprop("autopilot/logic/ALT-sw") == 0) {
				setprop("autopilot/locks/pitch", "");
			}
##			else {setprop("autopilot/locks/pitch", "altitude-hold");}

			gsMANAltControl();

			# resets
##			setprop("autopilot/locks/passive-mode", 0);
		}
		if (getprop("autopilot/switches/mode-knob") == 4) {
			# FLARE - Mode
			}
	}
	else {
		# switched off
		setprop("autopilot/locks/lateral", "");
		setprop("autopilot/locks/pitch", "");
##		setprop("autopilot/internal/wing-leveler-target-roll-deg", 0.0);
##		setprop("autopilot/locks/passive-mode", 0);
##		setprop("autopilot/locks/speed", "");
	}
}
##setlistener("autopilot/switches/AP1orAP2-sw", listenerApModeFunc);
##print("setlistener(autopilot/switches/mode-knob)");
##setlistener("autopilot/switches/mode-knob", listenerApModeFunc, 1,0);

# switches off 'altitude-hold' if GS is in range and all other conditions are satisfied
######var gsMANAltControl = func {
######	if (	getprop("autopilot/switches/AP1orAP2-sw") == 1 and
######		getprop("autopilot/switches/mode-knob") == 3) {      # GS-MAN
######		if (getprop("instrumentation/nav[0]/gs-in-range") == 0) {
######			settimer(gsMANAltControl, 0.2);
######		}
######		else {
######			setprop("autopilot/locks/pitch", "");
######		}
######	}
######}


# MAN - Mode - roll-selector
var listenerApMANRollFunc = func {
	if(getprop("autopilot/settings/RollKnobInDetent") == 0) {
##		print (" if TurnKnob turn, the mode selector jump to mode 0");
		setprop("autopilot/switches/mode-knob", 0);   # MAN
		}

	if (	getprop("autopilot/switches/AP1orAP2-sw") == 1 and

		getprop("autopilot/switches/mode-knob") == 0) {   # MAN

##		setprop("autopilot/internal/wing-leveler-target-roll-deg", getprop("autopilot/settings/TurnKnob"));
	}
}
setlistener("autopilot/settings/TurnKnob", listenerApMANRollFunc);

# MAN - Mode - pitch-wheel selector
var listenerApMANPitchFunc = func {
	if (getprop("autopilot/switches/AP1orAP2-sw") == 1 and getprop("autopilot/switches/mode-knob") == 0)
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
######setlistener("autopilot/settings/pitch-wheel-deg", listenerApMANPitchFunc);

# ALT switch
#####var listenerApAltFunc = func {
#####	if (getprop("autopilot/switches/AP1orAP2-sw") == 1) {
#####		if (getprop("autopilot/logic/ALT-sw") == 1) {

#####			# set altitude-hold-value to the actual altitude plus an offset dependent on vspeed

#####			var vspeed = getprop("velocities/vertical-speed-fps");
#####			var altOffset = vspeed * 5;	# aircraft altitude change in 5 seconds

#####			var altitudeFt = getprop("instrumentation/altimeter/indicated-altitude-ft") + altOffset;
#####			setprop("autopilot/settings/AltRef", altitudeFt);

##			setprop("autopilot/locks/pitch", "altitude-hold");
#####		}
#####		else {
#####			if (getprop("autopilot/switches/mode-knob") == 0) {   # MAN
#####				setprop("autopilot/locks/pitch", "pitch-hold");
#####			}
###			else {if (getprop("autopilot/locks/pitch") == "altitude-hold") #####{setprop("autopilot/locks/pitch", "");}}
#####		}
#####	}
#####	else {
#####		setprop("autopilot/locks/pitch", "");
#####	}
#####}
######setlistener("autopilot/logic/ALT-sw", listenerApAltFunc);


# settings from FG-menu (shift-F11)

######listenerApSetHeadingFunc = func {
######	menuSwitchAp();
#####}
##setlistener("autopilot/locks/lateral", listenerApSetHeadingFunc);

######listenerApSetAltitudeFunc = func {
######	if (getprop("autopilot/locks/pitch") == "altitude-hold") {
##		setprop("autopilot/switches/AP1orAP2-sw", 1);
######		setprop("autopilot/logic/ALT-sw", 1);
######		if (getprop("autopilot/switches/mode-knob") == 0) {  # MAN
######			setprop("autopilot/locks/lateral", "wing-leveler");
######		}
######	}
######	else {setprop("autopilot/logic/ALT-sw", 0);}
######	menuSwitchAp();
######}
#####setlistener("autopilot/locks/pitch", listenerApSetAltitudeFunc);

var menuSwitchAp = func {

	if (getprop("autopilot/locks/lateral") == "wing-leveler") {
	    print (" if heading lock = wing-leveler, the mode selector springs back to mode 0");
		setprop("autopilot/switches/AP1orAP2-sw", 1);
		setprop("autopilot/switches/mode-knob", 0);  # MAN
	}
	elsif (getprop("autopilot/locks/lateral") == "dg-heading-hold") {
##		setprop("autopilot/switches/AP1orAP2-sw", 1);
	}
	elsif (	getprop("autopilot/locks/lateral") == "nav1-hold") {
		if (getprop("autopilot/locks/pitch") == "gs1-hold") {
##			setprop("autopilot/switches/AP1orAP2-sw", 1);
			setprop("autopilot/switches/mode-knob", 2);  # GS AUTO
		}
##		else {setprop("autopilot/switches/AP1orAP2-sw", 1);}
	}
	elsif (getprop("autopilot/locks/lateral") == "") {
		if (getprop("autopilot/locks/pitch") == "") {
			setprop("autopilot/logic/AP1-sw", 0);
			setprop("autopilot/logic/AP2-sw", 0);
			setprop("autopilot/switches/AP1orAP2-sw", 0);
			setprop("autopilot/logic/ALT-sw", 0);
			setprop("autopilot/switches/mode-knob", 0);  # MAN
		}
	}
}

##listenerApSetPitchFunc = func {

##	setprop("autopilot/settings/pitch-wheel-deg", getprop("autopilot/settings/target-pitch-deg"));
##}
##setlistener("autopilot/locks/pitch", listenerApSetPitchFunc);
##setlistener("autopilot/settings/pitch-hold", listenerApSetPitchFunc);

### Bendix PB 20 ###

setlistener("controls/special/yoke-switch1", func (s1){
    var s1 = s1.getBoolValue();
    if (s1 == 1){
		setprop("autopilot/logic/AP1-sw", 0);
		setprop("autopilot/logic/AP2-sw", 0);
		setprop("autopilot/switches/AP1orAP2-sw", 0);
		setprop("autopilot/logic/ALT-sw", 0);
		setprop("autopilot/logic/IAS-sw", 0);
		setprop("autopilot/logic/MACH-sw", 0);
		print (" AP disconnect sw");
		setprop("autopilot/switches/mode-knob", 0);   # MAN
		setprop("autopilot/settings/pitch-wheel-deg", 0);
		setprop("autopilot/settings/target-pitch-deg", 0);
		setprop("autopilot/locks/pitch", "");
		setprop("autopilot/locks/lateral", "");
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
	var APengaged = getprop("autopilot/switches/AP1orAP2-sw");
	##print ("altsw ", altsw,"  iassw ", iassw,"  machsw ", machsw,"  pitchsw ", pitchsw,"  APengaged");
	if (!altsw and !iassw and !machsw and APengaged)(
		setprop("autopilot/logic/PITCH-HOLD", 1)
		);
	pitchsw = getprop("autopilot/logic/PITCH-HOLD") != 0;
	##print ("altsw ", altsw,"  iassw ", iassw,"  machsw ", machsw,"  pitchsw ", pitchsw,"  APengaged");
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
	if(getprop("autopilot/switches/AP1orAP2-sw") == 1){
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

	setlistener("autopilot/logic/PITCH-HOLD", listenerPitchhHoldFunc,1,0); 	
	setlistener("autopilot/logic/ALT-sw", listenerAltSwFunc,1,0);
	setlistener("autopilot/logic/IAS-sw", listenerIasSwFunc,1,0);
	setlistener("autopilot/logic/MACH-sw",listenerMachSwFunc,1,0);
	setlistener("autopilot/logic/GS-CAPT",listenerGSCaptFunc,1,0);
	setlistener("autopilot/switches/AP1orAP2-sw",listenerAP_EngageFunc,1,0);
	
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
	
	var AP1_haspower  = 0;
	var AP2_haspower  = 0;		
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

	setprop("autopilot/switches/AP1orAP2-sw", (getprop("autopilot/logic/AP1-sw") or getprop("autopilot/logic/AP2-sw")));
	
	## both Autopilots are needed for autoland
	setprop("autopilot/switches/AP1andAP2-sw", (getprop("autopilot/logic/AP1-sw") and getprop("autopilot/logic/AP2-sw")));
	
	var APengaged = getprop("autopilot/switches/AP1orAP2-sw");
	
	setprop("autopilot/internal/BarometricModeSelected",(
			getprop("autopilot/settings/Mach-sw") 
			or getprop("autopilot/logic/IAS-sw")
			or getprop("autopilot/logic/ALT-sw") 		
			));

	setprop("autopilot/settings/RollKnobInDetent",
	(getprop("autopilot/settings/TurnKnob") < 0.11) and (getprop("autopilot/settings/TurnKnob") > -0.11));
	
	if (APengaged){   # Auto pitch-trim
		var APelevator_deg =  getprop("autopilot/commands/APelevator-deg");
		if (APelevator_deg > -0.1) controls.slewProp("controls/flight/elevator-trim", dt*0.5);
		if (APelevator_deg < 0.0)  controls.slewProp("controls/flight/elevator-trim", -dt*0.5);
	}
	
	if (getprop("autopilot/switches/mode-knob") == -1){
		setprop("autopilot/settings/Mode", "HDG");
		}
 	elsif (getprop("autopilot/switches/mode-knob") ==  0){
		setprop("autopilot/settings/Mode", "MAN");
		}
 	elsif (getprop("autopilot/switches/mode-knob") ==  1){
		setprop("autopilot/settings/Mode", "LOC VOR");
		}
  	elsif (getprop("autopilot/switches/mode-knob") ==  2){
		setprop("autopilot/settings/Mode", "GS AUTO");
		}
  	elsif (getprop("autopilot/switches/mode-knob") ==  3){
		setprop("autopilot/settings/Mode", "GS MAN");
		}
  	elsif (getprop("autopilot/switches/mode-knob") ==  4){
		setprop("autopilot/settings/Mode", "FLARE");
		}
  	else{
		setprop("autopilot/settings/Mode", "");
		}
		
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
##	setlistener("autopilot/switches/mode-knob", listenerApModeFunc, 1,0);
##	setlistener("autopilot/logic/ALT-sw", listenerAltSwFunc,1,0);
##	setlistener("autopilot/logic/IAS-sw", listenerIasSwFunc,1,0);
##	setlistener("autopilot/logic/MACH-sw",listenerMachSwFunc,1,0);
	}
);
