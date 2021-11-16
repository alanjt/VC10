print ("controls.nas");
#set initial values

# ========================= Elevator Trim  =====================================
controls.elevatorTrim = func(direction){
	var volts = getprop("systems/electrical/outputs/control_pos_indicator");;
	controls.slewProp("controls/flight/elevator-trim", direction * 0.09);
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





