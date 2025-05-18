//cleanup if WeChat app is gone
if instance_number(obj_WeChat) < 1{
	show_debug_message("WeChat Icon " +string(id)+" destroyed");
	instance_destroy(self);
}

if click_counter == 15 && !card_given{
	obj_MANAGER.draw_card();
	obj_phone.phone_close();
	card_given = true;
}