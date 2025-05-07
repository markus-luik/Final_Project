draw_self();

//SHADING FUNCTION
	///if mouse clicks and is over icon
if mouse_check_button_pressed(1) && position_meeting(mouse_x,mouse_y,id)
{
	image_index = 1; //shaded
	
	///if mouse releases AND the icon was shaded
}else if mouse_check_button_released(1) && image_index == 1
{
	image_index = 0; //unshaded
	Message_open = true; //triggers opening
}
