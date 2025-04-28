click_counter = 0;
starting_x = x;
starting_y = y;

shake = 15;

function new_pos(){
	x = random_range(starting_x-shake,starting_x+shake)
	y = random_range(starting_y-shake,starting_y+shake)
}

function draw_card(){
 obj_MANAGER.draw_card();
 show_debug_message("Manager drew a card")
}