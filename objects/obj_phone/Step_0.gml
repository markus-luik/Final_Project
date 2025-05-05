//LERP
x = lerp(x,x_to_move,lerping);
y = lerp(y,y_to_move,lerping);
scale = lerp(scale,to_scale,lerping); //changes sprite size (via variable)
		image_xscale = scale; //changes obj size!
		image_yscale = scale;

//Mouse hover
if position_meeting(mouse_x,mouse_y,obj_pos_phone_zone) && !BIG && obj_MANAGER.playing && obj_MANAGER.op_played{
	//click_counter ++;
	hovering_over = true; //hovering over phone
	x_to_move = x_pos;
	y_to_move = y_pos;
	
	//pressing ON the phone -- bringing it up
	if mouse_check_button_pressed(1){
		BIG = true;
		show_debug_message("Ring Ring Phone should have enlarged");
	}
}else if !BIG{
	hovering_over = false;
	x_to_move = starting_x;
	y_to_move = starting_y;
}

//Pressing OUTSIDE of phone -- sending it back
if !position_meeting(mouse_x,mouse_y,obj_phone){
	if mouse_check_button_pressed(1){
		////RESETS variables
		BIG = false;
		active = false;
		////position
		x_to_move = starting_x;
		y_to_move = starting_y;
		////scale
		to_scale = starting_scale;
		show_debug_message("Ring Ring Phone should have scaled back down");
	}
}

if BIG{
	to_scale = 4;
	x_to_move = x_pos_BIG;
	y_to_move = y_pos_BIG;
}


//switch click_counter{

//	case 5:
//		draw_card();
//		click_counter++; // a cheap way of making sure that more than one card does not get drawn NOT VERY GOOD
//	break;
	
//	case 15:
//		draw_card();
//		click_counter++;
//	break;
	
//	case 30:
//		draw_card();
//		click_counter++;
//	break;
	
//	case 55:
//		draw_card();
//		sprite_index = spr_phone_w_cigar;
//		image_xscale = 0.08;
//		image_yscale = 0.08;
//		click_counter++;
//	break;
	
//	case 79:
//		draw_card();
//		click_counter++;
//	break;
//}


if (hovering_over){
		locked = false;
		show_debug_message("UNLOCKED")
		
}
else {
		locked = true;
}

//DEV OVERRIDE
if keyboard_check_pressed(ord("O")){
	draw_card();
}


debugger();