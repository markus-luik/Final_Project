if (!obj_Chase.APP_ON && !obj_WeChat.APP_ON){ //if no apps are running, render and allow behavior
	draw_self();

	////SHADING FUNCTION
	if mouse_check_button_pressed(1) && position_meeting(mouse_x,mouse_y,id) //if mouse clicks ON the icon
	{
		image_index = 1; //shaded
	
	}else if mouse_check_button_released(1) && position_meeting(mouse_x,mouse_y,id) //if mouse releases ON the icon
	{
		image_index = 0; //unshaded
		APP_ON = true; //triggers opening
	
	}else if !position_meeting(mouse_x,mouse_y,id){ //mouse not touching icon (clicked but didn't release)
		image_index = 0; //unshaded
	}
}

if APP_ON{
	if (loading > loading_MAX) { loaded = true; }else{ loading++; }//loading trick
	
	if (loaded)
	{
		draw_sprite_ext(open_bg,1,bg_x,bg_y,scale,scale,0,c_white,1); //main screen
	}else
	{
		draw_sprite_ext(open_bg,0,bg_x,bg_y,scale,scale,0,c_white,1); //loading screen
	}
}