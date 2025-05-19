//setting up positions for easy drawing
//X pos is actually set as a formula in draw
//Y pos is set by objects

//PLAY
t_play = "Made by MARKUS LUIK";
s_c = c_white; //color
s_z = 1; //scale
s_z_to_be = s_z; //scale lerp
x_pos_play = (room_width/2)-string_width(t_play)/3; //X
x_pos_play_to_be = x_pos_play; //X lerp
y_pos_play = obj_title_UI_pos_START.y; //Y pos

//QUIT
t_quit = "Inspired by my partner Houzhi's visa experience";
q_c = c_white; //color
q_z = 0.75; //scale
q_z_to_be = q_z; //scale lerp
x_pos_quit = (room_width/2)-string_width(t_quit)/3.5; //X
x_pos_quit_to_be = x_pos_quit; //X lerp
y_pos_quit = obj_title_UI_pos_QUIT.y; // Y pos

audio_play_sound(snd_song_sukiyaki,1,false);