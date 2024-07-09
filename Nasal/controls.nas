print ("controls.nas");
#set initial values

# ========================= Elevator Trim  =====================================
controls.elevatorTrim = func(direction){
	var volts = getprop("systems/electrical/outputs/control_pos_indicator");
	controls.slewProp("controls/flight/elevator-trim", direction * 0.1);
} # end 
# ========================= Aileron Trim  =====================================
controls.aileronTrim = func(direction){
	var volts = getprop("systems/electrical/outputs/control_pos_indicator");
	controls.slewProp("controls/flight/aileron-trim", direction * 0.05);
} # end 
# ========================= Rudder Trim  =====================================
controls.rudderTrim = func(direction){
	var volts = getprop("systems/electrical/outputs/control_pos_indicator");
##	setprop("sim/model/TSR2/controls/flight/rudder-trim", direction);
	controls.slewProp("controls/flight/rudder-trim", direction * 0.1);
} # end 
# ========================= Airbrakes  =====================================
controls.stepSpoilers = func(step) {
    if(props.globals.getNode("/sim/spoilers") != nil) {
        controls.stepProps("/controls/flight/spoilers", "/sim/spoilers", step);
        return;
    }
    # Hard-coded spoilers movement in 5 equal steps:
    var val = 0.20 * step + getprop("/controls/flight/spoilers");
    setprop("/controls/flight/spoilers", val > 1 ? 1 : val < 0 ? 0 : val);
}
# ========================= Flaps  =====================================
controls.flapsDown = func(step) {
    if(step == 0) return;
    if(props.globals.getNode("/sim/flaps") != nil) {
        controls.stepProps("/controls/flight/flaps", "/sim/flaps", step);
        return;
    }
    # Hard-coded flaps movement in 4 equal steps:
    var val = 0.25 * step + getprop("/controls/flight/flaps");
    setprop("/controls/flight/flaps", val > 1 ? 1 : val < 0 ? 0 : val);
}

