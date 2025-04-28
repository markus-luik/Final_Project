if mouse_check_button_pressed(1){
	click_counter ++;
}

switch click_counter{
	
	case 1:
		sprite_index = spr_apply_for_visa;
	break;
	
	case 2:
		room_goto(rm_play)
	break;
	
}