extends Node2D

class_name ClickController

@onready var character_movement: CharacterMovement = %CharacterMovement
var click_position = Vector2()
# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	if Input.is_action_pressed("select"):
		click_position = get_global_mouse_position()
		character_movement.chosen_position = click_position
