extends Attack

class_name LowAttack

const ATTACK_MODIFIER: int = 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _apply_damage(target_monster: Monster, source_monster: Monster):
	var damage = ((source_monster.attack * ATTACK_MODIFIER ) + 2) + randi_range(5,20)
	target_monster.apply_damage(floor(damage))

func get_damage_string() -> String:
	return "LOW" 
