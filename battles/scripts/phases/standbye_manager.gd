extends PhaseManager

class_name StandbyeManager
@export var timer: Timer
@export var wait_time: int = 3
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_phase_change(phase: BattleManager.Phases):
	# wait for n seconds
	if(phase == BattleManager.Phases.STANDBYE):
		timer.start()

func _on_timer_timeout():
	battle_manager.next_phase()
