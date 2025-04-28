//click on PLAY
if position_meeting(mouse_x,mouse_y,obj_title_UI_pos_START) && mouse_check_button_pressed(1){
	room_goto(rm_opening_cinematic);
}

//click on QUIT
if position_meeting(mouse_x,mouse_y,obj_title_UI_pos_QUIT) && mouse_check_button_pressed(1){
	game_end();
}