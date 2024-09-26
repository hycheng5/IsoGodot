extends CharacterBody2D

class_name CharacterMovement
@export var SPEED = 300
@onready var camera: Camera2D = %Camera2D
var debug_scene = preload("res://debug/debug_point.tscn")
var chosen_position: Vector2:
	get:
		return chosen_position
	set (p_chosen_position):
		# Sets chosen position but also offset's the chosen position
		chosen_position = p_chosen_position - get_parent().position

var target_position = Vector2()

# Called when the node enters the scene tree for the first time.

func _ready():
	# added this so that the position is just wherever the player is placed if 
	# this isn't set it'll try to go to 0,0,0
	target_position = get_parent().position
	pass

func _physics_process(delta):
	if position.distance_to(chosen_position) > 40:
		target_position = (chosen_position - position).normalized()
		velocity = target_position * SPEED
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	pass
