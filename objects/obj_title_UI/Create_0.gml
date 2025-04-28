//setting up positions for easy drawing
//X pos is actually set as a formula in draw
//Y pos is set by objects

//PLAY
t_play = "Play";
s_c = c_black; //color
s_z = 1; //scale
s_z_to_be = s_z; //scale lerp
x_pos_play = (room_width/2)-(string_width(t_play)/2); //X
x_pos_play_to_be = x_pos_play; //X lerp
y_pos_play = obj_title_UI_pos_START.y; //Y pos

//QUIT
t_quit = "I'm done...";
q_c = c_black; //color
q_z = 0.75; //scale
q_z_to_be = q_z; //scale lerp
x_pos_quit = (room_width/2)-(string_width(t_quit)/2); //X
x_pos_quit_to_be = x_pos_quit; //X lerp
y_pos_quit = obj_title_UI_pos_QUIT.y; // Y pos
