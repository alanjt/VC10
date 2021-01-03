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
# wiper action
setlistener("controls/special/wiper-switch", func() {
  wiper_action();  
}, 0, 1);

var wiper_action = func(){

    var ws = getprop("controls/special/wiper-switch") or 0;
    var d = getprop("controls/special/wiper-deg") or 0;
    
 		if(ws){
 								
 		  if(ws == 4){
				if (d > 108){        
					interpolate("controls/special/wiper-deg", 0, 2);  
				}
				if (d < 2){        
					interpolate("controls/special/wiper-deg", 110,  2);  
				}
				
				settimer(wiper_action, 6);
			}
 		
 		  if(ws == 1){
				if (d > 108){        
					interpolate("controls/special/wiper-deg", 0, 2);  
				}
				if (d < 2){        
					interpolate("controls/special/wiper-deg", 110,  2);  
				}
				
				settimer(wiper_action, 2.5);
			}
			
 		  if(ws == 2){
				if (d > 108){        
					interpolate("controls/special/wiper-deg", 0, 1);  
				}
				if (d < 2){        
					interpolate("controls/special/wiper-deg", 110,  1);  
				}
				
				settimer(wiper_action, 1.1);
			}
					
 		  if(ws == 3){
				if (d > 108){        
					interpolate("controls/special/wiper-deg", 0, 0.6);  
				}
				if (d < 2){        
					interpolate("controls/special/wiper-deg", 110,  0.6);  
				}
				
				settimer(wiper_action, 0.7);
			}

			

		  
		}else{
			interpolate("controls/special/wiper-deg", 0,  1);
		}   


};
