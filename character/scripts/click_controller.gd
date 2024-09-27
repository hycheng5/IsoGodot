extends Node2D

class_name ClickController

@export var debug: bool = false
@onready var character_movement: CharacterMovement = %MovementController
@onready var click_area: Area2D = %ClickArea2D

var root: Node2D
var click_position = Vector2()
var debug_scene = preload("res://debug/debug_point.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO: Figure out other ways around this!!! I don't want to have raw strings!
	root = get_node("/root/World")

func _physics_process(delta):
	# Area position needs to be offset since it's within the character node
	click_area.position = root.get_global_mouse_position() - get_parent().position
	if Input.is_action_pressed("select"):
		# You have to get the root global mouse position or else the player offset 
		# will mess up the position
		click_position = root.get_global_mouse_position() 
		character_movement.chosen_position = click_position
		for overlap_node: Node2D in click_area.get_overlapping_areas():
			pass
		if(debug):
			var debug_instance: Node2D = debug_scene.instantiate()
			debug_instance.position = click_position
			get_tree().root.add_child(debug_instance)
