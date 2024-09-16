extends Effect

# This effect occurs once every turn for n turns
class_name PeriodicEffect

@export var duration: int

# All this should do is just apply effects when execute happens
# This will append a duplicate of this effect for mutability
func _apply_effect(battle_manager: BattleManager, target_monster: Monster, source_monster: Monster):
	target_monster._applied_periodic_effects.append(duplicate())

# All effect is applied on the end turn
func _periodic_effect(battle_manager: BattleManager, self_monster: Monster, opponent_monster: Monster):	
	duration -= 1
	
	# checks if duration is done if so it will remove itself from the effects list	
	if(duration <= 0):
		self_monster._applied_periodic_effects.erase(self)
