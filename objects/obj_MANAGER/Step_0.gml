//checks how many cards are in the player's hand from list
var player_num = ds_list_size(player_hand);
var oponent_num = ds_list_size(oponent_hand);
var deck_num =  ds_list_size(deck);
var discard_num = ds_list_size(discard);
var comparison_num_player = ds_list_size(comp);
var comparison_num_oponent = ds_list_size(comp_oponent);

	///
	///
	///DEALING
	///
if (dealing){
	show_debug_message("Dealing");

		//
		//OPONENT
		if oponent_num < num_hand_size{
			//looks at the deck and returns the LAST value added to it (top card)
			var dealt_card_o = ds_list_find_value(deck_czech_consular,ds_list_size(deck_czech_consular)-1); //-1 because ds list starts at 0
				if (last_card_in_place_o){
			
					if (!(dealt_card_o == undefined)) {
						//deletes card from deck list
						ds_list_delete(deck_czech_consular,ds_list_size(deck_czech_consular)-1);
						//adds card to player hand list
						ds_list_add(oponent_hand,dealt_card_o);
							show_debug_message("I added CARD " + string(dealt_card_o)+ " to OP hand at POS " + string(ds_list_find_index(oponent_hand,dealt_card_o)));
		
						//places card in player's hand area
						audio_play_sound(snd_chk,2,false);
						dealt_card_o.x_to_move = hand_x_pos_oponent + which_card_in_hand * hand_x_offset*2;
						dealt_card_o.y_to_move = hand_y_pos_oponent;
		
						//card is in player's hand
						dealt_card_o.in_oponent_hand = true;
						
						//resets counter, increments card counter
						wait_between_cards = 0;
						}
			}
			//// this is -> an overly convoluted way of checking to see if the last card reached where it should be
			var last_o_hand_card = oponent_hand[|which_card_in_hand]; //last card
			if (last_o_hand_card == undefined) return;
			//distance of that card to the place
			var dist_to_goal_o = point_distance(last_o_hand_card.x,last_o_hand_card.y,hand_x_pos_oponent + (which_card_in_hand) * hand_x_offset*2,hand_y_pos_oponent);
			if (dist_to_goal_o < 10.00) { //If last card is close enough to where it should be, send in the next one
				last_card_in_place_o = true;
				if (which_card_in_hand < 2){
					which_card_in_hand ++;
				}
				}else{last_card_in_place_o = false;} //otherwise not
		}else if (player_num == 0){
			//horribly innefiecnt scope use but basically checks AGAIN if the last card is in the right place
			var last_o_hand_card = oponent_hand[|which_card_in_hand]; //last card
			//distance of that card to the place
			var dist_to_goal_o = point_distance(last_o_hand_card.x,last_o_hand_card.y,hand_x_pos_oponent + (which_card_in_hand) * hand_x_offset*2,hand_y_pos_oponent);
				if (dist_to_goal_o < 10.00) { //If last card is close enough to where it should be, send in the next one
					oponent_dealt = true; // STATE BOOLEAN TRIGGERED
					show_debug_message("Oponent dealt");
					which_card_in_hand = 0;
					//OPONENT HAS FINALLY BEEN DEALT!!
					//MOVING ON TO PLAYER
					//
				}
		}
		
	
	if oponent_dealt{
		dealing = false;	
		playing = true;
		player_dealt = false;
		oponent_dealt = false;
		wait_between_cards = 0;
		show_debug_message("Dealing ENDED");
	}
}


///
///
///PLAYING
///
if playing{
	//show_debug_message("Playing");
	///
	///
	///OPONENT PLAYING
	///
	if !op_played && oponent_num > 0{
		show_debug_message(op_play_wait);
		if (op_play_wait > op_play_wait_M){
			if (comparison_num_oponent < 1){
				show_debug_message("Attack! By opponent")
				var random_choice = irandom_range(1,oponent_num);
				var oponents_played_card = oponent_hand[|random_choice-1];
				show_debug_message("Oponent's turn, they chose: " + string (random_choice-1));
		
				audio_play_sound(snd_chk,2,false);
				oponents_played_card.x_to_move = hand_played_x_pos_oponent;
				oponents_played_card.y_to_move = hand_played_y_pos_oponent;
				oponents_played_card.face_up = true;
			
				ds_list_delete(oponent_hand, ds_list_find_index(oponent_hand,oponents_played_card));
				ds_list_add(comp_oponent, oponents_played_card);
			
				op_played = true;
			
				score_changed = false;
				op_play_wait = 0;
			}
		}else op_play_wait++;
	}

	///
	///
	///COMPARISON
	///
	if(p_played && op_played){
		var players_card = comp[|0]; show_debug_message(players_card);
		var oponents_card = comp_oponent[|0]; show_debug_message(oponents_card);
	
		if wait_between_reveal > wait_between_reveal_M{
			
			if (!(players_card == undefined) && !(oponents_card == undefined)){
			
				oponents_card.face_up = true;

				var p_i = players_card.face_index;
				var p_trans = players_card.translated;
				var o_i = oponents_card.face_index;
		
				if (p_i == o_i){ //tie
					end_comp();
					show_debug_message("tie");
				}
				else if (p_trans && (p_i == 0 && o_i == 1 || p_i == 2 && o_i == 3 || p_i == 4 && o_i == 5  || p_i == 6 && o_i == 7 )){ //player wins
					if !score_changed {player_score ++; 
						obj_energy_bar.image_index ++;
						audio_play_sound(snd_win,1,false);
						score_changed = true;
						}
					show_debug_message("Player wins");
					end_comp(); 
				}
				else{ //oponent wins
					if !score_changed {
						oponent_score ++;
						obj_energy_bar.image_index ++;
						audio_play_sound(snd_loss,1,false);
						show_message("I don't understand, it needs to be in Czech.");
						score_changed = true;
						send_back(players_card);
						}
					//show_debug_message("Oponent wins");
					//end_comp();
				}
			}else {end_comp(); show_debug_message("Let end_comp do it's thing...");}
		}else wait_between_reveal ++;
	}
	
	
}


if (deck_num == 0 && player_num == 0) {
	playing = false; 
	reshuffled = false; 
}



	////	
	////
	///RESHUFFLING
	///
if (!reshuffled){
	show_message("You never submitted that visa....");
	obj_MANAGER_text__incl_score.visa_done = true;
	obj_black_Text_bg.visible=true;
	room_goto(rm_ending);
}

//show_debug_message(comp[|0]);
//show_debug_message("Deck num: "+string(deck_num) +"  Player num: "+string(player_num) + " -comp num: "+string(comparison_num_player) + "  Oponent num: "+string(oponent_num) + " -comp num: "+string(comparison_num_oponent) + "  Player score: "+string(player_score) + "  Oponent score: "+string(oponent_score)+ "  Discard num: "+string(discard_num));

