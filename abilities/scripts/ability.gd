extends Resource

class_name Ability
# this is the weight at which the ability will be selected
@export var weight: int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


static func choose_random_ability(ability_list: Array) -> Ability:
	var sum_weight: int = 0
	for ability in ability_list:
		sum_weight += ability.weight
	var choice_val: int = randi_range(0,sum_weight)
	for ability in ability_list:
		choice_val -= ability.weight
		if(choice_val <= 0):
			return ability
	return null
