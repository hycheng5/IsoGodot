extends PhaseManager

class_name AttackChooseManager
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	super._ready()
	battle_manager.choose_ability_sequence.connect(on_choose_ability_sequence)

func _process(delta):
	pass

func _on_phase_change(phase: BattleManager.Phases):
	pass

func on_choose_ability_sequence(ability: AbilitySequence):
	ability._execute_sequence(battle_manager.player_monster, battle_manager.opponent_monster)
