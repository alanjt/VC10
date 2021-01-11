print ("VC10 dialogs.nas");

##### VC10 Location In Air Dialogue

# Overwrite the original menu
var location_settings = gui.Dialog.new("/sim/gui/dialogs/VC10-position/dialog","Aircraft/VC10/Dialogs/VC10-location-in-air.xml");
gui.menuBind("position-in-air", "dialogs.location_settings.open()");


#