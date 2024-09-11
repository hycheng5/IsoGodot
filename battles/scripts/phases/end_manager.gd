extends PhaseManager

func _ready():
	super._ready()
	_self_phase = BattleManager.Phases.END

func _execute_phase():
	# execute effects for each player monster
	# this is an issue!!! how can I represent end of turn poison!!!
	for effects in battle_manager.player_monster._applied_periodic_effects:
		effects._periodic_effect(
			battle_manager, 
			battle_manager.player_monster, 
			battle_manager.opponent_monster
		)
	
	# Apply any effects for the opponent monster
	for effects in battle_manager.opponent_monster._applied_periodic_effects:
		effects._periodic_effect(
			battle_manager, 
			battle_manager.opponent_monster, 
			battle_manager.player_monster
		)
	
	# checks if either monster has 0 health if so then the battle will end
	if(battle_manager.player_monster.health == 0 || 
	battle_manager.opponent_monster.health == 0):
		battle_manager.battle_end()
	
	# continue to next turn
	battle_manager.next_phase()
func _get_self_phase() -> BattleManager.Phases:
	return BattleManager.Phases.END
