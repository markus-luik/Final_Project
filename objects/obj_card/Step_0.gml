//movement
x = lerp(x,x_to_move,lerping);
y = lerp(y,y_to_move,lerping);



if(in_player_hand && face_up && !obj_MANAGER.p_played){
	
	//mouse click on object, VERY USEFUL
	if (position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left)){
		
		show_debug_message("Clicked on card");
		
		//reduces money
		obj_MANAGER_text__incl_score.money_to_be -= 280;
		
		//starts the comparison function
		obj_MANAGER.comparison(id);
		
	}
	else if position_meeting(mouse_x,mouse_y,id){
		y_to_move = obj_pos_hand.y - 20;
	}else{
	y_to_move = obj_pos_hand.y;
	}

}


depth = target_depth;

if(face_index == 0) sprite_index = spr_criminalRec_US;
if(face_index == 1) sprite_index = spr_A_criminalRec_CN;
if(face_index == 2) sprite_index = spr_Q_criminal;

if (face_up == false) sprite_index = spr_card;

draw_sprite(sprite_index, image_index, x, y);