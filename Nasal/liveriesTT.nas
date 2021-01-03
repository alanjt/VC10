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
aircraft.livery.init("Aircraft/VC10/Models/LiveriesTT");

# Not the best place but liveries are independent to the aircraft

var isEC = func {
    var mpOther = props.globals.getNode("ai/models").getChildren("multiplayer");
    var otherNr = size(mpOther);
		var am = getprop("tanker") or 0;

    # find EC-137D
    for(var v = 0; v < otherNr; v += 1) {

       if (mpOther[v].getNode("sim/model/path").getValue() == "Aircraft/VC10/Models/EC-137D.xml" and
           mpOther[v].getNode("id").getValue() >= 0 and mpOther[v].getNode("radar/range-nm").getValue() < 0.3 ) {

			if (mpOther[v].getNode("sim/multiplay/generic/int[12]").getValue() != nil){
				if(mpOther[v].getNode("sim/multiplay/generic/int[12]").getValue() == 1){
					setprop("VC10/refuelling/contact",1);
					break;
				}elsif(mpOther[v].getNode("sim/multiplay/generic/int[12]").getValue() == 2){
					setprop("VC10/refuelling/ready",1);
					break;
				}else{
					setprop("VC10/refuelling/contact",0);
					setprop("VC10/refuelling/ready",0);
				}
			}else{
				setprop("VC10/refuelling/contact",0);
				setprop("VC10/refuelling/ready",0);
			}
		}else{
			setprop("VC10/refuelling/contact",0);
			setprop("VC10/refuelling/ready",0);
		}
    }
	if(am) settimer( isEC, 0.4);
}

setlistener( "tanker", func{ 
	isEC();
});


