draw_self();

if position_meeting(mouse_x,mouse_y,id){
	if mouse_check_button_pressed(1)
	{
		image_index = 1;
	}else if mouse_check_button_released(1)
	{
		image_index = 0;
		APP_ON = true;
	}
}

if APP_ON{
	if (loading > loading_MAX) { loaded = true; }else{ loading++; }//loading trick
	
	if (loaded)
	{
		draw_sprite_ext(spr_WeChatOpen,1,bg_x,bg_y,scale,scale,0,c_white,1); //main screen
	}else
	{
		draw_sprite_ext(spr_WeChatOpen,0,bg_x,bg_y,scale,scale,0,c_white,1); //loading screen
	}
}