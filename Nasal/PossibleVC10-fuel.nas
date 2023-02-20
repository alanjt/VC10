# VC10 Fuel System
# ----------------
# Author: A J Teeder

    print("VC10 fuel.nas");

# All values in US Gallons, unless specified.

# VC10 fuel system operation logic:
# 6 wing tanks (1a,1,2 left and 3,4,4a right), 1 centre wing tank. 



# Check valves prevent reverse fuel flow from the main tanks to the wing tanks.

# Fuel from the external wing tanks (if fitted) is transferred to the main tanks 
# by hydraulic transfer pumps and/or pressure from the bleed air system.
 
# The same system transfers fuel from the wing tanks to the main tanks.


# Fuel flow 12100 gal/hr  -- full reheat.
# Refuel rate 500 gal/min -> 12min refuel time
 

var Valve_1        = nil;
var Valve_2        = nil;
var Valve_3        = nil;
var Valve_4        = nil;
var Valve_5        = nil;
var Valve_6        = nil;
var Valve_7        = nil;
var Valve_8        = nil;
var Aft_ManualXferCock = nil;
var Fwd_ManualXferCock = nil;
var Xfeed_Cock       = nil;
var Port_RecircCock  = nil;
var Stbd_RecircCock  = nil;
var Port_LPCock      = nil;
var Stbd_LPCock      = nil;
var Port_BypassCock  = nil;
var Stbd_BypassCock  = nil;
var Port_CoolingCock = nil;
var Stbd_CoolingCock = nil;

var Xfer_gallery   = nil;
var Tank_1         = nil;
var Tank_2         = nil;
var Tank_3         = nil;
var Tank_4         = nil;
var Port_WingTank  = nil;
var Stbd_WingTank  = nil;
var Fwd_Collector  = nil;
var Aft_Collector  = nil;
var Engine_1LP     = nil;
var Engine_2LP     = nil;
var APP_LP         = nil;

var Boost_Pump1    = nil;
var Boost_Pump2    = nil;
var Boost_Pump3    = nil;
var Boost_Pump4    = nil;
var Port_XferPump  = nil;
var Stbd_XferPump  = nil;
var PortAirPress   = nil;
var StbdAirPress   = nil;			

var DC_ESSEN_ok    = nil;
var counter        = 0;
var FuelFreeze     = props.globals.getNode("sim/freeze/fuel");
var Pilot_G        = props.globals.getNode("accelerations/pilot-g");
var Pitch_Deg      = props.globals.getNode("orientation/pitch-deg");
var XAccell_Fpss   = props.globals.getNode("accelerations/pilot/x-accel-fps_sec"); 
var APP_Switch     = props.globals.getNode("controls/APP/off-start-switch");
var TotalFuelGals  = props.globals.getNode("consumables/fuel/total-fuel-gals", 1);
var fwd_fuel_gauge_lbs  = props.globals.getNode("consumables/fuel/fwd_fuel_gauge_lbs", 1); 
var aft_fuel_gauge_lbs  = props.globals.getNode("consumables/fuel/aft_fuel_gauge_lbs", 1); 

### Initialise fuel stuff ###

var SysFuelInit    = props.globals.initNode("systems/fuel/initialized", 0, "BOOL");
var FuelFull       = props.globals.initNode("systems/fuel/fueltanksfull", 0, "BOOL");

var init_fuel = func {	
	if ( ! SysFuelInit.getBoolValue() ) {
	print ("initialise fuel");
		# Don't do it twice. ie: case of fgcommand("reinit").
		fuel.update = func {}; # Kill $FG_ROOT/Nasal/fuel.nas loop.
		
		# Fuel indicators
		props.globals.getNode("systems/fuel/crossfeed", 1).setBoolValue(0);
		props.globals.getNode("systems/fuel/tank1lamp", 1).setBoolValue(0);
		props.globals.getNode("systems/fuel/tank2lamp", 1).setBoolValue(0);
		props.globals.getNode("systems/fuel/tank3lamp", 1).setBoolValue(0);
		props.globals.getNode("systems/fuel/tank4lamp", 1).setBoolValue(0);
		props.globals.getNode("systems/fuel/Wingtanklamp", 1).setBoolValue(0);
		props.globals.getNode("systems/fuel/OLtanklamp", 1).setBoolValue(0);
		props.globals.getNode("systems/fuel/flight_time_remaining", 1).setDoubleValue(0.0);
		props.globals.getNode("systems/fuel/fuel-flow-rate-pps", 1).setDoubleValue(0.0);
		
		# Valves ("property",number, initial status):
	print ("initialise fuel valves");
		Valve_1        		= Valve.new("Valve_1",				0, 0);
		Valve_2        		= Valve.new("Valve_2",				1, 0);
		Valve_3        		= Valve.new("Valve_3",				2, 1);
		Valve_4        		= Valve.new("Valve_4",				3, 1);
		Valve_5        		= Valve.new("Valve_5",				4, 1);
		Valve_6        		= Valve.new("Valve_6",				5, 1);
		Valve_7        		= Valve.new("Valve_7",				6, 0);
		Valve_8        		= Valve.new("Valve_8",				7, 0);
		Aft_ManualXferCock  = Valve.new("Aft_ManualXferCock",	8, 0);
		Fwd_ManualXferCock  = Valve.new("Fwd_ManualXferCock",	9, 0);
		Xfeed_Cock       	= Valve.new("Xfeed_Cock",			10, 1);
		Port_RecircCock  	= Valve.new("Port_RecircCock",		11, 0);
		Stbd_RecircCock  	= Valve.new("Stbd_RecircCock",		12, 0);
		Port_LPCock      	= Valve.new("Port_LPCock",			13, 1);
		Stbd_LPCock      	= Valve.new("Stbd_LPCock",			14, 1);
		Port_BypassCock  	= Valve.new("Port_BypassCock",		15, 0);
		Stbd_BypassCock  	= Valve.new("Stbd_BypassCock",		16, 0);	
		Port_CoolingCock  	= Valve.new("Port_CoolingCock",		17, 0);
		Stbd_CoolingCock  	= Valve.new("Stbd_CoolingCock",		18, 0);		
		
		 #Tanks ("name", number, type (1 = internal), selected):
	print ("initialise fuel tanks");
		Xfer_gallery   = Tank.new("Xfer_gallery",         0, 1, 1);	
		Tank_1         = Tank.new("Tank 1",               1, 1, 1);
		Tank_2         = Tank.new("Tank 2",               2, 1, 1);
		Tank_3         = Tank.new("Tank 3",               3, 1, 1);
		Tank_4         = Tank.new("Tank 4",               4, 1, 1);
		Port_WingTank  = Tank.new("Port wing tank",       5, 1, 1);
		Stbd_WingTank  = Tank.new("Stbd wing tank",       6, 1, 1);
		Fwd_Collector  = Tank.new("Fwd Collector",        7, 1, 1);
		Aft_Collector  = Tank.new("Aft Collector",        8, 1, 1);
		Engine_1LP     = Tank.new("Engine 1 LP",          9, 1, 1);
		Engine_2LP     = Tank.new("Engine 2 LP",         10, 1, 1);
		APP_LP         = Tank.new("APP LP",              11, 1, 1);
##		Port_DropTank  = Tank.new("Port drop tank",      12, 0, 1);
##		Stbd_DropTank  = Tank.new("Stbd drop tank",      13, 0, 1);		

			
		#Pumps ("name", number, source (percent of max), threshold, max_output (gph) )
	print ("initialise fuel pumps");
# fueldraulic driven LP boost pumps, max output in GPH
		Boost_Pump1    = Pump.new("Boost_Pump1",			0, "/engines/engine[0]/n2", 1.0, 15000);
		Boost_Pump2    = Pump.new("Boost_Pump2",			1, "/engines/engine[1]/n2", 1.0, 15000);
		Boost_Pump3    = Pump.new("Boost_Pump3",			2, "/engines/engine[0]/n2", 1.0, 15000);
		Boost_Pump4    = Pump.new("Boost_Pump4",			3, "/engines/engine[1]/n2", 1.0, 15000);
#  TODO wing Xfer pumps should be driven by hydraulic system 		
		Port_XferPump  = Pump.new("Port_XferPump",			4, "/engines/engine[0]/n2", 20.0, 5000); 
		Stbd_XferPump  = Pump.new("Stbd_XferPump",			5, "/engines/engine[1]/n2", 20.0, 5000);
#  air bleeds to pressurise wing and drop tanks , max output in GPH output from tank		
		PortAirPress   = Pump.new("PortAirPress",			6, "/engines/engine[0]/n2", 1.0, 5000.0); 
		StbdAirPress   = Pump.new("StbdAirPress",			7, "/engines/engine[1]/n2", 1.0, 5000.0);

		settimer(update_fuel, 2);
		SysFuelInit.setBoolValue(1);
	}
}
##--------------------------------------------------------------------------------------------------------
var update_fuel = func {
## print ("update fuel");

	if ( FuelFreeze.getBoolValue() ) { return }
	
	var current_time = getprop("/sim/time/elapsed-sec");
	var dt = 0.1;
	var dtr = getprop("/sim/time/delta-realtime-sec"); 
#	print ("dt  ", dt, "  dtreal ", dtr," current_time ",current_time);

	var Eng1_fuel_avail_gals     = 0.0;
	var Eng2_fuel_avail_gals     = 0.0;
		
	var gal_level1                  = Tank_1.get_level_gals();
	var gal_level2                  = Tank_2.get_level_gals();	
	var gal_level3                  = Tank_3.get_level_gals();	
	var gal_level4                  = Tank_4.get_level_gals();
	var gal_levelportwing           = Port_WingTank.get_level_gals();	
	var gal_levelstbdwing           = Stbd_WingTank.get_level_gals();
	var gal_fwdcoll                 = Fwd_Collector.get_level_gals();
	var gal_aftcoll                 = Aft_Collector.get_level_gals();	
	var gal_LP1                  	= Engine_1LP.get_level_gals();	
	var gal_LP2                 	= Engine_2LP.get_level_gals();	
	var gal_LP_AP                  	= APP_LP.get_level_gals();	
	var gal_Xfer                 	= Xfer_gallery.get_level_gals();
##	var gal_levelportdrop           = Port_DropTank.get_level_gals();	
##	var gal_levelstbddrop           = Stbd_DropTank.get_level_gals();
	
	var fwd_main_tanks_gals         = gal_level1 + gal_level2;
	var aft_main_tanks_gals         = gal_level3 + gal_level4;
	
	var capacity1 					= Tank_1.get_capacity_gals();
	var capacity2 					= Tank_2.get_capacity_gals();
	var capacity3 					= Tank_3.get_capacity_gals();
	var capacity4 					= Tank_4.get_capacity_gals();
	var capacityportwing 			= Port_WingTank.get_capacity_gals();
	var capacitystbdwing 			= Stbd_WingTank.get_capacity_gals();
	var capacity_fwdcoll 			= Fwd_Collector.get_capacity_gals();
	var capacity_aftcoll 			= Aft_Collector.get_capacity_gals();
	var capacity_LP1     			= Engine_1LP.get_capacity_gals();	
	var capacity_LP2     			= Engine_2LP.get_capacity_gals();	
	var capacity_LP_AP   			= APP_LP.get_capacity_gals();	
	var capacity_xfr 				= Xfer_gallery.get_capacity_gals();
##	var capacityportdrop 			= Port_DropTank.get_capacity_gals();
##	var capacitystbddrop 			= Stbd_opTank.get_capacity_gals();
	
	var space1 						= Tank_1.get_space_gals();
	var space2 						= Tank_2.get_space_gals();	
	var space3 						= Tank_3.get_space_gals();
	var space4 						= Tank_4.get_space_gals();
	var spaceportwing 				= Port_WingTank.get_space_gals();
	var spacestbdwing 				= Stbd_WingTank.get_space_gals();
	var space_fwdcoll 				= Fwd_Collector.get_space_gals();
	var space_aftcoll 				= Aft_Collector.get_space_gals();
	var space_LP1 					= Engine_1LP.get_space_gals();
	var space_LP2 					= Engine_2LP.get_space_gals();
	var space_LP_AP 				= APP_LP.get_space_gals();	
	var space_xfr 					= Xfer_gallery.get_space_gals();
##	var spaceportdrop 				= Port_DropTank.get_space_gals();
##	var spacestbddrop 				= Stbd_DropTank.get_space_gals();	
	
	var space_fwdtanks = space1 + space2;
	var space_afttanks = space3 + space4;	
				
	var lbs_level1                  = Tank_1.get_level_lbs();
	var lbs_level2                  = Tank_2.get_level_lbs();	
	var lbs_level3                  = Tank_3.get_level_lbs();	
	var lbs_level4                  = Tank_4.get_level_gals();
	var lbs_levelportwing           = Port_WingTank.get_level_lbs();	
	var lbs_levelstbdwing           = Stbd_WingTank.get_level_lbs();
	var lbs_fwdcoll                 = Fwd_Collector.get_level_lbs();
	var lbs_aftcoll                 = Aft_Collector.get_level_lbs();	
	var lbs_LP1                  	= Engine_1LP.get_level_lbs();	
	var lbs_LP2                 	= Engine_2LP.get_level_lbs();	
	var lbs_LP_AP                  	= APP_LP.get_level_lbs();	
	var lbs_Xfer                 	= Xfer_gallery.get_level_lbs();
##	var lbs_levelportdrop           = Port_DropTank.get_level_lbs();	
##	var lbs_levelstbddrop           = Stbd_DropTank.get_level_lbs();

	DC_ESSEN_ok = getprop("systems/electrical/outputs/essDCbus_online");
	var brakesOn = getprop("/controls/gear/brake-parking");
	var wow = getprop("/gear/gear/wow");
	var ground_fuel = getprop("systems/fuel/ground_fuel");
		if (!brakesOn or !wow){
		ground_fuel = 0;
		setprop("systems/fuel/ground_fuel", ground_fuel);
		}
	
###################################################################################### 
#Fuel feed to engines from fuselage tanks via collector tanks and LP cocks.
###################################################################################### 

	if (getprop("controls/switches/port_lp_cock-switch") == 0) {
		Port_LPCock.set_closed();
	}
	else {
		Port_LPCock.set_open();
	}
	

	if (getprop("controls/switches/stbd_lp_cock-switch") == 0) {
		Stbd_LPCock.set_closed();
	}
	else {
		Stbd_LPCock.set_open();
	}
		
	if (getprop("controls/switches/fuel/autobalance_master") == 0) {
		Xfeed_Cock.set_closed();
	}
	else {
		Xfeed_Cock.set_open();
	}
		
## In the following code pumps should depend upon the fueldraulic system, not on the essentialDC bus

	if ( Boost_Pump1.is_powered() or Boost_Pump2.is_powered() ) {
		if (Xfeed_Cock.is_open()) {
			Eng1_fuel_avail_gals = gal_fwdcoll;
			Eng2_fuel_avail_gals = gal_fwdcoll;
		}
		else {
			Eng1_fuel_avail_gals = gal_fwdcoll;
		}
	}
	if ( Boost_Pump3.is_powered() or Boost_Pump4.is_powered() ) {
		if (Xfeed_Cock.is_open()) {
			Eng1_fuel_avail_gals += gal_aftcoll;
			Eng2_fuel_avail_gals += gal_aftcoll;
		}
		else {
			Eng2_fuel_avail_gals = gal_aftcoll;					
		}
	}
	
## printf ("AftColl  %f  FwdColl %f   Eng1Avail,Eng2Avail %f  %f",Fwd_Collector.get_level_gals(),Aft_Collector.get_level_gals(), Eng1_fuel_avail_gals,Eng2_fuel_avail_gals);
	
	# Keep engine LP pipework full as long as there is fuel in the collector tanks
	# and the LP cocks are open.
	
## Engine_1LP 
	var Engine_1gal_used = Engine_1LP.get_space_gals();
	if (Eng1_fuel_avail_gals > Engine_1gal_used){
		Engine_1LP.set_level_gals(capacity_LP1); 
	}
	if (!Port_LPCock.is_open()) {
		Engine_1LP.set_level_gals(0.0);
		Engine_1gal_used = 0;
	}

## Engine_2LP 
	var Engine_2gal_used = Engine_2LP.get_space_gals();
	if (Eng2_fuel_avail_gals > Engine_2gal_used){
		Engine_2LP.set_level_gals(capacity_LP2); 
	}
	if (!Stbd_LPCock.is_open()) {
		Engine_2LP.set_level_gals(0); 
		Engine_2gal_used = 0;
	}
	
## APP_LP
	var APPgal_used = APP_LP.get_space_gals();
	if ( Tank_2.get_level_gals() > APPgal_used){
		APP_LP.set_level_gals(capacity_LP_AP);
	}

#### set engine controls so that engine can be restarted when we have fuel	
	if(gal_LP1 < 0.001){
		setprop("controls/engines/engine/cutoff","true");		setprop("controls/engines/engine/starter","false");
	}
	
	if(gal_LP2 < 0.001){
		setprop("controls/engines/engine[1]/cutoff","true");		setprop("controls/engines/engine[1]/starter","false");
	}
	
# e1 and e2 are the proportion of fuel to be taken from fwd and aft tanks. 
# This is 0.5:0.5 unless the autotrim system is in operation.

	var e1 = 0.5;
	var e2 = 0.5;
	if (getprop("controls/switches/fuel/autobalance_master") != 0) {
		e1 = auto_trim();
		e2 = 1.0 - e1;
	}
## printf ("eng1  %f  eng2 %f   e1,e2 %f  %f",Engine_1LP.get_used_gals(),Engine_2LP.get_used_gals(), e1,e2);		

# empty collector tanks from engine demands, dependant on boost pumps, x-feed and auto-balance
## Fwd_Collector

	var	fwd_collector_demand = 0.0;
	if (gal_fwdcoll  > 0) {
		if (Xfeed_Cock.is_open()) {
			fwd_collector_demand = (e1 * Engine_1gal_used + e1 * Engine_2gal_used);
		}
		else {
			fwd_collector_demand = Engine_1gal_used;
		}
		if ((Boost_Pump1.is_powered()) or (Boost_Pump2.is_powered()))  {
		gal_fwdcoll  = gal_fwdcoll - fwd_collector_demand;
		}
	}

## Aft_Collector

	var aft_collector_demand = 0.0;
	if (gal_aftcoll > 0) {
		if (Xfeed_Cock.is_open()) {
			aft_collector_demand = (e2 * Engine_1gal_used + e2 * Engine_2gal_used);
		}
		else {
			aft_collector_demand = Engine_2gal_used;
		}
		if ((Boost_Pump3.is_powered()) or (Boost_Pump4.is_powered()))  {
		gal_aftcoll = gal_aftcoll - aft_collector_demand;
		}
	}
	
# keep fwd collector tank full  by gravity if there is fuel in tanks1/2
	space_fwdcoll = capacity_fwdcoll - gal_fwdcoll;
	if (fwd_main_tanks_gals > space_fwdcoll) {
		gal_fwdcoll = capacity_fwdcoll;
		}
		
# keep aft collector tank full by gravity if there is fuel in tanks3/4
	space_aftcoll = capacity_aftcoll - gal_aftcoll;
		if (aft_main_tanks_gals > space_aftcoll) {
		gal_aftcoll = capacity_aftcoll;
		}

# Fuselage Tanks
		
# Proportion fuel taken from main tanks to collectors according to relative levels in each pair of main tanks.
	var k12 = 0.0;
	var k21 = 0.0;
	if ((gal_level1  + gal_level2 ) > 0.0) {
		k12 = gal_level1 /(gal_level1  + gal_level2 );
		k21 = 1.0 - k12;
	}
	var k34 = 0.0;
	var k43 = 0.0;
	if ((gal_level3  + gal_level4 ) > 0.0) {	
		k34 = gal_level3 /(gal_level3  + gal_level4 );
		k43 = 1.0 - k34;
	}
	
	var gal_used = 0;
	
## Tank 1
	gal_used = space_fwdcoll * k12;
	gal_level1 = gal_level1 - gal_used;
 
## Tank 2
	gal_used = space_fwdcoll * k21 + APPgal_used;
	gal_level2 = gal_level2 - gal_used;
	
## Tank 3
	gal_used = space_aftcoll * k34;
	gal_level3 = gal_level3 - gal_used;
 
## Tank 4
	gal_used = space_aftcoll * k43;
	gal_level4 = gal_level4 - gal_used;

###################################################################################### 
# refuelling, manual fuel balance and fuel transfer to and from wing tanks plus drop tanks
###################################################################################### 

## fuel switches on the navigators fuel panel.

	var direction_sw = (getprop("controls/switches/fuel/manual_transfer"));  # -1=AFT,  0=OFF,  1=FWD
	var tank1_sw = (getprop("controls/switches/fuel/fuel_tank1-switch"));        # -1=FLGT, 0=OFF,  1=REFL
	var tank2_sw = (getprop("controls/switches/fuel/fuel_tank2-switch"));        # -1=FLGT, 0=OFF,  1=REFL
	var tank3_sw = (getprop("controls/switches/fuel/fuel_tank3-switch"));        # -1=FLGT, 0=OFF,  1=REFL
	var tank4_sw = (getprop("controls/switches/fuel/fuel_tank4-switch"));        # -1=FLGT, 0=OFF,  1=REFL
	var wingtank_sw = (getprop("controls/switches/fuel/fuel_tankwings-switch")); # -1=FLGT, 0=OFF,  1=REFL
	var droptank_sw = (getprop("controls/switches/fuel/fuel_tankOL-switch"));    # -1=FLGT, 0=OFF,  1=REFL
	var fuel_master_sw = (getprop("controls/switches/fuel/fuel_master-switch")); # -1=OFF,  0=REFL, 1=DEFL
	var fuel_fuse_sw = (getprop("controls/switches/fuel/fuel_refuel-switch"));   #          0=FULL, 1=HALF

	var tank1Andgate1 = (tank1_sw == -1) and (direction_sw == 1) and Tank_1.below_Xferlevel();
	var tank1Andgate2 = (Tank_1.below_half() or (fuel_master_sw == 1)) and (fuel_fuse_sw == 1);
	var tank1Andgate3 = (Tank_1.notfull() or (fuel_master_sw == 1)) and (fuel_fuse_sw == 0) and (tank1_sw == 1);
	var tank1lamp = tank1Andgate2 or tank1Andgate3;
	var tank1fuelcock = tank1Andgate1 or tank1Andgate2 or tank1Andgate3;
	setprop("systems/fuel/tank1lamp", tank1lamp);
	
	var tank2Andgate1 = (tank2_sw == -1) and (direction_sw == 1) and Tank_2.below_Xferlevel();
	var tank2Andgate2 = (Tank_2.below_half() or (fuel_master_sw == 1)) and (fuel_fuse_sw == 1);
	var tank2Andgate3 = (Tank_2.notfull() or (fuel_master_sw == 1)) and (fuel_fuse_sw == 0) and (tank2_sw == 1);
	var tank2lamp = tank2Andgate2 or tank2Andgate3;
	var tank2fuelcock = tank2Andgate1 or tank2Andgate2 or tank2Andgate3;
	setprop("systems/fuel/tank2lamp", tank2lamp);
	
	var tank3Andgate1 = (tank3_sw == -1) and ((direction_sw == -1) or direction_sw == 0) and Tank_3.below_Xferlevel();
	var tank3Andgate2 = (Tank_3.notfull() or (fuel_master_sw == 1)) and (tank3_sw == 1);
	var tank3lamp = tank3Andgate2;
	var tank3fuelcock = tank3Andgate1 or tank3Andgate2;
	setprop("systems/fuel/tank3lamp", tank3lamp);
	
	var tank4Andgate1 = (tank4_sw == -1) and ((direction_sw == -1) or direction_sw == 0) and Tank_4.below_Xferlevel();
	var tank4Andgate2 = (Tank_4.notfull() or (fuel_master_sw == 1)) and (tank4_sw == 1);
	var tank4lamp = tank4Andgate2;
	var tank4fuelcock = tank4Andgate1 or tank4Andgate2;
	setprop("systems/fuel/tank4lamp", tank4lamp);

	var gal_levelstbddrop = 0;   # remove this when drop tanks are simulated
	var gal_levelportdrop = 0;   # remove this when drop tanks are simulated
	var spacestbddrop = 0;       # remove this when drop tanks are simulated
	var spaceportdrop = 0;       # remove this when drop tanks are simulated
	
	var droptankAndgate = (droptank_sw == 1) and ((spacestbddrop > 0 or (spaceportdrop > 0) or fuel_master_sw == 1));
	var droptanklamp = droptankAndgate;
	var droptankfuelcock = droptankAndgate;
	setprop("systems/fuel/OLtanklamp", droptanklamp);

	var refuel_probe_in = 1;   # remove this when flight refuel probe is simulated
	
	var wingtankAndgate1 = (droptank_sw == -1) and (gal_levelportdrop > 0 ) and (gal_levelstbddrop > 0) and Stbd_WingTank.notfull() and Port_WingTank.notfull() and ((wingtank_sw == 1) or (wingtank_sw == -1));
	var wingtankAndgate2 = Stbd_WingTank.notempty() and Port_WingTank.notempty() and (wingtank_sw == 1) and refuel_probe_in;
	var wingtankAndgate3 = (wingtank_sw == -1) and Stbd_WingTank.empty() and Port_WingTank.empty();
	var wingtankAndgate4 = (wingtank_sw == 1) and Stbd_WingTank.notfull() and Port_WingTank.notfull();
	var wingtanklamp = wingtankAndgate2;
	var wingtankfuelcock = wingtankAndgate2 or wingtankAndgate3;
	setprop("systems/fuel/systems/fuel/Wingtanklamp", wingtanklamp);
	
	var available_gals = 0.0;
	var pump12_gals = 0.0;
	var pump34_gals = 0.0;
	var engine_used_gals = 0.0;
	
	if (tank1fuelcock) {
		Valve_1.set_open();
		}
	else {
		Valve_1.set_closed();
		}
	if (tank2fuelcock) {
		Valve_2.set_open();
		}
	else {
		Valve_2.set_closed();
		}
	if (tank3fuelcock) {
		Valve_3.set_open();
		}
	else {
		Valve_3.set_closed();
		}
	if (tank4fuelcock) {
		Valve_4.set_open();
		}
	else {
		Valve_4.set_closed();
		}
	if (wingtankfuelcock) {
	## set to refuel to wingtanks
		Port_BypassCock.set_open();
		Stbd_BypassCock.set_open();
		}
	else {
	## set to transfer fuel from wingtanks
		Port_BypassCock.set_closed();
		Stbd_BypassCock.set_closed();
		}
	
	if (direction_sw == 1){  # move fuel fwd
		Aft_ManualXferCock.set_closed();
		Fwd_ManualXferCock.set_open();
		}
	else if (direction_sw == -1){  # move fuel aft
		Aft_ManualXferCock.set_open();
		Fwd_ManualXferCock.set_closed();
		}
	else if (direction_sw == 0){  # close Fwd and Aft xfer cocks
		Aft_ManualXferCock.set_closed();
		Fwd_ManualXferCock.set_closed();
		}
		
##	Xfer_Gallery_Transfer(dt);

# check for open valves
	var v1  = Valve_1.is_open();
	var v2  = Valve_2.is_open();
	var v3  = Valve_3.is_open();
	var v4  = Valve_4.is_open();
	var v5  = Valve_5.is_open();
	var v6  = Valve_6.is_open();
	var v7  = Valve_7.is_open();
	var v8  = Valve_8.is_open();
	var v9  = Port_BypassCock.is_open();
	var v10 = Stbd_BypassCock.is_open();
	var FwdXfer = Fwd_ManualXferCock.is_open();
	var AftXfer = Aft_ManualXferCock.is_open();
	
# If fwd manual transfer valve is open, pump fuel from aft collector to transfer gallery	
	if (FwdXfer){
		engine_used_gals = space_aftcoll;
		pump34_gals = Boost_Pump3.get_output(dt) + Boost_Pump4.get_output(dt);
		available_gals = pump34_gals - engine_used_gals;
		if (available_gals > space_xfr){
			available_gals = space_xfr;
			}
		gal_aftcoll -= available_gals;
		gal_Xfer += available_gals;
		}
# If aft manual transfer valve is open, pump fuel from fwd collector to transfer gallery
	if (AftXfer){
		engine_used_gals = space_fwdcoll;
		pump12_gals = Boost_Pump1.get_output(dt) + Boost_Pump2.get_output(dt);
		available_gals = pump12_gals - engine_used_gals;
			if (available_gals > space_xfr){
			available_gals = space_xfr;
			}
		gal_fwdcoll -= available_gals;
		gal_Xfer += available_gals;
		}

	# distribute fuel from wing tanks to transfer gallery	
	if (!v9 and (gal_levelportwing > 0) and (space_afttanks > 100)){
		    var gal_portwingXfer = PortAirPress.get_output(dt);
			gal_levelportwing -= gal_portwingXfer;
			gal_Xfer += gal_portwingXfer;
		}
	if (!v10 and (gal_levelstbdwing > 0) and (space_afttanks > 100)){
		    var gal_stbdwingXfer = StbdAirPress.get_output(dt);
		    gal_levelstbdwing -= gal_stbdwingXfer;
		    gal_Xfer += gal_stbdwingXfer;
		}
		
	var vout = v1 + v2 + v3 + v4 + v9 + v10;  # no of valves open to take fuel from transfer gallery
	
	if (ground_fuel and (vout > 0)) gal_Xfer += (dt * 500/60); ## 500 gal/min
	
	var share = gal_Xfer/vout;  # quantity of fuel to transfer to each tank
	
##    printf ("gal_Xfer %f gal_wingXfer %f share %f valves %d %d %d %d %d %d", gal_Xfer,gal_wingXfer,share,v1,v2,v3,v4,v9,v10); 

# transfer fuel from transfer gallery to tanks that have open inlet valves
	
# Tanks that are selected for filling	
	if (v1){
		gal_level1 += share;
		}
	if (v2){
		gal_level2 += share;
		}
	if (v3){
		gal_level3 += share;
		}
	if (v4){
		gal_level4 += share;
		}
# wing tanks
	if (v9){
		gal_levelportwing += share;
		}
	if (v10){
		gal_levelstbdwing += share;
		}

	gal_Xfer = 0;
	Tank_1.set_level_gals(gal_level1);
	Tank_2.set_level_gals(gal_level2);
	Tank_3.set_level_gals(gal_level3);
	Tank_4.set_level_gals(gal_level4);
	Port_WingTank.set_level_gals(gal_levelportwing);
	Stbd_WingTank.set_level_gals(gal_levelstbdwing);
	Fwd_Collector.set_level_gals(gal_fwdcoll);
	Aft_Collector.set_level_gals(gal_aftcoll);
	Xfer_gallery.set_level_gals(gal_Xfer);

# update fuel gauge needles (TODO add effect of navigator gauge selector switches)

	fwd_fuel_gauge_lbs = Tank_1.get_level_lbs() + Tank_2.get_level_lbs();
	aft_fuel_gauge_lbs = Tank_3.get_level_lbs() + Tank_4.get_level_lbs();
	setprop("consumables/fuel/fwd_fuel_gauge_lbs", fwd_fuel_gauge_lbs); 
	setprop("consumables/fuel/aft_fuel_gauge_lbs", aft_fuel_gauge_lbs);
	
	var fuel_remaining = getprop("/consumables/fuel/total-fuel-lbs") or 0;
	var fuel_flow_rate0 = getprop("fdm/jsbsim/propulsion/engine[0]/fuel-flow-rate-pps") or 0;
	var fuel_flow_rate1 = getprop("fdm/jsbsim/propulsion/engine[1]/fuel-flow-rate-pps") or 0;
	var fuel_flow_rate2 = getprop("fdm/jsbsim/propulsion/engine[2]/fuel-flow-rate-pps") or 0;
	var fuel_flow_rate3 = getprop("fdm/jsbsim/propulsion/engine[3]/fuel-flow-rate-pps") or 0;
	var fuel_flow_rate = fuel_flow_rate0 + fuel_flow_rate1 + fuel_flow_rate2 + fuel_flow_rate2;
	setprop("systems/fuel/fuel-flow-rate-pps", fuel_flow_rate);
	if (fuel_flow_rate < 1.0) fuel_flow_rate = 0.0001;
	var flight_time_remaining = fuel_remaining / (60.0 * fuel_flow_rate);
	if(flight_time_remaining > 999.0) flight_time_remaining = 999.0;
	setprop("systems/fuel/flight_time_remaining", flight_time_remaining);

 # Request that the update function be called after time dt	
	settimer(update_fuel, dt);
	
}  # end func

#-----------------------------------------------------------------------------------------------
var auto_trim = func(){
    var cg_aft  = 46.0;
	var cg_mid  = 39.0;
	var cg_fwd  = 36.0;   # not used

	var ratio = 0.5; 
# ratio = 1, use only fwd tanks, = 0, use only aft tanks, = 0.5, use tanks equally.

	var cg = getprop("fdm/jsbsim/inertia/cg-x-percent");
	
	var cg_datum = cg_mid;	
	if(getprop("controls/switches/fuel/norm_aft") == 0) {
		cg_datum = cg_aft;
	}

	if (cg > (cg_datum + 0.1) ) {
		ratio = 0; # use aft fuel
	}
	if (cg < (cg_datum - 0.1)) {
		ratio = 1; # use fwd fuel
	}
	
 ##   printf ("cg %f  datum %f  ratio %f", cg,cg_datum,ratio);	

	return(ratio);
}

#-----------------------------------------------------------------------------------------------
# Classes ################
Tank = {
	new : func (name, number, type, selected) {
		var obj = { parents : [Tank]};
		obj.prop         = props.globals.getNode("consumables/fuel").getChild("tank", number , 1);
		obj.name         = obj.prop.getNode("name", 1);
		obj.capacity_gals= obj.prop.getNode("capacity-gal_us", 1);
		obj.ppg          = obj.prop.getNode("density-ppg", 1);
		obj.level_gal_us = obj.prop.getNode("level-gal_us", 1);		
		obj.type         = obj.prop.getNode("type", 1);			
		obj.level_lbs    = obj.prop.getNode("level-lbs", 1);    
		obj.prop.getChild("name", 0, 1).setValue(name);
		obj.prop.getChild("selected", 0, 1).setBoolValue(selected);
		obj.prop.getChild("type", 0, 1).setBoolValue(type);

		append(Tank.list, obj);
		return obj;
	},
	get_capacity_gals : func {
		return me.capacity_gals.getValue(); 
	},
	get_ppg : func {
		return me.ppg.getValue();
	},
	get_type : func {
		return me.type.getBoolValue(); 
	},
	get_level_lbs : func {
		var level_lbs = me.level_lbs.getValue() or 0 ;	
		return level_lbs;	
	},
	get_level_gals : func {
		var level_gal_us = me.level_gal_us.getValue() or 0 ;	
		return level_gal_us;	
	},
	set_level_gals : func (gals_us){
		if(gals_us < 0) gals_us = 0;
		var capacity_gals = me.capacity_gals.getValue();
		if(gals_us > capacity_gals) gals_us = capacity_gals;
		me.level_gal_us.setDoubleValue(gals_us);
	},
	get_space_gals : func {
		var level = me.level_gal_us.getValue()or 0;
	    var space = me.capacity_gals.getValue() - level;
		return space;	
	},
	get_name : func () {
		return me.name.getValue();
	},
	get_index : func () {
		return me.prop.getIndex();
	},
	full : func {
		var level = me.level_gal_us.getValue()or 0;
	    var space = me.capacity_gals.getValue() - level;
		return (space < 0.1);
	},
	notfull : func {
		var level = me.level_gal_us.getValue()or 0;
	    var space = me.capacity_gals.getValue() - level;
		return (space > 0.1);
	},
	below_half : func {
		var level = me.level_gal_us.getValue()or 0;
		return (level < me.capacity_gals.getValue() /2.0);
	},
	below_Xferlevel : func {
		var level = me.level_gal_us.getValue()or 0;
		return (level < me.capacity_gals.getValue()*0.95);
	},
	empty : func {
		var level = me.level_gal_us.getValue()or 0;
		return (level < 0.1);
	},
	notempty : func {
		var level = me.level_gal_us.getValue()or 0;
		return (level > 0.1);
	},
	list : [],
};
#----------------------------------------------------------------------------------------------
#		Pumps ("name", number, source, threshold, max_output)
var Pump = {
	new: func(name, number, source, threshold, max_output) {
		var obj = { parents: [Pump] };
		obj.prop = props.globals.getNode( "systems/fuel").getChild("pump", number , 1);
		obj.name         = obj.prop.getNode("name", 1);
		obj.source       = props.globals.getNode(source);
		obj.threshold    = threshold;
		obj.power        = obj.prop.getNode("power", 1);
		obj.max_output   = max_output;
		obj.output       = obj.prop.getNode("output", 1);
		obj.prop.getChild("name", 0, 1).setValue(name);
		obj.prop.getChild("source", 0, 1).setValue(source);	
		obj.prop.getChild("threshold", 0, 1).setValue(threshold);			
		obj.prop.getChild("power", 0, 1).setBoolValue(0);
		obj.prop.getChild("max_output", 0, 1).setValue(max_output);
		obj.prop.getChild("output", 0, 1).setDoubleValue(0.0);
		append(Pump.list, obj);
		return obj;
	},
	is_powered : func {
		var n2 = me.source.getValue();
###print ("  n2 ",n2, "   threshold ",me.threshold);
		var power = (n2 > me.threshold);
		me.power.setBoolValue(power);
		return power;
	},
	set_unpowered : func {
		me.power.setBoolValue(0);
	},
	set_powered : func {
		me.power.setBoolValue(1);
	},
	toggle : func {
		me.power.setBoolValue(!me.power.getValue());
	},
	get_output : func (dt){
		var n2 = me.source.getValue();	
		var output = n2 * me.max_output * dt / 360000.0;
		me.output.setDoubleValue(output);
		return output;
	},
	list : [],
};
#------------------------------------------------------------------------------------------------------
var Valve = {
	new: func(name, number, position) {
		var obj = { parents: [Valve] };
		obj.prop 			= props.globals.getNode("systems/fuel").getChild("valve", number , 1);
		obj.name       		= obj.prop.getNode("name", 1);
		obj.position        = obj.prop.getNode("position", 1);
		obj.prop.getChild("name", 0, 1).setValue(name);
		obj.prop.getChild("position", 0, 1).setBoolValue(position);
		append(Valve.list, obj);
		return obj;
	},
	is_open : func {
#			print ("valve ", me.name.getValue(), " position ", me.position.getValue());
		return me.position.getValue();
	},
	set_closed : func {
#		print ("valve set closed");
		me.position.setBoolValue(0);
	},
	set_open : func {
#	print ("valve set open");
		me.position.setBoolValue(1);
	},
	list : [],
};
	
#-----------------------------------------------------------------------------------------------
########################################################################
# Fuel and Payload dialog
########################################################################

########################################################################
# Widgets & Layout Management
########################################################################

##
# A "widget" class that wraps a property node.  It provides useful
# helper methods that are difficult or tedious with the raw property
# API.  Note especially the slightly tricky addChild() method.
#
var Widget = {
    set : func(name, val) { me.node.getNode(name, 1).setValue(val); },
    prop : func { return me.node; },
    new : func { return { parents : [Widget], node : props.Node.new() } },
    addChild : func(type) {
        var idx = size(me.node.getChildren(type));
        var name = type ~ "[" ~ idx ~ "]";
        var newnode = me.node.getNode(name, 1);
        return { parents : [Widget], node : newnode };
    },
    setColor : func(r, g, b, a = 1) {
        me.node.setValues({ color : { red:r, green:g, blue:b, alpha:a } });
    },
    setFont : func(n, s = 13, t = 0) {
        me.node.setValues({ font : { name:n, "size":s, slant:t } });
    },
    setBinding : func(cmd, carg = nil) {
        var idx = size(me.node.getChildren("binding"));
        var node = me.node.getChild("binding", idx, 1);
        node.getNode("command", 1).setValue(cmd);
        if (cmd == "nasal") {
            node.getNode("script", 1).setValue(carg);
        } elsif (carg != nil and (cmd == "dialog-apply" or cmd == "dialog-update")) {
            node.getNode("object-name", 1).setValue(carg);
        }
    },
};

########################################################################
# Dialog Boxes
########################################################################
gui.menuBind("fuel-and-payload", "VC10.showWeightDialog()");
var fdm = getprop("/sim/flight-model");
var showDialog = func(name) {
    fgcommand("dialog-show", props.Node.new({ "dialog-name" : name }));
	}

var dialog = {};

var setWeight = func(wgt, opt) {
    var lbs = opt.getNode("lbs", 1).getValue();
    wgt.getNode("weight-lb", 1).setValue(lbs);

    # Weights can have "tank" indices which set the capacity of the
    # corresponding tank.  This code should probably be moved to
    # something like fuel.setTankCap(tank, gals)...
    if(wgt.getNode("tank",0) == nil) { return 0; }
    var ti = wgt.getNode("tank").getValue();
    var gn = opt.getNode("gals");
    var gals = gn == nil ? 0 : gn.getValue();
    var tn = props.globals.getNode("consumables/fuel/tank["~ti~"]", 1);
    var ppg = tn.getNode("density-ppg", 1).getValue();
    var lbs = gals * ppg;
    var curr = tn.getNode("level-gal_us", 1).getValue();
    curr = curr > gals ? gals : curr;
    tn.getNode("capacity-gal_us", 1).setValue(gals);
    tn.getNode("level-gal_us", 1).setValue(curr);
    tn.getNode("level-lbs", 1).setValue(curr * ppg);
printf ("FUEL  setWeight ti  %f  level-lbs %f ",ti,curr * ppg);	
    return 1;
}

# Checks the /sim/weight[n]/{selected|opt} values and sets the
# appropriate weights therefrom.
var setWeightOpts = func {
    var tankchange = 0;
printf ("  FUEL setWeightOpts");
    foreach(var w; props.globals.getNode("sim").getChildren("weight")) {
        var selected = w.getNode("selected");
        if(selected != nil) {
            foreach(var opt; w.getChildren("opt")) {
                if(opt.getNode("name", 1).getValue() == selected.getValue()) {
                    if(setWeight(w, opt)) { tankchange = 1; }
                    break;
                }
            }
        }
    }
    return tankchange;
}
# Run it at startup and on reset to make sure the tank settings are correct
_setlistener("/sim/signals/fdm-initialized", func { settimer(setWeightOpts, 0) });
_setlistener("/sim/signals/reinit", func(n) { props._getValue(n, []) or setWeightOpts() });


# Called from the F&W dialog when the user selects a weight option
var weightChangeHandler = func {
    var tankchanged = setWeightOpts();
printf ("  FUEL weightChangeHandler");

    # This is unfortunate.  Changing tanks means that the list of
    # tanks selected and their slider bounds must change, but our GUI
    # isn't dynamic in that way.  The only way to get the changes on
    # screen is to pop it down and recreate it.
    if(tankchanged) {
        var p = props.Node.new({"dialog-name": "WeightAndFuel"});
        fgcommand("dialog-close", p);
        showWeightDialog();
    }
}

##
# Dynamically generates a weight & fuel configuration dialog specific to
# the aircraft.
#
var showWeightDialog = func {
    var name = "WeightAndFuel";
#   menu entry is "Fuel and Payload"
    var title = "VC10 Fuel and Payload Settings";
printf ("  FUEL WeightFuelDialog");
    #
    # General Dialog Structure
    #
    dialog[name] = Widget.new();
    dialog[name].set("name", name);
    dialog[name].set("layout", "vbox");

    var header = dialog[name].addChild("group");
    header.set("layout", "hbox");
    header.addChild("empty").set("stretch", "1");
    header.addChild("text").set("label", title);
    header.addChild("empty").set("stretch", "1");
    var w = header.addChild("button");
    w.set("pref-width", 16);
    w.set("pref-height", 16);
    w.set("legend", "");
    w.set("default", 0);
    # "Esc" causes dialog-close
    w.set("key", "Esc");
    w.setBinding("dialog-close");

    dialog[name].addChild("hrule");

    var fdmdata = {
            grosswgt : "fdm/jsbsim/inertia/weight-lbs",
            payload  : "/payload",
            cg_x_in       : "fdm/jsbsim/inertia/cg-x-in",
			cg_x_pcent : "fdm/jsbsim/inertia/cg-x-percent",
	        cg_z_in       : "fdm/jsbsim/inertia/cg-z-in",
        };

    var contentArea = dialog[name].addChild("group");
    contentArea.set("layout", "hbox");
    contentArea.set("default-padding", 10);

    dialog[name].addChild("empty");

    var limits = dialog[name].addChild("group");
    limits.set("layout", "table");
    limits.set("halign", "center");
    var row = 0;

    var massLimits = props.globals.getNode("/limits/mass-and-balance");

    var tablerow = func(name, node, format ) {

        var n = isa( node, props.Node ) ? node : massLimits.getNode( node );
        if( n == nil ) return;

        var label = limits.addChild("text");
        label.set("row", row);
        label.set("col", 0);
        label.set("halign", "right");
        label.set("label", name ~ ":");

        var val = limits.addChild("text");
        val.set("row", row);
        val.set("col", 1);
        val.set("halign", "left");
        val.set("label", "0123457890123456789");
        val.set("format", format);
        val.set("property", n.getPath());
        val.set("live", 1);
          
        row += 1;
    }

    var grossWgt = props.globals.getNode(fdmdata.grosswgt);
    if(grossWgt != nil) {
        tablerow("Gross Weight", grossWgt, "%.0f lb");
    }

    if(massLimits != nil ) {
##        tablerow("Max. Ramp Weight", "maximum-ramp-mass-lbs", "%.0f lb" );
        tablerow("Max. Takeoff  Weight", "maximum-takeoff-mass-lbs", "%.0f lb" );
        tablerow("Max. Landing  Weight", "maximum-landing-mass-lbs", "%.0f lb" );

    }

    if( fdmdata.cg_x_in != nil ) { 
        var n = props.globals.getNode("/limits/mass-and-balance/cg/dimension");
        tablerow("Centre of Gravity", props.globals.getNode(fdmdata.cg_x_in), "%.1f " ~ (n == nil ? "in" : n.getValue()));
    }
	
    if( fdmdata.cg_x_pcent != nil ) {
	var cg_x_percent = props.globals.getNode(fdmdata.cg_x_pcent);
        tablerow("Centre of Gravity", cg_x_percent, "%.1f %%");
    }
    if( fdmdata.cg_z_in != nil ) { 
	var cg_z_in = props.globals.getNode(fdmdata.cg_z_in);
        tablerow("Vertical Centre of Gravity", props.globals.getNode(fdmdata.cg_z_in), "%.1f  in");
    } 

    dialog[name].addChild("hrule");

    var buttonBar = dialog[name].addChild("group");
    buttonBar.set("layout", "hbox");
    buttonBar.set("default-padding", 10);

    var close = buttonBar.addChild("button");
    close.set("legend", "Close");
    close.set("default", "true");
    close.set("key", "Enter");
    close.setBinding("dialog-close");

    # Temporary helper function
    var tcell = func(parent, type, row, col) {
        var cell = parent.addChild(type);
        cell.set("row", row);
        cell.set("col", col);
        return cell;
    }

    #
    # Fill in the content area
    #
    var fuelArea = contentArea.addChild("group");
    fuelArea.set("layout", "vbox");
    fuelArea.addChild("text").set("label", "Fuel Tanks");

    var fuelTable = fuelArea.addChild("group");
    fuelTable.set("layout", "table");

    fuelArea.addChild("empty").set("stretch", 1);

    tcell(fuelTable, "text", 0, 0).set("label", "Tank");
    tcell(fuelTable, "text", 0, 3).set("label", "Pounds");
    tcell(fuelTable, "text", 0, 4).set("label", "Gallons");
    tcell(fuelTable, "text", 0, 5).set("label", "Fraction");

    var tanks = props.globals.getNode("/consumables/fuel").getChildren("tank");
    for(var i=0; i<size(tanks); i+=1) {
        var t = tanks[i];

        var tname = i ~ "";
        var tnode = t.getNode("name");
        if(tnode != nil) { tname = tnode.getValue(); }

        var tankprop = "/consumables/fuel/tank["~i~"]";

        var cap = t.getNode("capacity-gal_imp", 0);

        # Hack, to ignore the "ghost" tanks created by the C++ code.
        if(cap == nil ) { continue; }
        cap = cap.getValue();

        # Ignore tanks of capacity 0
        if (cap == 0) { continue; }

        var title = tcell(fuelTable, "text", i+1, 0);
        title.set("label", tname);
        title.set("halign", "right");

#       var selected = props.globals.initNode(tankprop ~ "/selected", 1, "BOOL");
#        if (selected.getAttribute("writable")) {
#            var sel = tcell(fuelTable, "checkbox", i+1, 1);
#            sel.set("property", tankprop ~ "/selected");
#            sel.set("live", 1);
#            sel.setBinding("dialog-apply");
#        }

        var slider = tcell(fuelTable, "slider", i+1, 2);
        slider.set("property", tankprop ~ "/level-gal_imp");
        slider.set("live", 1);
        slider.set("min", 0);
        slider.set("max", cap);
        slider.setBinding("dialog-apply");

        var lbs = tcell(fuelTable, "text", i+1, 3);
        lbs.set("property", tankprop ~ "/level-lbs");
        lbs.set("label", "0123456");
        lbs.set("format", cap < 1 ? "%.3f" : cap < 10 ? "%.2f" : "%.1f" );
        lbs.set("halign", "right");
        lbs.set("live", 1);

        var gals = tcell(fuelTable, "text", i+1, 4);
        gals.set("property", tankprop ~ "/level-gal_imp");
        gals.set("label", "0123456");
        gals.set("format", cap < 1 ? "%.3f" : cap < 10 ? "%.2f" : "%.1f" );
        gals.set("halign", "right");
        gals.set("live", 1);

        var per = tcell(fuelTable, "text", i+1, 5);
        per.set("property", tankprop ~ "/level-norm");
        per.set("label", "0123456");
        per.set("format", "%.2f");
        per.set("halign", "right");
        per.set("live", 1);
    }

    varbar = tcell(fuelTable, "hrule", size(tanks)+1, 0);
    varbar.set("colspan", 6);

    var total_label = tcell(fuelTable, "text", size(tanks)+2, 2);
    total_label.set("label", "Total:");
    total_label.set("halign", "right");

    var lbs = tcell(fuelTable, "text", size(tanks)+2, 3);
    lbs.set("property", "/consumables/fuel/total-fuel-lbs");
    lbs.set("label", "0123456");
    lbs.set("format", "%.1f" );
    lbs.set("halign", "right");
    lbs.set("live", 1);

    var gals = tcell(fuelTable, "text",size(tanks) +2, 4);
    gals.set("property", "/consumables/fuel/total-fuel-gal_imp");
    gals.set("label", "0123456");
    gals.set("format", "%.1f" );
    gals.set("halign", "right");
    gals.set("live", 1);

    var per = tcell(fuelTable, "text", size(tanks)+2, 5);
    per.set("property", "/consumables/fuel/total-fuel-norm");
    per.set("label", "0123456");
    per.set("format", "%.2f");
    per.set("halign", "right");
    per.set("live", 1);
	
	var valveArea = contentArea.addChild("group");
    valveArea.set("layout", "vbox");
    valveArea.addChild("text").set("label", "Valves");

    var valveTable = valveArea.addChild("group");
    valveTable.set("layout", "table");
	
	valveArea.addChild("empty").set("stretch", 1);

    tcell(valveTable, "text", 0, 0).set("label", "Valve");
    tcell(valveTable, "text", 0, 2).set("label", "State");
	
	var valves = props.globals.getNode("/systems/fuel").getChildren("valve");
	   for(var i=0; i<size(valves); i+=1) {
        var v = valves[i];

        var vname = i ~ "";
        var vnode = v.getNode("name");
        if (vnode != nil) { vname = vnode.getValue(); }

        var valveprop = "/systems/fuel/valve["~i~"]";

 #       var vposition = v.getNode("position", 0);

        var title = tcell(valveTable, "text", i+1, 0);
        title.set("label", vname);
        title.set("halign", "right");

       var position = props.globals.initNode(valveprop ~ "/position", 1, "BOOL");
        if (position.getAttribute("writable")) {
            var sel = tcell(valveTable, "checkbox", i+1, 1);
            sel.set("property", valveprop ~ "/position");
            sel.set("live", 1);
            sel.setBinding("dialog-apply");
        }
	}

    var weightArea = contentArea.addChild("group");
    weightArea.set("layout", "vbox");
    weightArea.addChild("text").set("label", "Payload");

    var weightTable = weightArea.addChild("group");
    weightTable.set("layout", "table");

    weightArea.addChild("empty").set("stretch", 1);

    tcell(weightTable, "text", 0, 0).set("label", "Location");
    tcell(weightTable, "text", 0, 2).set("label", "Pounds");

    var payload_base = props.globals.getNode(fdmdata.payload);
    if (payload_base != nil)
        var wgts = payload_base.getChildren("weight");
    else
        var wgts = [];
    for(var i=0; i<size(wgts); i+=1) {
        var w = wgts[i];
        var wname = w.getNode("name", 1).getValue();
        var wprop = fdmdata.payload ~ "/weight[" ~ i ~ "]";

        var title = tcell(weightTable, "text", i+1, 0);
        title.set("label", wname);
        title.set("halign", "right");

        if(w.getNode("opt") != nil) {
            var combo = tcell(weightTable, "combo", i+1, 1);
            combo.set("property", wprop ~ "/selected");
            combo.set("pref-width", 300);

            # Simple code we'd like to use:
            #foreach(opt; w.getChildren("opt")) {
            #    var ent = combo.addChild("value");
            #    ent.prop().setValue(opt.getNode("name", 1).getValue());
            #}

            # More complicated workaround to move the "current" item
            # into the first slot, because dialog.cxx doesn't set the
            # selected item in the combo box.
            var opts = [];
            var curr = w.getNode("selected");
            curr = curr == nil ? "" : curr.getValue();
            foreach(opt; w.getChildren("opt")) {
                append(opts, opt.getNode("name", 1).getValue());
            }
            forindex(oi; opts) {
                if(opts[oi] == curr) {
                    var tmp = opts[0];
                    opts[0] = opts[oi];
                    opts[oi] = tmp;
                    break;
                }
            }
            foreach(opt; opts) {
                combo.addChild("value").prop().setValue(opt);
            }

            combo.setBinding("dialog-apply");
            combo.setBinding("nasal", "gui.weightChangeHandler()");
        } else {
            var slider = tcell(weightTable, "slider", i+1, 1);
            slider.set("property", wprop ~ "/weight-lb");
            var min = w.getNode("min-lb", 1).getValue();
            var max = w.getNode("max-lb", 1).getValue();
            slider.set("min", min != nil ? min : 0);
            slider.set("max", max != nil ? max : 100);
            slider.set("live", 1);
            slider.setBinding("dialog-apply");
        }

        var lbs = tcell(weightTable, "text", i+1, 2);
        lbs.set("property", wprop ~ "/weight-lb");
        lbs.set("label", "0123456");
        lbs.set("format", "%.0f");
        lbs.set("live", 1);
    }

    # All done: pop it up
    fgcommand("dialog-new", dialog[name].prop());
    showDialog(name);
}


