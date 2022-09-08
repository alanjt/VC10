#################################################################################
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
#																				#
#################################################################################
# RunwayData.nas  - Provide runway data that is needed to calculate V1 (takeoff decision speed).

var Runwayinfo = airportinfo();
print(info.name);
print(info.id);
print(info.lat);
print(info.lon);
print(info.has_metar);
print(info.elevation);
foreach(var rwy; keys(info.runways)){
    print("-- ", rwy, " --");
    print(info.runways[rwy].lat);
    print(info.runways[rwy].lon);
    print(info.runways[rwy].length);
    print(info.runways[rwy].width);
    print(info.runways[rwy].heading);
    print(info.runways[rwy].stopway);
    print(info.runways[rwy].threshold);
}