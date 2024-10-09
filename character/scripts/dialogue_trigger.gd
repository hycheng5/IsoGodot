extends Node2D

@export var dialogue_area: Area2D
@export var current_title: String
var dialogue_resource: DialogueResource

@onready var interaction_controller: InteractionController = %InteractionController

# Called when the node enters the scene tree for the first time.
func _ready():
	var npc_character: NpcCharacter = owner as NpcCharacter
	dialogue_resource = npc_character.dialogue_resource
	interaction_controller.interacted.connect(on_interact)
	
# when interact is called 
func on_interact(_source: Node2D):
	DialogueScene.start(dialogue_resource, "start")
	pass
