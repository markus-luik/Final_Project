//LERP
bg_x = lerp(bg_x,bg_x_to_move,lerping);
bg_y = lerp(bg_y,bg_y_to_move,lerping);
scale = lerp(scale,to_scale,lerping); //changes sprite size (via variable)

		
if APP_ON{
	bg_x_to_move = bg_phone_x;
	bg_y_to_move = bg_phone_y;
	to_scale = bg_scale_max;
}

var phone_x = obj_phone.x;
var phone_y = obj_phone.y;
if loaded{ //at an insane depth level
	instance_create_depth(phone_x,phone_y-270,-5000,obj_WeChat_Person_icon); show_debug_message("Mom's message created");
} 


debugger();