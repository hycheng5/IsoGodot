extends Node2D

@export var dialogue_area: Area2D
@export var dialogue_resource: DialogueResource
@export var current_title: String

@onready var interaction_controller: InteractionController = %InteractionController

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_controller.interacted.connect(on_interact)
	
# when interact is called 
func on_interact(source: Node2D):
	DialogueScene.start(dialogue_resource, "start")
	pass
