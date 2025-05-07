draw_self();

////SHADING FUNCTION
	//if mouse clicks and is over icon
if mouse_check_button_pressed(1) && position_meeting(mouse_x,mouse_y,id)
{
	image_index = 1; //shaded
	
	//if mouse releases AND the icon was shaded
}else if mouse_check_button_released(1) && image_index == 1
{
	image_index = 0; //unshaded
	APP_ON = true; //triggers opening
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