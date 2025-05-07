//cleanup if WeChat app is gone
if instance_number(obj_WeChat) < 1{
	show_debug_message("WeChat Icon " +string(id)+" destroyed");
	instance_destroy(self);
}