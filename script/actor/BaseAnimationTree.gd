extends AnimationTree

var playerMovement : CharacterBody2D
var parentNode : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	active = true
	parentNode = get_parent()
	if(parentNode is CharacterBody2D):
		playerMovement = parentNode
	else:
		#find the first child node from parent that is character body 2d
		playerMovement = parentNode.find_children("*", "CharacterBody2D")[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(playerMovement.velocity == Vector2.ZERO):
		set("parameters/conditions/is_idle", true)
		set("parameters/conditions/is_walking", false)
	else:
		set("parameters/conditions/is_idle", false)
		set("parameters/conditions/is_walking", true)
	
	if(playerMovement.velocity.normalized() != Vector2.ZERO):
		set("parameters/Idle/blend_position",playerMovement.velocity.normalized())
		set("parameters/Walking/blend_position",playerMovement.velocity.normalized())

