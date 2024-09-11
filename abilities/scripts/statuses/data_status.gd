extends Ability

class_name Status

@export var name: String

# not sure if needed but will allow you to check if the monster
# has a specific status
func _check_status(battle_manager: BattleManager, target_monster: Monster, source_monster: Monster) -> bool:
	return false

func _get_name() -> String:
	return ""
