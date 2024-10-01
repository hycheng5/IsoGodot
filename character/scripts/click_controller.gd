extends Node2D

class_name ClickController

@export var debug: bool = false
@onready var character_movement: CharacterMovement = %MovementController
@onready var click_area: Area2D = %ClickArea2D

var click_position = Vector2()
var debug_scene = preload("res://debug/debug_point.tscn")


func _physics_process(delta):
	# Area position needs to be offset since it's within the character node
	click_area.position = owner.get_global_mouse_position() - global_position
	if Input.is_action_pressed("select"):
		# You have to get the root global mouse position or else the player offset 
		# will mess up the position
		click_position = owner.get_global_mouse_position() 
		character_movement.chosen_position = click_position
		
		# check if any of the overlapping nodes have the InteractionController class
		for overlap_node: Node2D in click_area.get_overlapping_areas():
			for child in overlap_node.owner.get_children():
				if child is InteractionController:
					child.interact(self)
					return true
		if(debug):
			var debug_instance: Node2D = debug_scene.instantiate()
			debug_instance.position = click_position
			get_tree().root.add_child(debug_instance)
