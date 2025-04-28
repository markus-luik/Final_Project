//movement
x = lerp(x,x_to_move,lerping_move);
y = lerp(y,y_to_move,lerping_move);
//scale

image_xscale = lerp(image_xscale,to_scale_x,lerping_scale);
image_yscale = lerp(image_yscale,to_scale_y,lerping_scale);
//depth
depth = lerp(depth,to_depth,lerping_depth);


if(in_player_hand && face_up && !obj_MANAGER.p_played){
	
	//DRAG & DROP
	//Start
	if (position_meeting(mouse_x,mouse_y,id) && mouse_check_button(mb_left) && !global.mouse_busy){
		//occupies mouse and global moving id
		global.mouse_busy = true;
		global.card_in_move = id;
	}
	//var
	var move_id = global.card_in_move;
	//Movement
	if (global.mouse_busy){ //Moves the card to the cursor position
		move_id.to_scale_x = DRAG_scale;
		move_id.to_scale_y = DRAG_scale;
		move_id.to_depth = DRAG_depth;
		if (!(mouse_x < 0) && !(mouse_x > room_width)){ //limits mouse movement to room boundaries
		move_id.x_to_move = mouse_x;}
		if (!(mouse_y < 0) && !(mouse_y > room_height)){
		move_id.y_to_move = mouse_y;
		}
	}
	//Reset
	if (mouse_check_button_released(mb_left)){ //if player lets go of mouse
		show_debug_message("Ï also RAN");
		//resets scale, depth and mouse
		to_scale_x = REG_scale;
		to_scale_y = REG_scale;
		//card stacks on last card
		if (move_id != 0){ //safety if there was no card
			show_debug_message("Move id is: " + string(move_id))
			if (global.last_card_depth != 0){move_id.target_depth = global.last_card_depth - 1;} //check that the global variable has been initialized, uses last card depth - 1 
			to_depth = target_depth;
			global.last_card_depth = move_id.target_depth;
			global.mouse_busy = false; //releases mouse of its occcupation
		}
	}

}else {//deck cards remain unscaled
	to_scale_x = REG_scale;
	to_scale_y = REG_scale;
	to_depth = target_depth;
}

//CARD SELECTION -- playing into the arena
if in_player_hand && place_meeting(x,y,obj_pos_hand_oponent_played) && image_xscale == REG_scale{
	obj_MANAGER.comparison(id);
	obj_MANAGER_text__incl_score.money_to_be -= 280;
}






if(face_index == 0) sprite_index = spr_criminalRec_US;
if(face_index == 1) sprite_index = spr_Q_criminal
if(face_index == 2) sprite_index = spr_A_student_OGS;
if(face_index == 3) sprite_index = spr_Q_student;
if(face_index == 4) sprite_index = spr_A_finances;
if(face_index == 5) sprite_index = spr_Q_poor;
if(face_index == 6) sprite_index = spr_Q_nationality;
if(face_index == 7) sprite_index = spr_A_nation_china;

if (face_up == false) sprite_index = spr_card;

draw_sprite(sprite_index, image_index, x, y);