extends Node2D

class_name ClickController

@export var debug: bool = false
@onready var character_movement: CharacterMovement = %MovementController
var click_position = Vector2()
var debug_scene = preload("res://debug/debug_point.tscn")

# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	if Input.is_action_pressed("select"):
		click_position = get_global_mouse_position()
		character_movement.chosen_position = click_position
		
		var ray_cast:RayCast2D = RayCast2D.new()
		ray_cast.target_position = click_position
		
		if(debug):
			var debug_instance: Node2D = debug_scene.instantiate()
			debug_instance.position = click_position
			add_child(debug_instance)
