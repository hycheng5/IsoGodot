extends Button

class_name CycleButton

@export var battle_manager: BattleManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# When this button is pressed the cycle state is emitted
func _pressed():
	battle_manager.enter_cycle.emit()
	print("Entered Cycle State!")
