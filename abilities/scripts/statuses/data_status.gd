extends Ability

class_name Status

@export var name: String

# not sure if needed but will allow you to check if the monster
# has a specific status
func _check_status():
	pass
# this will be called on status checks 
func _apply_status():
	pass
