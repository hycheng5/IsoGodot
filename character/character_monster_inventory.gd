extends Resource

class_name CharacterMonsterInventory

@export var monster_list : Array[Monster]

# calls ready function from each monster
# TODO: somewhere add a check to see if monster list is already initialized
func ready():
	for monster in monster_list:
		monster.ready()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
