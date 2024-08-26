# VC10 Fuel System
# ----------------
# Author: A J Teeder

#################################################################################
# switches

props.globals.initNode("VC10/fuel/switches/CentreTankLH_TXPumpSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/CentreTankRH_TXPumpSw",0,"BOOL");

props.globals.initNode("VC10/fuel/switches/Tank1A_AltTXsw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/Tank4A_AltTXsw",0,"BOOL");

props.globals.initNode("VC10/fuel/switches/Tank1A_Tank1TXsw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/Tank4A_Tank4TXsw",0,"BOOL");

props.globals.initNode("VC10/fuel/switches/Tank1TXsw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/Tank2TXsw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/Tank3TXsw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/Tank4TXsw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/CrossFeedTXSw",0,"BOOL");

props.globals.initNode("VC10/fuel/switches/BoostPump1_aftSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/BoostPump1_fwdSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/BoostPump2_aftSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/BoostPump2_fwdSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/BoostPump3_aftSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/BoostPump3_fwdSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/BoostPump4_aftSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/BoostPump4_fwdSw",0,"BOOL");

props.globals.initNode("VC10/fuel/switches/LPCock1Sw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/LPCock2Sw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/LPCock3Sw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/LPCock4Sw",0,"BOOL");

props.globals.initNode("VC10/fuel/switches/InterEngineLeftSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/InterEngineXfeedSw",0,"BOOL");
props.globals.initNode("VC10/fuel/switches/InterEngineRightSw",0,"BOOL");

#################################################################################
# valves

props.globals.initNode("VC10/fuel/valves/Tank1A_AltTX",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/Tank4A_AltTX",0,"BOOL");

props.globals.initNode("VC10/fuel/valves/Tank1A_Tank1TX",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/Tank4A_Tank4TX",0,"BOOL");

props.globals.initNode("VC10/fuel/valves/Tank1TX",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/Tank2TX",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/Tank3TX",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/Tank4TX",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/CrossFeedTX",0,"BOOL");

props.globals.initNode("VC10/fuel/valves/LPCock1",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/LPCock2",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/LPCock3",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/LPCock4",0,"BOOL");

props.globals.initNode("VC10/fuel/valves/InterEngineLeft",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/InterEngineXfeed",0,"BOOL");
props.globals.initNode("VC10/fuel/valves/InterEngineRight",0,"BOOL");

#################################################################################
# pumps

props.globals.initNode("VC10/fuel/pumps/CentreTankLH_TXPump",0,"BOOL");
props.globals.initNode("VC10/fuel/pumps/CentreTankRH_TXPump",0,"BOOL");

props.globals.initNode("VC10/fuel/pumps/BoostPump1_aft",0,"BOOL");
props.globals.initNode("VC10/fuel/pumps/BoostPump1_fwd",0,"BOOL");
props.globals.initNode("VC10/fuel/pumps/BoostPump2_aft",0,"BOOL");
props.globals.initNode("VC10/fuel/pumps/BoostPump2_fwd",0,"BOOL");
props.globals.initNode("VC10/fuel/pumps/BoostPump3_aft",0,"BOOL");
props.globals.initNode("VC10/fuel/pumps/BoostPump3_fwd",0,"BOOL");
props.globals.initNode("VC10/fuel/pumps/BoostPump4_aft",0,"BOOL");
props.globals.initNode("VC10/fuel/pumps/BoostPump4_fwd",0,"BOOL");

#################################################################################
# tanks - defined in VC10.xml
props.globals.initNode("consumables/fuel/tank[7]/space-lbs",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[8]/space-lbs",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[9]/space-lbs",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[10]/space-lbs",0,"DOUBLE");

props.globals.initNode("consumables/fuel/tank[0]/inches",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[1]/inches",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[2]/inches",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[3]/inches",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[4]/inches",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[5]/inches",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[0]/Head",0,"DOUBLE");
props.globals.initNode("consumables/fuel/tank[5]/Head",0,"DOUBLE");																   

#################################################################################
# Fuel transfer
props.globals.initNode("VC10/fuel/XferRate",2,"DOUBLE");  #  gravity transfer from tank 1a to 1 and 4a to 4  (lbs/sec)

#################################################################################
# Fuel dump 

props.globals.initNode("VC10/fuel/valves/dump-cover[0]",0,"DOUBLE");
props.globals.initNode("VC10/fuel/valves/dump-cover[1]",0,"DOUBLE");
props.globals.initNode("VC10/fuel/valves/dump-retract[0]",0,"DOUBLE");
props.globals.initNode("VC10/fuel/valves/dump-retract[1]",0,"DOUBLE");
props.globals.initNode("VC10/fuel/valves/dump-cover[1]",0,"DOUBLE");
props.globals.initNode("VC10/fuel/valves/dump-valve[0]",0,"BOOL"); #left centre tank
props.globals.initNode("VC10/fuel/valves/dump-valve[1]",0,"BOOL"); #right centre tank
props.globals.initNode("VC10/fuel/valves/dump-valve[2]",0,"BOOL"); #main tank 1
props.globals.initNode("VC10/fuel/valves/dump-valve[3]",0,"BOOL"); #main tank 2
props.globals.initNode("VC10/fuel/valves/dump-valve[4]",0,"BOOL"); #main tank 3
props.globals.initNode("VC10/fuel/valves/dump-valve[5]",0,"BOOL"); #main tank 4
props.globals.initNode("VC10/fuel/valves/dump-valve-pos[0]",1,"BOOL");
props.globals.initNode("VC10/fuel/valves/dump-valve-pos[1]",1,"BOOL");
props.globals.initNode("VC10/fuel/valves/dump-valve-pos[2]",1,"BOOL");
props.globals.initNode("VC10/fuel/valves/dump-valve-pos[3]",1,"BOOL");
props.globals.initNode("VC10/fuel/valves/dump-valve-pos[4]",1,"BOOL");
props.globals.initNode("VC10/fuel/valves/dump-valve-pos[5]",1,"BOOL");
#################################################################################

#################################################################################
# Weight and Balance 
print ("init Payload");
props.globals.initNode("payload/passengers",0,"DOUBLE");
props.globals.initNode("payload/cabin-lb",0,"DOUBLE");
props.globals.initNode("payload/hold-lb",0,"DOUBLE");
props.globals.initNode("payload/cabin-kg",0,"DOUBLE");
props.globals.initNode("payload/hold-kg",0,"DOUBLE");
for(var ci=0; ci<12; ci+=1)
	{
		props.globals.initNode("sim/presets/payload/weight[" ~ ci ~ "]/pers",0,"DOUBLE");
		props.globals.initNode("sim/presets/payload/weight[" ~ ci ~ "]/weight-lb",0,"DOUBLE");
		props.globals.initNode("sim/presets/payload/weight[" ~ ci ~ "]/weight-kg",0,"DOUBLE");
	}

for(var wi=0; wi<12; wi+=1)
	{
		props.globals.initNode("payload/weight[" ~ wi ~ "]/pers");
		props.globals.initNode("payload/weight[" ~ wi ~ "]/weight-lb");
		props.globals.initNode("payload/weight[" ~ wi ~ "]/weight-kg");
##		print (getprop("payload/weight[" ~ wi ~ "]/pers"), " pers");
		var pers = getprop("payload/weight[" ~ wi ~ "]/pers");
		var lb = pers * 185.0;
		var kg = lb * 0.453592;
		setprop("payload/weight[" ~ wi ~ "]/weight-lb",lb);
		setprop("payload/weight[" ~ wi ~ "]/weight-kg",kg);
		
		setprop("sim/presets/payload/weight[" ~ wi ~ "]/pers", pers);
		setprop("sim/presets/payload/weight[" ~ wi ~ "]/weight-lb", lb);
		setprop("sim/presets/payload/weight[" ~ wi ~ "]/weight-kg", kg);
	}
	
    props.globals.initNode("VC10/cg/cg-x-in",923.0);
	props.globals.initNode("VC10/cg/cg-x-datum-in",-25.0);
	props.globals.initNode("VC10/cg/cg-x-percent",21.2);
	props.globals.initNode("VC10/cg/cg-z-in",-35.0);
	props.globals.initNode("VC10/cg/cg-z-in",-35.0);
	props.globals.initNode("VC10/cg/take_off_trim",0.0);





##############################################################################################
var update_fuel_and_weight = func {
#	print ("update_fuel_and_weight");
##	if ( FuelFreeze.getBoolValue() ) { return }
	
	var current_time = getprop("/sim/time/elapsed-sec");
	var dt = 0.1;
	var dtr = getprop("/sim/time/delta-realtime-sec"); 
#	print ("dt  ", dt, "  dtreal ", dtr," current_time ",current_time);

# update valves

	if(getprop("VC10/fuel/switches/Tank1A_AltTXsw") == 1){
		setprop("VC10/fuel/valves/Tank1A_AltTX", 1);
	}else{
		setprop("VC10/fuel/valves/Tank1A_AltTX",0);
	}
	
	if(getprop("VC10/fuel/switches/Tank4A_AltTXsw") == 1){
		setprop("VC10/fuel/valves/Tank4A_AltTX", 1);
	}else{
		setprop("VC10/fuel/valves/Tank4A_AltTX",0);
	}

	if(getprop("VC10/fuel/switches/Tank1A_Tank1TXsw") == 1){
		setprop("VC10/fuel/valves/Tank1A_Tank1TX", 1);
	}else{
		setprop("VC10/fuel/valves/Tank1A_Tank1TX",0);
	}

	if(getprop("VC10/fuel/switches/Tank4A_Tank4TXsw") == 1){
		setprop("VC10/fuel/valves/Tank4A_Tank4TX", 1);
	}else{
		setprop("VC10/fuel/valves/Tank4A_Tank4TX",0);
	}
	
	if(getprop("VC10/fuel/switches/Tank1TXsw") == 1){
		setprop("VC10/fuel/valves/Tank1TX", 1);
	}else{
		setprop("VC10/fuel/valves/Tank1TX",0);
	}

	if(getprop("VC10/fuel/switches/Tank2TXsw") == 1){
		setprop("VC10/fuel/valves/Tank2TX", 1);
	}else{
		setprop("VC10/fuel/valves/Tank2TX",0);
	}

	if(getprop("VC10/fuel/switches/Tank3TXsw") == 1){
		setprop("VC10/fuel/valves/Tank3TX", 1);
	}else{
		setprop("VC10/fuel/valves/Tank3TX",0);
	}

	if(getprop("VC10/fuel/switches/Tank4TXsw") == 1){
		setprop("VC10/fuel/valves/Tank4TX", 1);
	}else{
		setprop("VC10/fuel/valves/Tank4TX",0);
	}
	
	if(getprop("VC10/fuel/switches/CrossFeedTXSw") == 1){
		setprop("VC10/fuel/valves/CrossFeedTX", 1);
	}else{
		setprop("VC10/fuel/valves/CrossFeedTX",0);
	}

	if(getprop("VC10/fuel/switches/LPCock1Sw") == 1){
		setprop("VC10/fuel/valves/LPCock1", 1);
	}else{
		setprop("VC10/fuel/valves/LPCock1",0);
	}
	
		if(getprop("VC10/fuel/switches/LPCock2Sw") == 1){
		setprop("VC10/fuel/valves/LPCock2", 1);
	}else{
		setprop("VC10/fuel/valves/LPCock2",0);
	}
	
	if(getprop("VC10/fuel/switches/LPCock3Sw") == 1){
		setprop("VC10/fuel/valves/LPCock3", 1);
	}else{
		setprop("VC10/fuel/valves/LPCock3",0);
	}

	if(getprop("VC10/fuel/switches/LPCock4Sw") == 1){
		setprop("VC10/fuel/valves/LPCock4", 1);
	}else{
		setprop("VC10/fuel/valves/LPCock4",0);
	}
	
	if(getprop("VC10/fuel/switches/InterEngineLeftSw") == 1){
		setprop("VC10/fuel/valves/InterEngineLeft", 1);
	}else{
		setprop("VC10/fuel/valves/InterEngineLeft",0);
	}

	if(getprop("VC10/fuel/switches/InterEngineRightSw") == 1){
		setprop("VC10/fuel/valves/InterEngineRight", 1);
	}else{
		setprop("VC10/fuel/valves/InterEngineRight",0);
	}

	if(getprop("VC10/fuel/switches/InterEngineXfeedSw") == 1){
		setprop("VC10/fuel/valves/InterEngineXfeed", 1);
	}else{
		setprop("VC10/fuel/valves/InterEngineXfeed",0);
	}
	
# update pumps

	if(getprop("VC10/fuel/switches/CentreTankLH_TXPumpSw") == 1){
		setprop("VC10/fuel/pumps/CentreTankLH_TXPump", 1);
	}else{
		setprop("VC10/fuel/pumps/CentreTankLH_TXPump",0);
	}

	if(getprop("VC10/fuel/switches/CentreTankRH_TXPumpSw") == 1){
		setprop("VC10/fuel/pumps/CentreTankRH_TXPump", 1);
	}else{
		setprop("VC10/fuel/pumps/CentreTankRH_TXPump",0);
	}	
	
	if(getprop("VC10/fuel/switches/BoostPump1_fwdSw") == 1){
		setprop("VC10/fuel/pumps/BoostPump1_fwd", 1);
	}else{
		setprop("VC10/fuel/pumps/BoostPump1_fwd",0);
	}

	if(getprop("VC10/fuel/switches/BoostPump1_aftSw") == 1){
		setprop("VC10/fuel/pumps/BoostPump1_aft", 1);
	}else{
		setprop("VC10/fuel/pumps/BoostPump1_aft",0);
	}

	if(getprop("VC10/fuel/switches/BoostPump2_fwdSw") == 1){
		setprop("VC10/fuel/pumps/BoostPump2_fwd", 1);
	}else{
		setprop("VC10/fuel/pumps/BoostPump2_fwd",0);
	}

	if(getprop("VC10/fuel/switches/BoostPump2_aftSw") == 1){
		setprop("VC10/fuel/pumps/BoostPump2_aft", 1);
	}else{
		setprop("VC10/fuel/pumps/BoostPump2_aft",0);
	}

	if(getprop("VC10/fuel/switches/BoostPump3_fwdSw") == 1){
		setprop("VC10/fuel/pumps/BoostPump3_fwd", 1);
	}else{
		setprop("VC10/fuel/pumps/BoostPump3_fwd",0);
	}

	if(getprop("VC10/fuel/switches/BoostPump3_aftSw") == 1){
		setprop("VC10/fuel/pumps/BoostPump3_aft", 1);
	}else{
		setprop("VC10/fuel/pumps/BoostPump3_aft",0);
	}

	if(getprop("VC10/fuel/switches/BoostPump4_fwdSw") == 1){
		setprop("VC10/fuel/pumps/BoostPump4_fwd", 1);
	}else{
		setprop("VC10/fuel/pumps/BoostPump4_fwd",0);
	}

	if(getprop("VC10/fuel/switches/BoostPump4_aftSw") == 1){
		setprop("VC10/fuel/pumps/BoostPump4_aft", 1);
	}else{
		setprop("VC10/fuel/pumps/BoostPump4_aft",0);
	}
# engines take fuel from LP pipework.
		
	var IELv = getprop("VC10/fuel/valves/InterEngineLeft");
	var IERv = getprop("VC10/fuel/valves/InterEngineRight");
	var IEXv = getprop("VC10/fuel/valves/InterEngineXfeed");	
	var BP1f = getprop("VC10/fuel/pumps/BoostPump1_fwd");
	var BP1a = getprop("VC10/fuel/pumps/BoostPump1_aft");	
	var BP2f = getprop("VC10/fuel/pumps/BoostPump2_fwd");
	var BP2a = getprop("VC10/fuel/pumps/BoostPump2_aft");
	var BP3f = getprop("VC10/fuel/pumps/BoostPump3_fwd");
	var BP3a = getprop("VC10/fuel/pumps/BoostPump3_aft");
	var BP4f = getprop("VC10/fuel/pumps/BoostPump4_fwd");
	var BP4a = getprop("VC10/fuel/pumps/BoostPump4_aft");	

	var density =  getprop("consumables/fuel/tank[7]/density-ppg") or 6.6;
	
	var Tank1aCapacityLbs = getprop("consumables/fuel/tank[0]/capacity-gal_us") * density;	
	var Tank1CapacityLbs = getprop("consumables/fuel/tank[1]/capacity-gal_us") * density;
	var Tank2CapacityLbs = getprop("consumables/fuel/tank[2]/capacity-gal_us") * density;
	var Tank3CapacityLbs = getprop("consumables/fuel/tank[3]/capacity-gal_us") * density;
	var Tank4CapacityLbs = getprop("consumables/fuel/tank[4]/capacity-gal_us") * density;
	var Tank4aCapacityLbs = getprop("consumables/fuel/tank[5]/capacity-gal_us") * density;
	var TankCCapacityLbs = getprop("consumables/fuel/tank[6]/capacity-gal_us") * density;

	var Tank1aLbs = getprop("consumables/fuel/tank[0]/level-lbs");
	var Tank1Lbs = getprop("consumables/fuel/tank[1]/level-lbs");
	var Tank2Lbs = getprop("consumables/fuel/tank[2]/level-lbs");
	var Tank3Lbs = getprop("consumables/fuel/tank[3]/level-lbs");
	var Tank4Lbs = getprop("consumables/fuel/tank[4]/level-lbs");
	var Tank4aLbs = getprop("consumables/fuel/tank[5]/level-lbs");
	var TankCLbs = getprop("consumables/fuel/tank[6]/level-lbs");
	
	var Tank1aSpaceLbs = Tank1aCapacityLbs - Tank1aLbs;
	var Tank1SpaceLbs = Tank1CapacityLbs - Tank1Lbs;
	var Tank2SpaceLbs = Tank2CapacityLbs - Tank2Lbs;
	var Tank3SpaceLbs = Tank3CapacityLbs - Tank3Lbs;
	var Tank4SpaceLbs = Tank4CapacityLbs - Tank4Lbs;
	var Tank4aSpaceLbs = Tank4aCapacityLbs - Tank4aLbs;	
	var TankCSpaceLbs = TankCCapacityLbs - TankCLbs;	
	
	var LP1CapacityLbs = getprop("consumables/fuel/tank[7]/capacity-gal_us") * density;
	var LP2CapacityLbs = getprop("consumables/fuel/tank[8]/capacity-gal_us") * density;
	var LP3CapacityLbs = getprop("consumables/fuel/tank[9]/capacity-gal_us") * density;
	var LP4CapacityLbs = getprop("consumables/fuel/tank[10]/capacity-gal_us") * density;	
	var LP1Lbs = getprop("consumables/fuel/tank[7]/level-lbs");
	var LP2Lbs = getprop("consumables/fuel/tank[8]/level-lbs");
	var LP3Lbs = getprop("consumables/fuel/tank[9]/level-lbs");
	var LP4Lbs = getprop("consumables/fuel/tank[10]/level-lbs");
	
	var LP1SpaceLbs = LP1CapacityLbs - LP1Lbs;
	var LP2SpaceLbs = LP2CapacityLbs - LP2Lbs;
	var LP3SpaceLbs = LP3CapacityLbs - LP3Lbs;
	var LP4SpaceLbs = LP4CapacityLbs - LP4Lbs;	

#fill space in LP pipework from main tanks
	
	if (IELv == 0 and IERv == 0 and IEXv == 0){
# 1. With no cross feed valves open

		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {
			if (Tank1Lbs > LP1SpaceLbs) {
				Tank1Lbs = Tank1Lbs - LP1SpaceLbs;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > LP2SpaceLbs) {
				Tank2Lbs = Tank2Lbs - LP2SpaceLbs;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > LP3SpaceLbs) {
				Tank3Lbs = Tank3Lbs - LP3SpaceLbs;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > LP4SpaceLbs) {
				Tank4Lbs = Tank4Lbs - LP4SpaceLbs;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}
		}elsif (IELv == 1 and IERv == 0 and IEXv == 0){
	
# 2. With left engines cross feed valve open
			
		var NBP12 = BP1a + BP1f + BP2a + BP2f;        # number of Boost pumps running
		var LP12Space = LP1SpaceLbs + LP2SpaceLbs;  # fuel required to fill LP1, LP2 pipework
		var QBP12 = LP12Space / NBP12; 					# amount of fuel to be supplied by each Boost pump
		var QBP1 = QBP12*(BP1a+BP1f);
		var QBP2 = QBP12*(BP2a+BP2f);
		
		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {		
			if (Tank1Lbs > QBP1) {
				Tank1Lbs = Tank1Lbs - QBP1;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > QBP2) {
				Tank2Lbs = Tank2Lbs - QBP2;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > LP3SpaceLbs) {
				Tank3Lbs = Tank3Lbs - LP3SpaceLbs;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > LP4SpaceLbs) {
				Tank4Lbs = Tank4Lbs - LP4SpaceLbs;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}
		}elsif (IELv == 0 and IERv == 1 and IEXv == 0){
	
# 3. With right engines cross feed valve open
	
		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {
			if (Tank1Lbs > LP1SpaceLbs) {
				Tank1Lbs = Tank1Lbs - LP1SpaceLbs;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > LP2SpaceLbs) {
				Tank2Lbs = Tank2Lbs - LP2SpaceLbs;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}		
		var NBP34 = BP3a + BP3f + BP4a + BP4f;        # number of Boost pumps running
		var LP34Space = LP3SpaceLbs + LP4SpaceLbs;    # fuel required to fill LP3, LP4 pipework
		var QBP34 = LP34Space / NBP34; 				  # amount of fuel to be supplied by each Boost pump
		var QBP3 = QBP34*(BP3a+BP3f);
		var QBP4 = QBP34*(BP4a+BP4f);	
		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > QBP3) {
				Tank3Lbs = Tank3Lbs - QBP3;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > QBP4) {
				Tank4Lbs = Tank4Lbs - QBP4;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}	
		}elsif (IELv == 0 and IERv == 0 and IEXv == 1){
	
# 4. With centre cross feed valve open
		
		var NBP23 = BP2a + BP2f + BP3a + BP3f;        # number of Boost pumps running
		var LP23Space = LP2SpaceLbs + LP3SpaceLbs;    # fuel required to fill LP2, LP3 pipework
		var QBP23 = LP23Space / NBP23; 				  # amount of fuel to be supplied by each Boost pump
		var QBP2 = QBP23*(BP2a+BP2f);
		var QBP3 = QBP23*(BP3a+BP3f);
		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {
			if (Tank1Lbs > LP1SpaceLbs) {
				Tank1Lbs = Tank1Lbs - LP1SpaceLbs;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > QBP2) {
				Tank2Lbs = Tank2Lbs - QBP2;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > QBP3) {
				Tank3Lbs = Tank3Lbs - QBP3;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > LP4SpaceLbs) {
				Tank4Lbs = Tank4Lbs - LP4SpaceLbs;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}			
		}elsif (IELv == 1 and IERv == 1 and IEXv == 0){	
#5.  With both left and right engines cross feed valves open
	
		var NBP12 = BP1a + BP1f + BP2a + BP2f;        # number of Boost pumps running
		var LP12Space = LP1SpaceLbs + LP2SpaceLbs;    # fuel required to fill LP1, LP2 pipework
		var QBP12 = LP12Space / NBP12; 				  # amount of fuel to be supplied by each Boost pump
		var QBP1 = QBP12*(BP1a+BP1f);
		var QBP2 = QBP12*(BP2a+BP2f);
		
		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {		
			if (Tank1Lbs > QBP1) {
				Tank1Lbs = Tank1Lbs - QBP1;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > QBP2) {
				Tank2Lbs = Tank2Lbs - QBP2;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}		
		var NBP34 = BP3a + BP3f + BP4a + BP4f;        # number of Boost pumps running
		var LP34Space = LP3SpaceLbs + LP4SpaceLbs;    # fuel required to fill LP3, LP4 pipework
		var QBP34 = LP34Space / NBP34; 				  # amount of fuel to be supplied by each Boost pump
		var QBP3 = QBP34*(BP3a+BP3f);
		var QBP4 = QBP34*(BP4a+BP4f);	
		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > QBP3) {
				Tank3Lbs = Tank3Lbs - QBP3;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > QBP4) {
				Tank4Lbs = Tank4Lbs - QBP4;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}
		}elsif (IELv == 1 and IERv == 0 and IEXv == 1){	
#6.  With both left engine and centre cross feed valves open
	
		var NBP123 = BP1a + BP1f + BP2a + BP2f + BP3a + BP3f;        # number of Boost pumps running
		var LP123Space = LP1SpaceLbs + LP2SpaceLbs + LP3SpaceLbs;    # fuel required to fill LP1, LP2, LP3pipework
		var QBP123 = LP123Space / NBP123; 				             # amount of fuel to be supplied by each Boost pump
		var QBP1 = QBP123*(BP1a+BP1f);
		var QBP2 = QBP123*(BP2a+BP2f);
		var QBP3 = QBP123*(BP3a+BP3f);
		
		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {		
			if (Tank1Lbs > QBP1) {
				Tank1Lbs = Tank1Lbs - QBP1;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > QBP2) {
				Tank2Lbs = Tank2Lbs - QBP2;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}		

		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > QBP3) {
				Tank3Lbs = Tank3Lbs - QBP3;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > LP4SpaceLbs) {
				Tank4Lbs = Tank4Lbs - LP4SpaceLbs;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}
		}elsif (IELv == 0 and IERv == 1 and IEXv == 1){	
#7.  With both right engine and centre cross feed valves open
	
		var NBP234 = BP2a + BP2f + BP3a + BP3f + BP4a + BP4f;        # number of Boost pumps running
		var LP234Space = LP2SpaceLbs + LP3SpaceLbs + LP4SpaceLbs;    # fuel required to fill LP2, LP3, LP4 pipework
		var QBP234 = LP234Space / NBP234; 				             # amount of fuel to be supplied by each Boost pump
		var QBP2 = QBP234*(BP2a+BP2f);
		var QBP3 = QBP234*(BP3a+BP3f);
		var QBP4 = QBP234*(BP4a+BP4f);
		
		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {		
			if (Tank1Lbs > LP1SpaceLbs) {
				Tank1Lbs = Tank1Lbs - LP1SpaceLbs;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > QBP2) {
				Tank2Lbs = Tank2Lbs - QBP2;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}		
		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > QBP3) {
				Tank3Lbs = Tank3Lbs - QBP3;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > QBP4) {
				Tank4Lbs = Tank4Lbs - QBP4;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}
		}elsif (IELv == 1 and IERv == 1 and IEXv == 1){	
#8.  With all 3 cross feed valves open
	
		var NBP1234 = BP1a + BP1f + BP2a + BP2f + BP3a + BP3f + BP4a + BP4f;        # number of Boost pumps running
		var LP1234Space = LP1SpaceLbs + LP2SpaceLbs + LP3SpaceLbs + LP4SpaceLbs;    # fuel required to fill LP1, LP2, LP3, LP4 pipework
		var QBP1234 = LP1234Space / NBP1234;		                                # amount of fuel to be supplied by each Boost pump
		var QBP1 = QBP1234*(BP1a+BP1f);
		var QBP2 = QBP1234*(BP2a+BP2f);
		var QBP3 = QBP1234*(BP3a+BP3f);
		var QBP4 = QBP1234*(BP4a+BP4f);
		
		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {		
			if (Tank1Lbs > QBP1) {
				Tank1Lbs = Tank1Lbs - QBP1;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > QBP2) {
				Tank2Lbs = Tank2Lbs - QBP2;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}		
		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > QBP3) {
				Tank3Lbs = Tank3Lbs - QBP3;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > QBP4) {
				Tank4Lbs = Tank4Lbs - QBP4;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}
		}else{
		print ("ToDo: IELv ",IELv," IERv ",IERv," IEXv ",IEXv);
		if (getprop("VC10/fuel/switches/LPCock1Sw") == 1) {
			if (Tank1Lbs > LP1SpaceLbs) {
				Tank1Lbs = Tank1Lbs - LP1SpaceLbs;
				LP1Lbs = LP1Lbs + LP1SpaceLbs;
				}else{
				Tank1Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock2Sw") == 1) {		
			if (Tank2Lbs > LP2SpaceLbs) {
				Tank2Lbs = Tank2Lbs - LP2SpaceLbs;
				LP2Lbs = LP2Lbs + LP2SpaceLbs;
				}else{
				Tank2Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock3Sw") == 1) {		
			if (Tank3Lbs > LP3SpaceLbs) {
				Tank3Lbs = Tank3Lbs - LP3SpaceLbs;
				LP3Lbs = LP3Lbs + LP3SpaceLbs;
				}else{
				Tank3Lbs = 0.0;
				}
			}
		if (getprop("VC10/fuel/switches/LPCock4Sw") == 1) {		
			if (Tank4Lbs > LP4SpaceLbs) {
				Tank4Lbs = Tank4Lbs - LP4SpaceLbs;
				LP4Lbs = LP4Lbs + LP4SpaceLbs;
				}else{
				Tank4Lbs = 0.0;
				}
			}		
		}

	
#############################################################################################################
# Tank 1/1a and 4/4a crossfeed

	var Tank1aTxValve = getprop("VC10/fuel/valves/Tank1A_Tank1TX");
	var Tank4aTxValve = getprop("VC10/fuel/valves/Tank4A_Tank4TX");

	var Tank1SpaceLbs = Tank1CapacityLbs - Tank1Lbs;
	var Tank2SpaceLbs = Tank2CapacityLbs - Tank2Lbs;
	var Tank3SpaceLbs = Tank3CapacityLbs - Tank3Lbs;
	var Tank4SpaceLbs = Tank4CapacityLbs - Tank4Lbs;

#Calculate depth of fuel in outer wing tanks. This is the depth used by the fuel contents sensors, and is measured from the lowest part of each tank.

	var Tank1gal = getprop("consumables/fuel/tank[1]/level-gal_imp");
	var Tank4gal = getprop("consumables/fuel/tank[4]/level-gal_imp");
	var Tank1agal = getprop("consumables/fuel/tank[0]/level-gal_imp");
	var Tank4agal = getprop("consumables/fuel/tank[5]/level-gal_imp");
	var Tank1inch  = -5.3833E-012*math.pow(Tank1gal,4) + 2.8875E-008*math.pow(Tank1gal,3) - 5.409E-005*math.pow(Tank1gal,2)  + 0.04680*Tank1gal; 
	var Tank4inch  = -5.3833E-012*math.pow(Tank4gal,4) + 2.8875E-008*math.pow(Tank4gal,3) - 5.409E-005*math.pow(Tank4gal,2)  + 0.04680*Tank4gal;
	var Tank1ainch = -7.015E-012*math.pow(Tank1agal,4) + 3.432E-008*math.pow(Tank1agal,3) - 5.409E-005*math.pow(Tank1agal,2) + 0.04680*Tank1agal; 
	var Tank4ainch = -7.015E-012*math.pow(Tank4agal,4) + 3.432E-008*math.pow(Tank4agal,3) - 5.409E-005*math.pow(Tank4agal,2) + 0.04680*Tank4agal;
# The lowest point of outboard tanks 1a and 4a are 18 inches higher than tanks 1 and 2, due to dihedral.

# Therefore add this distance to these tanks when calculating fuel flow from the outboard to inboard tanks due to gravity.

	var XfrRate = getprop("VC10/fuel/XferRate")*dt;

	var Tank1aHead = Tank1ainch + 18.0 - Tank1inch;
	if (Tank1aTxValve and (Tank1aHead > 0) and (Tank1aLbs > 0) and (Tank1SpaceLbs > XfrRate)) {
				Tank1aLbs = Tank1aLbs - XfrRate;
				Tank1Lbs = Tank1Lbs + XfrRate;	
			}
	var Tank4aHead = Tank4ainch + 18.0 - Tank4inch;
	if (Tank4aTxValve and (Tank4aHead > 0) and (Tank4aLbs > 0) and (Tank4SpaceLbs > XfrRate)) {
				Tank4aLbs = Tank4aLbs - XfrRate;
				Tank4Lbs = Tank4Lbs + XfrRate;	
			}									  
#############################################################################################################
# transfer of fuel from centre tank to wing tanks

	var Tank1aTXvalve = getprop("VC10/fuel/valves/Tank1A_AltTX");
	var Tank1TXvalve = getprop("VC10/fuel/valves/Tank1TX");
	var Tank2TXvalve = getprop("VC10/fuel/valves/Tank2TX");
	var Tank3TXvalve = getprop("VC10/fuel/valves/Tank3TX");
	var Tank4TXvalve = getprop("VC10/fuel/valves/Tank4TX");
	var Tank4aTXvalve = getprop("VC10/fuel/valves/Tank4A_AltTX");
	var XfeedTXvalve = getprop("VC10/fuel/valves/CrossFeedTX");
	
	var LH_TXPump = 0;
	var RH_TXPump = 0; 
	if (getprop("VC10/fuel/pumps/CentreTankLH_TXPump")) {LH_TXPump = 1;}
	if (getprop("VC10/fuel/pumps/CentreTankRH_TXPump")) {RH_TXPump = 1;}

	var LHfuelXf = 0.0;
	var RHfuelXf = 0.0;
	if (TankCLbs > 0){   
		LHfuelXf = LH_TXPump * 250.0 * dt /60.0;   # fuel pumped from centre tank in time dt
		RHfuelXf = RH_TXPump * 250.0 * dt /60.0;   #  - assume pump capacity is 250 lb/min. 
		}
		
	var Tank1aHasSpace = (Tank1aSpaceLbs > 0);
	var Tank1HasSpace = (Tank1SpaceLbs > 0);	
	var Tank2HasSpace = (Tank2SpaceLbs > 0);
	var Tank4aHasSpace = (Tank4aSpaceLbs > 0);
	var Tank4HasSpace = (Tank4SpaceLbs > 0);	
	var Tank3HasSpace = (Tank3SpaceLbs > 0);
#  number of tanks that are not full and have their transfer valve open.			
	var NumTanksL = (Tank1aTXvalve and Tank1aHasSpace) + (Tank1TXvalve and Tank1HasSpace) + (Tank2TXvalve and Tank2HasSpace);
	var NumTanksR = (Tank4aTXvalve and Tank4aHasSpace) + (Tank4TXvalve and Tank4HasSpace) + (Tank3TXvalve and Tank3HasSpace);	

	if (XfeedTXvalve) { 
		if ((LH_TXPump or RH_TXPump)  and ((NumTanksL + NumTanksR) > 0))
			{
			XfrRate = (LHfuelXf+RHfuelXf)/(NumTanksL+NumTanksR);
			if (Tank1aTXvalve and Tank1aHasSpace)
				{
				Tank1aLbs = Tank1aLbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank1TXvalve and Tank1HasSpace)
				{
				Tank1Lbs = Tank1Lbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank2TXvalve and Tank2HasSpace)
				{
				Tank2Lbs = Tank2Lbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank4aTXvalve and Tank4aHasSpace)
				{
				Tank4aLbs = Tank4aLbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank4TXvalve and Tank4HasSpace)
				{
				Tank4Lbs = Tank4Lbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank3TXvalve and Tank3HasSpace)
				{
				Tank3Lbs = Tank3Lbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			}
		}
		else {
		if (LH_TXPump  and (NumTanksL > 0))
			{
			XfrRate = LHfuelXf/NumTanksL;
			if (Tank1aTXvalve and Tank1aHasSpace)
				{
				Tank1aLbs = Tank1aLbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank1TXvalve and Tank1HasSpace)
				{
				Tank1Lbs = Tank1Lbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank2TXvalve and Tank2HasSpace)
				{
				Tank2Lbs = Tank2Lbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			}
		if (RH_TXPump  and (NumTanksR > 0))
			{
			XfrRate = RHfuelXf/NumTanksR;
			if (Tank4aTXvalve and Tank4aHasSpace)
				{
				Tank4aLbs = Tank4aLbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank4TXvalve and Tank4HasSpace)
				{
				Tank4Lbs = Tank4Lbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			if (Tank3TXvalve and Tank3HasSpace)
				{
				Tank3Lbs = Tank3Lbs + XfrRate;
				TankCLbs = TankCLbs - XfrRate;				
				}
			}

		}

	
#############################################################################################################	
# update property tree
		
	setprop ("consumables/fuel/tank[0]/level-lbs",Tank1aLbs );
	setprop ("consumables/fuel/tank[1]/level-lbs",Tank1Lbs );
	setprop ("consumables/fuel/tank[2]/level-lbs",Tank2Lbs );
	setprop ("consumables/fuel/tank[3]/level-lbs",Tank3Lbs );
	setprop ("consumables/fuel/tank[4]/level-lbs",Tank4Lbs );
	setprop ("consumables/fuel/tank[5]/level-lbs",Tank4aLbs );
	setprop ("consumables/fuel/tank[6]/level-lbs",TankCLbs );	

	setprop ("consumables/fuel/tank[1]/inches",Tank1inch );	
	setprop ("consumables/fuel/tank[4]/inches",Tank4inch );
	setprop ("consumables/fuel/tank[0]/inches",Tank1ainch );
	setprop ("consumables/fuel/tank[5]/inches",Tank4ainch );
	setprop ("consumables/fuel/tank[0]/Head",Tank1aHead );
	setprop ("consumables/fuel/tank[5]/Head",Tank4aHead );
	
	setprop ("consumables/fuel/tank[7]/level-lbs", LP1Lbs );
	setprop ("consumables/fuel/tank[8]/level-lbs", LP2Lbs );
	setprop ("consumables/fuel/tank[9]/level-lbs", LP3Lbs );
	setprop ("consumables/fuel/tank[10]/level-lbs",LP4Lbs );
	setprop ("consumables/fuel/tank[7]/space-lbs", LP1SpaceLbs);
	setprop ("consumables/fuel/tank[8]/space-lbs", LP2SpaceLbs);
	setprop ("consumables/fuel/tank[9]/space-lbs", LP3SpaceLbs);
	setprop ("consumables/fuel/tank[10]/space-lbs", LP4SpaceLbs);
	

# update fuel tank Centres of Gravity
	setprop ("fdm/jsbsim/propulsion/tank[0]/x-position",getprop("fdm/jsbsim/propulsion/tank[0]/New-x-position"));
	setprop ("fdm/jsbsim/propulsion/tank[1]/x-position",getprop("fdm/jsbsim/propulsion/tank[1]/New-x-position"));
	setprop ("fdm/jsbsim/propulsion/tank[2]/x-position",getprop("fdm/jsbsim/propulsion/tank[2]/New-x-position"));
	setprop ("fdm/jsbsim/propulsion/tank[3]/x-position",getprop("fdm/jsbsim/propulsion/tank[3]/New-x-position"));
	setprop ("fdm/jsbsim/propulsion/tank[4]/x-position",getprop("fdm/jsbsim/propulsion/tank[4]/New-x-position"));
	setprop ("fdm/jsbsim/propulsion/tank[5]/x-position",getprop("fdm/jsbsim/propulsion/tank[5]/New-x-position"));
##	setprop ("fdm/jsbsim/propulsion/tank[6]/x-position",getprop("fdm/jsbsim/propulsion/tank[6]/New-x-position"));

	var cg_x_in = getprop("fdm/jsbsim/inertia/cg-x-in");
    setprop("VC10/cg/cg-x-in",cg_x_in);
## Trim datum is 948 inches aft of fuselage datum
	var cg_x_datum_in = cg_x_in - 948.0;
	setprop("VC10/cg/cg-x-datum-in",cg_x_datum_in);
## SMC LE is 872 inches aft of fuselage datum
## SMC is 240.2 inches, divide by 100 to get % 
	var cg_x_percent = (cg_x_in - 872.0)/2.402;
	setprop("VC10/cg/cg-x-percent",cg_x_percent);
	var cg_z_in = getprop("fdm/jsbsim/inertia/cg-z-in");	
	setprop("VC10/cg/cg-z-in",cg_z_in);
	
	var tt= math.clamp(3.75 - cg_x_datum_in * 5/(15+27), 2.0, 7.0);

	setprop("VC10/cg/take_off_trim",tt);
	
###
# end of func update_fuel_and_weight()
###

	settimer(func update_fuel_and_weight(), 0.01);   ## loop 10 per second
	}

##############################################################################################
setlistener("sim/signals/fdm-initialized", func {
	print (" fdm_initalized");
    settimer(func update_fuel_and_weight(), 10.0);
});

########################################### LOOP ENGINES ######################################################
###############################################################################################################
# engines feed only on the main tank. Engine 1 to main 1 etc.


var engines_alive = maketimer (8.0, func {
print("Func engines_live");

  # control the engine dependens
  foreach(var e; props.globals.getNode("engines").getChildren("engine")) {
		  var n2_node = e.getNode("n2");
		  if (n2_node == nil) {
			continue;
			# some buggy aircraft create additional /engines/engine[x] properties over multiplayer;
			# they lack n2: skip them
		  }
		  var n2 = n2_node.getValue() or 0;
		  var oil = getprop("VC10/oil/quantity["~e.getIndex()~"]") or 0;
		  var s = getprop("VC10/fuel/valves/LPCock["~e.getIndex()~"]") or 0;
		  var c = props.globals.getNode("controls/engines/engine["~e.getIndex()~"]/cutoff");
		  var f = props.globals.initNode("controls/engines/engine["~e.getIndex()~"]/fire",0,"BOOL");
		  var w = props.globals.getNode("VC10/warning/enabled");
		  var b = boost_pumps_for_engine (e.getIndex());
		  var cfv = getprop ("VC10/fuel/valves/valve-pos[" ~ (e.getIndex()+1) ~ "]");
		  var fp = 0;
		  var newfp = 0;
		  
		  ## SHUTOFF VALVE ## 
		  if(n2 >= 50 and !s) {
		      trace("Engine "~e.getIndex()~" without fuel - shutoff valve closed!");
			  print (" fuel and payload without fuel set cutoff true ");
		      c.setBoolValue(1);
		  }
		  
		  if(e.getIndex() > 0) { # Engines 2..4 have compressors
		     if(n2 < 25) {
		     		setprop("VC10/air-conditioning/compressor-start[" ~ (e.getIndex()-1) ~ "]", 0);
				interpolate("VC10/air-conditioning/compressor-rpm[" ~ (e.getIndex()-1) ~ "]", 0, 5);
		     }
		  }		  

		  # fuel pressure calculation
		  if (cfv) fp = fpsystem.getValue()*39;
		  if (b[0] and !b[1]) fp = 80;
		  if (!b[0] and b[1]) fp = 75;
		  if (b[0] and b[1]) fp = 100;
		  if (!s) fp = 0;
		  
		  newfp = (fp*1000-n2*200+600)/1000;
		  
	  	  interpolate("VC10/fuel/fuel-pressure["~e.getIndex()~"]", newfp, 4);	  
		  
		  ## BOOST-PUMPS ## are both closed and the crossfeed valve is closed too
		  if(n2 >= 50 and fp == 0) {
		      trace("Engine "~e.getIndex()~" without fuel - boost-pumps out!");
			  print (" fuel and payload boost pumps out set cutoff true ");
		      c.setBoolValue(1);
		  } 
		   		  
		  ## HYDRAULIC ## fake system pressure. Look inside the mk-VC10.nas for more
		  # at engine 2 and 3 was the pumps for the residual hydraulic system
		  if(e.getIndex() == 1 or e.getIndex() == 2){

		 		var r2  =  getprop("engines/engine[1]/running") or 0;
		 		var r3  =  getprop("engines/engine[2]/running") or 0;
		 		var psi =getprop("VC10/hydraulic/system") or 0;
		 		
		 		var s1 = getprop("VC10/hydraulic/hyd-fluid-shutoff[0]") or 0;
				var s2 = getprop("VC10/hydraulic/hyd-fluid-shutoff[1]") or 0;
				var p1 = getprop("VC10/hydraulic/hyd-fluid-pump[0]") or 0;
				var p2 = getprop("VC10/hydraulic/hyd-fluid-pump[1]") or 0;
		  
		  	# first running engine 2 or 3 supports the hydraulic system pressure
		  	if (r2 or r3){
		  		if(!hydSup.getValue()){
		  		  if(psi > 2000 and psi <= 2500){
		  		  	interpolate("VC10/hydraulic/system", 3018, 5);
							hydSup.setValue(e.getIndex());
		  		  } 	  	
		  		}
		  	}else{
		  		hydSup.setValue(0);
		  		# if hydraulic system is already started increase the pressure back to min
		  		if(((s1 and p1) or (s2 and p2)) and psi > 3010){
						interpolate("VC10/hydraulic/system", 2210, 3);
		  		}
		  	}	  	
		  } 
		  
		  ## FIRE ## action
		  var isL = props.globals.getNode("sim/multiplay/generic/int[17]");
		  var isR = props.globals.getNode("sim/multiplay/generic/int[18]");
		  
		  c.setBoolValue(0);  ## clear fire flag, so thet engines do not stop
		  
		  if(f.getBoolValue()){
		  			  print (" fuel and payload Fire set cutoff true ");
		  	c.setBoolValue(1);
		  	w.setValue(1);
		  	# fill the property for multiplay fire
		  	if(e.getIndex() == 0){
					if(isL.getValue() == 0) isL.setValue(1); 
					if(isL.getValue() == 2) isL.setValue(3);
				}
		  	if(e.getIndex() == 1){
					if(isL.getValue() == 0) isL.setValue(2); 
					if(isL.getValue() == 1) isL.setValue(3);
				}
		  	if(e.getIndex() == 2){
					if(isR.getValue() == 0) isR.setValue(1); 
					if(isR.getValue() == 2) isR.setValue(3);
				}
		  	if(e.getIndex() == 3){
					if(isR.getValue() == 0) isR.setValue(2); 
					if(isR.getValue() == 1) isR.setValue(3);
				}
		  }else{
		  	if(e.getIndex() == 0){
					if(isL.getValue() == 1) isL.setValue(0); 
					if(isL.getValue() == 3) isL.setValue(2);
				}
		  	if(e.getIndex() == 1){
					if(isL.getValue() == 2) isL.setValue(0); 
					if(isL.getValue() == 3) isL.setValue(1);
				}
		  	if(e.getIndex() == 2){
					if(isR.getValue() == 1) isR.setValue(0); 
					if(isR.getValue() == 3) isR.setValue(2);
				}
		  	if(e.getIndex() == 3){
					if(isR.getValue() == 2) isR.setValue(0); 
					if(isR.getValue() == 3) isR.setValue(1);
				}	  
		  } 
		  
		if(n2 > 15){
			if(e.getIndex() == 1 or e.getIndex() == 2){
				var oilNew = (oil > 2600 ) ? oil - 950 : 2600;
				interpolate("VC10/oil/quantity["~e.getIndex()~"]", oilNew, 8);
			}else{
				var oilNew = (oil > 2800 ) ? oil - 900 : 2800;
				interpolate("VC10/oil/quantity["~e.getIndex()~"]", oilNew, 8);
			}
		}else{
			var oilNew = (oil < 6400 ) ? oil + 100 : 6400;
			interpolate("VC10/oil/quantity["~e.getIndex()~"]", oilNew, 8);
		}
	}
	
	# fuel consumption calculation 8 sec for on loop
	var new = getprop("consumables/fuel/total-fuel-lbs") or 0;
	var tc = getprop("sim/time/elapsed-sec") or 0;
	var co = 0;
	if(flo.getValue() and fct.getValue()){
		co = 3600 * (flo.getValue() - new) / (tc - fct.getValue());
	}
	flo.setValue(new); 
	fph.setValue(co); 
	fct.setValue(tc);
});
###################################################################################################
###################################################################################################

setlistener("VC10/oil/oil-test", func(pos){
	var pos = pos.getValue();
	var pwr = getprop("VC10/electric/ess-bus") or 0;
	if(pos and pwr > 24) {
		interpolate("VC10/oil/quantity[0]", 0, 1);
		interpolate("VC10/oil/quantity[1]", 0, 1);
		interpolate("VC10/oil/quantity[2]", 0, 1);
		interpolate("VC10/oil/quantity[3]", 0, 1);
	}else{
		interpolate("VC10/oil/quantity[0]", 6400, 1);
		interpolate("VC10/oil/quantity[1]", 6400, 1);
		interpolate("VC10/oil/quantity[2]", 6400, 1);
		interpolate("VC10/oil/quantity[3]", 6400, 1);	
	}
},1,0);



############  Start up the loops ################

# do not burn fuel while sim is paused.
#engines_alive.simulatedTime = 1;
#engines_alive.start();
#crossfeed_action.start();

############################################# external fuel service action ###########################################
var fuel_truck = props.globals.getNode("VC10/ground-service/fuel-truck/state");
var fuel_truck_enable = props.globals.getNode("VC10/ground-service/fuel-truck/enable");
var fuel_truck_connect = props.globals.getNode("VC10/ground-service/fuel-truck/connect");
var fuel_truck_transfer = props.globals.getNode("VC10/ground-service/fuel-truck/transfer");
var fuel_truck_clean = props.globals.getNode("VC10/ground-service/fuel-truck/clean");

var clean_or_refuel = maketimer(0.12, func(){
	
	# Fuel Truck Controls
	var request_kg = getprop("VC10/ground-service/fuel-truck/request-kg") or 0;
	var total_fuel = getprop("consumables/fuel/total-fuel-kg") or 0; 

	if (fuel_truck_enable.getBoolValue()) {

		if(!getprop("engines/engine[0]/running") and !getprop("engines/engine[1]/running") and
		   !getprop("engines/engine[2]/running") and !getprop("engines/engine[3]/running")){
		   	fuel_truck.setValue(1.0);
		}else{
			screen.log.write("Please shutdown engines before Re-fueling Service call!", 1, 0, 0);
			setprop("VC10/ground-service/fuel-truck/enable", 0);
			setprop("VC10/ground-service/fuel-truck/connect", 0);
			setprop("VC10/ground-service/fuel-truck/transfer", 0);
			setprop("VC10/ground-service/fuel-truck/clean", 0);
			setprop("VC10/ground-service/fuel-truck/state", 0);
		}

		if(fuel_truck_connect.getBoolValue()){
	   		fuel_truck.setValue(1.1);
			if (fuel_truck_transfer.getBoolValue()) {
			
				if (!getprop("VC10/fuel/valves/valve[0]") and
					!getprop("VC10/fuel/valves/valve[1]") and !getprop("VC10/fuel/valves/valve[2]") and
					!getprop("VC10/fuel/valves/valve[3]") and !getprop("VC10/fuel/valves/valve[4]") and
					!getprop("VC10/fuel/valves/valve[5]")) {

					if (total_fuel < request_kg and total_fuel < 72485.0) {
						setprop("consumables/fuel/tank[0]/level-kg", getprop("consumables/fuel/tank[0]/level-kg") + 0.5);
						setprop("consumables/fuel/tank[1]/level-kg", getprop("consumables/fuel/tank[1]/level-kg") + 3);
						setprop("consumables/fuel/tank[2]/level-kg", getprop("consumables/fuel/tank[2]/level-kg") + 3);
						setprop("consumables/fuel/tank[3]/level-kg", getprop("consumables/fuel/tank[3]/level-kg") + 6);
						setprop("consumables/fuel/tank[4]/level-kg", getprop("consumables/fuel/tank[4]/level-kg") + 3);
						setprop("consumables/fuel/tank[5]/level-kg", getprop("consumables/fuel/tank[5]/level-kg") + 3);
						setprop("consumables/fuel/tank[6]/level-kg", getprop("consumables/fuel/tank[6]/level-kg") + 0.5);

						fuel_truck.setValue(1.2); 

					} else {
						setprop("VC10/ground-service/fuel-truck/transfer", 0);
						screen.log.write("Re-fueling complete! Have a nice flight... :)", 1, 1, 1);
					}				

				}else{
					setprop("VC10/ground-service/fuel-truck/transfer", 0);
					screen.log.write("ABORT! Please CLOSE your crossfeed valves before Re-fueling!", 1, 0, 0);
				}

			}
			if (fuel_truck_clean.getBoolValue()) {

				if (getprop("VC10/fuel/valves/valve[0]") and
					getprop("VC10/fuel/valves/valve[1]") and getprop("VC10/fuel/valves/valve[2]") and
					getprop("VC10/fuel/valves/valve[3]") and getprop("VC10/fuel/valves/valve[4]") and
					getprop("VC10/fuel/valves/valve[5]")) {

					if (getprop("consumables/fuel/total-fuel-kg")) {
						setprop("consumables/fuel/tank[0]/level-kg", getprop("consumables/fuel/tank[0]/level-kg") - 0.5);
						setprop("consumables/fuel/tank[1]/level-kg", getprop("consumables/fuel/tank[1]/level-kg") - 3);
						setprop("consumables/fuel/tank[2]/level-kg", getprop("consumables/fuel/tank[2]/level-kg") - 3);
						setprop("consumables/fuel/tank[3]/level-kg", getprop("consumables/fuel/tank[3]/level-kg") - 6);
						setprop("consumables/fuel/tank[4]/level-kg", getprop("consumables/fuel/tank[4]/level-kg") - 3);
						setprop("consumables/fuel/tank[5]/level-kg", getprop("consumables/fuel/tank[5]/level-kg") - 3);
						setprop("consumables/fuel/tank[6]/level-kg", getprop("consumables/fuel/tank[6]/level-kg") - 0.5);
						fuel_truck.setValue(1.2);

					} else {
						setprop("VC10/ground-service/fuel-truck/clean", 0);
						screen.log.write("Finished draining the fuel tanks...", 1, 1, 1);
					}
				}else{
					setprop("VC10/ground-service/fuel-truck/clean", 0);
					screen.log.write("ABORT! Please OPEN your crossfeed valves before draining!", 1, 0, 0);
				}
			}

		}

	}else{
		setprop("VC10/ground-service/fuel-truck/transfer", 0);
		setprop("VC10/ground-service/fuel-truck/connect", 0);
		setprop("VC10/ground-service/fuel-truck/clean", 0);
		setprop("VC10/ground-service/fuel-truck/state", 0);
		clean_or_refuel.stop();
	}
});

setlistener("VC10/ground-service/fuel-truck/enable", func{
	clean_or_refuel.start();
},1,0);

# Overwrite the original menu
gui.menuBind("fuel-and-payload", "VC10.WeightFuelDialog()");

var showDialog = func(name) {
    fgcommand("dialog-show", props.Node.new({ "dialog-name" : name }));
}

########################################################################
# Private Stuff:
########################################################################

var debug_traces = props.globals.initNode ("VC10/fuel/debug", 0, "BOOL");
var trace = func (message) {
  if (debug_traces.getValue()) {
    print (message);
  }
}

var crossfeed_per_tank_pps = props.globals.initNode ("VC10/fuel/crossfeed-flow-per-tank-pps", 5, "DOUBLE");
var automatic_management   = props.globals.initNode ("VC10/fuel/automatic-management",        0, "BOOL");

########################################################################
# Fuel and Payload Menu
########################################################################

##var fdm = getprop("sim/flight-model");
var c0 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[0]");
var c1 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[1]");
var c2 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[2]");
var c3 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[3]");
var c4 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[4]");
var c5 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[5]");
var c6 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[6]");
var c7 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[7]");
var h8 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[8]");
var h9 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[9]");
var h10 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[10]");
var h11 = props.globals.getNode("fdm/jsbsim/inertia/pointmass-weight-lbs[11]");

# the tanks
var tf1a = props.globals.getNode("consumables/fuel/tank[0]/level-lbs");
var tf1 = props.globals.getNode("consumables/fuel/tank[1]/level-lbs");
var tf2 = props.globals.getNode("consumables/fuel/tank[2]/level-lbs");
var tf3  = props.globals.getNode("consumables/fuel/tank[3]/level-lbs");
var tf4 = props.globals.getNode("consumables/fuel/tank[4]/level-lbs");
var tf4a = props.globals.getNode("consumables/fuel/tank[5]/level-lbs");
var tfC = props.globals.getNode("consumables/fuel/tank[6]/level-lbs");

var bp0 = props.globals.initNode("VC10/fuel/switches/BoostPump1_fwdSw",0,"BOOL");
var bp1 = props.globals.initNode("VC10/fuel/switches/BoostPump1_aftSw",0,"BOOL");
var bp2 = props.globals.initNode("VC10/fuel/switches/BoostPump2_fwdSw",0,"BOOL");
var bp3 = props.globals.initNode("VC10/fuel/switches/BoostPump2_aftSw",0,"BOOL");
var bp4 = props.globals.initNode("VC10/fuel/switches/BoostPump3_fwdSw",0,"BOOL");
var bp5 = props.globals.initNode("VC10/fuel/switches/BoostPump3_aftSw",0,"BOOL");
var bp6 = props.globals.initNode("VC10/fuel/switches/BoostPump4_fwdSw",0,"BOOL");
var bp7 = props.globals.initNode("VC10/fuel/switches/BoostPump4_aftSw",0,"BOOL");

var fp0 = props.globals.initNode("VC10/fuel/fuel-pressure[0]",0,"DOUBLE");
var fp1 = props.globals.initNode("VC10/fuel/fuel-pressure[1]",0,"DOUBLE");
var fp2 = props.globals.initNode("VC10/fuel/fuel-pressure[2]",0,"DOUBLE");
var fp3 = props.globals.initNode("VC10/fuel/fuel-pressure[3]",0,"DOUBLE");
var fpsystem = props.globals.initNode("VC10/fuel/fuel-pressure-system",0,"DOUBLE");

var hydSup = props.globals.initNode("VC10/hydraulic/hyd-supported-by-engine-index",0,"DOUBLE");

var flo = props.globals.initNode("VC10/fuel/fuel-level-old-lbs",0,"DOUBLE"); # we need only for consumption calc
var fph = props.globals.initNode("VC10/fuel/fuel-per-hour-lbs",0,"DOUBLE"); # we need only for consumption calc
var fct = props.globals.initNode("VC10/fuel/fuel-calc-time",0,"DOUBLE"); # we need only for consumption calc

########################################################################
# Widgets & Layout Management
########################################################################

##
# A "widget" class that wraps a property node.  It provides useful
# helper methods that are difficult or tedious with the raw property
# API.  Note especially the slightly tricky addChild() method.
#
var Widget = {
    set : func { me.node.getNode(arg[0], 1).setValue(arg[1]); },
    prop : func { return me.node; },
    new : func { return { parents : [Widget], node : props.Node.new() } },
    addChild : func {
        var type = arg[0];
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
    return 1;
}

# Checks the /sim/weight[n]/{selected|opt} values and sets the
# appropriate weights therefrom.
var setWeightOpts = func {
##	print("setWeightOps()");
    var tankchange = 0;
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
##	print("setWeightOps(), tankchange = ", tankchange);
    return tankchange;
}
# Run it at startup and on reset to make sure the tank settings are correct
_setlistener("sim/signals/fdm-initialized", func { settimer(setWeightOpts, 0) });
###_setlistener("sim/signals/reinit", func(n) { props._getValue(n, []) or setWeightOpts() });


# Called from the F&W dialog when the user selects a weight option
var weightChangeHandler = func {

    var tankchanged = setWeightOpts();
##	print("weightChangeHandler(), tankchanged = ", tankchanged);
	
    # This is unfortunate.  Changing tanks means that the list of
    # tanks selected and their slider bounds must change, but our GUI
    # isn't dynamic in that way.  The only way to get the changes on
    # screen is to pop it down and recreate it.
    if(tankchanged) {
        var p = props.Node.new({"dialog-name": "WeightAndFuel"});
        fgcommand("dialog-close", p);
        WeightFuelDialog();
    }
}

##
# Dynamically generates a weight & fuel configuration dialog specific to
# the aircraft.
#
var WeightFuelDialog = func {
    var name = "WeightAndFuel";
    var title = "VICKERS VC10 Weight and Fuel Settings";
    var cargo = getprop("sim/multiplay/generic/int[9]") or 0;
      var title = "VICKERS VC10 - CARGO Weight and Fuel Settings";
    	setprop("payload/weight[1]/name", "Cabin_C1");
    	setprop("payload/weight[2]/name", "Cabin_C2");
    	setprop("payload/weight[3]/name", "Cabin_C3");
    	setprop("payload/weight[4]/name", "Cabin_C4");
    	setprop("payload/weight[5]/name", "Cabin_C5");
    	setprop("payload/weight[6]/name", "Cabin_C6");
    	setprop("payload/weight[7]/name", "Cabin_C7");
    	setprop("payload/weight[8]/name", "Hold_8.1");
    	setprop("payload/weight[9]/name", "Hold_8.2");
    	setprop("payload/weight[10]/name","Hold_9.1");
    	setprop("payload/weight[11]/name","Hold_9.2");
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
    w.set("default", 1);
    w.set("key", "esc");
    w.setBinding("nasal", "delete(VC10.dialog, \"" ~ name ~ "\")");
    w.setBinding("dialog-close");

    dialog[name].addChild("hrule");

    var contentArea = dialog[name].addChild("group");
    contentArea.set("layout", "hbox");
    contentArea.set("default-padding", 10);

    dialog[name].addChild("empty");

    var limits = dialog[name].addChild("group");
    limits.set("layout", "table");
    limits.set("halign", "center");
    var row = 0;

    var massLimits = props.globals.getNode("limits/mass-and-balance");

    var tablerow = func(name, node, format ) {
	
		print ("tablerow row ", row, " name ", name);
		
        var n = isa( node, props.Node ) ? node : massLimits.getNode( node );
        if( n == nil ) {
			print ("nil");
			return;}
		
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

    ##var grossWgt = props.globals.getNode(fdmdata.grosswgt);
    var grossWgt = props.globals.getNode("fdm/jsbsim/inertia/weight-lbs");
    var grosskg = props.globals.getNode("VC10/weight-kg");
##    if(grossWgt != nil) {
##       tablerow("Gross Weight", grossWgt, "%.0f lbs");
##   }

    if(massLimits != nil ) {
		tablerow("Max. Takeoff", "maximum-takeoff-mass-lbs", "%.0f lbs" );
		tablerow("Max. Landing", "maximum-landing-mass-lbs", "%.0f lbs" );
    }
    props.globals.initNode("VC10/cg/cg-x-in",923.0);
	props.globals.initNode("VC10/cg/cg-x-datum-in",-25.0);
	props.globals.initNode("VC10/cg/cg-x-percent",21.2);
	props.globals.initNode("VC10/cg/cg-z-in",-35.0);

##	var cg_x_percent = props.globals.getNode("fdm/jsbsim/inertia/cg-x-percent");
	var cg_x_percent = props.globals.getNode("VC10/cg/cg-x-percent");
        tablerow("Centre of Gravity", cg_x_percent, "%.1f %% SMC");
##    var cg_x_in = props.globals.getNode("fdm/jsbsim/inertia/cg-x-in");
    var cg_x_in = props.globals.getNode("VC10/cg/cg-x-in");
    tablerow("CG about nose datum ", cg_x_in, "%.1f  in");
	
##    var cg_x_d_in = props.globals.getNode("fdm/jsbsim/inertia/inertia/cg-x-datum-in");
    var cg_x_d_in = props.globals.getNode("VC10/cg/cg-x-datum-in");
    tablerow("CG about trim datum ", cg_x_d_in, "%.1f  in");	
	var TO_trim = props.globals.getNode("VC10/cg/take_off_trim");
    tablerow("Take off Trim ", TO_trim, "%.1f  deg");
	
##	var cg_z_in = props.globals.getNode("fdm/jsbsim/inertia/cg-z-in");
	var cg_z_in = props.globals.getNode("VC10/cg/cg-z-in");
        tablerow("Vertical Centre of Gravity", cg_z_in, "%.1f  in");
	
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
    var lbs = tcell(fuelTable, "text", 0, 3);
    lbs.set("label", "lbs");
    lbs.set("halign", "left");
    
    var kg = tcell(fuelTable, "text", 0, 4);
    kg.set("label", "kg");
    kg.set("halign", "left");
    
 ##   var tnames = ["  1A", "   1", "   2", "   3", "   4", "  4A", "Centre","LP1","LP2","LP3","LP4"];

    var tanks = props.globals.getNode("consumables/fuel").getChildren("tank");
    for(var ti=0; ti<11; ti+=1) {
        var t = tanks[ti];
 ##       var tname = tnames[ti] ~ "";

		trace("Tanks in for:"~ti);
##		trace("Tank name: "~tnames[ti]);
		
        var tnode = t.getNode("name");
        if(tnode != nil) { tname = tnode.getValue(); }

        var tankprop = "consumables/fuel/tank["~ti~"]";

        var cap = t.getNode("capacity-gal_us", 0);

        # Hack, to ignore the "ghost" tanks created by the C++ code.
        if(cap == nil ) { continue; }
        cap = cap.getValue();

        # Ignore tanks of capacity 0
        if (cap == 0) { continue; }

        var title = tcell(fuelTable, "text", ti+1, 0);
        title.set("label", tname);
        title.set("halign", "left");

        var selected = props.globals.initNode(tankprop ~ "/selected", 1, "BOOL");
        if (selected.getAttribute("writable")) {
            var sel = tcell(fuelTable, "checkbox", ti+1, 1);
            sel.set("property", tankprop ~ "/selected");
            sel.set("live", 1);
            sel.setBinding("dialog-apply");
        }

        var slider = tcell(fuelTable, "slider", ti+1, 2);
        slider.set("property", tankprop ~ "/level-gal_us");
        slider.set("live", 1);
        slider.set("min", 0);
        slider.set("max", cap);
        slider.setBinding("dialog-apply");

        var lbs = tcell(fuelTable, "text", ti+1, 3);
        lbs.set("property", tankprop ~ "/level-lbs");
				lbs.set("label", "0123456");
				lbs.set("format", "%.1f" );
				lbs.set("halign", "right");
				lbs.set("live", 1);

        var kg = tcell(fuelTable, "text", ti+1, 4);
        kg.set("property", tankprop ~ "/level-kg");
				kg.set("label", "0123456");
				kg.set("format", "%.1f" );
				kg.set("halign", "right");
				kg.set("live", 1);
    }

    var bar = tcell(fuelTable, "hrule", size(tanks)+1, 0);
    bar.set("colspan", 5);

    var total_label = tcell(fuelTable, "text", size(tanks)+2, 0);
    total_label.set("label", "Total");
    total_label.set("halign", "left");
    
    # set each pair (Port and Stbd) of tanks to the same fraction
    var balanceFuel = tcell(fuelTable, "button", size(tanks)+2, 2);  
    balanceFuel.set("pref-width", 70);
    balanceFuel.set("pref-height", 20);
    balanceFuel.set("legend", "Levelling");
    balanceFuel.setBinding("nasal", "VC10.balance_fuel()");

    var lbs = tcell(fuelTable, "text", size(tanks)+2, 3);
    lbs.set("property", "consumables/fuel/total-fuel-lbs");
    lbs.set("label", "0123456");
    lbs.set("format", "%.1f" );
    lbs.set("halign", "right");
    lbs.set("live", 1);

    var kg = tcell(fuelTable, "text",size(tanks) +2, 4);
    kg.set("property", "consumables/fuel/total-fuel-kg");
    kg.set("label", "0123456");
    kg.set("format", "%.1f" );
    kg.set("halign", "right");
    kg.set("live", 1);

    var weightArea = contentArea.addChild("group");
    weightArea.set("layout", "vbox");
    weightArea.addChild("text").set("label", "Payload");

    var weightTable = weightArea.addChild("group");
    weightTable.set("layout", "table");

    weightArea.addChild("empty").set("stretch", 1);

    tcell(weightTable, "text", 0, 0).set("label", "Location");
    var lbs = tcell(weightTable, "text", 0, 3);
    lbs.set("label", "lbs");
    lbs.set("halign", "left");

    var kg = tcell(weightTable, "text", 0, 4);
    kg.set("label", "kg");
    kg.set("halign", "left");
    
    if(!cargo){
		  var pers = tcell(weightTable, "text", 0, 2);
		  pers.set("label", "Pers.");
		  pers.set("halign", "left");
		}
		
    var payload_base = props.globals.getNode("payload");
    if (payload_base != nil){
        var wgts = payload_base.getChildren("weight");
		var nwgts = size(wgts);
		}
    else
        var wgts = [];
    for(var i=0; i<size(wgts); i+=1) {
        var w = wgts[i];
        var wname = w.getNode("name", 1).getValue();		
        var title = tcell(weightTable, "text", i+1, 0);
        title.set("label", wname);
        title.set("halign", "left");

		if (i<8)
			{   # Main cabin - Can be either seats or cargo
            var slider = tcell(weightTable, "slider", i+1, 1);
		    slider.set("property", "payload/weight["~i~"]/pers");		
			var min = getprop("/payload/weight["~i~"]/min-pers");
			var max = getprop("/payload/weight["~i~"]/max-pers");
            slider.set("min", min != nil ? min : 0);
            slider.set("max", max != nil ? max : 100);
            slider.set("step", 1);
            slider.set("live", 1);
            slider.setBinding("dialog-apply");
			slider.setBinding("nasal", 	"VC10.update_payload("~i~")");
        } else
			{   # Cargo hold
		    var slider = tcell(weightTable, "slider", i+1, 2);
		    slider.set("property", "payload/weight["~i~"]/weight-lb");
            var min = w.getNode("min-lb", 1).getValue();
            var max = w.getNode("max-lb", 1).getValue();			
            slider.set("min", min != nil ? min : 0);
            slider.set("max", max != nil ? max : 100);
            slider.set("step", 1);
            slider.set("live", 1);
            slider.setBinding("dialog-apply");
			slider.setBinding("nasal", 	"VC10.update_payload("~i~")");
		}
		
		if (i<8)
		{
		 var pas = tcell(weightTable, "text", i+1, 2);
		 pas.set("property", "payload/weight["~i~"]/pers");
		 pas.set("label", "0123456");
		 pas.set("format", "%.0f");
		 pas.set("halign", "right");
		 pas.set("live", 1);
		 }

        var lbs = tcell(weightTable, "text", i+1, 3);
        lbs.set("property", "payload/weight[" ~ i ~ "]/weight-lb");
        lbs.set("label", "0123456");
        lbs.set("format", "%.0f");
        lbs.set("halign", "right");
        lbs.set("live", 1);
        
        var kg = tcell(weightTable, "text", i+1, 4);
        kg.set("property", "payload/weight["~i~"]/weight-kg");
        kg.set("label", "0123456");
        kg.set("format", "%.0f");
        kg.set("halign", "right");
        kg.set("live", 1);  
    }
    
    var bar = tcell(weightTable, "hrule", size(wgts)+1, 0);
    bar.set("colspan", 5);
    
    if(!cargo){
		  var total_label = tcell(weightTable, "text", size(wgts)+2, 0);
		  total_label.set("label", "Total Load/Passengers");
		  total_label.set("halign", "left");
		}else{
		  var total_label = tcell(weightTable, "text", size(wgts)+2, 0);
		  total_label.set("label", "Total Load");
		  total_label.set("halign", "left");		
		}

    fgcommand("dialog-new", dialog[name].prop());
    showDialog(name);
}

########################################### Helper #################################
 var update_payload = func(i){
	print ("Update Payload ",i);
	if (i<8) {
		var pers = getprop("payload/weight[" ~ i ~ "]/pers") or 0;
		var lb = pers*185;
		setprop("payload/weight[" ~ i ~ "]/weight-lb", lb);
		var kg = lb*0.453592;
		setprop("payload/weight[" ~ i ~ "]/weight-kg", kg);
		setprop("sim/presets/payload/weight[" ~ i ~ "]/pers", pers);
		setprop("sim/presets/payload/weight[" ~ i ~ "]/weight-lb", lb);
		setprop("sim/presets/payload/weight[" ~ i ~ "]/weight-kg", kg);		
		}
	else {
		var lb = getprop("payload/weight[" ~ i ~ "]/weight-lb") or 0;
		var kg = lb*0.453592;
		setprop("payload/weight[" ~ i ~ "]/weight-kg", kg);
		setprop("sim/presets/payload/weight[" ~ i ~ "]/weight-lb", lb);
		setprop("sim/presets/payload/weight[" ~ i ~ "]/weight-kg", kg);
		}
#	payload_update();
##	};

	var occupants = 0;
	var cabin_lb = 0;
	var cabin_kg = 0;
	var hold_lb = 0;
	var hold_kg = 0;
	var pers = 0;
	var lb = 0;
	var kg = 0;
	for(var ci=0; ci<12; ci+=1) 
		{
		pers = getprop("payload/weight[" ~ ci ~ "]/pers");
		lb = getprop("payload/weight[" ~ ci ~ "]/weight-lb");
		kg = getprop("payload/weight[" ~ ci ~ "]/weight-kg");
		if (ci < 8) {
			occupants = occupants + pers;
			cabin_lb = cabin_lb + lb;
			cabin_kg = cabin_kg + kg;
			} else  {
			hold_lb = hold_lb + lb;
			hold_kg = hold_kg + kg;	
			}
		}
	setprop ("payload/passengers",occupants);
	setprop ("payload/cabin-lb",cabin_lb);
	setprop ("payload/cabin-kg",cabin_kg);
	setprop ("payload/hold-lb",hold_lb);
	setprop ("payload/hold-kg",hold_kg);
	}

var balance_fuel = func{
##	print ("balance_fuel");
	
  var cfuel = (tf1a.getValue() + tf4a.getValue() )/ 2.0;
  tf1a.setValue(cfuel);
  tf4a.setValue(cfuel);  
  cfuel = (tf1.getValue() + tf4.getValue() )/ 2.0;
  tf1.setValue(cfuel);
  tf4.setValue(cfuel);
  cfuel = (tf2.getValue() + tf3.getValue() )/ 2.0;
  tf2.setValue(cfuel);
  tf3.setValue(cfuel);
}



