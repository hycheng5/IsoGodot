extends AnimationTree

var chracter_body : CharacterBody2D
var character: Character
var parent_node : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	active = true
	parent_node = get_parent()
	character = owner as Character
	if(parent_node is CharacterBody2D):
		chracter_body = parent_node
	else:
		#find the first child node from parent that is character body 2d
		chracter_body = parent_node.find_children("*", "CharacterBody2D")[0]
	character.set_rotation.connect(_on_player_character_set_rotation)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set("parameters/conditions/is_idle", chracter_body.velocity == Vector2.ZERO)
	set("parameters/conditions/is_walking", chracter_body.velocity != Vector2.ZERO)

	if(chracter_body.velocity.normalized() != Vector2.ZERO):
		set("parameters/Idle/blend_position",chracter_body.velocity.normalized())
		set("parameters/Walking/blend_position",chracter_body.velocity.normalized())
	
func _on_player_character_set_rotation(rotation):
	set("parameters/Idle/blend_position",rotation)
