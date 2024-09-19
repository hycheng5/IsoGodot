extends CharacterBody2D

@export var SPEED = 300
var clickPosition = Vector2()
var targetPosition = Vector2()
# Called when the node enters the scene tree for the first time.

func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("select"):
		clickPosition = get_global_mouse_position()
	if position.distance_to(clickPosition) > 40:
		targetPosition = (clickPosition - position).normalized()
		velocity = targetPosition * SPEED
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	pass
	
