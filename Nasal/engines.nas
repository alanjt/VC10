

props.globals.initNode("VC10/engines/HPcock[0]",0,"DOUBLE");
props.globals.initNode("VC10/engines/HPcock[1]",0,"DOUBLE");
props.globals.initNode("VC10/engines/HPcock[2]",0,"DOUBLE");
props.globals.initNode("VC10/engines/HPcock[3]",0,"DOUBLE");

props.globals.initNode("VC10/engines/start_sw1",0,"INT");
props.globals.initNode("VC10/engines/start_sw2",0,"INT");
props.globals.initNode("VC10/engines/start_sw3",0,"INT");
props.globals.initNode("VC10/engines/start_sw4",0,"INT");

props.globals.initNode("VC10/engines/StartModeSw",0,"INT");

props.globals.initNode("VC10/engines/Igniter1Lamp",0,"INT");
props.globals.initNode("VC10/engines/Igniter2Lamp",0,"INT");

props.globals.initNode("VC10/engines/LPshaftRotationLamp",0,"INT");
props.globals.initNode("VC10/engines/lamp_flash",0,"INT");

var engine = 0;

HPcock1 = getprop("VC10/engines/HPcock[0]");
HPcock2 = getprop("VC10/engines/HPcock[1]");
HPcock3 = getprop("VC10/engines/HPcock[2]");
HPcock4 = getprop("VC10/engines/HPcock[3]");

StartSw1 = getprop("VC10/engines/start_sw1");
StartSw2 = getprop("VC10/engines/start_sw2");
StartSw3 = getprop("VC10/engines/start_sw3");
StartSw4 = getprop("VC10/engines/start_sw4");





var flash  = func {
	var lamp_flash = getprop("VC10/engines/lamp_flash");
	
	if (lamp_flash == 0) {
##		print ("lamp on");
		lamp_flash = 1;
		}
	else {
##		print ("lamp off");
		lamp_flash = 0;
		}	
	setprop("VC10/engines/lamp_flash", lamp_flash);		
    settimer(func flash(), 0.5);
	}


## Engine Start

var engine_start = func {
##	print ("engine_start");
	var StartModeSw = getprop("VC10/engines/StartModeSw");
	var IgnSw1 = getprop("VC10/engines/start_sw1");
	var IgnSw2 = getprop("VC10/engines/start_sw2");
	var IgnSw3 = getprop("VC10/engines/start_sw3");
	var IgnSw4 = getprop("VC10/engines/start_sw4");	
	var No1EssDCbus_volts = getprop("VC10/electric/dc/EssDCbus1-volts");
	var No2EssDCbus_volts = getprop("VC10/electric/dc/EssDCbus2-volts");
	var No1EssDCbus = (No1EssDCbus_volts > 20.0);
	var No2EssDCbus = (No2EssDCbus_volts > 20.0);
	var flasher = getprop("VC10/engines/lamp_flash");
	var HPcock1 = getprop("VC10/engines/HPcock[0]");
	var HPcock2 = getprop("VC10/engines/HPcock[1]");
	var HPcock3 = getprop("VC10/engines/HPcock[2]");
	var HPcock4 = getprop("VC10/engines/HPcock[3]");
	
	if (HPcock1 == 0) setprop("controls/engines/engine[0]/cutoff", true);
	if (HPcock2 == 0) setprop("controls/engines/engine[1]/cutoff", true);
	if (HPcock3 == 0) setprop("controls/engines/engine[2]/cutoff", true);
	if (HPcock4 == 0) setprop("controls/engines/engine[3]/cutoff", true);	

	if (IgnSw1 == 1 ){
		setprop("controls/engines/engine[0]/starter", 1);
		setprop("VC10/engines/LPshaftRotationLamp", ((getprop("engines/engine[0]/n1") > 1.0) and flasher and No1EssDCbus));
		if (getprop("VC10/engines/LPshaftRotationLamp")) setprop("VC10/engines/HPcock[0]", 0.75);
##			else setprop("VC10/engines/HPcock[0]", 0);
		if (getprop("VC10/engines/HPcock[0]") > 0.74) setprop("controls/engines/engine[0]/cutoff", false);
##			else setprop("controls/engines/engine[0]/cutoff", true); 
		setprop("VC10/engines/Igniter1Lamp", No1EssDCbus);
		setprop("VC10/engines/Igniter2Lamp", No2EssDCbus);
		}

	elsif (IgnSw2 == 1 ){
		setprop("controls/engines/engine[1]/starter", 1);
		setprop("VC10/engines/LPshaftRotationLamp", ((getprop("engines/engine[1]/n1") > 1.0) and flasher and No1EssDCbus));
		if (getprop("VC10/engines/LPshaftRotationLamp")) setprop("VC10/engines/HPcock[1]", 0.75);
##			else setprop("VC10/engines/HPcock[1]", 0);
		if (getprop("VC10/engines/HPcock[1]") > 0.74) setprop("controls/engines/engine[1]/cutoff", false);
##			else setprop("controls/engines/engine[1]/cutoff", true); 
		setprop("VC10/engines/Igniter1Lamp", No1EssDCbus);
		setprop("VC10/engines/Igniter2Lamp", No2EssDCbus);
		}

	elsif (IgnSw3 == 1 ){
		setprop("controls/engines/engine[2]/starter", 1);
		setprop("VC10/engines/LPshaftRotationLamp", ((getprop("engines/engine[2]/n1") > 1.0) and flasher and No1EssDCbus));
		if (getprop("VC10/engines/LPshaftRotationLamp")) setprop("VC10/engines/HPcock[2]", 0.75);
##			else setprop("VC10/engines/HPcock[2]", 0);
		if (getprop("VC10/engines/HPcock[2]") > 0.74) setprop("controls/engines/engine[2]/cutoff", false);
##			else setprop("controls/engines/engine[2]/cutoff", true); 
		setprop("VC10/engines/Igniter1Lamp", No1EssDCbus);
		setprop("VC10/engines/Igniter2Lamp", No2EssDCbus);
		}

	elsif (IgnSw4 == 1 ){
		setprop("controls/engines/engine[3]/starter", 1);
		setprop("VC10/engines/LPshaftRotationLamp", ((getprop("engines/engine[3]/n1") > 1.0) and flasher and No1EssDCbus));
		if (getprop("VC10/engines/LPshaftRotationLamp")) setprop("VC10/engines/HPcock[3]", 0.75);
##			else setprop("VC10/engines/HPcock[3]", 0);
		if (getprop("VC10/engines/HPcock[3]") > 0.74) setprop("controls/engines/engine[3]/cutoff", false);
##			else setprop("controls/engines/engine[3]/cutoff", true); 
		setprop("VC10/engines/Igniter1Lamp", No1EssDCbus);
		setprop("VC10/engines/Igniter2Lamp", No2EssDCbus);
		}

	 else {
		setprop("controls/engines/engine[0]/starter", 0);
		setprop("controls/engines/engine[1]/starter", 0);
		setprop("controls/engines/engine[2]/starter", 0);
		setprop("controls/engines/engine[3]/starter", 0);
		setprop("VC10/engines/Igniter1Lamp", 0);
		setprop("VC10/engines/Igniter2Lamp", 0);
		setprop("VC10/engines/LPshaftRotationLamp",0);
		}		
  }

var engine_motor =func{

  }

settimer(flash,0.5);
	
##############################################################################################
var update_engine_starter = func {
	if (getprop("VC10/engines/StartModeSw") == 2 ) engine_start();
	if (getprop("VC10/engines/StartModeSw") == 1 ) engine_motor();
	settimer(func update_engine_starter(), 0.05);   ## loop 20 per second
	}

##############################################################################################
setlistener("sim/signals/fdm-initialized", func {
    update_engine_starter ();
});