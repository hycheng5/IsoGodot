extends Ability

class_name Effect
# This is the resource for an effect class
# the effect class is primarily used to apply statuses

# function to apply effect to object
func _apply_effect(battle_manager: BattleManager, target_monster: Monster, source_monster: Monster):
	pass

static func _get_name() -> String:
	return ""
