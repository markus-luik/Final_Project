//updates score
op_score = obj_MANAGER.oponent_score;
p_score = obj_MANAGER.player_score;
//if (money < 0){m_col = c_red;}
var m_draw = "$"+string(floor(money));

//sets font
draw_set_font(fnt_score);

var d = 4;
//draws text
//CONSULATE
//draw_text_colour(x_pos_op-d, y_pos_op+d,op_score,c_black,c_black,c_black,c_black,1);
//draw_text(x_pos_op, y_pos_op,op_score);
//PLAYER
draw_text_colour(x_pos_p-d, y_pos_p+d,string(p_score) +"/4",c_black,c_black,c_black,c_black,1);
draw_text(x_pos_p, y_pos_p,p_score);
//MONEY
draw_text_colour(x_pos_money-d,y_pos_money+d,m_draw,c_black,c_black,c_black,c_black,1);
draw_text_colour(x_pos_money,y_pos_money,m_draw,m_col,m_col,m_col,m_col,1);

if (visa_done){
draw_text_transformed_colour(200,550,"Visa submitted...",0.8,0.8,0,c_green,c_green,c_green,c_green,1)
}