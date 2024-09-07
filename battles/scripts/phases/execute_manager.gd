extends PhaseManager

class_name ExecuteManager

func _on_phase_change(phase: BattleManager.Phases):
	if(phase == BattleManager.Phases.EXECUTE):
		# TODO: add animation execution
		# TODO: add damage calculation
		# TODO: add first attack check
		var player_monster: Monster = battle_manager.player_monster
		var opponent_monster: Monster = battle_manager.opponent_monster
		
		# TODO: add animation and death/status check
		if(player_monster.speed >= opponent_monster.speed):
			battle_manager.player_sequence._execute_sequence(player_monster, opponent_monster)
			if(opponent_monster.health > 0):
				battle_manager.opponent_sequence._execute_sequence(opponent_monster, player_monster)
		else:
			battle_manager.opponent_sequence._execute_sequence(opponent_monster, player_monster)
			if(player_monster.health > 0):
				battle_manager.player_sequence._execute_sequence(player_monster, opponent_monster)
