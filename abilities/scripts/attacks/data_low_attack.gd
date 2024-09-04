extends Attack

class_name LowAttack

const ATTACK_MODIFIER: int = 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _apply_damage(self_monster: Monster, opponent_monster: Monster):
	var damage = ((self_monster.attack * ATTACK_MODIFIER ) + 2) + randi_range(5,20)
	opponent_monster.apply_damage(floor(damage))

func get_damage_string() -> String:
	return "LOW" 
