extends Resource
# this will execute a sequence of abilities which will represent a single 
# action done by the monster
class_name AbilitySequence

# Weight of sequence
@export var weight: int 
@export var name: String
# description of ability that will appear to attack
@export_multiline var ability_description: String = ""
# this function will be overwritten on init it will get the necessary 
# abilities 
func _init():
	pass

# This will create a a new sequence
func _generate_sequence(attacks: Array[Attack], statuses: Array[Status], effects: Array[Effect]):
	pass
# Battle manager will execute this sequence 
func _execute_sequence(battle_manager: BattleManager, self_monster: Monster, opponent_monster: Monster):
	pass

func _get_description()-> String:
	return ""
# Chooses a random sequence and returns a duplicate to prevent root 
# resource manupulation
static func choose_random_sequence(sequence_list: Array) -> AbilitySequence:
	var sum_weight: int = 0
	for sequence in sequence_list:
		sum_weight += sequence.weight
	var choice_val: int = randi_range(0,sum_weight)
	for sequence in sequence_list:
		choice_val -= sequence.weight
		if(choice_val <= 0):
			return sequence.duplicate()
	return null
