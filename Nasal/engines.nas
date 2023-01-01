

props.globals.initNode("VC10/engines/HPcock[0]",0,"DOUBLE");
props.globals.initNode("VC10/engines/HPcock[1]",0,"DOUBLE");
props.globals.initNode("VC10/engines/HPcock[2]",0,"DOUBLE");
props.globals.initNode("VC10/engines/HPcock[3]",0,"DOUBLE");

props.globals.initNode("VC10/engine[0]/start_sw",0,"INT");
props.globals.initNode("VC10/engine[1]/start_sw",0,"INT");
props.globals.initNode("VC10/engine[2]/start_sw",0,"INT");
props.globals.initNode("VC10/engine[3]/start_sw",0,"INT");

props.globals.initNode("VC10/engines/StartMasterSw",0,"INT");

props.globals.initNode("VC10/engines/Igniter1",0,"INT");
props.globals.initNode("VC10/engines/Igniter2",0,"INT");

props.globals.initNode("VC10/engines/LPshaftRotation",0,"INT");

var engine = 0;

HPcock1 = getprop("VC10/engines/HPcock[0]");
HPcock2 = getprop("VC10/engines/HPcock[1]");
HPcock3 = getprop("VC10/engines/HPcock[2]");
HPcock4 = getprop("VC10/engines/HPcock[3]");

StartSw1 = getprop("VC10/engine[0]/start_sw");
StartSw2 = getprop("VC10/engine[1]/start_sw");
StartSw3 = getprop("VC10/engine[2]/start_sw");
StartSw4 = getprop("VC10/engine[3]/start_sw");

StartMasterSw = getprop("VC10/engines/StartMasterSw");

##	if(StartSw1 == 1){
##  	 setprop("/controls/engine[0]/cutoff", 0); 
##  }else{
## 	 setprop("sim/sound/switch2", 1);
##  }