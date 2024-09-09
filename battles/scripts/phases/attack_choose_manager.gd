extends PhaseManager

class_name AttackChooseManager
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	super._ready()
	_self_phase = BattleManager.Phases.ATTACK_CHOOSE
	battle_manager.choose_ability_sequence.connect(on_choose_ability_sequence)

func on_choose_ability_sequence(ability: AbilitySequence):
	battle_manager.player_sequence = ability
	var random_index = randi_range(0,battle_manager.opponent_monster.ability_sequence_set.size())
	# TODO: add opponent AI choosing ability sequence
	battle_manager.opponent_sequence = battle_manager.opponent_monster.usable_ability_sequences[random_index]
	
	print("opponent attack is ", battle_manager.opponent_sequence.ability_description)
	print("player attack is ", battle_manager.player_sequence.ability_description)

	battle_manager.next_phase()

func _execute_phase():
	pass

func _get_self_phase() -> BattleManager.Phases:
	return BattleManager.Phases.ATTACK_CHOOSE
