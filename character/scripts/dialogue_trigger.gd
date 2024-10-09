extends Node2D

@export var dialogue_area: Area2D
@export var current_title: String

@onready var interaction_controller: InteractionController = %InteractionController
var dialogue_resource: DialogueResource
var npc_character: NpcCharacter

# Called when the node enters the scene tree for the first time.
func _ready():
	npc_character = owner as NpcCharacter
	dialogue_resource = npc_character.dialogue_resource
	interaction_controller.interacted.connect(on_interact)
	
# when interact is called 
func on_interact(_source: Node2D):
	print(_source.position)
	var source_position: Vector2 =  _source.position - npc_character.position
	source_position = source_position.normalized()
	
	npc_character.set_rotation.emit(source_position)
	DialogueScene.start(dialogue_resource, "start")
	pass
