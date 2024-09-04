extends Resource

class_name AbilitySequence
# this will execute a sequence of abilities which will represent a single 
# action done by the monster

# description of ability that will appear to attack
var ability_description: String = ""

# this function will be overwritten on init it will get the necessary 
# abilities 
func _init():
	pass

# This will create a a new sequence
func _generate_sequence(attacks: Array[Attack], statuses: Array[Status], effects: Array[Effect]):
	pass
# Battle manager will execute this sequence 
func _execute_sequence(self_monster: Monster, opponent_monster: Monster):
	pass

# Chooses a random sequence and returns a duplicate to prevent root 
# resource manupulation
static func choose_random_sequence(sequence_list: Array) -> AbilitySequence:
	if(sequence_list.size() == 0):
		assert("ERROR: sequence list must be greater than 0!")
		return null
	var index: int = randi_range(0, sequence_list.size()-1)
	return sequence_list[index].duplicate()
