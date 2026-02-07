#################################################################################
#		Lake of Constance Hangar												#
#		Vickers VC10 for Flightgear												#
#											#	
#																				#
#		This program is free software: you can redistribute it and/or modify	#
#		it under the terms of the GNU General Public License as published by	#
#		the Free Software Foundation, either version 3 of the License, or		#
#		(at your option) any later version.										#
#																				#
#		This program is distributed in the hope that it will be useful,			#
#		but WITHOUT ANY WARRANTY; without even the implied warranty of			#
#		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the			#
#		GNU General Public License for more details.							#
#																				#
#		You should have received a copy of the GNU General Public License		#
#		along with this program.  If not, see <http://www.gnu.org/licenses/>.	#
#																				#
#		Every software has a developer, also free software. 					#
#		As a gesture of courtesy and respect, I would be delighted 				#		
#		if you contacted me before making any changes to this software. 		#
#									#
#################################################################################

var run1 = props.globals.getNode("engines/engine[0]/running");
var run2 = props.globals.getNode("engines/engine[1]/running");
var run3 = props.globals.getNode("engines/engine[2]/running");
var run4 = props.globals.getNode("engines/engine[3]/running");
var auto_procedure = props.globals.initNode("VC10/autoprocedure",0,"BOOL");
var step = 0;

##################################################################################
var Reset = func{
	print ("VC10 Reset");
    var airspeed = getprop("/sim/presets/airspeed-kt");
    var altitude = getprop("/sim/presets/altitude-ft");
	setprop("controls/gear/nose-wheel-steering", 1);
	var engines_running = getprop("/sim/presets/engines_running");
	var park_brake = getprop("/sim/presets/park_brake");
	var gear_down = getprop("/sim/presets/gear_down");
	var flaps = getprop("/sim/presets/flaps") or 0;
##	var airbrakes = getprop("/sim/presets/airbrakes") or 0;

	print ("disconnect autopilot");

	setprop("autopilot/switches/AT_engageswitch",0);
	setprop("autopilot/switches/AT_1switch",0);		
	setprop("autopilot/switches/AT_2switch",0);	
	setprop("autopilot/switches/AT_3switch",0);	
	setprop("autopilot/switches/AT_4switch",0);
	setprop("autopilot/Logic/AP1-sw",0);		
	setprop("autopilot/Logic/AP2-sw",0);
	setprop("autopilot/Logic/YD1-sw",0);
	setprop("autopilot/Logic/YD2-sw",0);
		
	if (engines_running) { 

		print ("set engines running");	
	   	setprop("engines/engine[0]/running","true");
	   	setprop("engines/engine[1]/running","true");
	   	setprop("engines/engine[2]/running","true");
	   	setprop("engines/engine[3]/running","true");		
		 ## print ("reset in air - set cutoff false");	 
		setprop("controls/engines/engine[0]/cutoff", "false");
		setprop("controls/engines/engine[1]/cutoff", "false");
		setprop("controls/engines/engine[2]/cutoff", "false");
		setprop("controls/engines/engine[3]/cutoff", "false");
		setprop("controls/engines/engine[0]/started","false");
		setprop("controls/engines/engine[1]/started","false");
		setprop("controls/engines/engine[2]/started","false");
		setprop("controls/engines/engine[3]/started","false");
		
		setprop("VC10/electric/ac/generator/Gen1-Drv-sw", 1);
		setprop("VC10/electric/ac/generator/Gen2-Drv-sw", 1);
		setprop("VC10/electric/ac/generator/Gen3-Drv-sw", 1);
		setprop("VC10/electric/ac/generator/Gen4-Drv-sw", 1);
		setprop("VC10/electric/ac/generator/Gen1-Drv", 1);
		setprop("VC10/electric/ac/generator/Gen2-Drv", 1);
		setprop("VC10/electric/ac/generator/Gen3-Drv", 1);
		setprop("VC10/electric/ac/generator/Gen4-Drv", 1);
		setprop("VC10/electric/ac/generator/Gen1-Fail", 0);
		setprop("VC10/electric/ac/generator/Gen2-Fail", 0);
		setprop("VC10/electric/ac/generator/Gen3-Fail", 0);
		setprop("VC10/electric/ac/generator/Gen4-Fail", 0);
		setprop("VC10/electric/ac/generator/GenELRAT-drive", 0);
		setprop("VC10/electric/ac/BTB1-relay", 1);
		setprop("VC10/electric/ac/BTB2-relay", 1);
		setprop("VC10/electric/ac/BTB3-relay", 1);
		setprop("VC10/electric/ac/BTB4-relay", 1);				
		setprop("VC10/electric/ac/generator/GCR1-sw", 1);			
		setprop("VC10/electric/ac/generator/GCR2-sw", 1);			
		setprop("VC10/electric/ac/generator/GCR3-sw", 1);			
		setprop("VC10/electric/ac/generator/GCR4-sw", 1);
		setprop("VC10/electric/ac/generator/Gen1-Control-sw", 0);
		setprop("VC10/electric/ac/generator/Gen2-Control-sw", 0);
		setprop("VC10/electric/ac/generator/Gen3-Control-sw", 0);
		setprop("VC10/electric/ac/generator/Gen4-Control-sw", 0);
		setprop("VC10/electric/ac/generator/GCB1", 1);
		setprop("VC10/electric/ac/generator/GCB2", 1);
		setprop("VC10/electric/ac/generator/GCB3", 1);
		setprop("VC10/electric/ac/generator/GCB4", 1);
		setprop("VC10/electric/ac/generator/Gen1-freq", 400);
		setprop("VC10/electric/ac/generator/Gen2-freq", 400);
		setprop("VC10/electric/ac/generator/Gen3-freq", 400);
		setprop("VC10/electric/ac/generator/Gen4-freq", 400);
        setprop("VC10/electric/ess-power-switch", 5);
		setprop("VC10/electric/ac/ac-para-select", 6);
	
		setprop("VC10/hydraulic/ac-aux-pump[0]", 1);
		setprop("VC10/hydraulic/ac-aux-pump[1]", 1);
		setprop("VC10/hydraulic/brake-valve", 2);
		setprop("VC10/hydraulic/hyd-fluid-shutoff[0]", 1);
		setprop("VC10/hydraulic/hyd-fluid-shutoff[1]", 1);
		setprop("VC10/hydraulic/hyd-fluid-pump[0]", 1);
		setprop("VC10/hydraulic/hyd-fluid-pump[1]", 1);
		
		setprop("VC10/fuel/switches/BoostPump1_fwdSw", 1);
		setprop("VC10/fuel/switches/BoostPump1_aftSw", 1);	
		setprop("VC10/fuel/switches/BoostPump2_fwdSw", 1);
		setprop("VC10/fuel/switches/BoostPump2_aftSw", 1);
		setprop("VC10/fuel/switches/BoostPump3_fwdSw", 1);
		setprop("VC10/fuel/switches/BoostPump3_aftSw", 1);	
		setprop("VC10/fuel/switches/BoostPump4_fwdSw", 1);
		setprop("VC10/fuel/switches/BoostPump4_aftSw", 1);
		
		setprop("VC10/engines/HPcock[0]",1);
		setprop("VC10/engines/HPcock[1]",1);
		setprop("VC10/engines/HPcock[2]",1);
		setprop("VC10/engines/HPcock[3]",1);		
		
		setprop("VC10/fuel/switches/LPCock1Sw", 1);		
		setprop("VC10/fuel/valves/LPCock1", 1);
		setprop("VC10/fuel/switches/LPCock2Sw", 1);	
		setprop("VC10/fuel/valves/LPCock2", 1);
		setprop("VC10/fuel/switches/LPCock3Sw", 1);	
		setprop("VC10/fuel/valves/LPCock3", 1);
		setprop("VC10/fuel/switches/LPCock4Sw", 1);	
		setprop("VC10/fuel/valves/LPCock4", 1);
		
		setprop("controls/wiper/degrees",0);
		setprop("VC10/apu/off-start-run", 0);
		
		setprop("VC10/electric/ac/generator/hertz-converter", 1);
		setprop("VC10/equipment/blower", 1);
		setprop("VC10/equipment/ovbd-dump", 1);
		setprop("VC10/air-conditioning/ram-air-switch", 1);
		setprop("VC10/air-conditioning/compressor-start[0]", 2);
		setprop("VC10/air-conditioning/compressor-rpm[0]", 110);
		setprop("VC10/air-conditioning/compressor-start[1]", 2);
		setprop("VC10/air-conditioning/compressor-rpm[1]", 95);
		setprop("VC10/air-conditioning/compressor-start[2]", 2);
		setprop("VC10/air-conditioning/compressor-rpm[2]", 104);
	    setprop("VC10/air-conditioning/air-cond-unit-left-start",1);
		setprop("VC10/air-conditioning/air-cond-unit-right-start",1);
		setprop("VC10/air-conditioning/wing-valve[0]",1);
		setprop("VC10/air-conditioning/wing-valve[1]",1);
		setprop("VC10/air-conditioning/cabin-temp-selector[0]",4);
		setprop("VC10/air-conditioning/cabin-temp-selector[1]",4);
		setprop("VC10/emergency/oxygen-sw",2);
		setprop("VC10/pressurization/safety-valve", 1);
		#####VC10.safety_valv_pos();
		setprop("VC10/pressurization/manual-mode-switch", 1);
		setprop("VC10/pressurization/mode-switch", 1);
		}
		
	setprop("controls/gear/brake-parking", park_brake);      ## brakes
    setprop("/controls/gear/gear-down", gear_down);		
    setprop("fdm/jsbsim/gear/gear-cmd-norm", gear_down);	
    setprop("/controls/flight/flaps", flaps);		
    setprop("fdm/jsbsim/fcs/flaps", flaps);
    setprop("controls/flight/rudder-trim", 0);
    setprop("fdm/jsbsim/fcs/pitch-trim-pos-deg", 0);
    setprop("controls/flight/aileron-trim", 0);
	
	for(var ci=0; ci<12; ci+=1) {
			var pers = getprop("sim/presets/payload/weight[" ~ ci ~ "]/pers");
			var lb = getprop("sim/presets/payload/weight[" ~ ci ~ "]/weight-lb");
			var kg = getprop("sim/presets/payload/weight[" ~ ci ~ "]/weight-kg");
			setprop("payload/weight[" ~ ci ~ "]/pers", pers);			
			setprop("payload/weight[" ~ ci ~ "]/weight-lb", lb);
			setprop("payload/weight[" ~ ci ~ "]/weight-kg", kg)
	  }
	   
    setprop("instrumentation/weu/state/takeoff-mode",0);
    if(var vbaro = getprop("environment/metar/pressure-inhg"))
        {
            setprop("instrumentation/altimeter/setting-inhg", vbaro);
            setprop("instrumentation/altimeter[1]/setting-inhg", vbaro);
            setprop("instrumentation/altimeter[2]/setting-inhg", vbaro);
        }
    # set ILS frequency
    var cur_runway = getprop("sim/presets/runway");
	var airport_id = getprop("sim/presets/airport-id") or nil;
	if (airport_id  != nil) {
    var runways = airportinfo(airportinfo(getprop("sim/presets/airport-id")).id).runways;
    var runway_keys = sort(keys(runways), string.icmp);
    var i = 0;
    foreach(var rwy; runway_keys)
        {
            var r = runways[rwy];
            if(cur_runway == rwy)
            {
                if (r.ils != nil)
                {
                    setprop("instrumentation/nav/frequencies/selected-mhz", (r.ils.frequency / 100));
                }
                break;
            }
            i += 1;
            if (i == 10)
                break;
        }
	}
			
	setprop("systems/electrical/switches/RadioNav/CompassGyro1","true");
	setprop("systems/electrical/switches/RadioNav/CompassGyro2","true");
	setprop("systems/electrical/switches/RadioNav/VertGyro1","true");
	setprop("systems/electrical/switches/RadioNav/VertGyro2","true");
	setprop("systems/electrical/switches/RadioNav/radio1","true");
	setprop("systems/electrical/switches/RadioNav/radio2","true");
	setprop("systems/electrical/switches/RadioNav/radio1Emergency","true");
	setprop("systems/electrical/switches/RadioNav/intercom","true");
	
#for pilots without knowledge of the compass control system set the the compass controler here	
	setprop("instrumentation/compass-control/mag/", 0);
	setprop("instrumentation/compass-control/lat-turn/", math.round(getprop("/position/latitude-deg")));
	
	print ("VC10 Reset Complete");
} # end function


##################################################################################
var ResetFDM = func{
print ("SIGNAL /sim/signals/fdm-initialized");
##    Initall();
 } ## end func

var ResetReinit = func{
print ("SIGNAL /sim/signals/reinit");
  Reset();	
  fgcommand('reinit', props.Node.new({ subsystem: "xml-autopilot" }));
 } ## end func
 
var Lreset = setlistener("/sim/signals/fdm-initialized",ResetFDM);
var Linit = setlistener("sim/signals/reinit", ResetReinit);