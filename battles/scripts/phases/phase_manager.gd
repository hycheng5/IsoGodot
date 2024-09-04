extends Node

class_name PhaseManager
var battle_manager: BattleManager

# Called when the node enters the scene tree for the first time.
func _ready():
	battle_manager = find_parent("BattleRoot")
	battle_manager.change_phase.connect(_on_phase_change)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
# OVERRIDE
func _on_phase_change(phase: BattleManager.Phases):
	pass
