//App state
APP_ON = false;

//Loading timer
loading = 0;
loading_MAX = 100;
loaded = false;

//App bg references
bg_scale_start = 0.01;
bg_scale_max = obj_phone.scale;
bg_phone_x = obj_phone.x;
bg_phone_y = obj_phone.y;

//Lerp
lerping = 0.3;
	///Position
	bg_x = x;
	bg_y = y;
	bg_x_to_move = x;
	bg_y_to_move = x;
	///Scale
	scale = bg_scale_start;
	to_scale = scale;
	
	
	
//debugging boolean
d_bug_ON = false;
function debugger(){
	if keyboard_check_pressed(ord("1")){
		if d_bug_ON{
			d_bug_ON = false;
		}else{
			d_bug_ON = true;
		}
	}
	
	if d_bug_ON{
		show_debug_message("------------------");
		show_debug_message("--- " + string(app_name) + " info ---");
		show_debug_message("APP_ON:" +string(APP_ON));
		show_debug_message("bg_x "+string(bg_x));
		show_debug_message("bg_y "+string(bg_y));
		show_debug_message("scale "+string(scale));
		show_debug_message("bg_x_to_move "+string(bg_x_to_move));
		show_debug_message("bg_y_to_move "+string(bg_y_to_move));
		show_debug_message("to_scale "+string(to_scale));
		show_debug_message("------------------");
		}

}
