extends Attack

class_name HighAttack

const ATTACK_MODIFIER: int = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _apply_damage(self_monster: Monster, opponent_monster: Monster):
	var damage = ((self_monster.attack * ATTACK_MODIFIER ) + 2) + randi_range(5,20)
	opponent_monster.apply_damage(floor(damage))

func get_damage_string() -> String:
	return "HIGH" 
