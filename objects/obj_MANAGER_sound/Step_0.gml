var song = snd_song_sukiyaki;

var _play_sound = function()
{
	var song = snd_song_sukiyaki;
	audio_play_sound(song,1,0);
	audio_sound_gain(song,0,0);
	audio_sound_gain(song,1,1500);
}



if (keyboard_check_pressed(ord("H"))){
	
	if (!audio_is_playing(song)){
	var bg_music_ = call_later(0.2, time_source_units_seconds, _play_sound,false);
	}
	
	switch audio_sound_get_gain(song){
		
		case 1:
	audio_sound_gain(song,0,500);
	break;
	
		case 0:
	audio_sound_gain(song,1,1500);
	break;
	}
}
