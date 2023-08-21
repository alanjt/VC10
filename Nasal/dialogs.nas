print ("VC10 dialogs.nas");

##### VC10 Location In Air Dialog

# Overwrite the original menu
var location_settings = gui.Dialog.new("/sim/gui/dialogs/VC10-position/dialog","Aircraft/VC10/Dialogs/VC10-location-in-air.xml");
gui.menuBind("position-in-air", "dialogs.location_settings.open()");

##### Autopilot Dialog

var ap_settings = gui.Dialog.new("/sim/gui/dialogs/VC10-autopilot/dialog","Aircraft/VC10/Dialogs/VC10-autopilot-dlg.xml");
gui.menuBind("autopilot-settings", "dialogs.ap_settings.open()");

##### FGPlot Dialogs

var fgplot_settings = gui.Dialog.new("/sim/gui/dialogs/fgplot/dialog","Aircraft/VC10/Dialogs/fgplot.xml");
gui.menuBind("fgplot_settings", "dialogs.fgplot.open()");
var fgplot_help_settings = gui.Dialog.new("/sim/gui/dialogs/fgplot_help/dialog","Aircraft/VC10/Dialogs/fgplot_help.xml");
gui.menuBind("fgplot_help_settings", "dialogs.fgplot_help.open()");
var fgplot_opt_settings = gui.Dialog.new("/sim/gui/dialogs/fgplot_opt/dialog","Aircraft/VC10/Dialogs/fgplot_opt.xml");
gui.menuBind("fgplot_opt_settings", "dialogs.fgplot_opt.open()");
var fgplot_selector_settings = gui.Dialog.new("/sim/gui/dialogs/fgplot_selector/dialog","Aircraft/VC10/Dialogs/fgplot_selector.xml");
gui.menuBind("fgplot_selector_settings", "dialogs.fgplot_selector.open()");
#