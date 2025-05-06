//depth
dep = obj_phone.depth;

//Positions
	///WeChat
	WeChatExists = false;
	We_x_pos = obj_pos_WeChat.x;
	We_y_pos = obj_pos_WeChat.y;
	WeChatID = 0;
	
	
	
function app_creation(app, app_x, app_y){
	instance_create_depth(app_x,app_y,dep-1,app); 
	show_debug_message(string(app)+" created");
}

function app_destruction(app){
	instance_destroy(app); 
	show_debug_message(string(app)+" destroyed");
}