event_inherited();


if loaded{
	var col = c_black;
	var money = (obj_MANAGER_text__incl_score.money);
draw_set_font(fnt_score);
draw_text_color(x+sprite_get_width(spr_ChaseOpen)-string_width(money)+80,540,"$"+string(money),col,col,col,col,1);
}