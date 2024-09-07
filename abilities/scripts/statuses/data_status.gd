extends Ability

class_name Status

@export var name: String

# not sure if needed but will allow you to check if the monster
# has a specific status
func _check_status():
	pass

func _get_status_description() -> String:
	return ""
# this will be called on status checks 
func _apply_status(self_monster: Monster, opponent_monster: Monster):
	pass
