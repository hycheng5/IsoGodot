extends Control

var button_list: Array[ButtonAbility] = []
var battle_manager: BattleManager

# Called when the node enters the scene tree for the first time.
func _ready():
	# find battle manager and create connection
	battle_manager = find_parent("BattleRoot")
	if(battle_manager != null):
		battle_manager.change_phase.connect(on_phase_change)
		battle_manager.new_player_monster.connect(on_new_player_monster)
		#battle_manager.new_opponent_monster.connect(on_new_opponent_monster)

	#find any buttons in button container and add them to button list
	for child in get_node("Menu/AttackButtonContainer").get_children():
		if child is ButtonAbility:
			button_list.append(child)

func on_phase_change(phase: BattleManager.Phases):
	# TODO: not sure if this will be in game for now just keeps this for debugging
	var phase_string = battle_manager.phase_to_string(phase)
	print("changed phases ", phase_string)
	var phase_label: Label = find_child("PhaseLabel")
	phase_label.text = phase_string
	
	# Hide buttons if phase isn't attack choose
	if(phase != BattleManager.Phases.ATTACK_CHOOSE):
		for button in button_list:
			button.visible = false
	else:
		for button in button_list:
			button.visible = true
			
func on_new_player_monster(new_monster: Monster):
	for i in range(0,new_monster.usable_ability_sequences.size()):
		button_list[i].text = new_monster.usable_ability_sequences[i]._get_description()
		button_list[i].ability_sequence = new_monster.usable_ability_sequences[i]
		button_list[i].battle_manager = battle_manager

func on_new_opponent_monster(new_monster: Monster):
	pass
