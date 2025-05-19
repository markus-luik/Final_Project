draw_set_font(fnt_title);

//PLAY
if position_meeting(mouse_x,mouse_y,obj_title_UI_pos_START){ //hovered over
	s_c = c_white; 
	//s_z_to_be = 1.5; 
	//x_pos_play_to_be = (room_width/2)-(string_width(t_play)/1.5); //X
}else{ //regular scale + color
	s_c = c_black;
	s_z_to_be = 1; 
	x_pos_play_to_be = (room_width/2)-(string_width(t_play)/2); //X
}
s_z = lerp(s_z,s_z_to_be,0.175) //lerp scale
x_pos_play = lerp(x_pos_play,x_pos_play_to_be,0.175) //lerp x
draw_text_transformed_colour(x_pos_play,y_pos_play,t_play,s_z,s_z,0,s_c,s_c,s_c,s_c,1);

//QUIT
if position_meeting(mouse_x,mouse_y,obj_title_UI_pos_QUIT){ //hovered over
	q_c = c_white; 
	//q_z_to_be = 1; 
	//x_pos_quit_to_be = (room_width/2)-(string_width(t_quit)/2.5); //X
}else{ //regular scale + color
	q_c = c_black;
	q_z_to_be = 0.75; 
	x_pos_quit_to_be = (room_width/2)-(string_width(t_quit)/2); //X
}
q_z = lerp(q_z,q_z_to_be,0.175) //lerp scale
x_pos_quit = lerp(x_pos_quit,x_pos_quit_to_be,0.175) //lerp x
draw_text_transformed_colour(x_pos_quit,y_pos_quit,t_quit,q_z,q_z,0,q_c,q_c,q_c,q_c,1);