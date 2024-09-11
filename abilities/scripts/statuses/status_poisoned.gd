extends Status

class_name StatusPoisoned

# Checks the target monster's effect lists and sees if they're poisoned
func _check_status(battle_manager: BattleManager, target_monster: Monster, source_monster: Monster) -> bool:
	for effect in target_monster._applied_periodic_effects:
		if effect is PoisonEffect:
			return true
	return false


func _get_name() -> String:
	return "Poisoned"
