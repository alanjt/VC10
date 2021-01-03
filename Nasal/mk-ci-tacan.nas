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
# ==========================
# Course Inidcator for TACAN
# ==========================
var mod = func(n, m) {
    var x = n - m * int(n/m);      # int() truncates to zero, not -Inf
    return x < 0 ? x + abs(m) : x; # ...so must handle negative n's
}

var indiBearingDeg = func(a,b){
  var diff = b-a;
  var newAngle = 0.0;
  if(diff > 180)
  {
      newAngle = mod((diff + 180),360) - 180;
  }
  elsif(diff < -180)
  {
      newAngle = mod((diff - 180),360) + 180;
  }
  else
  {
      newAngle = mod(diff, 360);
  }

  return (360 - newAngle);
};


setlistener("instrumentation/tacan/indicated-bearing-true-deg", func(tacanDegree) {
      var tacanDegree = tacanDegree.getValue() or 0;
      var aircraftDirDeg = getprop("orientation/heading-deg");
      var inRange = getprop("instrumentation/tacan/in-range") or 0;

      var indiDeg = indiBearingDeg(aircraftDirDeg,tacanDegree);

      if (inRange){
        setprop("instrumentation/tacan/display/correction", indiDeg);
      }else{
        setprop("instrumentation/tacan/display/correction", 0);
      }
});


