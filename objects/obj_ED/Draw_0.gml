draw_set_font(fnt_dialogue);

s_z = lerp(s_z,s_z_to_be,0.175) //lerp scale
x_pos_play = lerp(x_pos_play,x_pos_play_to_be,0.175) //lerp x
draw_text_transformed_colour(x_pos_play,y_pos_play,t_play,s_z,s_z,0,s_c,s_c,s_c,s_c,1);

q_z = lerp(q_z,q_z_to_be,0.175) //lerp scale
x_pos_quit = lerp(x_pos_quit,x_pos_quit_to_be,0.175) //lerp x
draw_text_transformed_colour(x_pos_quit,y_pos_quit,t_quit,q_z,q_z,0,q_c,q_c,q_c,q_c,1);