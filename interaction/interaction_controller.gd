extends Node2D

class_name InteractionController

signal interacted(source: Node2D)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# This will trigger an interact signal
func interact(source: Node2D):
	interacted.emit(source)
