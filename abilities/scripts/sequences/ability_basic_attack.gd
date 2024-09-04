extends AbilitySequence

# This is the basic attack it should do nothing more than do a simple attack
class_name SequenceBasicAttack
var attack: Attack

func _generate_sequence(attacks: Array[Attack], statuses: Array[Status], effects: Array[Effect]):
	attack = Ability.choose_random_ability(attacks)
	ability_description = "Deal %s damage to opposing monster" % attack.get_damage_string()

func _execute_sequence(self_monster: Monster, opponent_monster: Monster):
	attack._apply_damage(self_monster, opponent_monster)
