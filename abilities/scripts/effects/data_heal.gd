extends Effect

class_name HealEffect

@export var heal_ammount: int

static func _get_name() -> String:
	return "Heal"

# function to apply effect to object
func _apply_effect(battle_manager: BattleManager, target_monster: Monster, source_monster: Monster):
	target_monster.apply_heal(heal_ammount)
