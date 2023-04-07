
var count = 0;
var wait = 0;

props.globals.initNode("VC10/electric/ac/generator/Gen1-Drv-Guard",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen2-Drv-Guard",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen3-Drv-Guard",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen4-Drv-Guard",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/Gen1-Drv-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen2-Drv-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen3-Drv-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen4-Drv-sw",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-switch",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/Gen1-Drv",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen2-Drv",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen3-Drv",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen4-Drv",1,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-drive",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/Gen1-Fail",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen2-Fail",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen3-Fail",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen4-Fail",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/CSD1low_pressure",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/CSD2low_pressure",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/CSD3low_pressure",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/CSD4low_pressure",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/Gen1-Fail",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen2-Fail",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen3-Fail",0,"BOOL");
props.globals.initNode("VC10/electric/ac/generator/Gen4-Fail",0,"BOOL");

props.globals.initNode("VC10/electric/ac/generator/GCR1-sw",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR2-sw",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR3-sw",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCR4-sw",1,"INT");

props.globals.initNode("VC10/electric/ac/generator/Gen1-ControlRelay",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/Gen2-ControlRelay",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/Gen3-ControlRelay",1,"INT");
props.globals.initNode("VC10/electric/ac/generator/Gen4-ControlRelay",1,"INT");

props.globals.initNode("VC10/electric/ac/generator/Gen1-Control-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/Gen2-Control-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/Gen3-Control-sw",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/Gen4-Control-sw",0,"INT");

props.globals.initNode("VC10/electric/ac/generator/GCB1",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB2",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB3",0,"INT");
props.globals.initNode("VC10/electric/ac/generator/GCB4",0,"INT");

props.globals.initNode("VC10/electric/ac/generator/Gen1-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen2-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen3-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen4-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-volts",0,"DOUBLE");

props.globals.initNode("VC10/electric/ac/generator/Gen1-freq",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen2-freq",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen3-freq",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen4-freq",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-freq",0,"DOUBLE");

props.globals.initNode("VC10/electric/ac/generator/Gen1-kvar",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen2-kvar",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen3-kvar",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/Gen4-kvar",0,"DOUBLE");
props.globals.initNode("VC10/electric/ac/generator/GenELRAT-kvar",0,"DOUBLE");

props.globals.initNode("VC10/electric/GroundPower-sw",0,"INT");
props.globals.initNode("VC10/electric/GroundPowerBreaker",0,"INT");
props.globals.initNode("VC10/electric/GroundPowerBusVolts",0,"DOUBLE");
props.globals.initNode("VC10/electric/GroundPowerBusCycles",0,"DOUBLE");

props.globals.initNode("VC10/electric/AC_FreqVoltsSelectsw",0,"INT");
props.globals.initNode("VC10/electric/AC_CSD_GenTempselsw",0,"INT");
props.globals.initNode("VC10/electric/AC_KW-KVARselsw",0,"INT");
props.globals.initNode("VC10/electric/DC_VoltsSelectsw",0,"INT");

props.globals.initNode("VC10/electric/ac/BTB1-relay",1,"INT");
props.globals.initNode("VC10/electric/ac/BTB2-relay",1,"INT");
props.globals.initNode("VC10/electric/ac/BTB3-relay",1,"INT");
props.globals.initNode("VC10/electric/ac/BTB4-relay",1,"INT");
props.globals.initNode("VC10/electric/ac/SSB",0,"INT");
props.globals.initNode("VC10/electric/ac/SSB-sw",0,"INT");

props.globals.initNode("VC10/electric/ac/BTB1-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB2-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB3-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/BTB4-ind",0,"INT");
props.globals.initNode("VC10/electric/ac/SSB-ind",0,"INT");

props.globals.initNode("VC10/electric/ac/AUXbus-ind",0,"INT");


props.globals.initNode("VC10/electric/dc/TRU1-volts",1,"DOUBLE");
props.globals.initNode("VC10/electric/dc/TRU2-volts",1,"DOUBLE");
props.globals.initNode("VC10/electric/dc/StbyTRU-volts",0,"DOUBLE");

props.globals.initNode("VC10/electric/dc/BAT1_sw",1,"INT");
props.globals.initNode("VC10/electric/dc/BAT2_sw",1,"INT");
props.globals.initNode("VC10/electric/dc/BAT1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/BAT2-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/TRU1-sw",1,"BOOL");
props.globals.initNode("VC10/electric/dc/TRU2-sw",1,"BOOL");

props.globals.initNode("VC10/electric/dc/TRU1power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/TRU2power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/StbyTRUpower-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/TRU1-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/dc/TRU2-volts",0,"DOUBLE");
props.globals.initNode("VC10/electric/dc/StbyTRU-volts",0,"DOUBLE");

props.globals.initNode("VC10/electric/dc/StbyTRUbus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/StbyTRUbus2-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/NonEssDCbus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/NonEssDCbus2-ind",0,"INT");

props.globals.initNode("VC10/electric/ac/Galley1-sw",0,"BOOL");
props.globals.initNode("VC10/electric/ac/Galley2-sw",0,"BOOL");
props.globals.initNode("VC10/electric/ac/Galley3-sw",0,"BOOL");

props.globals.initNode("VC10/electric/dc/DC1Fail",0,"BOOL");
props.globals.initNode("VC10/electric/dc/DC2Fail",0,"BOOL");

var No1ACbus_volts = props.globals.initNode("VC10/electric/ac/ACbus1-volts",0,"DOUBLE");
var No2ACbus_volts = props.globals.initNode("VC10/electric/ac/ACbus2-volts",0,"DOUBLE");
var No3ACbus_volts = props.globals.initNode("VC10/electric/ac/ACbus3-volts",0,"DOUBLE");
var No4ACbus_volts = props.globals.initNode("VC10/electric/ac/ACbus4-volts",0,"DOUBLE");

var ACEmergbus_volts = props.globals.initNode("VC10/electric/ac/ACEmerg-bus-volts",0,"DOUBLE");
var AuxACbus_volts = props.globals.initNode("VC10/electric/ac/ACAux-bus-volts",0,"DOUBLE");
var GroundPowerbus_volts = props.globals.initNode("VC10/electric/ac/gound-power-bus-volts",0,"DOUBLE");
var GroundPowerbus_freq = props.globals.initNode("VC10/electric/ac/gound-power-bus-freq",0,"DOUBLE");

var No1EssDCbus_volts = props.globals.initNode("VC10/electric/dc/EssDCbus1-volts",0,"DOUBLE");
var No2EssDCbus_volts = props.globals.initNode("VC10/electric/dc/EssDCbus2-volts",0,"DOUBLE");

var No1NonEssDCbus_volts = props.globals.initNode("VC10/electric/dc/NonEssDCbus1-volts",0,"DOUBLE");
var No2NonEssDCbus_volts = props.globals.initNode("VC10/electric/dc/NonEssDCbus2-volts",0,"DOUBLE");

var No1Batbus_volts = props.globals.initNode("VC10/electric/dc/BAT1-bus-volts",0,"DOUBLE");
var No2Batbus_volts = props.globals.initNode("VC10/electric/dc/BAT2-bus-volts",0,"DOUBLE");

var ACvoltmeter = props.globals.initNode("VC10/electric/ACmeter-freq",0,"DOUBLE");
var ACvoltmeter = props.globals.initNode("VC10/electric/ACmeter-volts",0,"DOUBLE");
var DCvoltmeter = props.globals.initNode("VC10/electric/DCmeter-volts",0,"DOUBLE");
var AC1KW_KVARmeter = props.globals.initNode("VC10/electric/ACmeter1KW_KVAR",0,"DOUBLE");
var AC2KW_KVARmeter = props.globals.initNode("VC10/electric/ACmeter2KW_KVAR",0,"DOUBLE");
var AC3KW_KVARmeter = props.globals.initNode("VC10/electric/ACmeter3KW_KVAR",0,"DOUBLE");
var AC4KW_KVARmeter = props.globals.initNode("VC10/electric/ACmeter4KW_KVAR",0,"DOUBLE");
####################################################################################################################
#                                        707 electrical system 
var EssDCbus = props.globals.initNode("VC10/electric/ess-bus",0,"DOUBLE");



var EssPwr= props.globals.initNode("VC10/electric/ess-power-switch",0,"DOUBLE");
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

var ExternalConnected = props.globals.initNode("VC10/electric/external-power-connected",0,"BOOL");
####################################################################################################################


var EssDCbus_volts = 0.0;
var EssDCbus_input=[];
var EssDCbus_output=[];
var EssDCbus_load=[];
var EssDCbus_service=[];

var ACSelector = props.globals.initNode("VC10/electric/AC_FreqVoltsSelectsw",0,"INT");
var DCSelector = props.globals.initNode("VC10/electric/DC_VoltsSelectsw",0,"INT");

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
        m.gen_output = props.globals.getNode(gen_output,1);
        m.gen_output.setDoubleValue(0);
        m.rpm_source = props.globals.getNode(src,1);
        m.rpm_threshold = thr;
        m.ideal_volts = vlt;
        m.ideal_amps = amp;
        m.condition = my_rand(0.01,0.6);

		if (num == 0){
			m.gen_drive_switch.setBoolValue(0);
			m.meter = props.globals.getNode("VC10/electric/ac/generator/GenELRAT-kvar",1);
			m.meter.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/GenELRAT-freq",1);
			m.frequency.setDoubleValue(my_rand(386,418));
			}elsif( num == 1){
			m.gen_drive_switch.setBoolValue(1);
		    m.meter = props.globals.getNode("VC10/electric/ac/generator/Gen1-kvar",1);
			m.meter.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/Gen1-freq",1);
			m.frequency.setDoubleValue(my_rand(386,418));
			}elsif( num == 2){
			m.gen_drive_switch.setBoolValue(1);
		    m.meter = props.globals.getNode("VC10/electric/ac/generator/Gen2-kvar",1);
			m.meter.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/Gen2-freq",1);
			m.frequency.setDoubleValue(my_rand(386,418));
			}elsif( num == 3){
			m.gen_drive_switch.setBoolValue(1);
		    m.meter = props.globals.getNode("VC10/electric/ac/generator/Gen3-kvar",1);
			m.meter.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/Gen3-freq",1);
			m.frequency.setDoubleValue(my_rand(386,418));
			}elsif( num == 4){
			m.gen_drive_switch.setBoolValue(1);
		    m.meter = props.globals.getNode("VC10/electric/ac/generator/Gen4-kvar",1);
			m.meter.setDoubleValue(0);			
			m.frequency = props.globals.getNode("VC10/electric/ac/generator/Gen4-freq",1);
			m.frequency.setDoubleValue(my_rand(386,418));
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
		var switch = me.gen_drive_switch.getValue();
		var threshold = me.rpm_threshold; 
       
		if(me.gen_drive_switch.getBoolValue() and (me.rpm_source.getValue() > threshold) or 
          (me.gen_drive_switch.getBoolValue() and me.gen_index == 4)){
            var factor = me.rpm_source.getValue() / threshold or 0;
            if ( factor > 1.0 )factor = 1.0;
            var out = (me.ideal_volts * factor) + me.condition; #condition is only a random between 0.01 and 0.6
        }
        me.gen_output.setValue(out);
        return out;
    }    
};
###							switch-prop					volts_output		  ideal_volts,amps,amp_hours,charge_decimal,charge_amps);
var battery1 = Battery.new("VC10/electric/dc/BAT1_sw","VC10/electric/dc/BAT1-volts",24.0,30,25,1.0,7.0);
var battery2 = Battery.new("VC10/electric/dc/BAT2_sw","VC10/electric/dc/BAT2-volts",24.0,30,25,1.0,7.0);

###                            num,switch,								gen_output,              rpm_source,           rpm_threshold,volts,amps,freq
var generator0 = Generator.new(0,"VC10/electric/ac/generator/GenELRAT-drive","VC10/electric/ac/generator/GenELRAT-volts","fdm/jsbsim/velocities/vtrue-kts",100.0,115.0,60.0);
var generator1 = Generator.new(1,"VC10/electric/ac/generator/Gen1-Drv","VC10/electric/ac/generator/Gen1-volts","/engines/engine[0]/n1",20.0,115.0,60.0);
var generator2 = Generator.new(2,"VC10/electric/ac/generator/Gen2-Drv","VC10/electric/ac/generator/Gen2-volts","/engines/engine[1]/n1",20.0,115.0,60.0);
var generator3 = Generator.new(3,"VC10/electric/ac/generator/Gen3-Drv","VC10/electric/ac/generator/Gen3-volts","/engines/engine[2]/n1",20.0,115.0,60.0);
var generator4 = Generator.new(4,"VC10/electric/ac/generator/Gen4-Drv","VC10/electric/ac/generator/Gen4-volts","/engines/engine[3]/n1",20.0,115.0,60.0);

props.globals.initNode("VC10/electric/dc/TRU1-sw",1,"BOOL");
props.globals.initNode("VC10/electric/dc/TRU2-sw",1,"BOOL");
props.globals.initNode("VC10/electric/dc/StbyTRUsel_sw",0,"INT");

props.globals.initNode("VC10/electric/dc/TRU1power-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/TRU2power-ind",0,"INT");

props.globals.initNode("VC10/electric/dc/NonEssDCbus1-ind",0,"INT");
props.globals.initNode("VC10/electric/dc/NonEssDCbus2-ind",0,"INT");
#####################################

var init_lighting_switches = func{
    props.globals.getNode("systems/electrical/serviceable",0,"BOOL");
    setprop("controls/lighting/panel-norm",0.0);
    setprop("controls/lighting/cabin-dim",0.0);
    setprop("controls/lighting/engineer-dim",0.0);
    setprop("controls/lighting/overhead-dim",0.0);
}

var init_instrumentation_power = func{	   
	props.globals.initNode("systems/electrical/outputs/KNS80",0,"DOUBLE");
	props.globals.initNode("systems/electrical/outputs/efis",0,"DOUBLE");
	props.globals.initNode("systems/electrical/outputs/adf[0]",0,"DOUBLE"); 
	props.globals.initNode("systems/electrical/outputs/adf[1]",0,"DOUBLE");									
	props.globals.initNode("systems/electrical/outputs/dme[0]",0,"DOUBLE"); 
	props.globals.initNode("systems/electrical/outputs/dme[1]",0,"DOUBLE");																							  
	props.globals.initNode("systems/electrical/outputs/gps",0,"DOUBLE");						
	props.globals.initNode("systems/electrical/outputs/DG[0]",0,"DOUBLE"); 
	props.globals.initNode("systems/electrical/outputs/DG[1]",0,"DOUBLE");									
	props.globals.initNode("systems/electrical/outputs/transponder",0,"DOUBLE");																							 
	props.globals.initNode("systems/electrical/outputs/mk-viii",0,"DOUBLE");						
	props.globals.initNode("systems/electrical/outputs/turn-coordinator",0,"DOUBLE");							  
	props.globals.initNode("systems/electrical/outputs/com[0]",0,"DOUBLE"); 
	props.globals.initNode("systems/electrical/outputs/com[1]",0,"DOUBLE");
	props.globals.initNode("systems/electrical/outputs/nav[0]",0,"DOUBLE"); 
	props.globals.initNode("systems/electrical/outputs/nav[1]",0,"DOUBLE"); 
	props.globals.initNode("systems/electrical/outputs/marker-beacon",0,"DOUBLE");


# perhaps these should be in marker-beacon.nas or instrumentation.nas
	props.globals.initNode("instrumentation/marker-beacon/inner",0,"BOOL");
	props.globals.initNode("instrumentation/marker-beacon/middle",0,"BOOL");
	props.globals.initNode("instrumentation/marker-beacon/outer",0,"BOOL");	
}

#############################################################################################################

var update_buses = func {

	generator1.get_output_volts();
	generator2.get_output_volts();
	generator3.get_output_volts();
	generator4.get_output_volts();
	generator0.get_output_volts(); # ELRAT
	
# Read local variables from property tree
	var Gen1_volts = getprop("VC10/electric/ac/generator/Gen1-volts") or 0;
	var Gen2_volts = getprop("VC10/electric/ac/generator/Gen2-volts") or 0;
	var Gen3_volts = getprop("VC10/electric/ac/generator/Gen3-volts") or 0;
	var Gen4_volts = getprop("VC10/electric/ac/generator/Gen4-volts") or 0;
	
	var GCR1 = getprop("VC10/electric/ac/generator/Gen1-ControlRelay") or 0;
	var GCR2 = getprop("VC10/electric/ac/generator/Gen2-ControlRelay") or 0;	
	var GCR3 = getprop("VC10/electric/ac/generator/Gen3-ControlRelay") or 0;	
	var GCR4 = getprop("VC10/electric/ac/generator/Gen4-ControlRelay") or 0;

	var BTB1 = getprop("VC10/electric/ac/BTB1-relay") or 0;
	var BTB2 = getprop("VC10/electric/ac/BTB2-relay") or 0;
	var BTB3 = getprop("VC10/electric/ac/BTB3-relay") or 0;
	var BTB4 = getprop("VC10/electric/ac/BTB4-relay") or 0;
	var SSB = getprop("VC10/electric/ac/SSB") or 0;
	
	var GCB1 = getprop("VC10/electric/ac/generator/GCB1") or 0;
	var GCB2 = getprop("VC10/electric/ac/generator/GCB2") or 0;	
	var GCB3 = getprop("VC10/electric/ac/generator/GCB3") or 0;	
	var GCB4 = getprop("VC10/electric/ac/generator/GCB4") or 0;	

	var Gen1V = Gen1_volts*GCR1;
	var Gen2V = Gen2_volts*GCR2; 
	var Gen3V = Gen3_volts*GCR3; 
	var Gen4V = Gen4_volts*GCR4;	

#Generator Circuit Breaker	
	if (GCR1 == 0) GCB1 = 0;
	if (GCR2 == 0) GCB2 = 0;
	if (GCR3 == 0) GCB3 = 0;
	if (GCR4 == 0) GCB4 = 0;

	var SSBsw = getprop("VC10/electric/ac/SSB-sw") or 0;	
#Split System Breaker
	if (((GCB1 == 0) or (GCB3 == 0) or (GCB2 == 0) or (GCB4 == 0)) and (SSBsw == 1)) SSB = 1;
	if (((BTB1 == 0 ) and (BTB3 == 0)) or ((BTB2 == 0 ) and (BTB4 == 0)) or (SSBsw == 0)) SSB = 0;
###	print ("SSBsw ",SSBsw," GCB1234 ",GCB1,GCB2,GCB3,GCB4," BTB1234 ",BTB1,BTB2,BTB3,BTB4, "    SSB ",SSB);
	
	var BAT1sw = getprop("VC10/electric/dc/BAT1_sw");
	var BAT2sw = getprop("VC10/electric/dc/BAT2_sw");
	var GPsw = getprop("VC10/electric/GroundPower-sw");
	
###	print ("GPsw ",GPsw," BAT1sw, BAT2sw ",BAT1sw,BAT2sw," GCR1234 ",GCR1,GCR2,GCR3,GCR4);
	
#Ground Power Breaker
	if ((GPsw == 1) and (BAT1sw == 1) and (BAT2sw == 1) and             ## Ground Power and Betteries on
	    (GCB1 == 0) and (GCB2 == 0) and (GCB3 == 0) and (GCB4 == 0)) {  ## all Generator circuit breakers open
				setprop ("VC10/electric/GroundPowerBreaker",1);
				setprop ("VC10/electric/GroundPowerBusVolts",115.0);
				setprop ("VC10/electric/GroundPowerBusCycles",400.0);
			}
		else { 
				setprop ("VC10/electric/GroundPowerBreaker",0);
				setprop ("VC10/electric/GroundPowerBusVolts",0.0);
				setprop ("VC10/electric/GroundPowerBusCycles",0.0);
			}
	var GPB = getprop("VC10/electric/GroundPowerBreaker") or 0;		
	var GPBV = getprop("VC10/electric/GroundPowerBusVolts") or 0;
	
###	print ("GPB ",GPB, " GPBV ", GPBV);
	
	var No1ACbus_volts = math.max(Gen1V*GCB1,
								Gen3V*GCB3*BTB3*BTB1,
								Gen2V*GCB2*BTB2*SSB*BTB1,
								Gen4V*GCB4*BTB4*SSB*BTB1,
								GPBV*GPB*BTB1);
	var No3ACbus_volts = math.max(Gen3V*GCB3,
								Gen1V*GCB1*BTB1*BTB3,
								Gen2V*GCB2*BTB2*SSB*BTB3,
								Gen4V*GCB4*BTB4*SSB*BTB3,
								GPBV*GPB*BTB3);
	var No2ACbus_volts = math.max(Gen2V*GCB2,
								Gen4V*GCB4*BTB4*BTB2,
								Gen1V*GCB1*BTB1*SSB*BTB2,
								Gen3V*GCB3*BTB3*SSB*BTB2,
								GPBV*GPB*SSB*BTB2);
	var No4ACbus_volts = math.max(Gen4V*GCB4,
								Gen2V*GCB2*BTB2*BTB4,
								Gen1V*GCB1*BTB1*SSB*BTB4,
								Gen3V*GCB3*BTB3*SSB*BTB4,
								GPBV*GPB*SSB*BTB4);

	var ACEmergbus_volts = getprop("VC10/electric/ac/ACEmerg-bus-volts");
	var AuxACbus_volts = getprop("VC10/electric/ac/ACAux-bus-volts");
	var GroundPowerbus_volts = getprop("VC10/electric/GroundPowerBusVolts");

	var No1EssDCbus_volts = getprop("VC10/electric/dc/EssDCbus1-volts");
	var No2EssDCbus_volts = getprop("VC10/electric/dc/EssDCbus2-volts");

	var No1NonEssDCbus_volts = getprop("VC10/electric/dc/NonEssDCbus1-volts");
	var No2NonEssDCbus_volts = getprop("VC10/electric/dc/NonEssDCbus2-volts");

	var No1Bat_volts = getprop("VC10/electric/dc/BAT1-volts");
	var No2Bat_volts = getprop("VC10/electric/dc/BAT2-volts");
	
	AuxACbus_volts = No3ACbus_volts;                ## or VC10/electric/ac/generator/GenELRAT-volts when Elrat is deployed
		
	var TRU1_volts = No1ACbus_volts * 28.0 / 115.0;	
	var TRU2_volts = No4ACbus_volts * 28.0 / 115.0;
	var StbyTRU_volts = AuxACbus_volts * 28.0 / 115.0;
	
	var TRU1_power = 0;
	if (TRU1_volts > 24) TRU1_power=1;
	var TRU2_power = 0;
	if (TRU2_volts > 24) TRU2_power=1;
	var StbyTRU_power = 0;	
	if (StbyTRU_volts > 24) StbyTRU_power=1;

	var StbyTRU_Sel_sw = getprop("VC10/electric/dc/StbyTRUsel_sw" );
	var StbyTRU_bus1_ind = 0;
	if ((StbyTRU_Sel_sw == -1) and (StbyTRU_volts > 24))  StbyTRU_bus1_ind = 1;
	var StbyTRU_bus2_ind = 0;
	if ((StbyTRU_Sel_sw == 1) and (StbyTRU_volts > 24))  StbyTRU_bus2_ind = 1;
	
	var BAT1_ind = getprop ("VC10/electric/dc/BAT1-ind");
	var BAT2_ind = getprop ("VC10/electric/dc/BAT2-ind");
		
	if (BAT1sw == 1){
			BAT1_ind=1;
		}elsif (BAT1sw == 0){
			BAT1_ind=0; 
		}elsif (BAT1sw == -1){
			BAT1_ind=1;
		}
	
	if (BAT2sw == 1){
			BAT2_ind=1;
		}elsif (BAT2sw == 0){
			BAT2_ind=0; 
		}elsif (BAT2sw == -1){
			BAT2_ind=1;
		}
	
	setprop ("VC10/electric/dc/BAT1-ind",BAT1_ind);
	setprop ("VC10/electric/dc/BAT2-ind",BAT2_ind);
	
	var No1EssDCbus_volts = math.max(TRU1_volts, No1Bat_volts*BAT1_ind, StbyTRU_volts * StbyTRU_bus1_ind );
	var No2EssDCbus_volts = math.max(TRU2_volts, No2Bat_volts*BAT2_ind, StbyTRU_volts * StbyTRU_bus2_ind );
	
	if ((No1EssDCbus_volts < 26.0) and BAT1_ind) setprop ("VC10/electric/dc/DC1Fail",1)
		else setprop ("VC10/electric/dc/DC1Fail",0);
	if ((No2EssDCbus_volts < 26.0) and BAT2_ind) setprop ("VC10/electric/dc/DC2Fail",1)
		else setprop ("VC10/electric/dc/DC2Fail",0);

	var Elrat_drive = getprop("VC10/electric/ac/generator/GenELRAT-drive");
	
	if (Elrat_drive ) {
			No1NonEssDCbus_volts =  0;
			No2NonEssDCbus_volts =  0;
			setprop("VC10/electric/dc/NonEssDCbus1-ind",1);
			setprop("VC10/electric/dc/NonEssDCbus2-ind",1);
		}
		else {
			No1NonEssDCbus_volts =  No1EssDCbus_volts;
			No2NonEssDCbus_volts =  No2EssDCbus_volts;
			setprop("VC10/electric/dc/NonEssDCbus1-ind",0);
			setprop("VC10/electric/dc/NonEssDCbus2-ind",0);			
		}
 	var BTB1_ind = BTB1;
 	var BTB2_ind = BTB2; 
 	var BTB3_ind = BTB3; 
 	var BTB4_ind = BTB4;
	var SSB_ind = SSB;
	if (No1EssDCbus_volts < 20) {
		BTB1_ind = 0;
		BTB3_ind = 0;
		SSB_ind = 0;
	}
		if (No2EssDCbus_volts < 20) {
		BTB2_ind = 0;
		BTB4_ind = 0;
	}

	
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
	
##	Constant Speed Drive  
	var GDrive1 = getprop("VC10/electric/ac/generator/Gen1-Drv");
	var GDrive2 = getprop("VC10/electric/ac/generator/Gen2-Drv");	
	var GDrive3 = getprop("VC10/electric/ac/generator/Gen3-Drv");	
	var GDrive4 = getprop("VC10/electric/ac/generator/Gen4-Drv");	
	
	var Engine1n2 = getprop("/engines/engine[0]/n2");
	var Engine2n2 = getprop("/engines/engine[0]/n2");	
	var Engine3n2 = getprop("/engines/engine[0]/n2");	
	var Engine4n2 = getprop("/engines/engine[0]/n2");
	
	if ((Engine1n2 < 50.0) or !GDrive1) setprop("VC10/electric/ac/generator/CSD1low_pressure",1)
		else setprop("VC10/electric/ac/generator/CSD1low_pressure",0); 
	if ((Engine2n2 < 50.0) or !GDrive2) setprop("VC10/electric/ac/generator/CSD2low_pressure",1)
		else setprop("VC10/electric/ac/generator/CSD2low_pressure",0); 
	if ((Engine3n2 < 50.0) or !GDrive3) setprop("VC10/electric/ac/generator/CSD3low_pressure",1)
		else setprop("VC10/electric/ac/generator/CSD3low_pressure",0); 
	if ((Engine4n2 < 50.0) or !GDrive4) setprop("VC10/electric/ac/generator/CSD4low_pressure",1)
		else setprop("VC10/electric/ac/generator/CSD4low_pressure",0); 
		
# Update property tree

	setprop("VC10/electric/dc/TRU1-volts",TRU1_volts);
	setprop("VC10/electric/dc/TRU2-volts",TRU2_volts);
	setprop("VC10/electric/dc/StbyTRU-volts",StbyTRU_volts);
	
	setprop("VC10/electric/ac/ACEmerg-bus-volts",ACEmergbus_volts);
	setprop("VC10/electric/ac/ACAux-bus-volts",AuxACbus_volts);
	setprop("VC10/electric/GroundPowerBusVolts",GroundPowerbus_volts);
	
	setprop("VC10/electric/ac/ACbus1-volts",No1ACbus_volts);
	setprop("VC10/electric/ac/ACbus2-volts",No2ACbus_volts);
	setprop("VC10/electric/ac/ACbus3-volts",No3ACbus_volts);
	setprop("VC10/electric/ac/ACbus4-volts",No4ACbus_volts);
	
	setprop("VC10/electric/dc/EssDCbus1-volts",No1EssDCbus_volts);
	setprop("VC10/electric/dc/EssDCbus2-volts",No2EssDCbus_volts);
	setprop("VC10/electric/dc/NonEssDCbus1-volts",No1NonEssDCbus_volts);
	setprop("VC10/electric/dc/NonEssDCbus2-volts",No2NonEssDCbus_volts);
	
	setprop("VC10/electric/dc/BAT1-bus-volts",No1Bat_volts);
	setprop("VC10/electric/dc/BAT2-bus-volts",No2Bat_volts);
	
	

###################################################################################
# temporary fix to supply 707 ess bus for imported systems	
	essbus = math.max(No1EssDCbus_volts,No2EssDCbus_volts);
	setprop("VC10/electric/ess-bus",essbus);
	
	
	setprop("systems/electrical/outputs/adf",No1NonEssDCbus_volts);
	setprop("systems/electrical/outputs/adf[1]",No2EssDCbus_volts);

###################################################################################
	
	setprop("VC10/electric/ac/generator/Gen1-volts",Gen1_volts);
	setprop("VC10/electric/ac/generator/Gen2-volts",Gen2_volts);
	setprop("VC10/electric/ac/generator/Gen3-volts",Gen3_volts);
	setprop("VC10/electric/ac/generator/Gen4-volts",Gen4_volts);
	
	setprop("VC10/electric/ac/generator/Gen1-ControlRelay",GCR1);
	setprop("VC10/electric/ac/generator/Gen2-ControlRelay",GCR2);	
	setprop("VC10/electric/ac/generator/Gen3-ControlRelay",GCR3);	
	setprop("VC10/electric/ac/generator/Gen4-ControlRelay",GCR4);

	setprop("VC10/electric/ac/BTB1-relay",BTB1);
	setprop("VC10/electric/ac/BTB2-relay",BTB2);
	setprop("VC10/electric/ac/BTB3-relay",BTB3);
	setprop("VC10/electric/ac/BTB4-relay",BTB4);
	setprop("VC10/electric/ac/SSB",SSB);
	
	setprop("VC10/electric/ac/BTB1-ind",BTB1_ind);
	setprop("VC10/electric/ac/BTB2-ind",BTB2_ind);
	setprop("VC10/electric/ac/BTB3-ind",BTB3_ind);
	setprop("VC10/electric/ac/BTB4-ind",BTB4_ind);
	setprop("VC10/electric/ac/SSB-ind",SSB_ind);
	
	setprop("VC10/electric/ac/generator/GCB1",GCB1);
	setprop("VC10/electric/ac/generator/GCB2",GCB2);	
	setprop("VC10/electric/ac/generator/GCB3",GCB3);	
	setprop("VC10/electric/ac/generator/GCB4",GCB4);
	
	setprop("VC10/electric/dc/TRU1power-ind",TRU1_power);
	setprop("VC10/electric/dc/TRU2power-ind",TRU2_power);
	setprop("VC10/electric/dc/StbyTRUpower-ind",StbyTRU_power);
	
	setprop("VC10/electric/dc/StbyTRUbus1-ind",StbyTRU_bus1_ind);
	setprop("VC10/electric/dc/StbyTRUbus2-ind",StbyTRU_bus2_ind);
}
###############################################################################################################

var update_electrical = func {
	update_buses();
	update_electrical_meters();
	settimer(update_electrical,0.05);   ## loop 20 per second
}
var update_electrical_meters = func {
	var ACSelector = getprop("VC10/electric/AC_FreqVoltsSelectsw");
	if (ACSelector == 0){ 
		setprop("VC10/electric/ACmeter-volts", getprop("VC10/electric/ac/gound-power-bus-volts"));
		setprop("VC10/electric/ACmeter-freq", getprop("VC10/electric/ac/gound-power-bus-freq"));
		}elsif ( ACSelector == 1){ 
		setprop("VC10/electric/ACmeter-volts", getprop("VC10/electric/ac/generator/Gen1-volts"));
		setprop("VC10/electric/ACmeter-freq", getprop("VC10/electric/ac/generator/Gen1-freq"));
		}elsif ( ACSelector == 2){ 
		setprop("VC10/electric/ACmeter-volts", getprop("VC10/electric/ac/generator/Gen2-volts"));
		setprop("VC10/electric/ACmeter-freq", getprop("VC10/electric/ac/generator/Gen2-freq"));
		}elsif (ACSelector == 3){
		setprop("VC10/electric/ACmeter-volts", getprop("VC10/electric/ac/generator/Gen3-volts"));
		setprop("VC10/electric/ACmeter-freq", getprop("VC10/electric/ac/generator/Gen3-freq"));
		}elsif (ACSelector == 4){
		setprop("VC10/electric/ACmeter-volts", getprop("VC10/electric/ac/generator/Gen4-volts"));
		setprop("VC10/electric/ACmeter-freq", getprop("VC10/electric/ac/generator/Gen4-freq"));
		}elsif (ACSelector == 5){
		setprop("VC10/electric/ACmeter-volts", getprop("VC10/electric/ac/generator/GenELRAT-volts"));
		setprop("VC10/electric/ACmeter-freq", getprop("VC10/electric/ac/generator/GenELRAT-freq"));
		}	
	var DCSelector = getprop("VC10/electric/DC_VoltsSelectsw");
	if (DCSelector == 0){ 
		setprop("VC10/electric/DCmeter-volts", 0);
		}elsif ( DCSelector == 1){ 
		setprop("VC10/electric/DCmeter-volts", getprop("VC10/electric/dc/EssDCbus1-volts"));
		}elsif ( DCSelector == 2){ 
		setprop("VC10/electric/DCmeter-volts", getprop("VC10/electric/dc/BAT1-volts"));
		}elsif (DCSelector == 3){
		setprop("VC10/electric/DCmeter-volts", getprop("VC10/electric/dc/BAT2-volts"));
		}elsif (DCSelector == 4){
		setprop("VC10/electric/DCmeter-volts", getprop("VC10/electric/dc/EssDCbus2-volts"));
		}
##	print("DCSelector ",DCSelector,"   DCmeter-volts  ",getprop("VC10/electric/DCmeter-volts"));
}

################################## more generator helpers #######################################





################ the ground connect switch fall back ###################
setlistener("VC10/electric/external-power-connected", func(state){
  var state = state.getBoolValue();
  if(state)	setprop("VC10/ground-service/enabled", 1); #illuminate the lights of VW Bus
	var src_ext = getprop("VC10/electric/ess-power-switch") or 0;


 	setprop("VC10/electric/GroundPower-sw", 0);
 	
	if(getprop("sim/sound/switch2") == 1){
  	 setprop("sim/sound/switch2", 0); 
  }else{
  	 setprop("sim/sound/switch2", 1);
  }

},0,0);

## Generator Drive Switches
## 1 = Normal (Should be returned to this position after use, to unpower the CSD drive trip solenoid.)
## 0 = Disconnect (Activates the generator CSD drive trip solenoid)
setlistener("VC10/electric/ac/generator/Gen1-Drv-sw", func {
	var GDsw = getprop("VC10/electric/ac/generator/Gen1-Drv-sw");
	if(GDsw == 0){
			setprop("VC10/electric/ac/generator/Gen1-Drv", 0);
			setprop("VC10/electric/ac/generator/GCB1", 0);
			setprop("VC10/electric/ac/generator/Gen1-Fail", 1);
		} 
});
setlistener("VC10/electric/ac/generator/Gen2-Drv-sw", func {
	var GDsw = getprop("VC10/electric/ac/generator/Gen2-Drv-sw");
	if(GDsw == 0){
			setprop("VC10/electric/ac/generator/Gen2-Drv", 0);
			setprop("VC10/electric/ac/generator/GCB2", 0);
			setprop("VC10/electric/ac/generator/Gen2-Fail", 1);
		} 
});
setlistener("VC10/electric/ac/generator/Gen3-Drv-sw", func {
	var GDsw = getprop("VC10/electric/ac/generator/Gen3-Drv-sw");
	if(GDsw == 0){
			setprop("VC10/electric/ac/generator/Gen3-Drv", 0);
			setprop("VC10/electric/ac/generator/GCB3", 0);
			setprop("VC10/electric/ac/generator/Gen3-Fail", 1);
		} 
});
setlistener("VC10/electric/ac/generator/Gen4-Drv-sw", func {
	var GDsw = getprop("VC10/electric/ac/generator/Gen4-Drv-sw");
	if(GDsw == 0){
			setprop("VC10/electric/ac/generator/Gen4-Drv", 0);
			setprop("VC10/electric/ac/generator/GCB4", 0);
			setprop("VC10/electric/ac/generator/Gen4-Fail", 1);
		} 
});

## GCR Switches
##  1 = Normal
##  0   (spring loaded centre position)
## -1 = Trip

setlistener("VC10/electric/ac/generator/GCR1-sw", func {
	var GCR1_sw = getprop("VC10/electric/ac/generator/GCR1-sw");
	if (GCR1_sw == 1) {
			setprop("VC10/electric/ac/generator/Gen1-ControlRelay", 1);
			}
		elsif(GCR1_sw == -1){
			setprop("VC10/electric/ac/generator/Gen1-ControlRelay", 0);
			setprop("VC10/electric/ac/generator/GCB1", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GCR2-sw", func {
	var GCR2_sw = getprop("VC10/electric/ac/generator/GCR2-sw");
	if (GCR2_sw == 1) {
			setprop("VC10/electric/ac/generator/Gen2-ControlRelay", 1);
			}
		elsif(GCR2_sw == -1){
			setprop("VC10/electric/ac/generator/Gen2-ControlRelay", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GCR3-sw", func {
	var GCR3_sw = getprop("VC10/electric/ac/generator/GCR3-sw");
	if (GCR3_sw == 1) {
			setprop("VC10/electric/ac/generator/Gen3-ControlRelay", 1);
			}
		elsif(GCR3_sw == -1){
			setprop("VC10/electric/ac/generator/Gen3-ControlRelay", 0);
		} 
});
setlistener("VC10/electric/ac/generator/GCR4-sw", func {
	var GCR4_sw = getprop("VC10/electric/ac/generator/GCR4-sw");
	if (GCR4_sw == 1) {
			setprop("VC10/electric/ac/generator/Gen4-ControlRelay", 1);
			}
		elsif(GCR4_sw == -1){
			setprop("VC10/electric/ac/generator/Gen4-ControlRelay", 0);
		} 
});

## Generator Circuit Breaker Switches
## 1 = Close
## 0 = Trip
setlistener("VC10/electric/ac/generator/Gen1-Control-sw", func {
	var GenControl_sw = getprop("VC10/electric/ac/generator/Gen1-Control-sw");
	if(GenControl_sw == 1){
			setprop("VC10/electric/ac/generator/GCB1", 1);
		}
	if(GenControl_sw == -1){
			setprop("VC10/electric/ac/generator/GCB1", 0);
		}		
});
 setlistener("VC10/electric/ac/generator/Gen2-Control-sw", func {
	var GenControl_sw = getprop("VC10/electric/ac/generator/Gen2-Control-sw");
	if(GenControl_sw == 1){
			setprop("VC10/electric/ac/generator/GCB2", 1);
		}
	if(GenControl_sw == -1){
			setprop("VC10/electric/ac/generator/GCB2", 0);
		}		
});
setlistener("VC10/electric/ac/generator/Gen3-Control-sw", func {
	var GenControl_sw = getprop("VC10/electric/ac/generator/Gen3-Control-sw");
	if(GenControl_sw == 1){
			setprop("VC10/electric/ac/generator/GCB3", 1);
		} 
	if(GenControl_sw == -1){
			setprop("VC10/electric/ac/generator/GCB3", 0);
		}
});
setlistener("VC10/electric/ac/generator/Gen4-Control-sw", func {
	var GenControl_sw = getprop("VC10/electric/ac/generator/Gen4-Control-sw");
	if(GenControl_sw == 1){
			setprop("VC10/electric/ac/generator/GCB4", 1);
		}
	if(GenControl_sw == -1){
			setprop("VC10/electric/ac/generator/GCB4", 0);
		}		
});
##############################################################################################
setlistener("sim/signals/fdm-initialized", func {
    init_lighting_switches();
	init_instrumentation_power();
    settimer(update_electrical,5);

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