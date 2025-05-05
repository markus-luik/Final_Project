//LERP
x = lerp(x,x_to_move,lerping);
y = lerp(y,y_to_move,lerping);

//Mouse hover
if position_meeting(mouse_x,mouse_y,obj_pos_phone_zone) && obj_MANAGER.playing && obj_MANAGER.op_played && (ds_list_size(obj_MANAGER.player_hand) == 0){
	//click_counter ++;
	hovering_over = true; //hovering over phone
	x_to_move = x_pos;
	y_to_move = y_pos;
	show_debug_message("Ring Ring "+ string(click_counter));
}else{
	hovering_over = false;
	x_to_move = starting_x;
	y_to_move = starting_y;
}

switch click_counter{

	case 5:
		draw_card();
		click_counter++; // a cheap way of making sure that more than one card does not get drawn NOT VERY GOOD
	break;
	
	case 15:
		draw_card();
		click_counter++;
	break;
	
	case 30:
		draw_card();
		click_counter++;
	break;
	
	case 55:
		draw_card();
		sprite_index = spr_phone_w_cigar;
		image_xscale = 0.08;
		image_yscale = 0.08;
		click_counter++;
	break;
	
	case 79:
		draw_card();
		click_counter++;
	break;
}


if (hovering_over){
		locked = false;
		show_debug_message("UNLOCKED")
		
}
else {
		locked = true;
}

show_debug_message("Alpha "+string(alpha))
//DEV OVERRIDE
if keyboard_check_pressed(ord("P")){
	draw_card();
}