extends PhaseManager

class_name StandbyeManager
@export var timer: Timer
@export var wait_time: int = 3

@export var statuses: Array[Status]
	
func _on_phase_change(phase: BattleManager.Phases):
	# wait for n seconds
	if(phase == BattleManager.Phases.STANDBYE):
		timer.start()

func _on_timer_timeout():
	battle_manager.next_phase()
