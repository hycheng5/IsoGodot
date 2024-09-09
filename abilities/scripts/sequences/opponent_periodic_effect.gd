extends AbilitySequence

# This will apply a random effect onto an enemy monster
class_name OpponentPeriodicEffect

var effect: Effect

func _generate_sequence(attacks: Array[Attack], statuses: Array[Status], effects: Array[Effect]):
	effect = Ability.choose_random_ability(effects)
	ability_description = "Applies %s damage to opposing monster" % effect._get_name()
	
func _execute_sequence(battle_manager: BattleManager, self_monster: Monster, opponent_monster: Monster):
	effect._apply_effect(battle_manager, opponent_monster, self_monster)
