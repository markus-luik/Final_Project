//draws previous sprite under new sprite for phone lock/unlock effect
if locked {
	if alpha > 0 {alpha -= lock_speed;} //transition speed
	draw_sprite_ext(spr_phone,0,x,y,1.5,1.5,0,c_white,1); //black
	draw_sprite_ext(spr_phone,1,x,y,1.5,1.5,0,c_white,alpha); //maoliang
}else{
	if alpha < 1 {alpha += unlock_speed;} //transition speed
	draw_sprite_ext(spr_phone,0,x,y,1.5,1.5,0,c_white,1); //black
	draw_sprite_ext(spr_phone,1,x,y,1.5,1.5,0,c_white,alpha); //maoliang
}
