//draws dark bg behind BIG phone
if BIG {
	if alpha_bg < 1 {alpha_bg += unlock_speed;} //transition speed
		draw_sprite_ext(spr_dark_bg,0,0,0,1,1,0,c_white,alpha_bg); //black bg
		
		//PHONE ACTIVE 
		if active{
		//draw_sprite_ext(spr_phone_OPEN,0,x,y,scale,scale,0,c_white,1);
		sprite_index = spr_phone_OPEN; //sets obj sprite to phone bg
		draw_self(); //draws phone bg
		//NB! In Draw End the rim of the phone is also drawn!!
	}else{
		image_speed = 1;
		sprite_index = spr_phone_unlocking;
		draw_self();
		if image_index > image_number -1 {
			active = true; //sets phone to ACTIVE
			image_speed = 0;
			image_index = 0;  //resets image index for future loop
		}
	}
	
} else{
	if alpha_bg > 0 {alpha_bg -= unlock_speed;} //transition speed
	draw_sprite_ext(spr_dark_bg,0,0,0,1,1,0,c_white,alpha_bg); //black bg
}
	
	
	
//phone on the side
if !BIG {
//draws previous sprite under new sprite for phone lock/unlock effect
if locked {
	if alpha > 0 {alpha -= lock_speed;} //transition speed	
}else{
	if alpha < 1 {alpha += unlock_speed;} //transition speed
}
	draw_sprite_ext(spr_phone,0,x,y,scale,scale,0,c_white,1); //black
	draw_sprite_ext(spr_phone,1,x,y,scale,scale,0,c_white,alpha); //maoliang
}
