if (keyboard_check_pressed(ord("I"))){//Switch to turn Inspection on/off
	if (!inspection_on){
		inspection_on = true;
		show_debug_message("Inspection debug  ON")
	}else {
		inspection_on = false;
		show_debug_message("Inspection debug  OFF")
	}
}

//visual spacing for console
show_debug_message(" ");
show_debug_message(" ");
show_debug_message(" ");

if (inspection_on){
	var mX = mouse_x;
	var mY = mouse_y;
	var objID = instance_position(mX,mY,obj_card); //gets ID
	
		if (objID != noone){ //returns card info
			show_debug_message("CARD UNDER INSPECTION: "+string(objID));
			show_debug_message("Depth "+string(objID.depth));
			show_debug_message("X "+string(objID.x));
			show_debug_message("Y "+string(objID.y));
			show_debug_message("In player hand: "+ string(objID.in_player_hand))
		}
}
