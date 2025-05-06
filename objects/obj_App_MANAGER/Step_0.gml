//phone state variables
var ON = obj_phone.active;
dep = obj_phone.depth;

if ON {
	app_creation(obj_WeChat,We_x_pos,We_y_pos); ///app boolean, app, x, y
	show_debug_message("ALL apps CREATED");
}
else{
	app_destruction(obj_WeChat);
	show_debug_message("ALL apps DESTROYED");
}