click_counter = 0;
starting_x = x;
starting_y = y;

//lerp
x_to_move = x;
y_to_move = y;
lerping = 0.1;
	////position references
	x_pos = obj_pos_phone.x;
	y_pos = obj_pos_phone.y;

//lock and unlock effect -- sprites drawn in DRAW
phone_lock_timer = 0;
locked = true;
alpha = 0.0;
lock_speed = 0.08;
unlock_speed = 0.1;

//hovering
hovering_over = false;


function draw_card(){
 obj_MANAGER.draw_card();
 show_debug_message("Manager drew a card")
}