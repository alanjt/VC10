
##############################################################################
##                                                                          ##
## AP - test filters                      									##
##                                                                          ##
##############################################################################

print ("autopilotfiltertest.nas");

var last_time = getprop("/sim/time/elapsed-sec");
var current_time = getprop("/sim/time/elapsed-sec");
var dt = 0.0;

props.globals.initNode("/autopilot/test/input",0.0,"DOUBLE");
props.globals.initNode("/autopilot/test/gain",1.0,"DOUBLE");

var setuplogging  = func {
print ("autopilotfiltertest setuplogging");
	setprop("/logging/log/enabled",0);
	setprop("/logging/log/interval-ms",50.0);
	setprop("/logging/log/filename","C:/Users/ajtee/AppData/Roaming/flightgear.org/Export/filters.csv");
	setprop("/logging/log/delimiter",",");
	
	setprop("/logging/log/entry[0]/title", "Input");
	setprop("/logging/log/entry[0]/property", "autopilot/test/input");
	setprop("/logging/log/entry[0]/enabled",1);
	
	setprop("/logging/log/entry[1]/title", "leadlag(1+S)/(1+S)");
	setprop("/logging/log/entry[1]/property","autopilot/test/leadlag1.0_1.0");
	setprop("/logging/log/entry[1]/enabled",1);
##	setprop("/logging/log/entry[1]/title", "exponential0.5");
##	setprop("/logging/log/entry[1]/property", "autopilot/test/exponential0p5");
##	setprop("/logging/log/entry[1]/enabled",1);

	setprop("/logging/log/entry[2]/title", "leadlag(1+S)/(1+.5S)");
	setprop("/logging/log/entry[2]/property","autopilot/test/leadlag1.0_0.5");
	setprop("/logging/log/entry[2]/enabled",1);
##	setprop("/logging/log/entry[2]/title", "exponential1.0");
##	setprop("/logging/log/entry[2]/property", "autopilot/test/exponential1p0");
##	setprop("/logging/log/entry[2]/enabled",1);

	setprop("/logging/log/entry[3]/title", "exponential1.5");
	setprop("/logging/log/entry[3]/property", "autopilot/test/exponential1p5");
	setprop("/logging/log/entry[3]/enabled",1);
##	setprop("/logging/log/entry[3]/title", "leadlag(1+S)/(1+1.5S)");
##	setprop("/logging/log/entry[3]/property","autopilot/test/leadlag1.0_1.5");
##	setprop("/logging/log/entry[3]/enabled",1);
	
	setprop("/logging/log/entry[4]/title", "high-pass0.5");
	setprop("/logging/log/entry[4]/property", "autopilot/test/high-pass0p5");
	setprop("/logging/log/entry[4]/enabled",1);
##	setprop("/logging/log/entry[4]/title", "leadlag(1+.5S/(1+S)");
##	setprop("/logging/log/entry[4]/property","autopilot/test/leadlag0.5_1.0");
##	setprop("/logging/log/entry[4]/enabled",1);

	setprop("/logging/log/entry[5]/title", "(1+1.5S/(1+S)");
	setprop("/logging/log/entry[5]/property","autopilot/test/leadlag1.5_1.0");
	setprop("/logging/log/entry[5]/enabled",1);	
##	setprop("/logging/log/entry[5]/title", "high-pass1.0");
##	setprop("/logging/log/entry[5]/property","autopilot/test/high-pass1p0");
##	setprop("/logging/log/entry[5]/enabled",1);

	setprop("/logging/log/entry[6]/title", "(1+1.5S/(1+S) gain2");
	setprop("/logging/log/entry[6]/property","autopilot/test/leadlag1.5_1.0gain2");
	setprop("/logging/log/entry[6]/enabled",1);	
##	setprop("/logging/log/entry[6]/title", "high-pass1.5");
##	setprop("/logging/log/entry[6]/property","autopilot/test/high-pass1p5");
##	setprop("/logging/log/entry[6]/enabled",1);

	}

	var runtest = func {
		print ("autopilotfiltertest-runtest");
		if (getprop("/logging/log/enabled") == 1.0) {
			print ("start logging, apply step input to all selected filters");
			settimer(func{ setprop("/autopilot/test/input", 1);}, 1.0);
			settimer(func{ setprop("/autopilot/test/input", 0);}, 7.0);
			settimer(func{ setprop("/logging/log/enabled", 0);}, 14.0);
			}
		if (getprop("/logging/log/enabled") == 0.0) {
			print ("logging and test finished - results in file $FG_HOME/Export/filters.csv ");
			}
		}

setlistener("sim/signals/fdm-initialized", setuplogging);
setlistener("/logging/log/enabled", runtest);