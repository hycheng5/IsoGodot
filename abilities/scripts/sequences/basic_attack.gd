extends AbilitySequence

# This is the basic attack it should do nothing more than do a simple attack
class_name SequenceBasicAttack
@export var attack: Attack

func _generate_sequence(attacks: Array[Attack], statuses: Array[Status], effects: Array[Effect]):
	attack = Ability.choose_random_ability(attacks)
	ability_description = "Deal %s damage to opposing monster" % attack.get_damage_string()

func _execute_sequence(battle_manager: BattleManager, self_monster: Monster, opponent_monster: Monster):
	attack._apply_damage(opponent_monster, self_monster)
	print(opponent_monster.name,": health is now")
	print(opponent_monster.health)
	
func _get_description()->String: 
	return "Deal %s damage to opposing monster" % attack.get_damage_string()
