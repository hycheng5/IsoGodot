extends Node2D

@export var dialogue_controller: DialogueController
@export var dialogue_resource: DialogueResource
# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue_controller.start(dialogue_resource, "this_is_a_node_title")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
