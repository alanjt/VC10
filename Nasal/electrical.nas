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

props.globals.initNode("VC10/electric/ac/generator/GenDrv1-Guard",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv2-Guard",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv3-Guard",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv4-Guard",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/GenDrv1-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv2-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv3-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv4-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-switch",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/GenDrv1",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv2",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv3",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrv4",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenDrvELRAT",1,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/GCR1-sw",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR2-sw",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR3-sw",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR4-sw",1,"INT");

props.globals.initNode("VC10/electric/ac/generator/GCR1_relay",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR2_relay",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR3_relay",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR4_relay",1,"INT");

props.globals.initNode("VC10/electric/ac/generator/GCB1-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB2-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB3-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB4-sw",0,"INT");

props.globals.initNode("VC10/electric/ac/generator/GCB1",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB2",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB3",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB4",0,"INT");

props.globals.initNode("VC10/electric/ac/generator/Gen1-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen2-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen3-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen4-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-volts",0,"DOUBLE");

props.globals.initNode("VC10/electric/ac/generator/Gen1-kw",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen2-kw",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen3-kw",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen4-kw",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-kw",0,"DOUBLE");

props.globals.initNode("VC10/electric/ac/generator/Gen1-kvar",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen2-kvar",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen3-kvar",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen4-kvar",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-kvar",0,"DOUBLE");

props.globals.initNode("VC10/electric/ac/SSB-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/GroundPower-switch",0,"INT");
props.globals.initNode("VC10/electric/ac/GroundBreaker",0,"INT");

props.globals.initNode("VC10/electric/ac/FreqVoltsSelectsw",0,"INT");
props.globals.initNode("VC10/electric/ac/CSD_GenTempselsw",0,"INT");
props.globals.initNode("VC10/electric/ac/KW-KVARselsw",0,"INT");
props.globals.initNode("VC10/electric/dc/VoltsSelectsw",0,"INT");

props.globals.initNode("VC10/electric/ac/generator/GCB1-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB2-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB3-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB4-ind",0,"INT");

props.globals.initNode("VC10/electric/ac/BTB1-relay",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB2-relay",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB3-relay",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB4-relay",0,"INT");
props.globals.initNode("VC10/electric/ac/SSB",0,"INT");

props.globals.initNode("VC10/electric/ac/AUXbus-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/bat1-switch",1,"INT");
props.globals.initNode("VC10/electric/dc/bat2-switch",1,"INT");
props.globals.initNode("VC10/electric/dc/BAT1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/BAT2-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/TRU1-switch",1,"BOOL");
props.globals.initNode("VC10/electric/dc/TRU2-switch",1,"BOOL");
props.globals.initNode("VC10/electric/dc/StbyTRU-switch",0,"INT");

props.globals.initNode("VC10/electric/dc/generatorTRU1power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/generatorTRU2power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/generatorStbyTRUpower-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/generatorTRU1-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/dc/generatorTRU2-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/dc/generatorStbyTRU-volts",0,"DOUBLE");

props.globals.initNode("VC10/electric/dc/StbyTRUdcBus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/StbyTRUdcBus2-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/NonEssDCbus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/NonEssDCbus2-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/Galley1-switch",0,"BOOL");
props.globals.initNode("VC10/electric/dc/Galley2-switch",0,"BOOL");
props.globals.initNode("VC10/electric/dc/Galley3-switch",0,"BOOL");


var No1ACbus_volts = props.globals.initNode("VC10/electric/ac/no1-AC-bus-volts",0,"DOUBLE");
var No2ACbus_volts = props.globals.initNode("VC10/electric/ac/no2-AC-bus-volts",0,"DOUBLE");
var No3ACbus_volts = props.globals.initNode("VC10/electric/ac/no3-AC-bus-volts",0,"DOUBLE");
var No4ACbus_volts = props.globals.initNode("VC10/electric/ac/no4-AC-bus-volts",0,"DOUBLE");

var ACEmergbus_volts = props.globals.initNode("VC10/electric/ac/ACEmerg-bus-volts",0,"DOUBLE");
var ACAuxbus_volts = props.globals.initNode("VC10/electric/ac/ACAux-bus-volts",0,"DOUBLE");
var GroundPowerbus_volts = props.globals.initNode("VC10/electric/ac/gound-power-bus-volts",0,"DOUBLE");

var No1EssDCbus_volts = props.globals.initNode("VC10/electric/dc/no1-essDC-bus-volts",0,"DOUBLE");
var No2EssDCbus_volts = props.globals.initNode("VC10/electric/dc/no2-essDC-bus-volts",0,"DOUBLE");

var No1NonEssDCbus_volts = props.globals.initNode("VC10/electric/dc/no1-nonessDC-bus-volts",0,"DOUBLE");
var No2NonEssDCbus_volts = props.globals.initNode("VC10/electric/dc/no2-nonessDC-bus-volts",0,"DOUBLE");

var No1Batbus_volts = props.globals.initNode("VC10/electric/no1-bat-bus-volts",0,"DOUBLE");
var No2Batbus_volts = props.globals.initNode("VC10/electric/no2-bat-bus-volts",0,"DOUBLE");

####################################################################################################################
#                                        707 electrical system 
var EssDCbus = props.globals.initNode("VC10/electric/ess-bus",0,"DOUBLE");
var EssFreq = props.globals.initNode("VC10/electric/ess-freq",400,"DOUBLE"); #400Hz is 



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
        m.gen_drive_switch.setBoolValue(1);
        m.gen_output = props.globals.getNode(gen_output,1);
        m.gen_output.setDoubleValue(0);
        m.rpm_source = props.globals.getNode(src,1);
        m.rpm_threshold = thr;
        m.ideal_volts = vlt;
        m.ideal_amps = amp;
        m.condition = my_rand(0.01,0.6);
		if (num == 0){
			m.meter = props.globals.getNode("VC10/electric/ac/generator/gen-load[0]",1);
			m.meter.setDoubleValue(0);
			m.gen_bus_tie = props.globals.getNode("VC10/electric/ac/generator/BTB1-relay",1);
			m.gen_bus_tie.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/gen-freq[0]",1);
			m.frequency.setDoubleValue(my_rand(386,418));
			m.gen_breaker = props.globals.getNode("VC10/electric/ac/generator/GCR1_relay",1);
			m.gen_breaker.setDoubleValue(0);
			m.gen_control = props.globals.getNode("VC10/electric/ac/generator/GCB1",1);
			m.gen_control.setDoubleValue(0);
			}elsif( num == 1){
		    m.meter = props.globals.getNode("VC10/electric/ac/generator/gen-load[1]",1);
			m.meter.setDoubleValue(0);
			m.gen_bus_tie = props.globals.getNode("VC10/electric/ac/generator/BTB2-relay",1);
			m.gen_bus_tie.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/gen-freq[1]",1);
			m.frequency.setDoubleValue(my_rand(386,418));
			m.gen_breaker = props.globals.getNode("VC10/electric/ac/generator/GCR2_relay",1);
			m.gen_breaker.setDoubleValue(0);
			m.gen_control = props.globals.getNode("VC10/electric/ac/generator/GCB2",1);
			m.gen_control.setDoubleValue(0);
			}elsif( num == 2){
		    m.meter = props.globals.getNode("VC10/electric/ac/generator/gen-load[2]",1);
			m.meter.setDoubleValue(0);
			m.gen_bus_tie = props.globals.getNode("VC10/electric/ac/generator/BTB3-relay",1);
			m.gen_bus_tie.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/gen-freq[2]",1);
			m.frequency.setDoubleValue(my_rand(386,418));
			m.gen_breaker = props.globals.getNode("VC10/electric/ac/generator/GCR3_relay",1);
			m.gen_breaker.setDoubleValue(0);
			m.gen_control = props.globals.getNode("VC10/electric/ac/generator/GCB3",1);
			m.gen_control.setDoubleValue(0);
			}elsif( num == 3){
		    m.meter = props.globals.getNode("VC10/electric/ac/generator/gen-load[3]",1);
			m.meter.setDoubleValue(0);
			m.gen_bus_tie = props.globals.getNode("VC10/electric/ac/generator/BTB4-relay",1);
			m.gen_bus_tie.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/gen-freq[3]",1);
			m.frequency.setDoubleValue(my_rand(386,418));
			m.gen_control = props.globals.getNode("VC10/electric/ac/generator/GCR4_relay",1);
			m.gen_control.setDoubleValue(0);
			m.gen_breaker = props.globals.getNode("VC10/electric/ac/generator/GCB4",1);
			m.gen_breaker.setDoubleValue(0);
			}		
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
##		var switch = me.gen_drive_switch.getBoolValue();
		var switch = me.gen_drive_switch.getValue();
##		print ("switch ", switch);
##        if(me.gen_drive_switch.getBoolValue() and getprop("engines/engine["~me.gen_index~"]/running") or 
       if(me.gen_drive_switch.getBoolValue() and (me.rpm_source.getValue() > me.rpm_threshold) or 
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
var battery1 = Battery.new("VC10/electric/dc/bat1-switch","/VC10/electric/dc/bat1",28.0,30,25,1.0,7.0);
var battery2 = Battery.new("VC10/electric/dc/bat2-switch","/VC10/electric/dc/bat2",28.0,30,25,1.0,7.0);

var battery = Battery.new("VC10/electric/dc/battery-switch","/VC10/electric/dc/battery",24.6,30,34,1.0,7.0);

###                            num,switch,								gen_output,              rpm_source,           rpm_threshold,volts,amps,freq
var generator0 = Generator.new(0,"VC10/electric/ac/generator/GenDrvELRAT","VC10/electric/ac/generator/GenELRAT-volts","/fdm/jsbsim/velocities/vtrue-kts",100.0,115.0,60.0);
var generator1 = Generator.new(1,"VC10/electric/ac/generator/GenDrv1","VC10/electric/ac/generator/Gen1-volts","/engines/engine[0]/n1",20.0,115.0,60.0);
var generator2 = Generator.new(2,"VC10/electric/ac/generator/GenDrv2","VC10/electric/ac/generator/Gen2-volts","/engines/engine[1]/n1",20.0,115.0,60.0);
var generator3 = Generator.new(3,"VC10/electric/ac/generator/GenDrv3","VC10/electric/ac/generator/Gen3-volts","/engines/engine[2]/n1",20.0,115.0,60.0);
var generator4 = Generator.new(4,"VC10/electric/ac/generator/GenDrv4","VC10/electric/ac/generator/Gen4-volts","/engines/engine[3]/n1",20.0,115.0,60.0);


var TRU1 = Generator.new(5,"VC10/electric/dc/generatorTRU1-switch","VC10/electric/dc/generator/TRU1-volts","VC10/electric/ac/generator/Gen1-volts",20.0,28.0,60.0);
var TRU2 = Generator.new(6,"VC10/electric/dc/generatorTRU2-switch","VC10/electric/dc/generator/TRU2-volts","VC10/electric/ac/generator/Gen4-volts",20.0,28.0,60.0);
var TRUstby = Generator.new(7,"VC10/electric/dc/generatorStbyTRU-switch","VC10/electric/dc/generator/StbyTRU-volts","VC10/electric/ac/generator/Gen3-volts",20.0,28.0,60.0);

props.globals.initNode("VC10/electric/dc/tru1-switch",1,"BOOL");
props.globals.initNode("VC10/electric/dc/tru2-switch",1,"BOOL");
props.globals.initNode("VC10/electric/dc/StbyTRUsel-switch",0,"INT");

props.globals.initNode("VC10/electric/dc/TRU1power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/TRU2power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/StbyTRUpower-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/StbyTRUdcBus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/StbyTRUdcBus2-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/NonEssDCbus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/NonEssDCbus2-ind",0,"INT");#####################################

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


var update_buses = func {
	var Gen1_volts = getprop("VC10/electric/ac/generator/Gen1-volts") or 0;
	var Gen2_volts = getprop("VC10/electric/ac/generator/Gen2-volts") or 0;
	var Gen3_volts = getprop("VC10/electric/ac/generator/Gen3-volts") or 0;
	var Gen4_volts = getprop("VC10/electric/ac/generator/Gen4-volts") or 0;
	
	var GCR1_relay = getprop("VC10/electric/ac/generator/GCR1_relay") or 0;
	var GCR2_relay = getprop("VC10/electric/ac/generator/GCR2_relay") or 0;	
	var GCR3_relay = getprop("VC10/electric/ac/generator/GCR3_relay") or 0;	
	var GCR4_relay = getprop("VC10/electric/ac/generator/GCR4_relay") or 0;
	var GCB1 = getprop("VC10/electric/ac/generator/GCB1") or 0;
	var GCB2 = getprop("VC10/electric/ac/generator/GCB2") or 0;	
	var GCB3 = getprop("VC10/electric/ac/generator/GCB3") or 0;	
	var GCB4 = getprop("VC10/electric/ac/generator/GCB4") or 0;
	var BTB1 = getprop("VC10/electric/ac/BTB1-relay") or 0;
	var BTB2 = getprop("VC10/electric/ac/BTB2-relay") or 0;
	var BTB3 = getprop("VC10/electric/ac/BTB3-relay") or 0;
	var BTB4 = getprop("VC10/electric/ac/BTB4-relay") or 0;
	var SSB = getprop("VC10/electric/ac/SSB") or 0;
	var Gen1V = Gen1_volts*GCR1_relay;
	var Gen2V = Gen2_volts*GCR2_relay; 
	var Gen3V = Gen3_volts*GCR3_relay; 
	var Gen4V = Gen4_volts*GCR4_relay; 
	
	var No1ACbus_volts = math.max(Gen1V*GCB1,
								Gen3V*GCB3*BTB3*BTB1,
								Gen2V*GCB2*BTB2*SSB*BTB1,
								Gen4V*GCB4*BTB4*SSB*BTB1);
	var No3ACbus_volts = math.max(Gen3V*GCB3,
								Gen1V*GCB1*BTB1*BTB3,
								Gen2V*GCB2*BTB2*SSB*BTB3,
								Gen4V*GCB4*BTB4*SSB*BTB3);
	var No2ACbus_volts = math.max(Gen2V*GCB2,
								Gen4V*GCB4*BTB4*BTB2,
								Gen1V*GCB1*BTB1*SSB*BTB2,
								Gen3V*GCB3*BTB3*SSB*BTB2);
	var No4ACbus_volts = math.max(Gen4V*GCB4,
								Gen2V*GCB2*BTB2*BTB4,
								Gen1V*GCB1*BTB1*SSB*BTB4,
								Gen3V*GCB3*BTB3*SSB*BTB4);

	ACEmergbus_volts = getprop("VC10/electric/ac/ACEmerg-bus-volts");
	ACAuxbus_volts = getprop("VC10/electric/ac/ACAux-bus-volts");
	GroundPowerbus_volts = getprop("VC10/electric/ac/gound-power-bus-volts");

	No1EssDCbus_volts = getprop("VC10/electric/dc/no1-essDC-bus-volts");
	No2EssDCbus_volts = getprop("VC10/electric/dc/no2-essDC-bus-volts");

	No1NonEssDCbus_volts = getprop("VC10/electric/dc/no1-nonessDC-bus-volts");
	No2NonEssDCbus_volts = getprop("VC10/electric/dc/no2-nonessDC-bus-volts");

	No1Batbus_volts = getprop("VC10/electric/no1-bat-bus-volts");
	No2Batbus_volts = getprop("VC10/electric/no2-bat-bus-volts");
		
	setprop("VC10/electric/ac/no1-AC-bus-volts",No1ACbus_volts);
	setprop("VC10/electric/ac/no2-AC-bus-volts",No2ACbus_volts);
	setprop("VC10/electric/ac/no3-AC-bus-volts",No3ACbus_volts);
	setprop("VC10/electric/ac/no4-AC-bus-volts",No4ACbus_volts);
	
#	generator1.apply_load(load);
#	generator2.apply_load(load);
#	generator3.apply_load(load);
#	generator4.apply_load(load);
#	generator0.apply_load(load); # ELRAT
		  
	generator1.get_output_volts();
	generator2.get_output_volts();
	generator3.get_output_volts();
	generator4.get_output_volts();
	generator0.get_output_volts(); # ELRAT
}
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
		  
		  if(battery1.switch.getBoolValue()){		  
				if (EssPwr.getValue() == 5 and ExternalConnected.getBoolValue()){
					  power_source = "External Power";
					  essdcbus_volts = 27.5;
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(essdcbus_volts > battery1.actual_volts.getValue()){
					  	battery1.actual_volts.setDoubleValue(battery1.actual_volts.getValue() + 0.0005);
					  }		  
					  if(!getprop("VC10/electric/ground-connect")){
							if(!generator1.get_output_volts()){
								setprop("VC10/electric/ac/BTB1-relay",0);		
							}
							if(!generator2.get_output_volts()){
								setprop("VC10/electric/ac/BTB2-relay",0);		
							}
							if(!generator3.get_output_volts()){
								setprop("VC10/electric/ac/BTB3-relay",0);		
							}
							if(!generator4.get_output_volts()){
								setprop("VC10/electric/ac/BTB4-relay",0);		
							}					  
					  }
					  
				}elsif (EssPwr.getValue() == 4 and generator4.get_output_volts() and VC10/electric/ac/BTB4-relay.getValue() and generator4.gen_breaker.getValue() and generator4.gen_control.getValue()){
					  power_source = "Generator4";
					  essdcbus_volts = generator4.get_output_volts();
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(battery1.switch.getBoolValue() and essdcbus_volts > battery1.actual_volts.getValue()){
					  	battery1.actual_volts.setDoubleValue(battery1.actual_volts.getValue() + 0.0005);
					  }
				}elsif (EssPwr.getValue() == 3 and generator3.get_output_volts() and VC10/electric/ac/BTB3-relay.getValue() and generator3.gen_breaker.getValue() and generator3.gen_control.getValue()){
					  power_source = "Generator3";
					  essdcbus_volts = generator3.get_output_volts();
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(battery1.switch.getBoolValue() and essdcbus_volts > battery1.actual_volts.getValue()){
					  	battery1.actual_volts.setDoubleValue(battery1.actual_volts.getValue() + 0.0005);
					  }
				}elsif (EssPwr.getValue() == 2 and generator2.get_output_volts() and VC10/electric/ac/BTB2-relay.getValue() and generator2.gen_breaker.getValue() and generator2.gen_control.getValue()){
					  power_source = "Generator2";
					  essdcbus_volts = generator2.get_output_volts();
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(battery1.switch.getBoolValue() and essdcbus_volts > battery1.actual_volts.getValue()){
					  	battery1.actual_volts.setDoubleValue(battery1.actual_volts.getValue() + 0.0005);
					  }
				}elsif (EssPwr.getValue() == 1 and generator1.get_output_volts() and VC10/electric/ac/BTB1-relay.getValue() and generator1.gen_breaker.getValue() and generator1.gen_control.getValue()){
					  power_source = "Generator1";
					  essdcbus_volts = generator1.get_output_volts();
						EssSourceFailure.setBoolValue(0);
					  #recharge
					  if(battery1.switch.getBoolValue() and essdcbus_volts > battery1.actual_volts.getValue()){
					  	battery1.actual_volts.setDoubleValue(battery1.actual_volts.getValue() + 0.0005);
					  }
				}else{
					  settimer(func{ setprop("VC10/electric/ground-connect", 0);}, 0.2);
					  power_source = "APU";
					  essdcbus_volts = generator5.get_output_volts();
						
							if(!generator1.get_output_volts()){
								setprop("VC10/electric/ac/BTB1-relay",0);		
							}
							if(!generator2.get_output_volts()){
								setprop("VC10/electric/ac/BTB2-relay",0);		
							}
							if(!generator3.get_output_volts()){
								setprop("VC10/electric/ac/BTB3-relay",0);		
							}
							if(!generator4.get_output_volts()){
								setprop("VC10/electric/ac/BTB4-relay",0);		
							}					  
					  
					  #recharge
					  if(battery1.switch.getBoolValue() and essdcbus_volts > battery1.actual_volts.getValue()){
					  	battery1.actual_volts.setDoubleValue(battery1.actual_volts.getValue() + 0.0005);
					  }
				}

				# bus-tie fall back on freq problems
				if(generator1.get_output_volts() and EssFreq.getValue() != generator1.frequency.getValue()){
					setprop("VC10/electric/ac/BTB1-relay",0);		
				}
				if(generator2.get_output_volts() and EssFreq.getValue() != generator2.frequency.getValue()){
					setprop("VC10/electric/ac/BTB2-relay",0);		
				}
				if(generator3.get_output_volts() and EssFreq.getValue() != generator3.frequency.getValue()){
					setprop("VC10/electric/ac/BTB3-relay",0);		
				}
				if(generator4.get_output_volts() and EssFreq.getValue() != generator4.frequency.getValue()){
					setprop("VC10/electric/ac/BTB4-relay",0);		
				}
				
				if (!generator1.gen_drive_switch.getBoolValue()){
					setprop("VC10/electric/ac/BTB1-relay",0); 
					generator1.gen_breaker.setValue(0); 
					generator1.gen_control.setValue(0); 
				}
				if (!generator2.gen_drive_switch.getBoolValue()){
					setprop("VC10/electric/ac/BTB2-relay",0); 
					generator2.gen_breaker.setValue(0); 
					generator2.gen_control.setValue(0); 
				}				
				if (!generator3.gen_drive_switch.getBoolValue()){
					setprop("VC10/electric/ac/BTB3-relay",0); 
					generator3.gen_breaker.setValue(0); 
					generator3.gen_control.setValue(0); 
				}				
				if (!generator4.gen_drive_switch.getBoolValue()){
					setprop("VC10/electric/ac/BTB4-relay",0); 
					generator4.gen_breaker.setValue(0); 
					generator4.gen_control.setValue(0); 
				}				
				
			}else{
				EssSourceFailure.setBoolValue(1);
				essdcbus_volts = 0;
			}

		  if(battery1.switch.getBoolValue() and essdcbus_volts < 24){
		  	EssSourceFailure.setBoolValue(1);
		  	power_source = "battery";	
			essdcbus_volts = battery1.get_output_volts();	  
		  }
		  
		  if (essdcbus_volts < 20 and count == 60){ 
		  
		  		# most switches fall back if essdc-buss is low
#					setprop("VC10/electric/ac/generator/GenDrv1-sw",0);
#					setprop("VC10/electric/ac/generator/GenDrv2-sw",0);
#					setprop("VC10/electric/ac/generator/GenDrv3-sw",0);
#					setprop("VC10/electric/ac/generator/GenDrv4-sw",0);
					setprop("VC10/electric/ground-connect",0);
					setprop("VC10/electric/ac/BTB1-relay",0);
					setprop("VC10/electric/ac/BTB2-relay",0);
					setprop("VC10/electric/ac/BTB3-relay",0);
					setprop("VC10/electric/ac/BTB4-relay",0);
					setprop("VC10/electric/ac/generator/GCR1-sw",0);
					setprop("VC10/electric/ac/generator/GCR2-sw",0);
					setprop("VC10/electric/ac/generator/GCR3-sw",0);
					setprop("VC10/electric/ac/generator/GCR4-sw",0);
					setprop("VC10/electric/ac/generator/GCB1-sw",0);
					setprop("VC10/electric/ac/generator/GCB2-sw",0);
					setprop("VC10/electric/ac/generator/GCB3-sw",0);
					setprop("VC10/electric/ac/generator/GCB4-sw",0);
					setprop("VC10/electric/ac/generator/GC1_relay",0);
					setprop("VC10/electric/ac/generator/GC2_relay",0);
					setprop("VC10/electric/ac/generator/GC3_relay",0);
					setprop("VC10/electric/ac/generator/GC4_relay",0);
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

#		  generator1.apply_load(load);
#		  generator2.apply_load(load);
#		  generator3.apply_load(load);
#		  generator4.apply_load(load);
#		  generator0.apply_load(load); # ELRAT
		  
		  generator1.get_output_volts();
		  generator2.get_output_volts();
		  generator3.get_output_volts();
		  generator4.get_output_volts();
		  generator0.get_output_volts(); # ELRAT

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
##  update_virtual_bus();
	update_buses();
	settimer(update_electrical, 0);
}

################################## more generator helpers #######################################

######################## ac paralleling #########################
var ac_sync = func{		  
		  if (battery1.switch.getBoolValue() and essdcbus_volts > 20){ 

				# Generator 1
				if( ACSelector.getValue() == 1 and 
						generator1.gen_drive_switch.getBoolValue() and 
						generator1.gen_control.getBoolValue() and 
						generator1.gen_breaker.getBoolValue()){
					ACSelFreq.setValue(generator1.frequency.getValue());
					ACSelVolts.setValue(generator1.gen_output.getValue()); 
				# Generator 2		
				}elsif( ACSelector.getValue() == 2 and
						generator2.gen_output.getValue() > 20 and
						generator2.gen_drive_switch.getBoolValue() and 
						generator2.gen_control.getBoolValue() and 
						generator2.gen_breaker.getBoolValue()){
					ACSelFreq.setValue(generator2.frequency.getValue());
					ACSelVolts.setValue(generator2.gen_output.getValue());
				# SYNC BUS		
				}elsif( ACSelector.getValue() == 3){
					ACSelFreq.setValue(EssFreq.getValue());
					ACSelVolts.setValue(EssDCbus.getValue());
				# Generator 3		
				}elsif( ACSelector.getValue() == 4 and
						generator3.gen_output.getValue() > 20 and
						generator3.gen_drive_switch.getBoolValue() and 
						generator3.gen_control.getBoolValue() and 
						generator3.gen_breaker.getBoolValue()){
					ACSelFreq.setValue(generator3.frequency.getValue());
					ACSelVolts.setValue(generator3.gen_output.getValue());
				# Generator 4		
				}elsif( ACSelector.getValue() == 5 and 
						generator4.gen_output.getValue() > 20 and
						generator4.gen_drive_switch.getBoolValue() and 
						generator4.gen_control.getBoolValue() and 
						generator4.gen_breaker.getBoolValue()){
					ACSelFreq.setValue(generator4.frequency.getValue());
					ACSelVolts.setValue(generator4.gen_output.getValue());
				# External Power		
				}elsif( ACSelector.getValue() == 6 and EssPwr.getValue() == 5 ){
				  var extGCcon = getprop("VC10/electric/external-power-connected") or 0;
				  if(	extGCcon and ACSelVolts.getValue() != 27.5){
						interpolate("VC10/electric/ac/ac-sel-para-freq", EssFreq.getValue(), 1.2);
						ACSelVolts.setValue(110.0);
					}		  
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
		  	interpolate("engines/engine[0]/ ", gl1, 2);
		  }else{
		  	var kvars = gl1 + gl1 * 0.36;
		  	interpolate("VC10/electric/ac/generator/Gen1-kw", kvars, 2);		  
		  }
		}else{
			interpolate("VC10/electric/ac/generator/Gen1-kw", 0, 0.5);
		}
		if(gl2){
		  if(!pm){
		  	interpolate("VC10/electric/ac/generator/Gen2-kw", gl2, 2);
		  }else{
		  	var kvars = gl2 + gl2 * 0.24;
		  	interpolate("VC10/electric/ac/generator/Gen2-kw", kvars, 2);		  
		  }
		}else{
			interpolate("VC10/electric/ac/generator/Gen2-kw", 0, 0.6);
		}
		if(gl3){
		  if(!pm){
		  	interpolate("VC10/electric/ac/generator/Gen3-kw", gl3, 2);
		  }else{
		  	var kvars = gl3 + gl3 * 0.30;
		  	interpolate("VC10/electric/ac/generator/Gen3-kw", kvars, 2);		  
		  }
		}else{
			interpolate("VC10/electric/ac/generator/Gen3-kw", 0, 0.4);
		}
		if(gl4){
		  if(!pm){
		  	interpolate("VC10/electric/ac/generator/Gen4-kw", gl4, 2);
		  }else{
		  	var kvars = gl4 + gl4 * 0.42;
		  	interpolate("VC10/electric/ac/generator/Gen4-kw", kvars, 2);		  
		  }
		}else{
			interpolate("VC10/electric/ac/generator/Gen4-kw", 0, 0.6);
		}
		settimer( gen_kw, 2);
}


################ the ground connect switch fall back ###################
setlistener("VC10/electric/external-power-connected", func(state){
  var state = state.getBoolValue();
  if(state)	setprop("VC10/ground-service/enabled", 1); #illuminate the lights of VW Bus
	var src_ext = getprop("VC10/electric/ess-power-switch") or 0;
	
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


setlistener("VC10/electric/ac/generator/GenDrv1-sw", func {
	var GDsw = getprop("VC10/electric/ac/generator/GenDrv1-sw");
	if(GDsw == 0){
			setprop("VC10/electric/ac/generator/GenDrv1", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GenDrv2-sw", func {
	var GDsw = getprop("VC10/electric/ac/generator/GenDrv2-sw");
	if(GDsw == 0){
			setprop("VC10/electric/ac/generator/GenDrv2", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GenDrv3-sw", func {
	var GDsw = getprop("VC10/electric/ac/generator/GenDrv3-sw");
	if(GDsw == 0){
			setprop("VC10/electric/ac/generator/GenDrv3", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GenDrv4-sw", func {
	var GDsw = getprop("VC10/electric/ac/generator/GenDrv4-sw");
	if(GDsw == 0){
			setprop("VC10/electric/ac/generator/GenDrv4", 0);
		} 
});

setlistener("VC10/electric/ac/generator/GCR1-sw", func {
	var GCRsw = getprop("VC10/electric/ac/generator/GCR1-sw");
	if(GCRsw == 1){
			setprop("VC10/electric/ac/generator/GCR1_relay", 1);
			}elsif(GCRsw == -1){
			setprop("VC10/electric/ac/generator/GCR1_relay", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GCR2-sw", func {
	var GCRsw = getprop("VC10/electric/ac/generator/GCR2-sw");
	if(GCRsw == 1){
			setprop("VC10/electric/ac/generator/GCR2_relay", 1);
			}elsif(GCRsw == -1){
			setprop("VC10/electric/ac/generator/GCR2_relay", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GCR3-sw", func {
	var GCRsw = getprop("VC10/electric/ac/generator/GCR3-sw");
	if(GCRsw == 1){
			setprop("VC10/electric/ac/generator/GCR3_relay", 1);
			}elsif(GCRsw == -1){
			setprop("VC10/electric/ac/generator/GCR3_relay", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GCR4-sw", func {
	var GCRsw = getprop("VC10/electric/ac/generator/GCR4-sw");
	if(GCRsw == 1){
			setprop("VC10/electric/ac/generator/GCR4_relay", 1);
			}elsif(GCRsw == -1){
			setprop("VC10/electric/ac/generator/GCR4_relay", 0);
		} 
});

setlistener("VC10/electric/ac/generator/GCB1-sw", func {
	var GCBsw = getprop("VC10/electric/ac/generator/GCB1-sw");
	if(GCBsw == 1){
			setprop("VC10/electric/ac/generator/GCB1", 1);
			}elsif(GCBsw == -1){
			setprop("VC10/electric/ac/generator/GCB1", 0);
		} 
});
 setlistener("VC10/electric/ac/generator/GCB2-sw", func {
	var GCBsw = getprop("VC10/electric/ac/generator/GCB2-sw");
	if(GCBsw == 1){
			setprop("VC10/electric/ac/generator/GCB2", 1);
			}elsif(GCBsw == -1){
			setprop("VC10/electric/ac/generator/GCB2", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GCB3-sw", func {
	var GCBsw = getprop("VC10/electric/ac/generator/GCB3-sw");
	if(GCBsw == 1){
			setprop("VC10/electric/ac/generator/GCB3", 1);
			}elsif(GCBsw == -1){
			setprop("VC10/electric/ac/generator/GCB3", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GCB4-sw", func {
	var GCBsw = getprop("VC10/electric/ac/generator/GCB4-sw");
	if(GCBsw == 1){
			setprop("VC10/electric/ac/generator/GCB4", 1);
			}elsif(GCBsw == -1){
			setprop("VC10/electric/ac/generator/GCB4", 0);
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