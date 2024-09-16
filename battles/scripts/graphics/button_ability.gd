extends Button

class_name ButtonAbility
var ability_sequence: AbilitySequence
var battle_manager: BattleManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	battle_manager.choose_ability_sequence.emit(ability_sequence)

func _on_mouse_entered():
	text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	z_index = 1

func _on_mouse_exited():
	text_overrun_behavior = TextServer.OVERRUN_TRIM_CHAR
	z_index = 0
