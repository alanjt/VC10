
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