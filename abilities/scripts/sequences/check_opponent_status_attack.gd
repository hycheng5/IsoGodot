extends AbilitySequence

# Checks if status is applied to opponent monster if true then execute attack
class_name CheckOpponentStatusAttack

var status: Status
var attack: Attack
# This will create a a new sequence
func _generate_sequence(attacks: Array[Attack], statuses: Array[Status], effects: Array[Effect]):
	status = Ability.choose_random_ability(statuses)
	attack = Ability.choose_random_ability(attacks)
# Battle manager will execute this sequence 
func _execute_sequence(battle_manager: BattleManager, self_monster: Monster, opponent_monster: Monster):
	# Checks if status is true if so then apply attack
	if(status._check_status(battle_manager, opponent_monster, self_monster)):
		attack._apply_damage(opponent_monster, self_monster)
	else:
		print("Status check is false!")

func _get_description()->String: 
	return "Deal %s damage to opposing monster if %s is applied" % [attack.get_damage_string(), status._get_name()]
