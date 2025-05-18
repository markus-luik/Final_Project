event_inherited();


var phone_x = obj_phone.x;
var phone_y = obj_phone.y;

if loaded && instance_number(obj_WeChat_Person_icon) < 1{ //at an insane depth level
	instance_create_depth(phone_x,phone_y-270,-5000,obj_WeChat_Person_icon); show_debug_message("Mom's message created");
} 