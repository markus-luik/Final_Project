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
		
		//
		//PLAYER
		//if oponent_dealt {
		//	if player_num < num_hand_size{
		//		//looks at the deck and returns the LAST value added to it (top card)
		//		var dealt_card = ds_list_find_value(deck,ds_list_size(deck)-1); //-1 because ds list starts at 0
		//			if (last_card_in_place_p){
				
						
		//				if (!(dealt_card == undefined)) {
		//				//deletes card from deck list
		//				ds_list_delete(deck,ds_list_size(deck)-1);
		//				//adds card to player hand list
		//				ds_list_add(player_hand,dealt_card);
		//					show_debug_message("I added CARD " + string(dealt_card)+ " to P hand at POS " + string(ds_list_find_index(player_hand,dealt_card)))
		
		//				//places card in player's hand area
		//				audio_play_sound(snd_chk,2,false);
		//				dealt_card.x_to_move = hand_x_pos + which_card_in_hand * hand_x_offset*2;
		//				dealt_card.y_to_move = hand_y_pos;
		
		//				//card is in player's hand
		//				dealt_card.in_player_hand = true;
					
		//				//resets counter, increments card counter
		//				wait_between_cards = 0;
		//				show_debug_message("Nr of card in hand: " + string(which_card_in_hand))
		//			}
		//		}
		//		//// this is -> an overly convoluted way of checking to see if the last card reached where it should be
		//		show_debug_message(which_card_in_hand)
		//			var last_p_hand_card = player_hand[|which_card_in_hand]; //last card
		//				if (last_p_hand_card == undefined) return;
		//			//distance of that card to the
		//			var dist_to_goal_p = point_distance(last_p_hand_card.x,last_p_hand_card.y,hand_x_pos + which_card_in_hand * hand_x_offset*2,hand_y_pos);
		//			if (dist_to_goal_p < 10.00) { //If last card is close enough to where it should be, send in the next one
		//				last_card_in_place_p = true;
		//				which_card_in_hand ++;
		//				}else{last_card_in_place_p = false;} //otherwise not
		//	}else {
		//		//horribly innefiecnt scope use but basically checks AGAIN if the last card is in the right place
		//		//AND IT DOESN'T REALLY WORK BUT IT KIND OF DOES
		//		var last_p_hand_card = oponent_hand[|which_card_in_hand]; //last card
		//		//distance of that card to the place
		//		var dist_to_goal_p = point_distance(last_p_hand_card.x,last_p_hand_card.y,hand_x_pos_oponent + (which_card_in_hand) * hand_x_offset*2,hand_y_pos_oponent);
		//				if (dist_to_goal_p < 0.01) { //If last card is close enough to where it should be, send in the next one
		//					player_dealt = true; // STATE BOOLEAN TRIGGERED
		//					show_debug_message("Player dealt");
		//					which_card_in_hand = 0;
		//					//PLAYER HAS FINALLY BEEN DEALT!!
		//				}
		//			}
		//	}
		//
		//
		//FINALIZING DEALING
	//if player_dealt && oponent_dealt{
	if oponent_dealt{
		//turn over player cards
		//for (var _i = 0; _i < num_hand_size; _i ++){
		//	var hand_card = ds_list_find_value(player_hand,ds_list_size(player_hand)-(_i+1));	
		//	if hand_card == undefined {break;}
		//	if hand_card.in_player_hand == true{
		//		hand_card.face_up = true;
		//		show_debug_message("turned")
		//	}
		//}
		////////turn over oponent cards
		//////for (var _i = 0; _i < num_hand_size; _i ++){
		//////	var op_hand_card = ds_list_find_value(oponent_hand,ds_list_size(oponent_hand)-(_i+1));	
		//////	if op_hand_card == undefined {break;}
		//////		op_hand_card.face_up = true;
		//////		show_debug_message("turned OP")
		//////}
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
				var o_i = oponents_card.face_index;
		
				if (p_i == o_i){ //tie
					end_comp();
					show_debug_message("tie");
				}
				else if (p_i == 0 && o_i == 2 || p_i == 1 && o_i == 2){ //player wins
					if !score_changed {player_score ++; 
						audio_play_sound(snd_win,1,false);
						score_changed = true;
						}
					show_debug_message("Player wins");
					end_comp(); 
				}
				else{ //oponent wins
					if !score_changed {
						oponent_score ++;
						audio_play_sound(snd_loss,1,false);
						show_debug_message("Hey! I just played sound!")
						score_changed = true;
						}
					show_debug_message("Oponent wins");
					end_comp();
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
	show_debug_message("Visa submitted. You now have a 2/3 chance of actually getting the visa ahahaha");
	obj_MANAGER_text__incl_score.visa_done = true;
	obj_black_Text_bg.visible=true;
	
	//deck_num =  ds_list_size(deck)
	//discard_num = ds_list_size(discard);

	////moves card from discard to deck all at once
	//if (discard_num == num_cards*2){
	//	for (var _i = 0; _i < num_cards; _i++){
	//		var reshuffle_card = ds_list_find_value(discard,ds_list_size(discard)-1);
	//		ds_list_delete(discard, ds_list_size(discard)-1);
	//		ds_list_add(deck, reshuffle_card);
	//	}
	//}
	
	
	
	////goes through deck to visually move and reset all the cards
	//show_debug_message(which_card_being_reshuffled)
	//if (which_card_being_reshuffled < num_cards){
	//	if reshuffle_wait > reshuffle_wait_M {
	//	//var new_deck_card = ds_list_find_value(deck,ds_list_size(deck)-(1+which_card_being_reshuffled));
	//	var new_deck_card = deck[|which_card_being_reshuffled];
	//	show_debug_message("Deck num: "+string(deck_num));
	//	show_debug_message("card: "+string(new_deck_card));
	
	//		//goes through the deck to set the right variables
			
	//		//depth and x,y
	//		new_deck_card.target_depth = -which_card_being_reshuffled;
	//		audio_play_sound(snd_chk,2,false);
	//		new_deck_card.x_to_move= deck_x_pos;
	//		new_deck_card.y_to_move= deck_y_pos-which_card_being_reshuffled*6
	//		show_debug_message(new_deck_card.y);
		
	//		//card not face up
	//		new_deck_card.face_up = false;
	//		//card not in player hand
	//		new_deck_card.in_player_hand = false;
	//		//card no longer discarded
	//		new_deck_card.discarded = false;
	//		//depth above prior card
	//		new_deck_card.target_depth = - which_card_being_reshuffled;
	//		which_card_being_reshuffled++
	//		reshuffle_wait = 0;
	//	}else reshuffle_wait ++;
	//} else {
	//	//shuffles list
	//	ds_list_shuffle(deck);
	
	////rearranges cards to be at appropriate heights after shuffling
	//	for (var _i = 0; _i < num_cards; _i++){
	//		var card_to_check_height = ds_list_find_value(deck,ds_list_size(deck)-(_i+1));
	//		var pos = ds_list_find_index(deck, card_to_check_height);
	//		audio_play_sound(snd_chk,2,false);
	//			card_to_check_height.target_depth = -pos
	//			card_to_check_height.y_to_move= deck_y_pos-10;
	//			card_to_check_height.y_to_move= deck_y_pos-pos*6;
	//	}
	//	the_great_reset();
	
	//	show_debug_message("Reshuffling ENDED");
	//}

}

//show_debug_message(comp[|0]);
//show_debug_message("Deck num: "+string(deck_num) +"  Player num: "+string(player_num) + " -comp num: "+string(comparison_num_player) + "  Oponent num: "+string(oponent_num) + " -comp num: "+string(comparison_num_oponent) + "  Player score: "+string(player_score) + "  Oponent score: "+string(oponent_score)+ "  Discard num: "+string(discard_num));

