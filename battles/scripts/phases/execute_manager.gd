extends PhaseManager

class_name ExecuteManager

func _ready():
	super._ready()
	_self_phase = BattleManager.Phases.EXECUTE

func _execute_phase():
	# TODO: add animation execution
	# TODO: add damage calculation
	# TODO: add first attack check
	var player_monster: Monster = battle_manager.player_monster
	var opponent_monster: Monster = battle_manager.opponent_monster
		
	# TODO: add animation and death/status check
	if(player_monster.speed >= opponent_monster.speed):
		battle_manager.player_sequence._execute_sequence(battle_manager,player_monster, opponent_monster)
		if(opponent_monster.health > 0):
			battle_manager.opponent_sequence._execute_sequence(battle_manager, opponent_monster, player_monster)
	else:
		battle_manager.opponent_sequence._execute_sequence(battle_manager, opponent_monster, player_monster)
		if(player_monster.health > 0):
			battle_manager.player_sequence._execute_sequence(battle_manager, player_monster, opponent_monster)
	
	battle_manager.next_phase()

func _get_self_phase() -> BattleManager.Phases:
	return BattleManager.Phases.EXECUTE
