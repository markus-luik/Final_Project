//LERP
bg_x = lerp(bg_x,bg_x_to_move,lerping);
bg_y = lerp(bg_y,bg_y_to_move,lerping);
scale = lerp(scale,to_scale,lerping); //changes sprite size (via variable)

		
if APP_ON{
	bg_x_to_move = bg_phone_x;
	bg_y_to_move = bg_phone_y;
	to_scale = bg_scale_max;
}

debugger();