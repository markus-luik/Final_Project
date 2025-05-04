if instance_place(x,y,obj_card){ //if card touches it
	var card = instance_place(x,y,obj_card); //takes var
	card.translated = true;  //translated TRUE
	obj_MANAGER_text__incl_score.money -= 100;
	show_debug_message("Card " +string(card)+ " is now translated " + string (card.translated))
}