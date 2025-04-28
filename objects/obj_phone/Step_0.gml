if position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(1) && obj_MANAGER.playing && obj_MANAGER.op_played && (ds_list_size(obj_MANAGER.player_hand) == 0){
	click_counter ++;
	new_pos();
	show_debug_message("Ring Ring "+ string(click_counter));
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