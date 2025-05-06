depth = -2000;

click_counter = 0;
starting_x = x;
starting_y = y;
starting_scale = 1.5;

//lerp
x_to_move = x;
y_to_move = y;
lerping = 0.1;
	////position references
	x_pos = obj_pos_phone.x;
	y_pos = obj_pos_phone.y;
to_scale = 1.5;
scale = starting_scale;
	////scale reference
	scale_ref = obj_pos_phone_BIG.image_xscale;
	////position BIG ref
	x_pos_BIG = obj_pos_phone_BIG.x;
	y_pos_BIG = obj_pos_phone_BIG.y;

//lock and unlock effect -- sprites drawn in DRAW
phone_lock_timer = 0;
locked = true;
alpha = 0.0;
lock_speed = 0.08;
unlock_speed = 0.1;

//dark BG
alpha_bg = 0.0;

//BIG phone
BIG = false;
active = false;
unlock_animation_frame = 0;

//hovering
hovering_over = false;


function draw_card(){
 obj_MANAGER.draw_card();
 show_debug_message("Manager drew a card")
}


//debugging boolean
d_bug_ON = false;
function debugger(){
	if keyboard_check_pressed(ord("P")){
		if d_bug_ON{
			d_bug_ON = false;
		}else{
			d_bug_ON = true;
		}
	}
	
	if d_bug_ON{
		show_debug_message("------------------");
		show_debug_message("--- Phone info ---");
		show_debug_message("Alpha "+string(alpha));
		show_debug_message("x "+string(x));
		show_debug_message("y "+string(y));
		show_debug_message("scale "+string(scale));
		show_debug_message("x_to_move "+string(x_to_move));
		show_debug_message("y_to_move "+string(y_to_move));
		show_debug_message("x_pos_BIG "+string(x_pos_BIG));
		show_debug_message("y_pos_BIG "+string(y_pos_BIG));
		show_debug_message("------");
		show_debug_message("image_index "+string(image_index));
		show_debug_message("image_number "+string(image_number));
		show_debug_message("------");
		show_debug_message("BIG? "+string(BIG));
		show_debug_message("active? "+string(active));
		show_debug_message("------------------");
	}

}