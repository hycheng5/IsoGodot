extends Node2D

class_name MonsterContainer

signal new_monster(monster: Monster)

@export var monster: Monster
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_monster(p_monster: Monster):
	monster = p_monster
	new_monster.emit(p_monster)
