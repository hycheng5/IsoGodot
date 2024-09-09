extends Node

class_name PhaseManager
var battle_manager: BattleManager

var _self_phase: BattleManager.Phases
# Called when the node enters the scene tree for the first time.
func _ready():
	battle_manager = find_parent("BattleRoot")
	battle_manager.change_phase.connect(on_phase_change)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _execute_phase():
	pass

func on_phase_change(phase: BattleManager.Phases):
	if(phase == _self_phase):
		_execute_phase()

func _get_self_phase() -> BattleManager.Phases:
	return BattleManager.Phases.NULL
