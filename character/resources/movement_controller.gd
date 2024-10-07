extends Node

class_name CharacterMovement
@export var SPEED = 300

# Character body of the character
@export var character_body: CharacterBody2D

@onready var camera: Camera2D = %Camera2D
@onready var navigation_agent: NavigationAgent2D = %NavigationAgent2D
var chosen_position: Vector2:
	get:
		return chosen_position
	set (p_chosen_position):
		# Sets chosen position but also offset's the chosen position
		chosen_position = p_chosen_position

var target_position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.pause_characters.connect(on_pause_characters)
	# added this so that the position is just wherever the player is placed if 
	# this isn't set it'll try to go to 0,0,0
	target_position = character_body.position
	chosen_position = character_body.position
	pass

func _physics_process(delta):
	if character_body.position.distance_to(chosen_position) > 40:
		navigation_agent.target_position = chosen_position

		target_position = (navigation_agent.get_next_path_position() - character_body.position).normalized()
		character_body.velocity = target_position * SPEED
		character_body.move_and_slide()
	else:
		character_body.velocity = Vector2.ZERO
	pass

func on_pause_characters():
	character_body.velocity = Vector2.ZERO
