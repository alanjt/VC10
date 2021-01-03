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
Doors = {};

Doors.new = func {
   obj = { parents : [Doors],
           pilotwin : aircraft.door.new("instrumentation/doors/pilotwin", 2.0, 0),
		   		 copilotwin : aircraft.door.new("instrumentation/doors/copilotwin", 2.0, 0),
		   		 pasfront : aircraft.door.new("instrumentation/doors/pasfront", 4.0, 0),
		   		 pasrear : aircraft.door.new("instrumentation/doors/pasrear", 4.0, 0),
		   		 cargo : aircraft.door.new("instrumentation/doors/cargo", 12.0, 0),
		   		 belly : aircraft.door.new("instrumentation/doors/belly", 4.0, 0),
		   		 nose : aircraft.door.new("instrumentation/doors/nose", 2.0, 0),
		   		 refuel : aircraft.door.new("instrumentation/doors/refuel-boom", 14.0, 0),
         };
   return obj;
};

Doors.pilotwinexport = func {
   me.pilotwin.toggle();	
   
   # if sombody open the cockpit windows in flight
   var speed = getprop("velocities/groundspeed-kt") or 0;
	 if(speed > 200){	 	 
	 	 setprop("VC10/pressurization/safety-valve", 0);
	 	 VC10.safety_valv_pos();
	 }
}

Doors.copilotwinexport = func {
   me.copilotwin.toggle();   
   # if sombody open the cockpit windows in flight
   var speed = getprop("velocities/groundspeed-kt") or 0;
	 if(speed > 200){
	 	 setprop("VC10/pressurization/safety-valve", 0);
	 	 VC10.safety_valv_pos();
	 }
}

Doors.pasfrontexport = func {
	var alt = getprop("position/altitude-agl-ft") or 0;
	if(alt < 7.0){
   	me.pasfront.toggle();
   	setprop("VC10/ground-service/enabled", 1);
  }else{
  	setprop("instrumentation/doors/pasfront/position-norm", 0);
  }
}

Doors.pasrearexport = func {
	var alt = getprop("position/altitude-agl-ft") or 0;
	if(alt < 7.0){
   	me.pasrear.toggle();
   	setprop("VC10/ground-service/enabled", 1);
  }else{
  	setprop("instrumentation/doors/pasrear/position-norm", 0);
  }
}

Doors.cargoexport = func {
	var alt = getprop("position/altitude-agl-ft") or 0;
	var cargoliner = getprop("sim/multiplay/generic/int[9]") or 0;
	if(alt < 7.0 and cargoliner){
   	me.cargo.toggle();
   	setprop("VC10/ground-service/enabled", 1);
  }else{
  	setprop("instrumentation/doors/cargo/position-norm", 0);
  }
}

Doors.noseexport = func {
	var alt = getprop("position/altitude-agl-ft") or 0;
	var inside = getprop("sim/current-view/internal") or 0;
	if(alt < 7.0 and !inside){
   	me.nose.toggle();
   	setprop("VC10/ground-service/enabled", 1);
  }else{
  	setprop("instrumentation/doors/nose/position-norm", 0);
  }
}

Doors.bellyexport = func {
	var alt = getprop("position/altitude-agl-ft") or 0;
	if(alt < 7.0){
   	me.belly.toggle();
   	setprop("VC10/ground-service/enabled", 1);
  }else{
  	setprop("instrumentation/doors/belly/position-norm", 0);
  }
}

Doors.refuelexport = func {
  me.refuel.toggle();
	var rh = getprop("instrumentation/doors/refuel-boom/position-norm") or 0;
	if(rh){
		setprop("VC10/refuelling/boom-telescope-lever",0);
   	interpolate("VC10/refuelling/boom-telescope-lever", -17.0, 0.5);
  }else{
		setprop("VC10/refuelling/boom-telescope-lever",0);
   	interpolate("VC10/refuelling/boom-telescope-lever",  17.0, 0.5);
  }
  
  var the_boom_state = setlistener("instrumentation/doors/refuel-boom/position-norm", func(bstate)
	{
	if (bstate.getValue() < 0.02 or bstate.getValue() > 0.98)
	 {
		setprop("VC10/refuelling/boom-telescope-lever",0);
	 }
	}, 0, 0);

}


# ==============
# Initialization
# ==============

# objects must be here, otherwise local to init()
doorsystem = Doors.new();
