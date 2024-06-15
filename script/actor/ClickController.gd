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
	
	if Input.is_action_pressed("move"):
		clickPosition = get_global_mouse_position()
	if position.distance_to(clickPosition) > 50:
		targetPosition = (clickPosition - position).normalized()
		velocity = targetPosition * SPEED
		move_and_slide()
	pass
	
