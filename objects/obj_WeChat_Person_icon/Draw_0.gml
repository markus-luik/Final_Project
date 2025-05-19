draw_self();

//SHADING FUNCTION
	///if mouse clicks and is over icon
if mouse_check_button_pressed(1) && position_meeting(mouse_x,mouse_y,id)
{
	image_index = 1; //shaded
	audio_play_sound(snd_call,1,false);
	
	///if mouse releases AND the icon was shaded
}else if mouse_check_button_released(1) && image_index == 1
{
	image_index = 0; //unshaded
	Message_open = true; //triggers opening
	click_counter ++;
}

draw_text_transformed_color(x-20,y+30,"Please..",0.25,0.25,0,c_black,c_black,c_black,c_black,1);