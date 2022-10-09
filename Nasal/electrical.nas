#################################################################################
#		Lake of Constance Hangar												#
#		Vickers VC10 for Flightgear												#
#		Copyright (C) 2013 M.Kraus												#	
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
#		<info (at) marc-kraus.de> April, 2017									#
#################################################################################
var count = 0;
var wait = 0;

props.globals.initNode("VC10/electric/ac/generator/gen1-drive-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/gen2-drive-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/gen3-drive-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/gen4-drive-sw",1,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/GC1-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GC2-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GC3-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GC4-sw",0,"INT");

props.globals.initNode("VC10/electric/ac/generator/GCR1-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR2-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR3-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR4-sw",0,"INT");

props.globals.initNode("VC10/electric/ac/SplitSystem_sw",0,"INT");
props.globals.initNode("VC10/electric/ac/GoundPowerSwitch_sw",0,"INT");
props.globals.initNode("VC10/electric/dc/StbyTRUsel_sw",0,"INT");

props.globals.initNode("VC10/electric/ac/FreqVoltsSelectsw",0,"INT");
props.globals.initNode("VC10/electric/ac/CSD_GenTempselsw",0,"INT");
props.globals.initNode("VC10/electric/ac/KW-KVARselsw",0,"INT");
props.globals.initNode("VC10/electric/dc/VoltsSelectsw",0,"INT");

props.globals.initNode("VC10/electric/dc/bat1_sw",1,"INT");
props.globals.initNode("VC10/electric/dc/bat2_sw",1,"INT");
props.globals.initNode("VC10/electric/dc/tru1_sw",1,"BOOL");
props.globals.initNode("VC10/electric/dc/tru2_sw",1,"BOOL");


props.globals.initNode("VC10/electric/dc/Galley1_sw",0,"BOOL");
props.globals.initNode("VC10/electric/dc/Galley2_sw",0,"BOOL");
props.globals.initNode("VC10/electric/dc/Galley3_sw",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/GCB1-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB2-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB3-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB4-ind",0,"INT");

props.globals.initNode("VC10/electric/ac/BTB1-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB2-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB3-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB4-ind",0,"INT");

props.globals.initNode("VC10/electric/ac/SSB-ind",0,"INT");

props.globals.initNode("VC10/electric/ac/AUXbus-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/TRU1power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/TRU2power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/StbyTRUpower-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/BAT1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/BAT2-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/NonEssDCbus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/NonEssDCbus2-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/StbyTRUdcBus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/StbyTRUdcBus2-ind",0,"INT");

var GroundPowerBus = props.globals.initNode("VC10/electric/gound-power-bus",0,"DOUBLE");

var No1EssDCBus = props.globals.initNode("VC10/electric/no1-essDC-bus",0,"DOUBLE");
var No1NonEssDCBus = props.globals.initNode("VC10/electric/no1-nonessDC-bus",0,"DOUBLE");
var No1BatBus = props.globals.initNode("VC10/electric/no1-bat-bus",0,"DOUBLE");
var No2EssDCBus = props.globals.initNode("VC10/electric/no2-essDC-bus",0,"DOUBLE");
var No2NonEssDCBus = props.globals.initNode("VC10/electric/no2-nonessDC-bus",0,"DOUBLE");
var No2BatBus = props.globals.initNode("VC10/electric/no2-bat-bus",0,"DOUBLE");

var No1GenACBus = props.globals.initNode("VC10/electric/no1-genAC-bus",0,"DOUBLE");
var No1GenControlDCBus = props.globals.initNode("VC10/electric/no1-gen1controlDC-bus",0,"DOUBLE");
var No2GenACBus = props.globals.initNode("VC10/electric/no2-genAC-bus",0,"DOUBLE");
var No2GenControlDCBus = props.globals.initNode("VC10/electric/no-gen2controlDC-bus",0,"DOUBLE");
var No3GenACBus = props.globals.initNode("VC10/electric/no3-genAC-bus",0,"DOUBLE");
var No3GenControlDCBus = props.globals.initNode("VC10/electric/no-gen3controlDC-bus",0,"DOUBLE");
var No4GenACBus = props.globals.initNode("VC10/electric/no4-genAC-bus",0,"DOUBLE");
var No4GenControlDCBus = props.globals.initNode("VC10/electric/no-gen4controlDC-bus",0,"DOUBLE");

var ACEmergELRATBus = props.globals.initNode("VC10/electric/ACEmergELRAT-bus",0,"DOUBLE");
var ACAuxBus = props.globals.initNode("VC10/electric/ACAux-bus",0,"DOUBLE");


####################################################################################################################
#                                        707 electrical system 
var EssDCbus = props.globals.initNode("VC10/electric/ess-bus",0,"DOUBLE");
var EssFreq = props.globals.initNode("VC10/electric/ess-freq",400,"DOUBLE"); #400Hz is standard
var EssPwr= props.globals.initNode("VC10/electric/ess-power-switch",0,"DOUBLE");
var EssSourceFailure = props.globals.initNode("VC10/electric/ess-source-failure",0,"BOOL");
var CabinDim = props.globals.initNode("systems/electrical/outputs/cabin-dim",0,"DOUBLE");
var PanelDim = props.globals.initNode("systems/electrical/outputs/panel-dim",0,"DOUBLE");
var OverheadDim = props.globals.initNode("systems/electrical/outputs/overhead-dim",0,"DOUBLE");
var EngineerDim = props.globals.initNode("systems/electrical/outputs/engineer-dim",0,"DOUBLE");

var LightLanding = props.globals.initNode("controls/lighting/switches/landing-light",0,"BOOL");
var LightLandingOne = props.globals.initNode("controls/lighting/switches/landing-light[1]",0,"BOOL");
var LightLandingTwo = props.globals.initNode("controls/lighting/switches/landing-light[2]",0,"BOOL");
var LightNav = props.globals.initNode("controls/lighting/switches/nav-lights",0,"BOOL");
var LightBeacon = props.globals.initNode("controls/lighting/switches/beacon",0,"BOOL");
var LightStrobe = props.globals.initNode("controls/lighting/switches/strobe",0,"BOOL");
var LightLogo = props.globals.initNode("controls/lighting/switches/logo-lights",0,"BOOL");

var PowermeterKnob = props.globals.initNode("VC10/electric/ac/generator/powermeter-knob",0,"BOOL");
var ExternalConnected = props.globals.initNode("VC10/electric/external-power-connected",0,"BOOL");
####################################################################################################################


var EssDCbus_volts = 0.0;
var EssDCbus_input=[];
var EssDCbus_output=[];
var EssDCbus_load=[];
var EssDCbus_service=[];

var ACSelector = props.globals.initNode("VC10/electric/ac/ac-para-select",0,"DOUBLE");
var syncLight1 = props.globals.initNode("VC10/electric/ac/acsync1",1,"BOOL");
var syncLight2 = props.globals.initNode("VC10/electric/ac/acsync2",1,"BOOL");
var ACSelFreq = props.globals.initNode("VC10/electric/ac/ac-sel-para-freq",0,"DOUBLE");
var ACSelVolts = props.globals.initNode("VC10/electric/ac/ac-sel-para-volts",0,"DOUBLE");


var strobe_switch = props.globals.getNode("controls/lighting/strobe", 1);
aircraft.light.new("controls/lighting/strobe-state", [0.05, 1.30], strobe_switch);
var beacon_switch = props.globals.getNode("controls/lighting/beacon", 1);
aircraft.light.new("controls/lighting/beacon-state", [0.05, 2.0], beacon_switch);
aircraft.light.new("VC10/warning", [1.0, 0.8]);


############## Helper ################
# random with limits
var my_rand = func(min,max) {
		  var min = min;
		  var max = max;
		  var r = 0;

			while( r < min or r > max ){
					r = rand() * max;
			}
			
		  return int(r);
}

# need for essential bus calculation
var ess_bus = func(bv) {
	var bus_volts = bv;
	var load = 0.0;
	var srvc = 0.0;

	for(var i=0; i<size(EssDCbus_input); i+=1) {
		srvc = EssDCbus_input[i].getValue();
		load += EssDCbus_load[i] * srvc;
		EssDCbus_output[i].setValue(bus_volts * srvc);

		if (EssDCbus_service[i] != nil) {
			if (bus_volts > 18.0)
				EssDCbus_service[i].setValue(1);
			else
				EssDCbus_service[i].setValue(0);
		}

	}
	return load;
}
######################################

#var battery = Battery.new(switch-prop,volts_output,ideal_volts,amps,amp_hours,charge_percent,charge_amps);
var Battery = {
    new : func(swtch,outvlt,vlt,amp,hr,chp,cha){
    m = { parents : [Battery] };
            m.switch = props.globals.getNode(swtch,1);
            m.switch.setBoolValue(0);
            m.actual_volts = props.globals.getNode(outvlt,1);
        		m.actual_volts.setDoubleValue(vlt);
            m.ideal_volts = vlt;
            m.ideal_amps = amp;
            m.amp_hours = hr;
            m.charge_percent = chp;
            m.charge_amps = cha;
    return m;
    },

    apply_load : func(load,dt) {
        if(me.switch.getValue()){
        var amphrs_used = load * dt / 3600.0;
        var percent_used = amphrs_used / me.amp_hours;
        me.charge_percent -= percent_used;
        if ( me.charge_percent < 0.0 ) {
            me.charge_percent = 0.0;
        } elsif ( me.charge_percent > 1.0 ) {
        me.charge_percent = 1.0;
        }
        var output =me.amp_hours * me.charge_percent;
        return output;
        }else return 0;
    },

    get_output_volts : func {
        if(me.switch.getValue()){
        var factor = 0.0000002;       
        var output = me.actual_volts.getValue() - me.actual_volts.getValue() * factor ;
        me.actual_volts.setValue(output);
        return output;
        }else return 0;
    }
};

# var generator = Generator.new(num,switch,gen_output,rpm_source,rpm_threshold,volts,amps);
var Generator = {
    new : func (num,switch,gen_output,src,thr,vlt,amp){
        m = { parents : [Generator] };
        m.gen_drive_switch = props.globals.getNode(switch,1);
        m.gen_drive_switch.setBoolValue(0);
        m.meter = props.globals.getNode("VC10/electric/ac/generator/gen-load["~num~"]",1);
        m.meter.setDoubleValue(0);
        m.gen_bus_tie = props.globals.getNode("VC10/electric/ac/generator/gen-bus-tie["~num~"]",1);
        m.gen_bus_tie.setDoubleValue(0);        
        m.gen_output = props.globals.getNode(gen_output,1);
        m.gen_output.setDoubleValue(0);
        m.rpm_source = props.globals.getNode(src,1);
        m.rpm_threshold = thr;
        m.ideal_volts = vlt;
        m.ideal_amps = amp;
        m.condition = my_rand(0.01,0.6);
        m.frequency = props.globals.getNode("VC10/electric/ac/generator/gen-freq["~num~"]",1);
        m.frequency.setDoubleValue(my_rand(386,418));
        m.gen_control = props.globals.getNode("VC10/electric/ac/generator/gen-control["~num~"]",1);
        m.gen_control.setDoubleValue(0);
        m.gen_breaker = props.globals.getNode("VC10/electric/ac/generator/gen-breaker["~num~"]",1);
        m.gen_breaker.setDoubleValue(0);
        m.gen_index = num;
        return m;
    },

    apply_load : func(load) {
        var cur_volt=me.gen_output.getValue();
        var cur_amp=me.meter.getValue();
        var freq = me.frequency.getValue();
        var gd = me.gen_drive_switch.getValue();
        if(cur_volt >1 and gd){
            var factor=1/cur_volt;
            gout = (load * factor) * freq/380; #380 hz is min
            if(gout>1)gout=1;
        }else{
            gout=0;
        }
        me.meter.setValue(gout);
    },

    get_output_volts : func {
        var out = 0;
        if(me.gen_drive_switch.getBoolValue() and getprop("engines/engine["~me.gen_index~"]/running") or 
          (me.gen_drive_switch.getBoolValue() and me.gen_index == 4)){
            var factor = me.rpm_source.getValue() / me.rpm_threshold or 0;
            if ( factor > 1.0 )factor = 1.0;
            var out = (me.ideal_volts * factor) + me.condition; #condition is only a random between 0.01 and 0.6
        }
        me.gen_output.setValue(out);
        return out;
    }    

};
###							switch-prop					volts_output		  ideal_volts,amps,amp_hours,charge_decimal,charge_amps);
var battery1 = Battery.new("VC10/electric/dc/bat1_sw","/VC10/electric/dc/bat1",28.0,30,25,1.0,7.0);
var battery2 = Battery.new("VC10/electric/dc/bat2_sw","/VC10/electric/dc/bat2",28.0,30,25,1.0,7.0);

var battery = Battery.new("VC10/electric/dc/battery-switch","/VC10/electric/dc/battery",24.6,30,34,1.0,7.0);

###                            num,switch,gen_output,                                      rpm_source,           rpm_threshold,volts,amps
var generator1 = Generator.new(0,"VC10/electric/ac/generator/gen-drive[0]","/engines/engine[0]/amp-v","/engines/engine[0]/n1",20.0,28.0,60.0);
var generator2 = Generator.new(1,"VC10/electric/ac/generator/gen-drive[1]","/engines/engine[1]/amp-v","/engines/engine[1]/n1",20.0,28.0,60.0);
var generator3 = Generator.new(2,"VC10/electric/ac/generator/gen-drive[2]","/engines/engine[2]/amp-v","/engines/engine[2]/n1",20.0,28.0,60.0);
var generator4 = Generator.new(3,"VC10/electric/ac/generator/gen-drive[3]","/engines/engine[3]/amp-v","/engines/engine[3]/n1",20.0,28.0,60.0);
var generator5 = Generator.new(4,"VC10/electric/ac/generator/gen-drive[4]","/engines/APU/amp-v","/engines/APU/rpm",80.0,26.0,60.0);

var TRU1 = Generator.new(0,"VC10/electric/ac/generator/gen-drive[0]","/engines/engine[0]/amp-v","/engines/engine[0]/n1",20.0,28.0,60.0);


#####################################

var init_switches = func{
    props.globals.getNode("systems/electrical/serviceable",0,"BOOL");
    setprop("controls/lighting/panel-norm",0.0);
    setprop("controls/lighting/cabin-dim",0.0);
    setprop("controls/lighting/engineer-dim",0.0);
    setprop("controls/lighting/overhead-dim",0.0);
    
    var AVswitch=props.globals.initNode("controls/electric/avionics-switch",1,"BOOL");
    setprop("controls/lighting/efis-norm",0.8); 
    
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/KNS80",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, nil);
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/efis",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, nil);
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/adf[0]",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/adf[0]/serviceable",0,"BOOL"));
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/adf[1]",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/adf[1]/serviceable",0,"BOOL"));
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/dme[0]",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/dme[0]/serviceable",0,"BOOL"));
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/dme[1]",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/dme[1]/serviceable",0,"BOOL"));
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/gps",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, nil);
    append(EssDCbus_input,AVswitch); 
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/DG",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, nil);
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/transponder",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, nil);
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/mk-viii",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, nil);
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/turn-coordinator",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, nil);
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/comm[0]",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/comm[0]/serviceable",0,"BOOL"));
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/comm[1]",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/comm[1]/serviceable",0,"BOOL"));
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/nav[0]",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/nav[0]/serviceable",0,"BOOL"));
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/nav[1]",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/nav[1]/serviceable",0,"BOOL"));
    append(EssDCbus_input,AVswitch);
    append(EssDCbus_output,props.globals.initNode("systems/electrical/outputs/marker-beacon",0,"DOUBLE"));
    append(EssDCbus_load,1);
    append(EssDCbus_service, props.globals.initNode("instrumentation/marker-beacon/serviceable",0,"BOOL"));

##    append(EssDCbus_service, props.globals.initNode("instrumentation/marker-beacon/inner",0,"BOOL"));
##    append(EssDCbus_service, props.globals.initNode("instrumentation/marker-beacon/middle",0,"BOOL"));
##    append(EssDCbus_service, props.globals.initNode("instrumentation/marker-beacon/outer",0,"BOOL"));
}

var load = 0.0;
var power_source = nil;
var essdcbus_volts = 0;

var update_virtual_bus = func {
		  var PWR = getprop("systems/electrical/serviceable");
		  load = 0.0;
		  power_source = nil;
		  EssSourceFailure.setBoolValue(1);

		  if(getprop("velocities/groundspeed-kt") > 12 or 
		  	(getprop("controls/engines/engine[0]/reverser") and getprop("/controls/engines/engine[0]/throttle") > 0.2)){
		  		ExternalConnected.setBoolValue(0);
		    	setprop("instrumentation/doors/pasfront/position-norm", 0);
		    	setprop("instrumentation/doors/pasrear/position-norm", 0);
		    	setprop("instrumentation/doors/cargo/position-norm", 0);
		    	setprop("instrumentation/doors/belly/position-norm", 0);
		    	setprop("instrumentation/doors/nose/position-norm", 0);
				setprop("VC10/ground-service/fuel-truck/transfer", 0);
				setprop("VC10/ground-service/fuel-truck/connect", 0);
				setprop("VC10/ground-service/fuel-truck/enable", 0);
				setprop("VC10/ground-service/fuel-truck/clean", 0);
				setprop("VC10/ground-service/fuel-truck/state", 0);
		  }
		  
		  if(battery.switch.getBoolValue()){		  
				if (EssPwr.getValue() == 5 and ExternalConnected.getBoolValue()){
					  power_source = "External Power";
					  essdcbus_volts = 27.5;
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(essdcbus_volts > battery.actual_volts.getValue()){
					  	battery.actual_volts.setDoubleValue(battery.actual_volts.getValue() + 0.0005);
					  }		  
					  if(!getprop("VC10/electric/ground-connect")){
							if(!generator1.get_output_volts()){
								generator1.gen_bus_tie.setValue(0);		
							}
							if(!generator2.get_output_volts()){
								generator2.gen_bus_tie.setValue(0);		
							}
							if(!generator3.get_output_volts()){
								generator3.gen_bus_tie.setValue(0);		
							}
							if(!generator4.get_output_volts()){
								generator4.gen_bus_tie.setValue(0);		
							}					  
					  }
					  
				}elsif (EssPwr.getValue() == 4 and generator4.get_output_volts() and generator4.gen_bus_tie.getValue() and generator4.gen_breaker.getValue() and generator4.gen_control.getValue()){
					  power_source = "Generator4";
					  essdcbus_volts = generator4.get_output_volts();
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(battery.switch.getBoolValue() and essdcbus_volts > battery.actual_volts.getValue()){
					  	battery.actual_volts.setDoubleValue(battery.actual_volts.getValue() + 0.0005);
					  }
				}elsif (EssPwr.getValue() == 3 and generator3.get_output_volts() and generator3.gen_bus_tie.getValue() and generator3.gen_breaker.getValue() and generator3.gen_control.getValue()){
					  power_source = "Generator3";
					  essdcbus_volts = generator3.get_output_volts();
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(battery.switch.getBoolValue() and essdcbus_volts > battery.actual_volts.getValue()){
					  	battery.actual_volts.setDoubleValue(battery.actual_volts.getValue() + 0.0005);
					  }
				}elsif (EssPwr.getValue() == 2 and generator2.get_output_volts() and generator2.gen_bus_tie.getValue() and generator2.gen_breaker.getValue() and generator2.gen_control.getValue()){
					  power_source = "Generator2";
					  essdcbus_volts = generator2.get_output_volts();
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(battery.switch.getBoolValue() and essdcbus_volts > battery.actual_volts.getValue()){
					  	battery.actual_volts.setDoubleValue(battery.actual_volts.getValue() + 0.0005);
					  }
				}elsif (EssPwr.getValue() == 1 and generator1.get_output_volts() and generator1.gen_bus_tie.getValue() and generator1.gen_breaker.getValue() and generator1.gen_control.getValue()){
					  power_source = "Generator1";
					  essdcbus_volts = generator1.get_output_volts();
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(battery.switch.getBoolValue() and essdcbus_volts > battery.actual_volts.getValue()){
					  	battery.actual_volts.setDoubleValue(battery.actual_volts.getValue() + 0.0005);
					  }
				}else{
						settimer(func{ setprop("VC10/electric/ground-connect", 0);}, 0.2);
					  power_source = "APU";
					  essdcbus_volts = generator5.get_output_volts();
						if(generator5.get_output_volts() and EssPwr.getValue() == 0){
							 EssSourceFailure.setBoolValue(0);
						}else{
							if(!generator1.get_output_volts()){
								generator1.gen_bus_tie.setValue(0);		
							}
							if(!generator2.get_output_volts()){
								generator2.gen_bus_tie.setValue(0);		
							}
							if(!generator3.get_output_volts()){
								generator3.gen_bus_tie.setValue(0);		
							}
							if(!generator4.get_output_volts()){
								generator4.gen_bus_tie.setValue(0);		
							}					  
					  }
					  #recharge
					  if(battery.switch.getBoolValue() and essdcbus_volts > battery.actual_volts.getValue()){
					  	battery.actual_volts.setDoubleValue(battery.actual_volts.getValue() + 0.0005);
					  }
				}

				# bus-tie fall back on freq problems
				if(generator1.get_output_volts() and EssFreq.getValue() != generator1.frequency.getValue()){
					generator1.gen_bus_tie.setValue(0);		
				}
				if(generator2.get_output_volts() and EssFreq.getValue() != generator2.frequency.getValue()){
					generator2.gen_bus_tie.setValue(0);		
				}
				if(generator3.get_output_volts() and EssFreq.getValue() != generator3.frequency.getValue()){
					generator3.gen_bus_tie.setValue(0);		
				}
				if(generator4.get_output_volts() and EssFreq.getValue() != generator4.frequency.getValue()){
					generator4.gen_bus_tie.setValue(0);		
				}
				
				if (!generator1.gen_drive_switch.getBoolValue()){
					generator1.gen_bus_tie.setValue(0); 
					generator1.gen_breaker.setValue(0); 
					generator1.gen_control.setValue(0); 
				}
				if (!generator2.gen_drive_switch.getBoolValue()){
					generator2.gen_bus_tie.setValue(0); 
					generator2.gen_breaker.setValue(0); 
					generator2.gen_control.setValue(0); 
				}				
				if (!generator3.gen_drive_switch.getBoolValue()){
					generator3.gen_bus_tie.setValue(0); 
					generator3.gen_breaker.setValue(0); 
					generator3.gen_control.setValue(0); 
				}				
				if (!generator4.gen_drive_switch.getBoolValue()){
					generator4.gen_bus_tie.setValue(0); 
					generator4.gen_breaker.setValue(0); 
					generator4.gen_control.setValue(0); 
				}				
				
			}else{
				EssSourceFailure.setBoolValue(1);
				essdcbus_volts = 0;
			}

		  if(battery.switch.getBoolValue() and essdcbus_volts < 24){
		  	EssSourceFailure.setBoolValue(1);
		  	power_source = "battery";	
			essdcbus_volts = battery.get_output_volts();	  
		  }
		  
		  if (essdcbus_volts < 20 and count == 60){ 
		  		# most switches fall back if ess-buss is low
					setprop("VC10/electric/ac/generator/gen-drive[0]",0);
					setprop("VC10/electric/ac/generator/gen-drive[1]",0);
					setprop("VC10/electric/ac/generator/gen-drive[2]",0);
					setprop("VC10/electric/ac/generator/gen-drive[3]",0);
					setprop("VC10/electric/ac/generator/gen-drive[4]",0); #APU
					setprop("VC10/apu/off-start-run",0);
					setprop("VC10/apu/apu-bleed-valve",0);
					setprop("VC10/electric/ground-connect",0);
					setprop("VC10/electric/ac/generator/gen-bus-tie[0]",0);
					setprop("VC10/electric/ac/generator/gen-bus-tie[1]",0);
					setprop("VC10/electric/ac/generator/gen-bus-tie[2]",0);
					setprop("VC10/electric/ac/generator/gen-bus-tie[3]",0);
					setprop("VC10/electric/ac/generator/gen-breaker[0]",0);
					setprop("VC10/electric/ac/generator/gen-breaker[1]",0);
					setprop("VC10/electric/ac/generator/gen-breaker[2]",0);
					setprop("VC10/electric/ac/generator/gen-breaker[3]",0);
					setprop("VC10/electric/ac/generator/gen-control[0]",0);
					setprop("VC10/electric/ac/generator/gen-control[1]",0);
					setprop("VC10/electric/ac/generator/gen-control[2]",0);
					setprop("VC10/electric/ac/generator/gen-control[3]",0);
					ACSelFreq.setValue(0);
					ACSelVolts.setValue(0);
					count = 0;
		  }
		  
		  essdcbus_volts *=PWR; # if system is not serviceable PWR is zero
		  EssDCbus.setValue(essdcbus_volts);
		  load += ess_bus(essdcbus_volts);

		  var dim = getprop("controls/lighting/cabin-dim") or 0;
		  dim = dim*essdcbus_volts/24;
		  CabinDim.setValue(dim);

		  var pdim = getprop("controls/lighting/panel-norm") or 0;
		  pdim = pdim*essdcbus_volts/24;
		  pdim = (pdim >= dim) ? pdim : dim; # if cabin light is stronger than panel dim
		  PanelDim.setValue(pdim);
		  
		  var odim = getprop("controls/lighting/overhead-dim") or 0;
		  odim = odim*essdcbus_volts/24;
		  odim = (odim >= dim) ? odim : dim; # if cabin light is stronger than overhead dim
		  OverheadDim.setValue(odim);
		  
		  var edim = getprop("controls/lighting/engineer-dim") or 0;
		  edim = edim*essdcbus_volts/24;
		  edim = (edim >= dim) ? edim : dim; # if cabin light is stronger than engineer dim
		  EngineerDim.setValue(edim);
		  
		  # if lightswitches are set
	  	if(LightLanding.getBoolValue() and essdcbus_volts > 20){
	  		setprop("controls/lighting/landing-light", 1);
	  	}else{
	  		setprop("controls/lighting/landing-light", 0);
	  	}
	  	
	  	if(LightLandingOne.getBoolValue() and essdcbus_volts > 20){
	  		setprop("controls/lighting/landing-light[1]", 1);
	  	}else{
	  		setprop("controls/lighting/landing-light[1]", 0);
	  	}
	  		  
	  	if(LightLandingTwo.getBoolValue() and essdcbus_volts > 20){
	  		setprop("controls/lighting/landing-light[2]", 1);
	  	}else{
	  		setprop("controls/lighting/landing-light[2]", 0);
	  	}
	  		  
	  	if(LightNav.getBoolValue() and essdcbus_volts > 20){
	  		setprop("controls/lighting/nav-lights", 1);
	  	}else{
	  		setprop("controls/lighting/nav-lights", 0);
	  	}
	  		  
	  	if(LightBeacon.getBoolValue() and essdcbus_volts > 20){
	  		setprop("controls/lighting/beacon", 1);
	  	}else{
	  		setprop("controls/lighting/beacon", 0);
	  	}
	  		  
	  	if(LightStrobe.getBoolValue() and essdcbus_volts > 20){
	  		setprop("controls/lighting/strobe", 1);
	  	}else{
	  		setprop("controls/lighting/strobe", 0);
	  	}
	  		  
	  	if(LightLogo.getBoolValue() and essdcbus_volts > 20){
	  		setprop("controls/lighting/logo-lights", 1);
	  	}else{
	  		setprop("controls/lighting/logo-lights", 0);
	  	}

		  generator1.apply_load(load);
		  generator2.apply_load(load);
		  generator3.apply_load(load);
		  generator4.apply_load(load);
		  generator5.apply_load(load); # APU
		  
		  generator1.get_output_volts();
		  generator2.get_output_volts();
		  generator3.get_output_volts();
		  generator4.get_output_volts();
		  generator5.get_output_volts();

			count += 1;
			################################### only print function #####################
			#if(count == 500){
			#	print("power source "~power_source);
			#	count = 0;
			#}
			#############################################################################
			
			# ground control - we are on water 
			var lat = getprop("position/latitude-deg");
			var lon = getprop("position/longitude-deg");
			var swim = props.globals.getNode("VC10/over-water");
			var info = geodinfo(lat, lon);
			if (info != nil) {
				if (info[1] != nil and info[1].solid !=nil){
					if (!info[1].solid){
					  swim.setBoolValue(1);
					}else{
					  swim.setBoolValue(0);
					}
				}     
			}

	return load;
}
#### END of update_electrical ####

var update_electrical = func {
  update_virtual_bus();
	settimer(update_electrical, 0);
}

################################## more generator helpers #######################################
var sync_lamp = func(ref, in){
	if(in > ref){
		 syncLight1.setValue(1);
		 syncLight2.setValue(0);
	}elsif(in < ref){
		 syncLight1.setValue(0);
		 syncLight2.setValue(1);
	}else{
		 syncLight1.setValue(0);
		 syncLight2.setValue(0);
	}
}

######################## ac paralleling #########################
var ac_sync = func{		  
		  if (battery.switch.getBoolValue() and essdcbus_volts > 20){ 

				syncLight1.setValue(1);
				syncLight2.setValue(1);
				
				# APU automatic sync if Ess Power is on APU and AC Paralleling Sel on APU
				if(ACSelector.getValue() == 0 and EssPwr.getValue() == 0 and 
					 generator5.gen_output.getValue() > 20 and generator5.gen_drive_switch.getBoolValue()){

						var apfreq = generator5.frequency.getValue();
						
						if(apfreq > 400){
							apfreq -= 1;
							settimer(ac_sync, 0); #loop
						}elsif(apfreq < 400){
							apfreq += 1;
							settimer(ac_sync, 0); #loop
						}else{
							apfreq = 400;
						}
						
						apfreq = int(apfreq);
						
		 				sync_lamp(EssFreq.getValue(),apfreq);
						generator5.frequency.setValue(apfreq);
					 	ACSelFreq.setValue(apfreq);
					 	ACSelVolts.setValue(generator5.gen_output.getValue());

						

				# Generator 1
				}elsif(ACSelector.getValue() == 1 and generator1.gen_output.getValue() > 20 and
											 				 generator1.gen_drive_switch.getBoolValue() and 
											 				 generator1.gen_control.getBoolValue() and 
											 				 generator1.gen_breaker.getBoolValue()){
						ACSelFreq.setValue(generator1.frequency.getValue());
					 	ACSelVolts.setValue(generator1.gen_output.getValue()); 
						sync_lamp(EssFreq.getValue(),generator1.frequency.getValue());
				# Generator 2		
				}elsif(ACSelector.getValue() == 2 and generator2.gen_output.getValue() > 20 and
											 				 generator2.gen_drive_switch.getBoolValue() and 
											 				 generator2.gen_control.getBoolValue() and 
											 				 generator2.gen_breaker.getBoolValue()){
						ACSelFreq.setValue(generator2.frequency.getValue());
					 	ACSelVolts.setValue(generator2.gen_output.getValue());
						sync_lamp(EssFreq.getValue(),generator2.frequency.getValue());
				# SYNC BUS		
				}elsif(ACSelector.getValue() == 3){
						ACSelFreq.setValue(EssFreq.getValue());
					 	ACSelVolts.setValue(EssDCbus.getValue());
						sync_lamp(EssFreq.getValue(),EssFreq.getValue());
				# Generator 3		
				}elsif(ACSelector.getValue() == 4 and generator3.gen_output.getValue() > 20 and
											 				 generator3.gen_drive_switch.getBoolValue() and 
											 				 generator3.gen_control.getBoolValue() and 
											 				 generator3.gen_breaker.getBoolValue()){
						ACSelFreq.setValue(generator3.frequency.getValue());
					 	ACSelVolts.setValue(generator3.gen_output.getValue());
						sync_lamp(EssFreq.getValue(),generator3.frequency.getValue());
				# Generator 4		
				}elsif(ACSelector.getValue() == 5 and generator4.gen_output.getValue() > 20 and
											 				 generator4.gen_drive_switch.getBoolValue() and 
											 				 generator4.gen_control.getBoolValue() and 
											 				 generator4.gen_breaker.getBoolValue()){
						ACSelFreq.setValue(generator4.frequency.getValue());
					 	ACSelVolts.setValue(generator4.gen_output.getValue());
						sync_lamp(EssFreq.getValue(),generator4.frequency.getValue());
				# External Power		
				}elsif(ACSelector.getValue() == 6 and EssPwr.getValue() == 5 ){
				  var extGCcon = getprop("VC10/electric/external-power-connected") or 0;
				  if(extGCcon and ACSelVolts.getValue() != 27.5){
						interpolate("VC10/electric/ac/ac-sel-para-freq", EssFreq.getValue(), 1.2);
						ACSelVolts.setValue(27.5);
					}
					sync_lamp(EssFreq.getValue(),EssFreq.getValue());
				  
				}else{
					ACSelFreq.setValue(0);
					ACSelVolts.setValue(0);			
				}
			}
};

# the control
setlistener("VC10/electric/ac/ac-para-select", func{
	var bat = getprop("VC10/electric/dc/battery-switch") or 0;
	var src_ext = getprop("VC10/electric/ess-power-switch") or 0;

	if(bat and src_ext == 0){
		ACSelFreq.setValue(0);
		ACSelVolts.setValue(0);
		settimer(ac_sync,0);
	}else{
		settimer(ac_sync,0);
	}
	
},1,0);

# knob is on the AC Paralleling instrument
setlistener("VC10/electric/ac/generator/residual-volts-knob", func(state){
	if(state.getBoolValue()){
		ACSelVolts.setValue(ACSelVolts.getValue()*1.3);
	}else{
		settimer(ac_sync,0);	
	}
},1,0);

################################## Volt and load Selector ######################################

var vlLoop = func{
	var esstr = getprop("VC10/electric/ess-bus") or 0;
	var tr2 = getprop("engines/engine[1]/amp-v") or 0;
	var tr3 = getprop("engines/engine[2]/amp-v") or 0;
	var tr4 = getprop("engines/engine[3]/amp-v") or 0;
	var bat_load = getprop("VC10/electric/dc/battery") or 0;
	var bat = getprop("VC10/electric/dc/battery-switch") or 0;	
	var select = getprop("VC10/electric/load-volt-selector") or 0;
	
	if (bat and select == 1){
			interpolate("VC10/electric/dc/volt-dc", esstr, 1.8);
			esstr = esstr*100/25; # load in percent
			interpolate("VC10/electric/dc/volt-load", esstr, 1.8);
			settimer(vlLoop ,1.8);
	}elsif (bat and select == 2){
			interpolate("VC10/electric/dc/volt-dc", tr2, 1.8);
			tr2 = tr2*100/25; # load in percent
			interpolate("VC10/electric/dc/volt-load", tr2, 1.8);
			settimer(vlLoop ,1.8);
	}elsif (bat and select == 3){
			interpolate("VC10/electric/dc/volt-dc", tr3, 1.8);
			tr3 = tr3*100/25; # load in percent
			interpolate("VC10/electric/dc/volt-load", tr3, 1.8);
			settimer(vlLoop ,1.8);
	}elsif (bat and select == 4){
			interpolate("VC10/electric/dc/volt-dc", tr4, 1.8);
			tr4 = tr4*100/25; # load in percent
			interpolate("VC10/electric/dc/volt-load", tr4, 1.8);
			settimer(vlLoop ,1.8);
	}elsif (bat and select == 5){
			interpolate("VC10/electric/dc/volt-dc", bat_load, 1.8);
			bat_load = bat_load*100/25; # load in percent
			interpolate("VC10/electric/dc/volt-load", bat_load, 1.8);
			settimer(vlLoop ,1.8);
	}else{
			interpolate("VC10/electric/dc/volt-load", 0, 1.8);
			interpolate("VC10/electric/dc/volt-dc", 0, 1.2);
	}

};

# the control
setlistener("VC10/electric/load-volt-selector", func{
		vlLoop();
		settimer(ac_sync,0);
},1,0);

##################### do as it is kvar or kw ########################
var gen_kw = func{
		var pm = PowermeterKnob.getBoolValue();
		var gl1 = getprop("engines/engine[0]/amp-v") or 0;
		var gl2 = getprop("engines/engine[1]/amp-v") or 0;
		var gl3 = getprop("engines/engine[2]/amp-v") or 0;
		var gl4 = getprop("engines/engine[3]/amp-v") or 0;
		
		if(gl1){
		  if(!pm){
		  	interpolate("engines/engine[0]/kw", gl1, 2);
		  }else{
		  	var kvars = gl1 + gl1 * 0.36;
		  	interpolate("engines/engine[0]/kw", kvars, 2);		  
		  }
		}else{
			interpolate("engines/engine[0]/kw", 0, 0.5);
		}
		if(gl2){
		  if(!pm){
		  	interpolate("engines/engine[1]/kw", gl2, 2);
		  }else{
		  	var kvars = gl2 + gl2 * 0.24;
		  	interpolate("engines/engine[1]/kw", kvars, 2);		  
		  }
		}else{
			interpolate("engines/engine[1]/kw", 0, 0.6);
		}
		if(gl3){
		  if(!pm){
		  	interpolate("engines/engine[2]/kw", gl3, 2);
		  }else{
		  	var kvars = gl3 + gl3 * 0.30;
		  	interpolate("engines/engine[2]/kw", kvars, 2);		  
		  }
		}else{
			interpolate("engines/engine[2]/kw", 0, 0.4);
		}
		if(gl4){
		  if(!pm){
		  	interpolate("engines/engine[3]/kw", gl4, 2);
		  }else{
		  	var kvars = gl4 + gl4 * 0.42;
		  	interpolate("engines/engine[3]/kw", kvars, 2);		  
		  }
		}else{
			interpolate("engines/engine[3]/kw", 0, 0.6);
		}
		settimer( gen_kw, 2);
}


################ the ground connect switch fall back ###################
setlistener("VC10/electric/external-power-connected", func(state){
  var state = state.getBoolValue();
  if(state)	setprop("VC10/ground-service/enabled", 1); #iluminate the lights of VW Bus
	var src_ext = getprop("VC10/electric/ess-power-switch") or 0;
	# if external power connected when apu is operating, apu shutdown
	setprop("VC10/apu/off-start-run", 0);
	generator5.gen_drive_switch.setValue(0);
	
	if(src_ext == 5){
		ACSelFreq.setValue(0);
		ACSelVolts.setValue(0);	
		settimer(ac_sync,0);
	}else{
		settimer(ac_sync,0);
	}

 	setprop("VC10/electric/ground-connect", 0);
 	
	if(getprop("sim/sound/switch2") == 1){
  	 setprop("sim/sound/switch2", 0); 
  }else{
  	 setprop("sim/sound/switch2", 1);
  }

},0,0);


################################# APU loop function #####################################
# the APU helper for smooth view on Amperemeter
var apu_gen_switch = func {
		var bt = props.globals.getNode("VC10/electric/ac/generator/gen-drive[4]", 1);
  	if(bt.getBoolValue()){
  		interpolate("engines/APU/amp-Needle",0,2);
  		bt.setBoolValue(0);
  		settimer(ac_sync,0);
  	}else{
  	  bt.setBoolValue(1);
  		settimer(func{  		
  			var amps = getprop("engines/APU/amp-v") or 0;
  			interpolate("engines/APU/amp-Needle",amps,2);
  			settimer(ac_sync,0); 
  		},0.8);
  	}
  	
		ACSelFreq.setValue(0);
		ACSelVolts.setValue(0);
}

var apuLoop = func{

	if (getprop("engines/APU/rpm") >= 80) {
		setprop("engines/APU/serviceable",1);
	} else {
		setprop("engines/APU/serviceable",0);
	}

	var setting = getprop("VC10/apu/off-start-run") or 0;
	var generator = getprop("VC10/electric/ac/generator/gen-drive[4]") or 0;

 	# rpm and running
 	if (setting != 0){
		if (setting == 1){
		 var rpm = getprop("engines/APU/rpm");
		 rpm += getprop("/sim/time/delta-realtime-sec") * 7;
		 if (rpm >= 101.7){
		  	rpm = 101.7;
				setprop("VC10/apu/off-start-run",2); # automatic spring for the apu-master-switch
				if(getprop("sim/sound/switch2") == 1){
					 setprop("sim/sound/switch2", 0); 
				}else{
					 setprop("sim/sound/switch2", 1);
				}
		  }
		 setprop("engines/APU/rpm", rpm);
		 
		}elsif (setting == 2 and getprop("engines/APU/rpm") >= 80){
		 props.globals.getNode("engines/APU/running").setBoolValue(1);
		}
		
  }else{
  	props.globals.getNode("engines/APU/running").setBoolValue(0);

		var rpm = getprop("engines/APU/rpm");
		rpm -= getprop("/sim/time/delta-realtime-sec") * 5;
		if (rpm < 0){
   		rpm = 0;
   	}
  	setprop("engines/APU/rpm", rpm);
  }
  
  # the apu temperature
  if (getprop("engines/APU/rpm") >= 40){

		 var temp = getprop("engines/APU/temp") or 0;
		 var abv = getprop("VC10/apu/apu-bleed-valve") or 0;
		 if(!generator){
			 temp += getprop("/sim/time/delta-realtime-sec") * 4;
			 if (temp >= 410){
				temp -= getprop("/sim/time/delta-realtime-sec") * 6;
				}
			}elsif(abv){
			 temp += getprop("/sim/time/delta-realtime-sec") * 6;
			 if (temp >= 590){
				temp -= getprop("/sim/time/delta-realtime-sec") * 8;
				}
			}else{
			 temp += getprop("/sim/time/delta-realtime-sec") * 8;
			 if (temp >= 780){
				temp -= getprop("/sim/time/delta-realtime-sec") * 10;
				}
			}
		 setprop("engines/APU/temp", temp);

  }else{
		var temp = getprop("engines/APU/temp") or 0;
		temp -= getprop("/sim/time/delta-realtime-sec") * 3;
	 	if (temp < 0){
		 temp = 0;
		}
		setprop("engines/APU/temp", temp);
  }

	
	 if (setting or temp > 5) {
	 		settimer(apuLoop, 0);
	 }
 };

setlistener("VC10/apu/starter", func (state){
    var state = state.getValue() or 0;
  	if(state == 1){
  		setprop("VC10/apu/off-start-run", 1);
  		# fall back, if external power source is connected or ess-bus to low
  		var ext_con = getprop("VC10/electric/external-power-connected") or 0;
  		
  		if(ext_con){
  			settimer(func{
					setprop("VC10/apu/off-start-run", 0);
  				setprop("VC10/electric/ac/generator/gen-drive[4]", 0);
				}, 0.5);  		
			}else{
  			VC10.apuLoop();
  		}

  	}else{
  		
  		setprop("VC10/apu/off-start-run", 0);
  		setprop("VC10/electric/ac/generator/gen-drive[4]", 0);
  	}
  	
		if(getprop("sim/sound/switch2") == 1){
			setprop("sim/sound/switch2", 0); 
		}else{
			setprop("sim/sound/switch2", 1);
		} 
}); 
 
##############################################################################################
setlistener("sim/signals/fdm-initialized", func {
    init_switches();
    settimer(update_electrical,5);
    settimer(gen_kw,5);
    settimer(ac_sync,5);
    settimer(func{ setprop("VC10/fuel/temperature", getprop("/environment/temperature-degc")) } , 5);
    
    print("Electrical System ... Initialised");
    
    setprop("controls/engines/msg", 1);
});

##########  ATTENTION: The setlistener for the /engines/engine[x]/running you will find in the autostart.nas

# switch back the lights, if there is now power on ess-bus
setlistener("controls/lighting/landing-light", func {
    var bat = getprop("VC10/electric/ess-bus") or 0;
    if(bat < 20) setprop("controls/lighting/landing-light", 0);
});
setlistener("controls/lighting/landing-light[1]", func {
    var bat = getprop("VC10/electric/ess-bus") or 0;
    if(bat < 20) setprop("controls/lighting/landing-light[1]", 0);
});
setlistener("controls/lighting/landing-light[2]", func {
    var bat = getprop("VC10/electric/ess-bus") or 0;
    if(bat < 20) setprop("controls/lighting/landing-light[2]", 0);
});