extends CharacterBody2D
@export var debug: bool
@export var SPEED = 300
@onready var camera: Camera2D = %Camera2D
var debug_scene = preload("res://debug/debug_point.tscn")
var clickPosition = Vector2()
var targetPosition = Vector2()
# Called when the node enters the scene tree for the first time.

func _ready():
	# added this so that the position is just wherever the player is placed if 
	# this isn't set it'll try to go to 0,0,0
	clickPosition = position
	targetPosition = position
	#
#func _input(event):
	#if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.position)
		#var debug_instance:Node2D = debug_scene.instantiate()
		#add_child(debug_instance)
		#debug_instance.position = event.position
		
func _physics_process(delta):
	if Input.is_action_pressed("select"):
		clickPosition = get_global_mouse_position()
		if(debug):
			var debug_instance:Node2D = debug_scene.instantiate()
			add_child(debug_instance)
			debug_instance.position = (clickPosition - position)
		
	if position.distance_to(clickPosition) > 40:
		targetPosition = (clickPosition - position).normalized()
		velocity = targetPosition * SPEED
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	pass
	
