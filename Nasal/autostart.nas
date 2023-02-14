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

var run1 = props.globals.getNode("engines/engine[0]/running");
var run2 = props.globals.getNode("engines/engine[1]/running");
var run3 = props.globals.getNode("engines/engine[2]/running");
var run4 = props.globals.getNode("engines/engine[3]/running");
var auto_procedure = props.globals.initNode("VC10/autoprocedure",0,"BOOL");
var step = 0;

##################################################################################

##################################################################################

# startup/shutdown functions
var startup = func
 {
   print ("startup");
  if(!auto_procedure.getValue()){
	 	auto_procedure.setValue(1);
	 	step = 1;
	 	t = 0.0;

	 	screen.log.write("Have a look on engineers panel - External power pluged-in ", 1, 1, 1);
		setprop("controls/engines/engine[0]/cutoff", 1);
		setprop("controls/engines/engine[1]/cutoff", 1);
		setprop("controls/engines/engine[2]/cutoff", 1);
		setprop("controls/engines/engine[3]/cutoff", 1);
	 	setprop("VC10/electric/ac/BTB1-relay", 1);
		setprop("VC10/electric/ac/BTB2-relay", 1);
		setprop("VC10/electric/ac/BTB3-relay", 1);
		setprop("VC10/electric/ac/BTB4-relay", 1);
	 	click_switch2();
	 	
	 	t += 1.0;
	 	
		# Connect External Power
	 	settimer( func{
	 	  if(step == 1 and auto_procedure.getValue()){
		 		setprop("VC10/electric/external-power-connected", 1);
				screen.log.write(" Connect external power ", 1, 0, 0);
				click_switch3();
				step = 2;
			}else{
				step = 0;
				screen.log.write(" Problems with cutoff/bus-tie or fuel system - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.5;
		 	
	 	# Batteries
	 	settimer( func{
			if(step == 2 and auto_procedure.getValue()){
				setprop("VC10/electric/dc/BAT1_sw", 1);
				click_switch3();
				step = 3;
			}else{
				step = 0;
				screen.log.write(" Bat1 - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.5;
		
		t += 0.5;
	 	settimer( func{
			if(step == 3 and auto_procedure.getValue()){
		 		setprop("VC10/electric/dc/BAT2_sw", 1);
				click_switch3();
				step = 4;
			}else{
				step = 0;
				screen.log.write(" Bat2 - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.5;
	 	settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/Gen4-Drv", 1);
				click_switch3();
				step = 4;
			}else{
				step = 0;
				screen.log.write(" gen-drive4 - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.5;
		
		# Volt-Loads-Selector
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/AC_FreqVoltsSelectsw", 1);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/AC_FreqVoltsSelectsw", 2);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/AC_FreqVoltsSelectsw", 3);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/AC_FreqVoltsSelectsw", 4);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/AC_FreqVoltsSelectsw", 5);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()){ 
		 		setprop("VC10/electric/AC_FreqVoltsSelectsw", 0);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/AC_FreqVoltsSelectsw", 1);
				click_switch3();
			}
		}, t); t += 0.5;
	
		# Essential-Power-Selector
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/DC_VoltsSelectsw", 1);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/DC_VoltsSelectsw", 2);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/DC_VoltsSelectsw", 3);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/DC_VoltsSelectsw", 4);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
		 	if(step == 4 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/DC_VoltsSelectsw", 0);
				click_switch3();
			}
		}, t); t += 0.5;

		
		# Auxilliary Pumps and Hydraulic Pumps Engine 2 and 3
		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/ac-aux-pump[0]", 1);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Auxilliary 1 Pump INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 4;
		
		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/ac-aux-pump[1]", 1);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Auxilliary 2 Pump INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 10;
		
		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/brake-valve", 2);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Auxilliary Connect Valve INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.5;

		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/hyd-fluid-shutoff-cover[0]", 1);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Hydraulic Shutoff Cover INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.2;

		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/hyd-fluid-shutoff-cover[1]", 1);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Hydraulic Shutoff Cover INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.2;
		
		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/hyd-fluid-shutoff[0]", 1);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Hydraulic Shutoff INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.2;
		
		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/hyd-fluid-shutoff[1]", 1);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Hydraulic Shutoff INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.2;

		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/hyd-fluid-shutoff-cover[0]", 0);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Hydraulic Shutoff Cover INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.2;

		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/hyd-fluid-shutoff-cover[1]", 0);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Hydraulic Shutoff Cover INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.2;
		
		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/hyd-fluid-pump[0]", 1);
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Hydraulic Pump for Engine 2 INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 4;
		
		settimer( func{
			if(step == 4 and auto_procedure.getValue()){
				setprop("VC10/hydraulic/hyd-fluid-pump[1]", 1);
				step = 5;
				click_switch3();
			}else{
				step = 0;
				screen.log.write(" Hydraulic Pump for Engine 3 INOP - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 8;
		
		# Gen Drive
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen1-Drv-Guard", 1);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen2-Drv-Guard", 1);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen3-Drv-Guard", 1);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen4-Drv-Guard", 1);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen4-Drv-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen3-Drv-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen2-Drv-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen1-Drv-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen1-Drv", 1);
				setprop("VC10/electric/ac/generator/Gen2-Drv", 1);
				setprop("VC10/electric/ac/generator/Gen3-Drv", 1);
				setprop("VC10/electric/ac/generator/Gen4-Drv", 1);
				setprop("VC10/electric/ac/generator/Gen1-Fail", 0);
				setprop("VC10/electric/ac/generator/Gen2-Fail", 0);
				setprop("VC10/electric/ac/generator/Gen3-Fail", 0);
				setprop("VC10/electric/ac/generator/Gen4-Fail", 0);
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen1-Drv-Guard", 0);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen2-Drv-Guard", 0);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen3-Drv-Guard", 0);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 5 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen4-Drv-Guard", 0);
				click_switch3();
				step = 6;
			}
		}, t); t += 0.8;

		# external power to Power Bus Tie (sync bus)
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
##				setprop("VC10/electric/GroundPower-sw", 1);
##				click_switch2();
				screen.log.write("External Power Unit connected!", 1, 1, 1);
			}else{
				step = 0;
				screen.log.write(" No External Power Unit found on bus - startup interrupted ", 1, 0, 0);
			}
		}, t); t += 0.2;
	
		# Gen Control

		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen4-Control-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen3-Control-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen2-Control-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen1-Control-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;

		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen4-Control-sw", 0);
				setprop("VC10/electric/ac/generator/GCB4", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen3-Control-sw", 0);
				setprop("VC10/electric/ac/generator/GCB3", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen2-Control-sw", 0);
				setprop("VC10/electric/ac/generator/GCB2", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/generator/Gen1-Control-sw", 0);
				setprop("VC10/electric/ac/generator/GCB1", 1);
				click_switch2();
			}
		}, t); t += 0.2;			
	
		# Gen bus-tie

		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/BTB4-relay", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/BTB3-relay", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/BTB2-relay", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
		 	if(step == 6 and auto_procedure.getValue()) {
				setprop("VC10/electric/ac/BTB1-relay", 1);
				click_switch2();
			}
		}, t); t += 0.2;
	
		# Gen - Breaker, so engines generator ar ready for start the engine
		settimer( func{
			if(step == 6 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/GCR4-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 6 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/GCR3-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 6 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/GCR2-sw", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 6 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/GCR1-sw", 1);
				click_switch2();				
			}
		}, t); t += 1.2;
				settimer( func{
			if(step == 6 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/GCR4-sw", 0);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 6 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/GCR3-sw", 0);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 6 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/GCR2-sw", 0);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 6 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/generator/GCR1-sw", 0);
				click_switch2();				
				step = 7;
			}
		}, t); t += 1.2;
		
		# The fuel valves
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[0]", 1);
				VC10.valve_pos(0);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[1]", 1);
				VC10.valve_pos(1);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[2]", 1);
				VC10.valve_pos(2);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[3]", 1);
				VC10.valve_pos(3);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[4]", 1);
				VC10.valve_pos(4);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[5]", 1);
				VC10.valve_pos(5);
				click_switch3();
			}
		}, t); t += 0.8;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[0]", 0);
				VC10.valve_pos(0);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[1]", 0);
				VC10.valve_pos(1);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[2]", 0);
				VC10.valve_pos(2);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[3]", 0);
				VC10.valve_pos(3);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[4]", 0);
				VC10.valve_pos(4);
				click_switch3();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/valve[5]", 0);
				VC10.valve_pos(5);
				click_switch3();
			}
		}, t); t += 0.8;
		
		# the fuel boost-pumps
				settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[0]", 1);
				click_switch2();

				screen.log.write("Boost pumps controll!", 1, 1, 1);
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[1]", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[2]", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[3]", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[4]", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[5]", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[6]", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[7]", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[8]", 1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/switches/boost-pump[9]", 1);
				click_switch2();
			}
		}, t); t += 0.5;
		
		# the fuel shutoff-valves
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/LPCock[0]", 1);
				VC10.shutoff_pos(0);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/LPCock[1]", 1);
				VC10.shutoff_pos(1);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/LPCock[2]", 1);
				VC10.shutoff_pos(2);
				click_switch2();
			}
		}, t); t += 0.2;
		settimer( func{
			if(step == 7 and auto_procedure.getValue()){
				setprop("VC10/fuel/valves/LPCock[3]", 1);
				VC10.shutoff_pos(3);
				click_switch2();				
				screen.log.write("Look down to your throttle levers on centre pedestal.", 1, 1, 1);
				
				#cold weather problems start the heating system for windows-fuel-and engines
				setprop("VC10/anti-ice/switch", 2);
				setprop("VC10/anti-ice/engine-inlet[0]", 1);
				setprop("VC10/anti-ice/engine-inlet[1]", 1);
				setprop("VC10/anti-ice/engine-inlet[2]", 1);
				setprop("VC10/anti-ice/engine-inlet[3]", 1);
				setprop("VC10/anti-ice/window-heat-cap-switch", 1);
				setprop("VC10/anti-ice/window-heat-fo-switch", 1);
				
				setprop("VC10/fuel/heater[0]", 1);
				setprop("VC10/fuel/heater[1]", 1);
				setprop("VC10/fuel/heater[2]", 1);
				setprop("VC10/fuel/heater[3]", 1);
				
				step = 8;
			}
		}, t); t += 2.5;

		# close throttle levers
		settimer( func{
			if(step == 8 and auto_procedure.getValue()){
			interpolate("controls/engines/engine[0]/throttle", 0.0, 0.4);
			interpolate("controls/engines/engine[1]/throttle", 0.0, 0.4);
			interpolate("controls/engines/engine[2]/throttle", 0.0, 0.4);
			interpolate("controls/engines/engine[3]/throttle", 0.0, 0.4);
			}
		}, t); t += 1.0;

		# close HP cocks	
		settimer( func{
			if(step == 8 and auto_procedure.getValue()){
				screen.log.write("Close HP cocks.", 1, 1, 1);
#				setprop("controls/engines/engine[0]/cutoff", 1);
				interpolate("VC10/engines/HPcock[0]", 0.0, 0.4);
				click_switch2();
			}
		}, t); t += 0.5;
		settimer( func{
			if(step == 8 and auto_procedure.getValue()){
#				setprop("controls/engines/engine[1]/cutoff", 1);
				interpolate("VC10/engines/HPcock[1]", 0.0, 0.4);
				click_switch2();
			}
		}, t); t += 0.5;
		settimer( func{
			if(step == 8 and auto_procedure.getValue()){
#				setprop("controls/engines/engine[2]/cutoff", 1);
				interpolate("VC10/engines/HPcock[2]", 0.0, 0.4);
				click_switch2();
			}
		}, t); t += 0.5;	
		settimer( func{
			if(step == 8 and auto_procedure.getValue()){
#				setprop("controls/engines/engine[3]/cutoff", 1);
				interpolate("VC10/engines/HPcock[3]", 0.0, 0.4);
				click_switch2();
				screen.log.write("Engine Start Panel.", 1, 1, 1);
				step = 9;
			}
		}, t); t += 1.5;

		# Engine Start Panel
		settimer( func{
			if(step == 9 and auto_procedure.getValue()){
				setprop("VC10/engines/StartModeSw", 2);
				click_switch3();
			}
		}, t); t += 0.5;	
#############################################
		settimer( func{
			if(step == 9 and auto_procedure.getValue()){
				setprop("VC10/engines/start_sw3", 1);										  
				click_switch3();
				screen.log.write("Engine 3 start switch", 1, 1, 1);
			}
		}, t); t += 1.5;
		settimer( func{
			if(step == 9 and auto_procedure.getValue()){
				screen.log.write("Open Engine 3 HP Cock to start position", 1, 1, 1);
			click_switch2();
			}else{
				screen.log.write("WARNING: startup interrupted before ENGINE 3 ", 1, 0, 0);
			}
		}, t); t += 6.0;
		settimer(func{
			if(step == 9 and auto_procedure.getValue()){
				screen.log.write("Engine 3 spoolup", 1, 1, 1);
			}
		}, t); t += 28.5;	
		settimer( func{
			if(step == 9 and auto_procedure.getValue()){
				screen.log.write("Engine 3 release start switch", 1, 1, 1);
				setprop("VC10/engines/start_sw3", 0);
				click_switch3();
				step = 10;
			}
		}, t); t += 0.5; # 30 sec per engine
#############################################
		settimer( func{	  
			if(step == 10 and auto_procedure.getValue()){
				setprop("VC10/engines/start_sw4", 1);
				click_switch3();
				screen.log.write("Engine 4 start switch", 1, 1, 1);
			}
		}, t); t += 1.5;
		settimer( func{
			if(step == 10 and auto_procedure.getValue()){
				screen.log.write("Open Engine 4 HP Cock to start position", 1, 1, 1);
				click_switch2();
			}else{
				screen.log.write("WARNING: startup interrupted at ENGINE 4 ", 1, 0, 0);
			}
		}, t); t += 6.0;
		settimer(func{
			if(step == 10 and auto_procedure.getValue()){
				screen.log.write("Engine 4 spoolup", 1, 1, 1);
			}
		}, t); t += 28.5;	
		settimer( func{
			if(step == 10 and auto_procedure.getValue()){
				screen.log.write("Engine 4 release start switch", 1, 1, 1);
				setprop("VC10/engines/start_sw4", 0);
				click_switch3();
				step = 11;
			}
		}, t); t += 0.5; # 30 sec per engine 	
#############################################	
		settimer( func{	  
			if(step == 11 and auto_procedure.getValue()){
				setprop("VC10/engines/start_sw2", 1);
				click_switch3();
				screen.log.write("Engine 2 start switch", 1, 1, 1);
			}
		}, t); t += 1.5;
		settimer( func{
			if(step == 11 and auto_procedure.getValue()){
				screen.log.write("Open Engine 2 HP Cock to start position", 1, 1, 1);
				click_switch2();
			}else{
				screen.log.write("WARNING: startup interrupted at ENGINE 2 ", 1, 0, 0);
			}
		}, t); t += 6.0;
		settimer(func{
			if(step == 11 and auto_procedure.getValue()){
			screen.log.write("Engine 2 spoolup", 1, 1, 1);
			}
		}, t); t += 28.5;	
		settimer( func{
			if(step == 11 and auto_procedure.getValue()){
			screen.log.write("Engine 2 release start switch", 1, 1, 1);
				setprop("VC10/engines/start_sw2", 0);
				click_switch3();
				step = 12;
			}
		}, t); t += 0.5; # 30 sec per engine 	
#############################################
		settimer( func{	  
			if(step == 12 and auto_procedure.getValue()){
				setprop("VC10/engines/start_sw1", 1);
				click_switch3();
				screen.log.write("Engine 1 start switch", 1, 1, 1);
			}
		}, t); t += 1.5;
		settimer( func{
			if(step == 12 and auto_procedure.getValue()){
				screen.log.write("Open Engine 1 HP Cock to start position", 1, 1, 1);
				click_switch2();
			}else{
				screen.log.write("WARNING: startup interrupted at ENGINE 1 ", 1, 0, 0);
			}
		}, t); t += 6.0;
		settimer(func{
			if(step == 12 and auto_procedure.getValue()){
				screen.log.write("Engine 1 spoolup", 1, 1, 1);
			}
		}, t); t += 28.5;
		settimer( func{
			if(step == 12 and auto_procedure.getValue()){
				screen.log.write("Engine 1 release start switch", 1, 1, 1);
				setprop("VC10/engines/start_sw1", 0);
				click_switch3();
				screen.log.write("Synchronisation of the engines now - have a look to the engineer panel", 1, 1, 1);
				step = 13;
			}
		}, t); t += 1.5; # 30 sec per engine 
#############################################		 
		# synchronized the generator one and select this engine as ess-pwr
	 	settimer( func{		
			if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ac/ac-para-select", 1);
				click_switch3();
			}
		}, t); t += 1.5;

	 	settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
				interpolate("VC10/electric/ac/generator/Gen1-freq",400, 1.0);
			}	
		}, t); t += 1.0;
	
	 	settimer( func{		
			if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ac/ac-para-select", 2);
				click_switch3();
			}
		}, t); t += 1.5;

	 	settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
				interpolate("VC10/electric/ac/generator/Gen2-freq",400, 1.0);
			}	
		}, t); t += 1.0;
	
	 	settimer( func{		
			if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ac/ac-para-select", 3);
				click_switch3();
			}
		}, t); t += 1.5;
	
	 	settimer( func{		
			if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ac/ac-para-select", 4);
				click_switch3();
				
				screen.log.write("Generators setup.", 1, 1, 1);
			}
		}, t); t += 0.5;

	 	settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
				interpolate("VC10/electric/ac/generator/Gen3-freq",400, 1.0);
			}	
		}, t); t +=  1.0;
	
	 	settimer( func{		
			if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ac/ac-para-select", 5);
				click_switch3();
			}
		}, t); t += 1.5;

	 	settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
				interpolate("VC10/electric/ac/generator/Gen4-freq",400, 1.0);
			}	
		}, t); t += 1.0;
		
	 	settimer( func{
		 	if(step == 13 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/ac/ac-para-select", 6);
				click_switch3();
			}
		}, t); t += 0.2;
		
	 	settimer( func{
		 	if(step == 13 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/ac/ac-para-select", 0);
				click_switch3();
			}
		}, t); t += 0.2;
		
	 	settimer( func{
		 	if(step == 13 and auto_procedure.getValue()) {
		 		setprop("VC10/electric/ac/ac-para-select", 1);
				click_switch3();
			}
		}, t); t += 0.5;
		
		# switch generators to the sync bus now

		settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/BTB1-relay", 1);
				click_switch2();
				screen.log.write("Generator BUS setup.", 1, 1, 1);
			}
		}, t); t += 0.5;
	
		settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/BTB2-relay", 1);
				click_switch2();
			}
		}, t); t += 0.5;
	
		settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/BTB3-relay", 1);
				click_switch2();
			}
		}, t); t += 0.5;
	
		settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
				setprop("VC10/electric/ac/BTB4-relay", 1);
				click_switch2();
			}
		}, t); t += 0.5;
	
		# Essential-Power-Selector
	 	settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ess-power-switch", 4);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ess-power-switch", 3);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ess-power-switch", 2);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{
	 		if(step == 13 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ess-power-switch", 1);
				step = 14;
				click_switch3();
			}
		}, t); t += 0.5;		

		# external power disconnected Power Bus Tie (sync bus)
		settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
##				setprop("VC10/electric/GroundPower-sw", 0);
				click_switch2();
				
				screen.log.write("External Power Unit disconnected! Continue the startup procedure.", 1, 1, 1);
			}
		}, t); t += 1.0;
	
		# plug out
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/electric/external-power-connected", 0);
				setprop("VC10/hydraulic/brake-valve", 0);
				click_switch3();
			}
		}, t); t += 1.5;
		
		# equipment cooling
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/electric/ac/generator/hertz-converter", 1);
				click_switch2();
			}
		}, t); t += 0.2;		
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/equipment/blower", 1);
				click_switch2();
			}
		}, t); t += 0.2;
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/equipment/ovbd-dump", 1);
				click_switch2();
			}
		}, t); t += 0.5;
	
	  # compressors
	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/air-conditioning/ram-air-switch", 1);
				click_switch2();
				
				screen.log.write("Compressors startup.", 1, 1, 1);
			}
		}, t); t += 0.5;	  
	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/compressor-start[0]", 2);
				setprop("VC10/air-conditioning/compressor-rpm[0]", 110);
				click_switch2();
			}
		}, t); t += 0.5;	
	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/compressor-start[1]", 2);
				setprop("VC10/air-conditioning/compressor-rpm[1]", 95);
				click_switch2();
			}
		}, t); t += 0.5;		
	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/compressor-start[2]", 2);
				setprop("VC10/air-conditioning/compressor-rpm[2]", 104);
				click_switch2();
			}
		}, t); t += 0.5;

	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/air-cond-unit-left-start",1);
				click_switch2();
			}
		}, t); t += 0.5;		

	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/air-cond-unit-right-start",1);
				click_switch2();
			}
		}, t); t += 0.5;			

	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/wing-valve[0]",1);
				click_switch2();
			}
		}, t); t += 0.5;			

	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/wing-valve[1]",1);
				click_switch2();
			}
		}, t); t += 0.5;			

	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/cabin-temp-selector[0]",4);
				click_switch2();
			}
		}, t); t += 0.5;			

	  settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
				setprop("VC10/air-conditioning/cabin-temp-selector[1]",4);
				setprop("VC10/emergency/oxygen-sw",2);
				click_switch2();
			}
		}, t); t += 0.5;			

		# safety-valve switch
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/pressurization/safety-valve-cover", 1);
				click_switch3();
			}
		}, t); t += 0.2;
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/pressurization/safety-valve", 1);
				VC10.safety_valv_pos();
				click_switch2();
			}
		}, t); t += 0.2;
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/pressurization/safety-valve-cover", 0);
				click_switch3();
			}
		}, t); t += 0.5;	
				
		# cabin pressurization to AUTO
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/pressurization/manual-mode-switch", 1);
				click_switch3();
			}
		}, t); t += 0.2;	
	 	settimer( func{ 		
			if(step == 14 and auto_procedure.getValue()){
		 		setprop("VC10/pressurization/mode-switch", 1);
				click_switch3();
				
				#for pilots without knowledge of the compass control system the the compass controler here
				setprop("instrumentation/compass-control/mag/", 0);
				setprop("instrumentation/compass-control/lat-turn/", math.round(getprop("/position/latitude-deg")));

				screen.log.write("Startup procedure was successful. It is now in your control! Do not forget to inform the Tower about your intentions.", 1, 1, 1);
				
			}
		}, t); t += 0.2;
				

		 # lights on 
		 if(getprop("sim/time/sun-angle-rad") > 1.55){
		 	settimer( func{
		 		screen.log.write("Switch lighting in the overhead panel.", 1, 1, 1);
				setprop("controls/lighting/beacon", 1);
				click_switch2();
			}, t); t += 0.5;
		 	settimer( func{
				setprop("controls/lighting/landing-light[0]", 1);
				click_switch2();
			}, t); t += 0.5;
		 	settimer( func{
				setprop("controls/lighting/landing-light[1]", 1);
				click_switch2();
			}, t); t += 0.5;
		 	settimer( func{
				setprop("controls/lighting/landing-light[2]", 1);
				click_switch2();
			}, t); t += 0.5;
		 	settimer( func{
				setprop("controls/lighting/nav-lights", 1);
				click_switch2();
			}, t); t += 0.5;
		 	settimer( func{
				setprop("controls/lighting/cabin-lights", 1);
				click_switch2();
			}, t); t += 0.5;
		 	settimer( func{
				interpolate("controls/lighting/cabin-dim", 0.8,0.5);
				click_switch2();
			}, t); t += 0.5;
		 	settimer( func{
				setprop("controls/lighting/strobe", 1);
				click_switch2();
			}, t); t += 0.5;

		 }else{
			 	settimer( func{
					setprop("controls/lighting/beacon", 1);
					click_switch2();
				}, t); t += 0.5;
			 	settimer( func{
					setprop("controls/lighting/nav-lights", 1);
					click_switch2();
				}, t); t += 0.5;  
		 }    
			# switch on the FlightRallyeMode
			var frwKnob = getprop("instrumentation/frw/btn-mode");
			if (frwKnob == 0) {
				setprop("instrumentation/frw/btn-mode",1);
				VC10.frw_mode();
			}
			
				# always after startup
			settimer( func{
				auto_procedure.setValue(0);
			}, t);
		
	}else{
		screen.log.write("The Automatic Start Procedure is allready running. Please wait!", 1, 0, 0);
	}
 };

var shutdown = func
 {
   print (" shutdown");
	 	if(!auto_procedure.getValue()){
			setprop("VC10/electric/ac/generator/Gen1-Drv-sw", 1);
			setprop("VC10/electric/ac/generator/Gen2-Drv-sw", 1);
			setprop("VC10/electric/ac/generator/Gen3-Drv-sw", 1);
			setprop("VC10/electric/ac/generator/Gen4-Drv-sw", 1);
			setprop("VC10/electric/ac/generator/Gen1-Fail", 0);
			setprop("VC10/electric/ac/generator/Gen2-Fail", 0);
			setprop("VC10/electric/ac/generator/Gen3-Fail", 0);
			setprop("VC10/electric/ac/generator/Gen4-Fail", 0);
			setprop("VC10/electric/ac/generator/Gen1-Drv", 1);
			setprop("VC10/electric/ac/generator/Gen2-Drv", 1);
			setprop("VC10/electric/ac/generator/Gen3-Drv", 1);
			setprop("VC10/electric/ac/generator/Gen4-Drv", 1);
		 	setprop("VC10/electric/ac/BTB1-relay", 1);
			setprop("VC10/electric/ac/BTB2-relay", 1);
			setprop("VC10/electric/ac/BTB3-relay", 1);
			setprop("VC10/electric/ac/BTB4-relay", 1);				
			setprop("VC10/electric/ac/generator/GCR1-sw", 0);			
			setprop("VC10/electric/ac/generator/GCR2-sw", 0);			
			setprop("VC10/electric/ac/generator/GCR3-sw", 0);			
			setprop("VC10/electric/ac/generator/GCR4-sw", 0);
		 	setprop("VC10/electric/ac/generator/Gen1-Control-sw", 0);
			setprop("VC10/electric/ac/generator/Gen2-Control-sw", 0);
			setprop("VC10/electric/ac/generator/Gen3-Control-sw", 0);
			setprop("VC10/electric/ac/generator/Gen4-Control-sw", 0);
			setprop("VC10/electric/ac/generator/GCB1", 1);
			setprop("VC10/electric/ac/generator/GCB2", 1);	
			setprop("VC10/electric/ac/generator/GCB3", 1);	
			setprop("VC10/electric/ac/generator/GCB4", 1);				
		 	setprop("VC10/electric/ac/generator/Gen1-freq", 0);
			setprop("VC10/electric/ac/generator/Gen2-freq", 0);
			setprop("VC10/electric/ac/generator/Gen3-freq", 0);
			setprop("VC10/electric/ac/generator/Gen4-freq", 0);
			setprop("controls/engines/engine[0]/cutoff", 1);
			setprop("controls/engines/engine[1]/cutoff", 1);
			setprop("controls/engines/engine[2]/cutoff", 1);
			setprop("controls/engines/engine[3]/cutoff", 1);
			setprop("controls/wiper/degrees",0);
			setprop("VC10/apu/off-start-run", 0);
	
			screen.log.write("The Aircraft Engines have been shut down.", 1, 1, 1);
		
		}else{
				screen.log.write("The Automatical Start Procedure is allready running. Please wait!", 1, 0, 0);
		}
 };

 # listener to activate these functions accordingly
setlistener("sim/model/Autostart_shutdown", func(idle)
 {
 var autorun = idle.getBoolValue();

 # Autostart if no engines are running.
 if (autorun and !run1.getBoolValue() and !run2.getBoolValue() and !run3.getBoolValue() and !run4.getBoolValue())
  {
  print ("Engines start");
  startup();
  }
 else
  {
  print ("Shutdown");
  shutdown();
  }
 }, 0, 0);
## START PROCEDURE ON MAIN SWITCHES ###
#######################################
var starter = func(nr) 
{
print ("starter func" );
}
var starter707 = func(nr)
 {
 print ("starter func" );
 	var s_bat = getprop("VC10/electric/dc/Battery-switch") or 0;
	var s_ext_con = getprop("VC10/electric/external-power-connected") or 0;
	var s_ess_pwr = getprop("VC10/electric/ess-power-switch") or 0;
	var s_ess_bus = getprop("VC10/electric/ess-bus") or 0;
##	var s_ground_c = getprop("VC10/electric/GroundPower-sw") or 0;
	var s_par_sel = getprop("VC10/electric/ac/ac-para-select") or 0;
	if (nr == 0){
		var s_apu_gen =  0;			
		var s_bus_tie = getprop("VC10/electric/ac/generator/BTB1-relay") or 0;
		var s_gen_bre = getprop("VC10/electric/ac/generator/GCR1") or 0;
		var s_bus_con = getprop("VC10/electric/ac/generator/GCB1") or 0;
	}elsif ( nr == 1){
		var s_apu_gen =  0;			
		var s_bus_tie = getprop("VC10/electric/ac/generator/BTB2-relay") or 0;
		var s_gen_bre = getprop("VC10/electric/ac/generator/GCR2") or 0;
		var s_bus_con = getprop("VC10/electric/ac/generator/GCB2") or 0;
	}elsif ( nr == 2){
		var s_apu_gen =  0;			
		var s_bus_tie = getprop("VC10/electric/ac/generator/BTB3-relay") or 0;
		var s_gen_bre = getprop("VC10/electric/ac/generator/GCR3") or 0;
		var s_bus_con = getprop("VC10/electric/ac/generator/GCB3") or 0;
	}elsif ( nr == 3){
		var s_apu_gen =  0;			
		var s_bus_tie = getprop("VC10/electric/ac/generator/BTB4-relay") or 0;
		var s_gen_bre = getprop("VC10/electric/ac/generator/GCR4") or 0;
		var s_bus_con = getprop("VC10/electric/ac/generator/GCB4") or 0;
	};
	
	if(s_bat and s_ess_bus > 20 and s_gen_bre and s_bus_tie and s_bus_con and
##			((s_ext_con and s_ess_pwr == 5 and s_ground_c == 1) or
			((s_ext_con and s_ess_pwr == 5 ) or
		 	 ( s_ess_pwr == 0 and s_apu_start == 2 and s_apu_gen) or
		 	 ((run1.getBoolValue() and s_ess_pwr == 1) or 
		 	  (run2.getBoolValue() and s_ess_pwr == 2) or 
		 	  (run3.getBoolValue() and s_ess_pwr == 3) or 
		 	  (run4.getBoolValue() and s_ess_pwr == 4) ))){
	
			# not supported the fuel system for the moment
			setprop("controls/engines/engine["~nr~"]/starter", 0);
			setprop("controls/engines/engine["~nr~"]/cutoff", 1);
			setprop("controls/engines/engine["~nr~"]/starter", 1);
			setprop("controls/engines/engine["~nr~"]/started", 1);
			if (num==0)
					setprop("VC10/electric/ac/generator/Gen1-freq", VC10.my_rand(384,418));
				elsif (num==1)
					setprop("VC10/electric/ac/generator/Gen2-freq", VC10.my_rand(384,418));
				elsif (num==2)
					setprop("VC10/electric/ac/generator/Gen3-freq", VC10.my_rand(384,418));
				elsif (num==3)
					setprop("VC10/electric/ac/generator/Gen4-freq", VC10.my_rand(384,418));
			
			if(auto_procedure.getValue()){
				settimer(func
				{
					setprop("controls/engines/engine["~nr~"]/cutoff", 0);
				}, 1.2);
			}
			
			# fake highpressure and crossfeed pressure startup - instrument in engineer panel
			if(nr == 2 or nr == 3) interpolate("VC10/start-air-bottle-press[0]",0, 15);
			if(nr == 1 or nr == 0) interpolate("VC10/start-air-bottle-press[1]",0, 15);
			settimer(func
			{
				if(nr == 2 or nr == 3) interpolate("VC10/start-air-bottle-press[0]",2870,7);
				if(nr == 1 or nr == 0) interpolate("VC10/start-air-bottle-press[1]",2930,8);
			}, 22);
	
	}else{
		setprop("controls/engines/engine["~nr~"]/starter", 0);
			if (num==0)
					setprop("VC10/electric/ac/generator/Gen1-freq", 0);
				elsif (num==1)
					setprop("VC10/electric/ac/generator/Gen2-freq", 0);
				elsif (num==2)
					setprop("VC10/electric/ac/generator/Gen3-freq", 0);
				elsif (num==3)
					setprop("VC10/electric/ac/generator/Gen4-freq", 0);
	}
		
};

setlistener("VC10/start/startercover[2]", func(open)
 {
 	var open = open.getBoolValue();
 	var s_bat = getprop("VC10/electric/dc/Battery-switch") or 0;
	var s_ext_con = getprop("VC10/electric/external-power-connected") or 0;
	var s_ess_pwr = getprop("VC10/electric/ess-power-switch") or 0;
	var s_ess_bus = getprop("VC10/electric/ess-bus") or 0;
#	var s_ground_c = getprop("VC10/electric/GroundPower-sw") or 0;
	var s_par_sel = getprop("VC10/electric/ac/ac-para-select") or 0;
	var s_apu_start = getprop("VC10/apu/off-start-run") or 0;
	var s_apu_gen = getprop("VC10/electric/ac/generator/GenELRAT-drive") or 0;			
	var s_bus_tie = getprop("VC10/electric/ac/BTB3-relay") or 0;
	var s_gen_bre = getprop("VC10/electric/ac/generator/GCR3-sw") or 0;
	
	if(open and s_bat and s_ess_bus > 20 and s_gen_bre and s_bus_tie and 
##			((s_ext_con and s_ess_pwr == 5 and s_ground_c == 1) or
			((s_ext_con and s_ess_pwr == 5) or
		 	 ( s_ess_pwr == 0 and s_apu_start == 2 and s_apu_gen))
		){
	 setprop("controls/engines/engine[2]/msg", 1);
	}
 }, 0, 0); 

setlistener("controls/engines/engine[0]/starter707", func
 {
 print (" listener engine 1 starter");
 	if(!run1.getBoolValue()){
	 starter(0);
	}
 }, 0, 0);
 
setlistener("controls/engines/engine[1]/starter707", func
 {
 print (" listener engine 2 starter");
 	if(!run2.getBoolValue()){
	 starter(1);
	}
 }, 0, 0);
 
setlistener("controls/engines/engine[2]/starter707", func
 {
  print (" listener engine 3 starter");
 	if(!run3.getBoolValue()){
	 starter(2);
	}
 }, 0, 0); 
 
setlistener("controls/engines/engine[3]/starter707", func
 {
  print (" listener engine 4 starter");
 	if(!run4.getBoolValue()){
	 starter(3);
	}
 }, 0, 0);

setlistener("engines/engine[0]/running707", func
 {
  print (" listener engine 1 running");
 	if(run1.getBoolValue()){
	 setprop("controls/engines/msg", 2);
	}else{
	 setprop("controls/engines/engine[0]/msg", 0);
	 setprop("controls/engines/engine[1]/msg", 0);
	 setprop("controls/engines/engine[2]/msg", 0);
	 setprop("controls/engines/engine[3]/msg", 0);
	 setprop("controls/engines/msg", 0);
	 if(getprop("controls/engines/engine[0]/started")){  # started control engines stop after running
#    	 	setprop("VC10/electric/ac/generator/Gen1-Drv-sw", 0);
    	 	setprop("VC10/electric/ac/BTB1-relay", 1);
			setprop("VC10/electric/ac/generator/GCR1-sw", 0);
			setprop("VC10/electric/ac/generator/Gen1-Control-sw", 0);
			setprop("VC10/electric/ac/generator/GCB1", 1);			
	 };
	}
 }, 0, 0);
 
setlistener("engines/engine[1]/running707", func
 {
   print (" listener engine 2 running");
 	if(run2.getBoolValue()){
	 setprop("controls/engines/engine[0]/msg", 1);
	}else{
	 setprop("controls/engines/engine[0]/msg", 0);
	 setprop("controls/engines/engine[1]/msg", 0);
	 setprop("controls/engines/engine[2]/msg", 0);
	 setprop("controls/engines/engine[3]/msg", 0);
	 setprop("controls/engines/msg", 0);
	 if(getprop("controls/engines/engine[1]/started")){  # started control engines stop after running
#    	 	setprop("VC10/electric/ac/generator/Gen2-Drv-sw", 0);
    	 	setprop("VC10/electric/ac/BTB2-relay", 1);
			setprop("VC10/electric/ac/generator/GCR2-sw", 0);
			setprop("VC10/electric/ac/generator/Gen2-Control-sw", 0);
			setprop("VC10/electric/ac/generator/GCB2", 1);					
	 };
	}
 }, 0, 0);
 
setlistener("engines/engine[2]/running707", func
 {
   print (" listener engine 3 running");
 	if(run3.getBoolValue()){
	 setprop("controls/engines/engine[3]/msg", 1);
	}else{
	 setprop("controls/engines/engine[0]/msg", 0);
	 setprop("controls/engines/engine[1]/msg", 0);
	 setprop("controls/engines/engine[2]/msg", 0);
	 setprop("controls/engines/engine[3]/msg", 0);
	 setprop("controls/engines/msg", 0);
	 if(getprop("controls/engines/engine[2]/started")){  # started control engines stop after running
 #   	 	setprop("VC10/electric/ac/generator/Gen3-Drv-sw", 0);
    	 	setprop("VC10/electric/ac/BTB3-relay", 1);
			setprop("VC10/electric/ac/generator/GCR3-sw", 0);
			setprop("VC10/electric/ac/generator/Gen3-Control-sw", 0);
			setprop("VC10/electric/ac/generator/GCB3", 1);					
	 };
	}
 }, 0, 0); 
 
setlistener("engines/engine[3]/running707", func
 {
   print (" listener engine 4 running");
 	if(run4.getBoolValue()){
	 setprop("controls/engines/engine[1]/msg", 1);
	}else{
	 setprop("controls/engines/engine[0]/msg", 0);
	 setprop("controls/engines/engine[1]/msg", 0);
	 setprop("controls/engines/engine[2]/msg", 0);
	 setprop("controls/engines/engine[3]/msg", 0);
	 setprop("controls/engines/msg", 0);
	 if(getprop("controls/engines/engine[3]/started")){  # started control engines stop after running
 #   	 	setprop("VC10/electric/ac/generator/Gen4-Drv-sw", 0);
    	 	setprop("VC10/electric/ac/BTB4-relay", 1);
			setprop("VC10/electric/ac/generator/GCR4-sw", 0);
			setprop("VC10/electric/ac/generator/Gen4-Control-sw", 0);
			setprop("VC10/electric/ac/generator/GCB4", 1);					
	 };
	}
 }, 0, 0);
 

var click_switch2 = func{

	if(getprop("sim/sound/switch2") == 1){
  	 setprop("sim/sound/switch2", 0); 
  }else{
  	 setprop("sim/sound/switch2", 1);
  }

}

var click_switch3 = func{

	if(getprop("sim/sound/switch3") == 1){
  	 setprop("sim/sound/switch3", 0); 
  }else{
  	 setprop("sim/sound/switch3", 1);
  }

}


######################## short Startup for testflight #################################

var short_startup = func
 {
   print (" short startup");
 	setprop("VC10/electric/dc/Battery-switch", 1);		
 	setprop("VC10/electric/external-power-connected", 0);
#	setprop("VC10/electric/GroundPower-sw", 0);
	setprop("VC10/electric/ess-power-switch", 0);
##	setprop("VC10/electric/ac/ac-para-select", 0);
## 	setprop("VC10/apu/starter", 1);
	setprop("VC10/electric/AC_FreqVoltsSelectsw", 1);
	setprop("instrumentation/transponder/inputs/knob-mode", 4);
	
##   settimer(func
##    {	
##			setprop("engines/APU/rpm", 95);
 ##   }, 0.5);
	
   settimer(func
    {	
#		VC10.apu_gen_switch();

		setprop("VC10/hydraulic/ac-aux-pump[0]", 1);
		setprop("VC10/hydraulic/ac-aux-pump[1]", 1);
		setprop("VC10/hydraulic/hyd-fluid-shutoff[0]", 1);
		setprop("VC10/hydraulic/hyd-fluid-shutoff[1]", 1);
		setprop("VC10/hydraulic/hyd-fluid-pump[0]", 1);
		setprop("VC10/hydraulic/hyd-fluid-pump[1]", 1);
		setprop("VC10/electric/ac/generator/Gen1-Drv-sw", 1);
		setprop("VC10/electric/ac/generator/Gen2-Drv-sw", 1);
		setprop("VC10/electric/ac/generator/Gen3-Drv-sw", 1);
		setprop("VC10/electric/ac/generator/Gen4-Drv-sw", 1);
		setprop("VC10/electric/ac/generator/Gen1-Fail", 0);
		setprop("VC10/electric/ac/generator/Gen2-Fail", 0);
		setprop("VC10/electric/ac/generator/Gen3-Fail", 0);
		setprop("VC10/electric/ac/generator/Gen4-Fail", 0);		
		setprop("VC10/electric/ac/generator/Gen1-Drv", 1);
		setprop("VC10/electric/ac/generator/Gen2-Drv", 1);
		setprop("VC10/electric/ac/generator/Gen3-Drv", 1);
		setprop("VC10/electric/ac/generator/Gen4-Drv", 1);
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
	
		setprop("VC10/fuel/valves/valve[0]", 0);
		VC10.valve_pos(0);
		setprop("VC10/fuel/valves/valve[1]", 0);
		VC10.valve_pos(1);
		setprop("VC10/fuel/valves/valve[2]", 0);
		VC10.valve_pos(2);
		setprop("VC10/fuel/valves/valve[3]", 0);
		VC10.valve_pos(3);
		setprop("VC10/fuel/valves/valve[4]", 0);
		VC10.valve_pos(4);
		setprop("VC10/fuel/valves/valve[5]", 0);
		VC10.valve_pos(5);
	
		setprop("VC10/fuel/switches/boost-pump[0]", 1);
		setprop("VC10/fuel/switches/boost-pump[1]", 1);
		setprop("VC10/fuel/switches/boost-pump[2]", 1);
		setprop("VC10/fuel/switches/boost-pump[3]", 1);
		setprop("VC10/fuel/switches/boost-pump[4]", 1);
		setprop("VC10/fuel/switches/boost-pump[5]", 1);
		setprop("VC10/fuel/switches/boost-pump[6]", 1);
		setprop("VC10/fuel/switches/boost-pump[7]", 1);
		setprop("VC10/fuel/switches/boost-pump[8]", 1);
		setprop("VC10/fuel/switches/boost-pump[9]", 1);
	
		setprop("VC10/fuel/valves/LPCock[0]", 1);
		VC10.shutoff_pos(0);
		setprop("VC10/fuel/valves/LPCock[1]", 1);
		VC10.shutoff_pos(1);
		setprop("VC10/fuel/valves/LPCock[2]", 1);
		VC10.shutoff_pos(2);
		setprop("VC10/fuel/valves/LPCock[3]", 1);
		VC10.shutoff_pos(3);
	
		setprop("controls/engines/engine[0]/throttle", 0.0);
		setprop("controls/engines/engine[1]/throttle", 0.0);
		setprop("controls/engines/engine[2]/throttle", 0.0);
		setprop("controls/engines/engine[3]/throttle", 0.0);
		setprop("controls/engines/engine[0]/cutoff", 1);
		setprop("controls/engines/engine[1]/cutoff", 1);
		setprop("controls/engines/engine[2]/cutoff", 1);
		setprop("controls/engines/engine[3]/cutoff", 1);
		setprop("controls/engines/engine[0]/starter", 1);
		setprop("controls/engines/engine[1]/starter", 1);
		setprop("controls/engines/engine[2]/starter", 1);
		setprop("controls/engines/engine[3]/starter", 1);
    }, 4);

   settimer(func
    {
	  print (" set cutoff(s) to zero");
			setprop("controls/engines/engine[0]/cutoff", 0);
			setprop("controls/engines/engine[1]/cutoff", 0);
			setprop("controls/engines/engine[2]/cutoff", 0);
			setprop("controls/engines/engine[3]/cutoff", 0);
    }, 14);
    

   settimer(func
    {
		setprop("VC10/air-conditioning/ram-air-switch",1);
		VC10.air_compressor(0);
		VC10.air_compressor(1);
		VC10.air_compressor(2);
		setprop("VC10/air-conditioning/compressor-rpm[0]",100);
		setprop("VC10/air-conditioning/compressor-rpm[1]",105);
		setprop("VC10/air-conditioning/compressor-rpm[2]",108);
		setprop("VC10/electric/ac/generator/Gen1-freq", 400);
		setprop("VC10/electric/ac/generator/Gen2-freq", 400);
		setprop("VC10/electric/ac/generator/Gen3-freq", 400);
		setprop("VC10/electric/ac/generator/Gen4-freq", 400);
		setprop("VC10/electric/ac/BTB1-relay", 1);
		setprop("VC10/electric/ac/BTB2-relay", 1);
		setprop("VC10/electric/ac/BTB3-relay", 1);
		setprop("VC10/electric/ac/BTB4-relay", 1);
		setprop("VC10/electric/ess-power-switch", 1);
#		setprop("VC10/electric/ac/ac-para-select", 1);
		setprop("VC10/electric/ac/generator/GenELRAT-drive", 0);
#		setprop("VC10/apu/starter", 0);
		setprop("VC10/hydraulic/quantity", 3050);
		setprop("VC10/electric/ac/generator/hertz-converter", 1);
		setprop("VC10/equipment/blower", 1);
		setprop("VC10/equipment/ovbd-dump", 1);
		setprop("VC10/pressurization/safety-valve", 1);
		VC10.safety_valv_pos();
		setprop("VC10/pressurization/manual-mode-switch",1);
		setprop("VC10/pressurization/mode-switch",1);
		setprop("VC10/air-conditioning/air-cond-unit-left-start",1);
		setprop("VC10/air-conditioning/air-cond-unit-right-start",1);
		setprop("VC10/air-conditioning/wing-valve[0]",1);
		setprop("VC10/air-conditioning/wing-valve[1]",1);
		setprop("VC10/air-conditioning/cabin-temp-selector[0]",4);
		setprop("VC10/air-conditioning/cabin-temp-selector[1]",4);
		setprop("VC10/emergency/oxygen-sw",2);
	 	setprop("instrumentation/compass-control/mag/", 0);
		setprop("instrumentation/compass-control/lat-turn/", math.round(getprop("/position/latitude-deg")));
		setprop("VC10/anti-ice/switch", 2);
		setprop("VC10/anti-ice/engine-inlet[0]", 1);
		setprop("VC10/anti-ice/engine-inlet[1]", 1);
		setprop("VC10/anti-ice/engine-inlet[2]", 1);
		setprop("VC10/anti-ice/engine-inlet[3]", 1);
		setprop("VC10/anti-ice/window-heat-cap-switch", 2);
		setprop("VC10/anti-ice/window-heat-fo-switch", 2);
		setprop("VC10/fuel/heater[0]", 1);
		setprop("VC10/fuel/heater[1]", 1);
		setprop("VC10/fuel/heater[2]", 1);
		setprop("VC10/fuel/heater[3]", 1);
		setprop("controls/lighting/cabin-lights", 1);
		setprop("controls/lighting/cabin-dim", 0.8);
		setprop("controls/lighting/panel-norm", 0.8);
		setprop("controls/lighting/overhead-dim", 0.8);
		setprop("controls/lighting/engineer-dim", 0.8);
		setprop("instrumentation/transponder/inputs/digit[0]", 4);
		setprop("instrumentation/transponder/inputs/digit[1]", 0);
		setprop("instrumentation/transponder/inputs/digit[2]", 0);
		setprop("instrumentation/transponder/inputs/digit[3]", 7); 
		setprop("instrumentation/frw/btn-mode",1);
		VC10.frw_mode();

    }, 34);
		
 };
