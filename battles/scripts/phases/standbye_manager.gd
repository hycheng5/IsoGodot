extends PhaseManager

class_name StandbyeManager
@export var timer: Timer
@export var wait_time: int = 3

@export var statuses: Array[Status]

func _ready():
	super._ready()
	_self_phase = BattleManager.Phases.STANDBYE

func _execute_phase():
	timer.start()

func _on_timer_timeout():
	battle_manager.next_phase()

func _get_self_phase() -> BattleManager.Phases:
	return BattleManager.Phases.STANDBYE
