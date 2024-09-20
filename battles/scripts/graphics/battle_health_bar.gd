extends ProgressBar

class_name HealthBar

@export var monster_container: MonsterContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	monster_container.new_monster.connect(on_new_monster)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_new_monster(monster: Monster):
	monster.monster_health_change.connect(on_monster_damage)
	max_value = monster.max_health
	value = monster.health

func on_monster_damage(monster: Monster, new_health: int):
	max_value = monster.max_health
	value = monster.health
	
