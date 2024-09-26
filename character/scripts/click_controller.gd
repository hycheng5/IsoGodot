extends Node2D

class_name ClickController

@export var SPEED = 300
@onready var camera: Camera2D = %Camera2D
var debug_scene = preload("res://debug/debug_point.tscn")
var clickPosition = Vector2()
var targetPosition = Vector2()
# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	if Input.is_action_pressed("select"):
		clickPosition = get_global_mouse_position()
		var debug_instance:Node2D = debug_scene.instantiate()
		add_child(debug_instance)
		debug_instance.position = (clickPosition - position)
