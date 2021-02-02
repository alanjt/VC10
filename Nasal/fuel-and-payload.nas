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
# Overwrite the original menu
gui.menuBind("fuel-and-payload", "VC10.WeightFuelDialog()");

var showDialog = func(name) {
    fgcommand("dialog-show", props.Node.new({ "dialog-name" : name }));
}

########################################################################
# Private Stuff:
########################################################################

var debug_traces = props.globals.initNode ("/VC10/fuel/debug", 0, "BOOL");
var trace = func (message) {
  if (debug_traces.getValue()) {
    print (message);
  }
}

var crossfeed_per_tank_pps = props.globals.initNode ("/VC10/fuel/crossfeed-flow-per-tank-pps", 5, "DOUBLE");
var automatic_management   = props.globals.initNode ("/VC10/fuel/automatic-management",        0, "BOOL");

var fdm = getprop("/sim/flight-model");
var c0 = props.globals.getNode("/fdm/jsbsim/inertia/pointmass-weight-lbs[0]"); # crew
var c1 = props.globals.getNode("/fdm/jsbsim/inertia/pointmass-weight-lbs[1]"); # first-class
var c2 = props.globals.getNode("/fdm/jsbsim/inertia/pointmass-weight-lbs[2]"); # tourist-class wing
var c3 = props.globals.getNode("/fdm/jsbsim/inertia/pointmass-weight-lbs[3]"); # tourist-class rear
var c4 = props.globals.getNode("/fdm/jsbsim/inertia/pointmass-weight-lbs[4]"); # lugage front
var c5 = props.globals.getNode("/fdm/jsbsim/inertia/pointmass-weight-lbs[5]"); # lugage centre
var c6 = props.globals.getNode("/fdm/jsbsim/inertia/pointmass-weight-lbs[6]"); # lugage rear

# the tank
var tfR1 = props.globals.getNode("/consumables/fuel/tank[0]/level-lbs");
var tfM1 = props.globals.getNode("/consumables/fuel/tank[1]/level-lbs");
var tfM2 = props.globals.getNode("/consumables/fuel/tank[2]/level-lbs");
var tfC  = props.globals.getNode("/consumables/fuel/tank[3]/level-lbs");
var tfM3 = props.globals.getNode("/consumables/fuel/tank[4]/level-lbs");
var tfM4 = props.globals.getNode("/consumables/fuel/tank[5]/level-lbs");
var tfR4 = props.globals.getNode("/consumables/fuel/tank[6]/level-lbs");

var bp0 = props.globals.initNode("/VC10/fuel/valves/boost-pump[0]",0,"BOOL");
var bp1 = props.globals.initNode("/VC10/fuel/valves/boost-pump[1]",0,"BOOL");
var bp2 = props.globals.initNode("/VC10/fuel/valves/boost-pump[2]",0,"BOOL");
var bp3 = props.globals.initNode("/VC10/fuel/valves/boost-pump[3]",0,"BOOL");
var bp4 = props.globals.initNode("/VC10/fuel/valves/boost-pump[4]",0,"BOOL");
var bp5 = props.globals.initNode("/VC10/fuel/valves/boost-pump[5]",0,"BOOL");
var bp6 = props.globals.initNode("/VC10/fuel/valves/boost-pump[6]",0,"BOOL");
var bp7 = props.globals.initNode("/VC10/fuel/valves/boost-pump[7]",0,"BOOL");
var bp8 = props.globals.initNode("/VC10/fuel/valves/boost-pump[8]",0,"BOOL");
var bp9 = props.globals.initNode("/VC10/fuel/valves/boost-pump[9]",0,"BOOL");

var fp0 = props.globals.initNode("/VC10/fuel/fuel-pressure[0]",0,"DOUBLE");
var fp1 = props.globals.initNode("/VC10/fuel/fuel-pressure[1]",0,"DOUBLE");
var fp2 = props.globals.initNode("/VC10/fuel/fuel-pressure[2]",0,"DOUBLE");
var fp3 = props.globals.initNode("/VC10/fuel/fuel-pressure[3]",0,"DOUBLE");
var fpsystem = props.globals.initNode("/VC10/fuel/fuel-pressure-system",0,"DOUBLE");

var so0 = props.globals.initNode("/VC10/fuel/valves/fuel-shutoff[0]",0,"BOOL");
var so1 = props.globals.initNode("/VC10/fuel/valves/fuel-shutoff[1]",0,"BOOL");
var so2 = props.globals.initNode("/VC10/fuel/valves/fuel-shutoff[2]",0,"BOOL");
var so3 = props.globals.initNode("/VC10/fuel/valves/fuel-shutoff[3]",0,"BOOL");

var sp0 = props.globals.initNode("/VC10/fuel/valves/fuel-shutoff-pos[0]",0,"BOOL");
var sp1 = props.globals.initNode("/VC10/fuel/valves/fuel-shutoff-pos[1]",0,"BOOL");
var sp2 = props.globals.initNode("/VC10/fuel/valves/fuel-shutoff-pos[2]",0,"BOOL");
var sp3 = props.globals.initNode("/VC10/fuel/valves/fuel-shutoff-pos[3]",0,"BOOL");

var v0 = props.globals.initNode("/VC10/fuel/valves/valve[0]",0,"BOOL");
var v1 = props.globals.initNode("/VC10/fuel/valves/valve[1]",0,"BOOL");
var v2 = props.globals.initNode("/VC10/fuel/valves/valve[2]",0,"BOOL");
var v3 = props.globals.initNode("/VC10/fuel/valves/valve[3]",0,"BOOL");
var v4 = props.globals.initNode("/VC10/fuel/valves/valve[4]",0,"BOOL");
var v5 = props.globals.initNode("/VC10/fuel/valves/valve[5]",0,"BOOL");

var vp0 = props.globals.initNode("/VC10/fuel/valves/valve-pos[0]",0,"BOOL");
var vp1 = props.globals.initNode("/VC10/fuel/valves/valve-pos[1]",0,"BOOL");
var vp2 = props.globals.initNode("/VC10/fuel/valves/valve-pos[2]",0,"BOOL");
var vp3 = props.globals.initNode("/VC10/fuel/valves/valve-pos[3]",0,"BOOL");
var vp4 = props.globals.initNode("/VC10/fuel/valves/valve-pos[4]",0,"BOOL");
var vp5 = props.globals.initNode("/VC10/fuel/valves/valve-pos[5]",0,"BOOL");

var dc0 = props.globals.initNode("/VC10/fuel/valves/dump-cover[0]",0,"DOUBLE");
var dc1 = props.globals.initNode("/VC10/fuel/valves/dump-cover[1]",0,"DOUBLE");
var drL = props.globals.initNode("/VC10/fuel/valves/dump-retract[0]",0,"DOUBLE");
var drR = props.globals.initNode("/VC10/fuel/valves/dump-retract[1]",0,"DOUBLE");
var dc1 = props.globals.initNode("/VC10/fuel/valves/dump-cover[1]",0,"DOUBLE");
var dv0 = props.globals.initNode("/VC10/fuel/valves/dump-valve[0]",0,"BOOL"); #left centre tank
var dv1 = props.globals.initNode("/VC10/fuel/valves/dump-valve[1]",0,"BOOL"); #right centre tank
var dv2 = props.globals.initNode("/VC10/fuel/valves/dump-valve[2]",0,"BOOL"); #main tank 1
var dv3 = props.globals.initNode("/VC10/fuel/valves/dump-valve[3]",0,"BOOL"); #main tank 2
var dv4 = props.globals.initNode("/VC10/fuel/valves/dump-valve[4]",0,"BOOL"); #main tank 3
var dv5 = props.globals.initNode("/VC10/fuel/valves/dump-valve[5]",0,"BOOL"); #main tank 4
var dvp0 = props.globals.initNode("/VC10/fuel/valves/dump-valve-pos[0]",1,"BOOL");
var dvp1 = props.globals.initNode("/VC10/fuel/valves/dump-valve-pos[1]",1,"BOOL");
var dvp2 = props.globals.initNode("/VC10/fuel/valves/dump-valve-pos[2]",1,"BOOL");
var dvp3 = props.globals.initNode("/VC10/fuel/valves/dump-valve-pos[3]",1,"BOOL");
var dvp4 = props.globals.initNode("/VC10/fuel/valves/dump-valve-pos[4]",1,"BOOL");
var dvp5 = props.globals.initNode("/VC10/fuel/valves/dump-valve-pos[5]",1,"BOOL");

var hydSup = props.globals.initNode("/VC10/hydraulic/hyd-supported-by-engine-index",0,"DOUBLE");

var flo = props.globals.initNode("/VC10/fuel/fuel-level-old-lbs",0,"DOUBLE"); # we need only for consumption calc
var fph = props.globals.initNode("/VC10/fuel/fuel-per-hour-lbs",0,"DOUBLE"); # we need only for consumption calc
var fct = props.globals.initNode("/VC10/fuel/fuel-calc-time",0,"DOUBLE"); # we need only for consumption calc

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
    return tankchange;
}
# Run it at startup and on reset to make sure the tank settings are correct
_setlistener("/sim/signals/fdm-initialized", func { settimer(setWeightOpts, 0) });
_setlistener("/sim/signals/reinit", func(n) { props._getValue(n, []) or setWeightOpts() });


# Called from the F&W dialog when the user selects a weight option
var weightChangeHandler = func {
    var tankchanged = setWeightOpts();

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
    # rewrite the name of payload if cargo livery/aircraft selected
    if(cargo){
      var title = "VICKERS VC10 - CARGO Weight and Fuel Settings";
    	setprop("/payload/weight[1]/name", "Cargo upper 1");
    	setprop("/payload/weight[2]/name", "Cargo upper 2");
    	setprop("/payload/weight[3]/name", "Cargo upper 3");
    	setprop("/payload/weight[4]/name", "Cargo belly 1");
    	setprop("/payload/weight[5]/name", "Cargo belly 2");
    	setprop("/payload/weight[6]/name", "Cargo belly 3");
    }else{
    	setprop("/payload/weight[1]/name", "First-class");
    	setprop("/payload/weight[2]/name", "Tourist-class / wing");
    	setprop("/payload/weight[3]/name", "Tourist-class / rear");
    	setprop("/payload/weight[4]/name", "Luggage 1 - front");
    	setprop("/payload/weight[5]/name", "Luggage 2 - centre");
    	setprop("/payload/weight[6]/name", "Luggage 3 - rear");    
    }
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

    var fdmdata = {
        grosswgt : "/fdm/jsbsim/inertia/weight-lbs",
        grosskg  : "/VC10/weight-kg",
        payload  : "/payload",
            cg_x_in       : "/fdm/jsbsim/inertia/cg-x-in",
			cg_x_pcent    : "/fdm/jsbsim/inertia/cg-x-percent",
	        cg_z_in       : "/fdm/jsbsim/inertia/cg-z-in"
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
    var grosskg = props.globals.getNode("/VC10/weight-kg");
    if(grossWgt != nil) {
        tablerow("Gross Weight", grossWgt, "%.0f lbs");
    }

    if(massLimits != nil ) {
		tablerow("Max. Ramp Weight", "maximum-ramp-mass-lbs", "%.0f lbs" );
		tablerow("Max. Takeoff", "maximum-takeoff-mass-lbs", "%.0f lbs" );
		tablerow("Max. Landing", "maximum-landing-mass-lbs", "%.0f lbs" );
		tablerow("Max. Arrested Landing  Weight", "maximum-arrested-landing-mass-lbs", "%.0f lbs" );
		tablerow("Max. Zero Fuel Weight", "maximum-zero-fuel-mass-lbs", "%.0f lb" );    
    }

    #if( fdmdata.cg != nil ) { 
    #    var n = props.globals.getNode("/limits/mass-and-balance/cg/dimension");
    #    tablerow("Centre of Gravity", props.globals.getNode(fdmdata.cg), "%.1f " ~ (n == nil ? "in" : n.getValue()));
    #}
	
   if( fdmdata.cg_x_in != nil ) { 
        var n = props.globals.getNode("/limits/mass-and-balance/cg/dimension");
        tablerow("Centre of Gravity", props.globals.getNode(fdmdata.cg_x_in), "%.1f " ~ (n == nil ? "in" : n.getValue()));
    }
	
    if( fdmdata.cg_x_pcent != nil ) {
	var cg_x_percent = props.globals.getNode(fdmdata.cg_x_pcent);
        tablerow("Centre of Gravity", cg_x_percent, "%.1f %%SMC");
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
    var lbs = tcell(fuelTable, "text", 0, 3);
    lbs.set("label", "lbs");
    lbs.set("halign", "left");
    
    var kg = tcell(fuelTable, "text", 0, 4);
    kg.set("label", "kg");
    kg.set("halign", "left");
    
    var tnames = ["  1A", "   1", "   2", "Centre", "   3", "   4", "  4A"];

    var tanks = props.globals.getNode("/consumables/fuel").getChildren("tank");
    for(var ti=0; ti<7; ti+=1) {
        var t = tanks[ti];
        var tname = tnames[ti] ~ "";

		trace("Tanks in for:"~ti);
		trace("Tank name: "~tnames[ti]);
		
        var tnode = t.getNode("name");
        if(tnode != nil) { tname = tnode.getValue(); }

        var tankprop = "/consumables/fuel/tank["~ti~"]";

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
    
    # set all tanks to the same fraction
    var calcFuel = tcell(fuelTable, "button", size(tanks)+2, 2);  
    calcFuel.set("pref-width", 70);
    calcFuel.set("pref-height", 20);
    calcFuel.set("legend", "Levelling");
    calcFuel.setBinding("nasal", "VC10.calc_fuel()");

    var lbs = tcell(fuelTable, "text", size(tanks)+2, 3);
    lbs.set("property", "/consumables/fuel/total-fuel-lbs");
    lbs.set("label", "0123456");
    lbs.set("format", "%.1f" );
    lbs.set("halign", "right");
    lbs.set("live", 1);

    var kg = tcell(fuelTable, "text",size(tanks) +2, 4);
    kg.set("property", "/consumables/fuel/total-fuel-kg");
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
    var lbs = tcell(weightTable, "text", 0, 2);
    lbs.set("label", "lbs");
    lbs.set("halign", "left");

    var kg = tcell(weightTable, "text", 0, 3);
    kg.set("label", "kg");
    kg.set("halign", "left");
    
    if(!cargo){
		  var pers = tcell(weightTable, "text", 0, 4);
		  pers.set("label", "Pers.");
		  pers.set("halign", "left");
		}
		
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
        title.set("halign", "left");

        if(w.getNode("opt") != nil) {
            var combo = tcell(weightTable, "combo", i+1, 1);
            combo.set("property", wprop ~ "/selected");

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
            combo.setBinding("nasal", "VC10.weightChangeHandler()");
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
        lbs.set("halign", "right");
        lbs.set("live", 1);
        
        var kg = tcell(weightTable, "text", i+1, 3);
        kg.set("property", "/VC10/passengers/weight-kg["~i~"]");
        kg.set("label", "0123456");
        kg.set("format", "%.0f");
        kg.set("halign", "right");
        kg.set("live", 1);
        
        if( i < 4 and !cargo){
		      var pas = tcell(weightTable, "text", i+1, 4);
		      pas.set("property", "/VC10/passengers/count["~i~"]");
		      pas.set("label", "0123456");
		      pas.set("format", "%.0f");
		      pas.set("halign", "right");
		      pas.set("live", 1);
		    }    
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

    # set 120 passengers or standard cargo
    var standLoad = tcell(weightTable, "button", size(wgts)+2, 1);  
    standLoad.set("pref-width", 70);
    standLoad.set("pref-height", 20);
    standLoad.set("legend", "Standard");
    standLoad.setBinding("nasal", "VC10.standard_load()");
    
    var lbs = tcell(weightTable, "text",size(wgts) +2, 2);
    lbs.set("property", "/VC10/passengers/load-weight");
    lbs.set("label", "0123456");
    lbs.set("format", "%.0f" );
    lbs.set("halign", "right");
    lbs.set("live", 1);

    var kg = tcell(weightTable, "text",size(wgts) +2, 3);
    kg.set("property", "/VC10/passengers/load-weight-kg");
    kg.set("label", "0123456");
    kg.set("format", "%.0f" );
    kg.set("halign", "right");
    kg.set("live", 1);

		if(!cargo){
		  var ps = tcell(weightTable, "text",size(wgts) +2, 4);
		  ps.set("property", "/VC10/passengers/count-all");
		  ps.set("label", "0123456");
		  ps.set("format", "%.0f" );
		  ps.set("halign", "right");
		  ps.set("live", 1);
		}
    # All done: pop it up
    fgcommand("dialog-new", dialog[name].prop());
    showDialog(name);
}

########################################### Helper #################################
var count_all = func{
 var pass_weight = c0.getValue() + c1.getValue() + c2.getValue() + c3.getValue();
 var lug_weight = c4.getValue() + c5.getValue() + c6.getValue();
 var load = pass_weight + lug_weight;
 var pass = (pass_weight > 0) ? pass_weight/180 : 0;
 setprop("/VC10/passengers/count-all", pass);
 setprop("/VC10/passengers/load-weight", load);
 setprop("/VC10/passengers/load-weight-kg", load*0.45359237);
}

#Linie 328
var calc_fuel = func{
	# how many fuel is inside the tanks
  var cfuel  = 0;
  var cfuel += tfR1.getValue() or 0;
  var cfuel += tfM1.getValue() or 0;
  var cfuel += tfM2.getValue() or 0;
  var cfuel += tfC.getValue()  or 0;
  var cfuel += tfM3.getValue() or 0;
  var cfuel += tfM4.getValue() or 0;
  var cfuel += tfR4.getValue() or 0;
  
 	# refill the tanks as her percent level
 	tfR1.setValue(cfuel * 0.0184);
 	tfM1.setValue(cfuel * 0.0974); 
 	tfM2.setValue(cfuel * 0.1705); 
 	tfC.setValue(cfuel  * 0.4274); 
 	tfM3.setValue(cfuel * 0.1705); 
 	tfM4.setValue(cfuel * 0.0974); 
 	tfR4.setValue(cfuel * 0.0184);  
}

var standard_load = func{
	var st = getprop("/VC10/standard-load") or 0;
  if(!st){
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[0]", 1068.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[1]", 3429.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[2]", 6713.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[3]", 11529.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[4]", 2805.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[5]", 6104.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[6]", 7532.0);
		setprop("/VC10/standard-load", 1);
		settimer(calc_fuel, 0.2);
	}else{
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[0]", 540.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[1]", 0.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[2]", 0.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[3]", 0.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[4]", 0.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[5]", 0.0);
		setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[6]", 0.0);
		setprop("/VC10/standard-load", 0);	
	}
}

# the passengers quantity
setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[0]", func(wlbs){
	var pers = wlbs.getValue() or 0;
	setprop("/VC10/passengers/weight-kg[0]", pers*0.45359237);
  pers = (pers > 0) ? pers/180 : 0;  # 180lbs per crew member
  setprop("/VC10/passengers/count[0]", pers);  
  count_all();
},1,0);
setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[1]", func(wlbs){
	var pers = wlbs.getValue() or 0;
	setprop("/VC10/passengers/weight-kg[1]", pers*0.45359237);
  pers = (pers > 0) ? pers/180 : 0;  # 180lbs per passanger
  setprop("/VC10/passengers/count[1]", pers);
  count_all();
},1,0);
setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[2]", func(wlbs){
	var pers = wlbs.getValue() or 0;
	setprop("/VC10/passengers/weight-kg[2]", pers*0.45359237);
  pers = (pers > 0) ? pers/180 : 0;  # 180lbs per passanger
  setprop("/VC10/passengers/count[2]", pers);
  count_all();
},1,0);
setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[3]", func(wlbs){
	var pers = wlbs.getValue() or 0;
	setprop("/VC10/passengers/weight-kg[3]", pers*0.45359237);
  pers = (pers > 0) ? pers/180 : 0;  # 180lbs per passanger
  setprop("/VC10/passengers/count[3]", pers);
  count_all();
},1,0);
setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[4]", func(wlbs){
	var lag = wlbs.getValue() or 0;
	setprop("/VC10/passengers/weight-kg[4]", lag*0.45359237);
  count_all();
},1,0);
setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[5]", func(wlbs){
	var lag = wlbs.getValue() or 0;
	setprop("/VC10/passengers/weight-kg[5]", lag*0.45359237);
  count_all();
},1,0);
setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[6]", func(wlbs){
	var lag = wlbs.getValue() or 0;
	setprop("/VC10/passengers/weight-kg[6]", lag*0.45359237);
  count_all();
},1,0);

setlistener("/fdm/jsbsim/inertia/weight-lbs", func(wlbs){
	var wlbs = wlbs.getValue();
  wlbs = (wlbs > 0) ? wlbs*0.45359237 : 0;  # 0.45359237
  setprop("/VC10/weight-kg", wlbs);
},1,0);


########################################### LOOP ENGINES ######################################################
###############################################################################################################
# engines feed only on the main tank. Engine 1 to main 1 etc.

##                  1a, 1, 2, Centre, 3, 4, 4a  VC10 Tank numbers ########
engine_for_tank = [ -1, 0, 1,   -1  , 2, 3, -1 ]; # -1 means no engine connected to that tank 
boost_pumps_for_tank = [ [-1,-1], [0,1], [2,3], [4,5], [6,7], [8,9], [-1,-1] ];

var boost_pumps_for_tank_are_on = func (tank)
{
  if (boost_pumps_for_tank[tank][0] == -1 or boost_pumps_for_tank[tank][1] == -1) {
    return 0;
  }
  return getprop ("/VC10/fuel/valves/boost-pump[" ~ boost_pumps_for_tank[tank][0] ~ "]")
      or getprop ("/VC10/fuel/valves/boost-pump[" ~ boost_pumps_for_tank[tank][1] ~ "]");
}

var boost_pumps_for_engine = func (engine) {
  var tank = -1;
  forindex (index; engine_for_tank) {
    if (engine_for_tank[index] == engine) {
      tank = index;
      break;
    }
  }
  if (tank == -1) {
    print ("bug: no main tank for engine " ~ engine);
    return [];
  }
  return [
    getprop ("/VC10/fuel/valves/boost-pump[" ~ boost_pumps_for_tank[tank][0] ~ "]"),
    getprop ("/VC10/fuel/valves/boost-pump[" ~ boost_pumps_for_tank[tank][1] ~ "]")
  ];
}

var engines_alive = maketimer (8.0, func {

  # control the engine dependens
  foreach(var e; props.globals.getNode("/engines").getChildren("engine")) {
		  var n2_node = e.getNode("n2");
		  if (n2_node == nil) {
			continue;
			# some buggy aircraft create additional /engines/engine[x] properties over multiplayer;
			# they lack n2: skip them
		  }
		  var n2 = n2_node.getValue() or 0;
		  var oil = getprop("/VC10/oil/quantity["~e.getIndex()~"]") or 0;
		  var s = getprop("/VC10/fuel/valves/fuel-shutoff["~e.getIndex()~"]") or 0;
		  var c = props.globals.getNode("/controls/engines/engine["~e.getIndex()~"]/cutoff");
		  var f = props.globals.initNode("/controls/engines/engine["~e.getIndex()~"]/fire",0,"BOOL");
		  var w = props.globals.getNode("/VC10/warning/enabled");
		  var b = boost_pumps_for_engine (e.getIndex());
		  var cfv = getprop ("/VC10/fuel/valves/valve-pos[" ~ (e.getIndex()+1) ~ "]");
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
		     		setprop("/VC10/air-conditioning/compressor-start[" ~ (e.getIndex()-1) ~ "]", 0);
				interpolate("/VC10/air-conditioning/compressor-rpm[" ~ (e.getIndex()-1) ~ "]", 0, 5);
		     }
		  }		  

		  # fuel pressure calculation
		  if (cfv) fp = fpsystem.getValue()*39;
		  if (b[0] and !b[1]) fp = 80;
		  if (!b[0] and b[1]) fp = 75;
		  if (b[0] and b[1]) fp = 100;
		  if (!s) fp = 0;
		  
		  newfp = (fp*1000-n2*200+600)/1000;
		  
	  	  interpolate("/VC10/fuel/fuel-pressure["~e.getIndex()~"]", newfp, 4);	  
		  
		  ## BOOST-PUMPS ## are both closed and the crossfeed valve is closed too
		  if(n2 >= 50 and fp == 0) {
		      trace("Engine "~e.getIndex()~" without fuel - boost-pumps out!");
			  print (" fuel and payload boost pumps out set cutoff true ");
		      c.setBoolValue(1);
		  } 
		   		  
		  ## HYDRAULIC ## fake system pressure. Look inside the mk-VC10.nas for more
		  # at engine 2 and 3 was the pumps for the residual hydraulic system
		  if(e.getIndex() == 1 or e.getIndex() == 2){

		 		var r2  =  getprop("/engines/engine[1]/running") or 0;
		 		var r3  =  getprop("/engines/engine[2]/running") or 0;
		 		var psi =getprop("/VC10/hydraulic/system") or 0;
		 		
		 		var s1 = getprop("/VC10/hydraulic/hyd-fluid-shutoff[0]") or 0;
				var s2 = getprop("/VC10/hydraulic/hyd-fluid-shutoff[1]") or 0;
				var p1 = getprop("/VC10/hydraulic/hyd-fluid-pump[0]") or 0;
				var p2 = getprop("/VC10/hydraulic/hyd-fluid-pump[1]") or 0;
		  
		  	# first running engine 2 or 3 supports the hydraulic system pressure
		  	if (r2 or r3){
		  		if(!hydSup.getValue()){
		  		  if(psi > 2000 and psi <= 2500){
		  		  	interpolate("/VC10/hydraulic/system", 3018, 5);
							hydSup.setValue(e.getIndex());
		  		  } 	  	
		  		}
		  	}else{
		  		hydSup.setValue(0);
		  		# if hydraulic system is already started increase the pressure back to min
		  		if(((s1 and p1) or (s2 and p2)) and psi > 3010){
						interpolate("/VC10/hydraulic/system", 2210, 3);
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
				var oilNeu = (oil > 2600 ) ? oil - 950 : 2600;
				interpolate("/VC10/oil/quantity["~e.getIndex()~"]", oilNeu, 8);
			}else{
				var oilNeu = (oil > 2800 ) ? oil - 900 : 2800;
				interpolate("/VC10/oil/quantity["~e.getIndex()~"]", oilNeu, 8);
			}
		}else{
			var oilNeu = (oil < 6400 ) ? oil + 100 : 6400;
			interpolate("/VC10/oil/quantity["~e.getIndex()~"]", oilNeu, 8);
		}
	}
	
	# fuel consumption calculation 8 sec for on loop
	var new = getprop("/consumables/fuel/total-fuel-lbs") or 0;
	var tc = getprop("/sim/time/elapsed-sec") or 0;
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

setlistener("/VC10/oil/oil-test", func(pos){
	var pos = pos.getValue();
	var pwr = getprop("/VC10/ess-bus") or 0;
	if(pos and pwr > 24) {
		interpolate("/VC10/oil/quantity[0]", 0, 1);
		interpolate("/VC10/oil/quantity[1]", 0, 1);
		interpolate("/VC10/oil/quantity[2]", 0, 1);
		interpolate("/VC10/oil/quantity[3]", 0, 1);
	}else{
		interpolate("/VC10/oil/quantity[0]", 6400, 1);
		interpolate("/VC10/oil/quantity[1]", 6400, 1);
		interpolate("/VC10/oil/quantity[2]", 6400, 1);
		interpolate("/VC10/oil/quantity[3]", 6400, 1);	
	}
},1,0);

#################################### CROSSFEED ANIMATION ############################################

var crossfeed_control_valves = func (tanknr) {
	var fq = getprop("/consumables/fuel/tank["~tanknr~"]/level-lbs") or 0;
	var fln = getprop("/consumables/fuel/tank["~tanknr~"]/level-norm") or 0;

	# boost pumps decide to take or get fuel
        if (boost_pumps_for_tank_are_on (tanknr)) {
		if(fq > 50){
			trace("Tank Nr."~tanknr~" kann "~fq~"lbs geben.");
			return 2;
		}else{
			trace("Tank Nr."~tanknr~" ist leer. WARNUNG: Das Risiko der Ueberhitzung der Pumpen besteht!");
			return 0;				
		}
	}else{	
		# is there space for fuel
		if(fln < 1){
		
			trace("Tank Nr."~tanknr~" kann aufnehmen.");
			return 1;
			
		}else{
			trace("Tank Nr."~tanknr~" ist voll!");
			return 0;				
		}		
	}	
}

var crossfeed_action_period = 4.0;

var available_receive_capacity_lbs = func (tank)
{
  var avail_now = getprop ("/consumables/fuel/tank[" ~ tank ~ "]/capacity-gal_us")
                * getprop ("/consumables/fuel/tank[" ~ tank ~ "]/density-ppg")
                - getprop ("/consumables/fuel/tank[" ~ tank ~ "]/level-lbs");
  if (boost_pumps_for_tank_are_on (tank)) {
    # If this tank has boost pumps and if either boost pump is on, this tank has no capacity to receive fuel via cross-feed.
    return 0;
  }
  if (engine_for_tank[tank] == -1) { return avail_now; }
  else {
     # The other thanks being connected to an engine, consider the present consumption for 4 s
     return avail_now + getprop("/engines/engine[" ~ engine_for_tank[tank] ~ "]/fuel-flow_pph")/3600*crossfeed_action_period;
  }
}

