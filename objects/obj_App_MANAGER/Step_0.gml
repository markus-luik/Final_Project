//phone state variables
var ON = obj_phone.active;
var dep = obj_phone.depth;

if ON {
	instance_create_depth(We_x_pos,We_y_pos,dep-1,obj_WeChat); show_debug_message("WeChat created");
	show_debug_message("ALL apps CREATED");
}
else{
	instance_destroy(obj_WeChat); show_debug_message("WeChat destroyed");
	
	show_debug_message("ALL apps DESTROYED");
}