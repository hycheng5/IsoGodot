extends Status

class_name StatusPoison

@export var poison_damage_percent: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _apply_status(self_monster: Monster, opponent_monster: Monster):
	var damage: int = poison_damage_percent * .01 * self_monster.health
	self_monster.apply_damage(damage)
	
func _get_status_description():
	return "Deal %s damage to monster every turn" % poison_damage_percent
