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
var agl_radar_control = func {
  #var state = props.globals.getNode("instrumentation/aglradar/power-btn");
  #if(state.getBoolValue()){
    #print("AGL Radar running ... ok");
    var agl = getprop("position/altitude-agl-ft") or 0;
    var aglft = agl - 6.02;  # is the position from the Vickers VC10 above ground
    var aglm = aglft * 0.3048;
    setprop("position/gear-agl-ft", aglft);
    setprop("position/gear-agl-m", aglm);
    
    #only for the MDA AGL instrument in the VC10
    var mda = getprop("instrumentation/aglradar/alt-offset-ft") or 0;
    if(mda > aglft){
    	setprop("instrumentation/aglradar/mda-lamp", 1);
    }else{
    	setprop("instrumentation/aglradar/mda-lamp", 0);    
    }
    interpolate("instrumentation/aglradar/alt-ft", aglft, 0.5);

    settimer(agl_radar_control, 0.5);
  #}
}

agl_radar_control();
