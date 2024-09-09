extends Ability

class_name Attack

# function that the game manager will call to apply damage?
func _apply_damage(target_monster: Monster, source_monster: Monster):
	pass
	
func _init():
	pass

func get_damage_string() -> String:
	return ""
