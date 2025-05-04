player_score = 0;
oponent_score = 0;


//lists for different card states
deck = ds_list_create(); show_debug_message("Deck list is " + string(deck));
deck_czech_consular = ds_list_create(); show_debug_message("Deck Czech consular list is " + string(deck_czech_consular));
player_hand = ds_list_create(); show_debug_message("Player_hand list is " + string(player_hand));
oponent_hand = ds_list_create(); show_debug_message("Oponent_hand list is " + string(oponent_hand));
discard = ds_list_create(); show_debug_message("Discard list is " + string(discard));
comp = ds_list_create(); show_debug_message("Comaprison list is " + string(comp)); //comparison 
comp_oponent = ds_list_create(); show_debug_message("Comaprison_oponent list is " + string(comp_oponent));

p_played = false;
op_played = false;

//for easier editing, the x and y of placement is tied to four objects that you can move in the room editor!
//note: for discard and deck the movable card is the bottom of the pile
//note: the alignment with the central played cards and the hands are not well intergrated, it is currently just aligned by eye
deck_x_pos = obj_pos_deck.x;
deck_y_pos = obj_pos_deck.y;
//
deck_x_CONSULAR_pos = obj_pos_deck_consular.x;
deck_y_CONSULAR_pos = obj_pos_deck_consular.y;
//
disc_x_pos = obj_pos_discard.x;
disc_y_pos = obj_pos_discard.y;
//
hand_x_pos = obj_pos_hand.x;
hand_y_pos = obj_pos_hand.y;
//
hand_x_pos_oponent = obj_pos_hand_oponent.x;
hand_y_pos_oponent = obj_pos_hand_oponent.y;
//
hand_played_x_pos = obj_pos_hand_played.x;
hand_played_y_pos = obj_pos_hand_played.y;
//
hand_played_x_pos_oponent = obj_pos_hand_oponent_played.x;
hand_played_y_pos_oponent = obj_pos_hand_oponent_played.y;
/////

//position setup
hand_x_offset = 100;

//card setup vars
num_cards = 4;

//hand size
num_hand_size = 1;

//prep for state machine
dealing = true;
playing = false;
discarding = false;
reshuffled = true;
score_changed = false;
oponent_dealt = false;
player_dealt = false;
last_card_in_place_p = true;
last_card_in_place_o = true;


//alarms and delays
wait_between_cards = 0;
wait_between_cards_M = 20;//card DEALING delay
which_card_in_hand = 0; //card DEALING iteration
//
wait_between_reveal = 0; 
wait_between_reveal_M = 80; //card COMPARISON delay
//
op_play_wait = 0;
op_play_wait_M = 80; //oponent making move delay
//
reshuffle_wait = 0
reshuffle_wait_M = 5;  //delay between each, bloody, individual card going back to the deck
which_card_being_reshuffled = 0;
//
discard_play_wait = 0;
discard_play_wait_M = 8; //delay between each card going to the discard pile 
which_card_being_discarded = 0;
//
wait_max = 50;
wait = 0;

var fx = 1 //face index
///
///CZECH CONSULAR DECK
for (var _i = 0; _i < num_cards; _i++){
	var new_card = instance_create_layer(x,y,"instances", obj_card);

	//modulo to determine face index of card
	//creates an even list
	//NOT perfectly shuffled, yet
	new_card.face_index = fx;
	fx += 2;
	if fx >= 7{fx = 1}
	
	//card not face up
	new_card.face_up = false;
	//card not in player hand
	new_card.in_player_hand = false;
	//card not discarded
	new_card.discarded = false;

	//depth above prior card
	new_card.target_depth = -_i;
	
	new_card.x = deck_x_CONSULAR_pos;
	new_card.y = deck_y_CONSULAR_pos-_i*6;
	
	new_card.x_to_move = deck_x_CONSULAR_pos;
	new_card.y_to_move = deck_y_CONSULAR_pos-_i*6;
	
	//adds to list
	ds_list_add(deck_czech_consular,new_card);
	
}

var fx_p = 0;
///
///PLAYER DECK
for (var _i = 0; _i < num_cards; _i++){
	var new_card = instance_create_layer(x,y,"instances", obj_card);

	//modulo to determine face index of card
	//creates an even list
	//NOT perfectly shuffled, yet
	new_card.face_index = fx_p;
	fx_p += 2;
	if fx_p >= 6 {fx_p = 0}
	
	//card not face up
	new_card.face_up = false;
	//card not in player hand
	new_card.in_player_hand = false;
	//card not discarded
	new_card.discarded = false;

	//depth above prior card
	new_card.target_depth = -_i;
	
	new_card.x = deck_x_pos;
	new_card.y = deck_y_pos-_i*6;
	
	new_card.x_to_move = deck_x_pos;
	new_card.y_to_move = deck_y_pos-_i*6;
	
	//adds to list
	ds_list_add(deck,new_card);
	
}

//FIX FOR POST-SHUFFLE HEIGHT AND POSITION
for (var _i = 0; _i < num_cards; _i++){
		var card_to_check_height = ds_list_find_value(deck,ds_list_size(deck)-(_i+1));
		var pos = ds_list_find_index(deck, card_to_check_height);
			card_to_check_height.target_depth = -pos
			card_to_check_height.y= deck_y_pos-pos*6;
			card_to_check_height.y_to_move= deck_y_pos-pos*6;
	}
	
function draw_card(){
	//looks at the deck and returns the LAST value added to it (top card)
	var dealt_card = ds_list_find_value(deck,ds_list_size(deck)-1); //-1 because ds list starts at 0
						
		if (!(dealt_card == undefined)) {
			//deletes card from deck list
			ds_list_delete(deck,ds_list_size(deck)-1);
			//adds card to player hand list
			ds_list_add(player_hand,dealt_card);
				show_debug_message("I added CARD " + string(dealt_card)+ " to Player hand at POS " + string(ds_list_find_index(player_hand,dealt_card)))
		
			//places card in player's hand area
			audio_play_sound(snd_chk,2,false);
			dealt_card.x_to_move = hand_x_pos + which_card_in_hand * hand_x_offset*2;
			dealt_card.y_to_move = hand_y_pos;
		
			//card is in player's hand
			dealt_card.in_player_hand = true;
			
			//depth
			dealt_card.target_depth = -600;
			
			//face up
			dealt_card.face_up = true;
			}
}

function send_back(card_to_send){
			//places card in player's hand area
			audio_play_sound(snd_chk,2,false);
			card_to_send.x_to_move = hand_x_pos + which_card_in_hand * hand_x_offset*2;
			card_to_send.y_to_move = hand_y_pos;
		
			//card is in player's hand
			card_to_send.in_player_hand = true;
			
			//depth
			card_to_send.target_depth = -600;
			
			//face up
			card_to_send.face_up = true;
			
			//resets variables
			show_debug_message("Player still needs to play; card wasn't translated")
			var reset = function(){
				p_played = false; //determines if player can move card
				score_changed = false; //determines if cards can be compared
			}
				////60 frame delay BEFORE LETTING THE PLAYER PLAY AGAIN	
			call_later(60,time_source_units_frames,reset,false); //calls later to prevent the comparison from running as the card lerps
}


function comparison (ID){	
	ID.face_up = true;
	ID.in_player_hand = false;
	audio_play_sound(snd_chk,2,false);
	ID.x_to_move = hand_played_x_pos;
	ID.y_to_move = hand_played_y_pos;

	show_debug_message("played");
	ds_list_delete(player_hand, ds_list_find_index(player_hand,ID));
	show_debug_message("Card " + string(ID) + " added to COMP!!!!!")
	ds_list_add(comp, ID);
	p_played = true;
}

function end_comp(){
	
		var comp_ENDED = false;
	
		var p_card = comp[|0];
		var o_card = comp_oponent[|0];
		var player_num = ds_list_size(player_hand);
		var oponent_num = ds_list_size(oponent_hand);
		var deck_num =  ds_list_size(deck);
		
		var oponent_discard;
		var player_discard;
		
		wait ++; show_debug_message("Wait: "+string(wait));
		discard_play_wait++; show_debug_message("Discard play wait: "+string(discard_play_wait));
		
		
		if wait > wait_max{
				
				the_card_discarder(comp_oponent,0);
				the_card_discarder(comp,0);
				the_card_discarder(oponent_hand,0);
				the_card_discarder(oponent_hand,0);
				the_card_discarder(oponent_hand,0);
				the_card_discarder(player_hand,0);
				the_card_discarder(player_hand,0);
				the_card_discarder(player_hand,0);
			
			
			//restating variables to check
			player_num = ds_list_size(player_hand);
			oponent_num = ds_list_size(oponent_hand);
			deck_num =  ds_list_size(deck);
			var comparison_num_player = ds_list_size(comp);
			var comparison_num_oponent = ds_list_size(comp_oponent);
			
			if (player_num == 0 && oponent_num == 0 && comparison_num_player == 0 && comparison_num_oponent == 0){
				comp_ENDED = true;
				show_debug_message("No more cards in either hand nor in play.");
			}
			
			if comp_ENDED {
				ds_list_clear(oponent_hand);
				ds_list_clear(player_hand);
				op_played = false;
				p_played = false;
				show_debug_message("comp ended; cards cleared");
				wait = 0;
					if (deck_num >= num_hand_size) {
					the_great_reset();
					show_debug_message("Playing ENDED");
					} else{
					playing = false;
					reshuffled = false;
					show_debug_message("Not enough cards in deck, reshuffling");
					}
			}
		}
}



function the_great_reset(){
	reshuffled = true;
	playing = false;
	dealing = true;
	wait_between_reveal = 0;
	last_card_in_place_o = true;
	last_card_in_place_p = true;
	which_card_being_reshuffled = 0;
}

function the_card_discarder(list,pos){

	if (discard_play_wait > discard_play_wait_M){
	var card_discard = list[|pos];
	
	if card_discard == undefined {
		show_debug_message("✘ The card " + string(card_discard) + " from " + string(list) + " pos " + string(pos) + " is undefined ✘");
		return;}

	ds_list_add(discard,card_discard);
	ds_list_delete(list,pos);
	audio_play_sound(snd_chk,2,false);
	card_discard.discarded = true;
	card_discard.face_up = true;
	card_discard.in_player_hand = false;
		//moves cards to discard pile
		card_discard.x_to_move = disc_x_pos;
		card_discard.y_to_move = disc_y_pos-ds_list_find_index(discard,card_discard)*6;
		card_discard.target_depth = -ds_list_find_index(discard,card_discard);	
	show_debug_message("✓DISCARDED " + string(card_discard) + " from " + string(list) + " pos " + string(pos));
	discard_play_wait = 0;
	}
}
