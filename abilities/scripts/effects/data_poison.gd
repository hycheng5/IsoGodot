extends PeriodicEffect

class_name PoisonEffect

@export var damage_percent: int

func _periodic_effect(battle_manager: BattleManager, target_monster: Monster, source_monster: Monster):
	super._periodic_effect(battle_manager, target_monster, source_monster)
	var damage = damage_percent * .01 * target_monster.max_health + 1
	target_monster.apply_damage(damage)

static func _get_name() -> String:
	return "Poison"
