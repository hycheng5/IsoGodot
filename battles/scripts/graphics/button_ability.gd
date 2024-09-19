extends Button

class_name ButtonAbility
var ability_sequence: AbilitySequence
@export var battle_manager: BattleManager

@export var select_theme: Theme
@export var cycle_theme: Theme
var is_cycling: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	is_cycling = false
	battle_manager.enter_cycle.connect(on_enter_cycle)
	battle_manager.exit_cycle.connect(on_exit_cycle)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	if(is_cycling):
		battle_manager.player_monster.ability_sequence_set.erase(ability_sequence)
		var new_ability: AbilitySequence = battle_manager.player_monster.generate_ability()
		battle_manager.player_monster.ability_sequence_set.append(new_ability)
		set_ability(new_ability)
		battle_manager.exit_cycle.emit()
	else:
		battle_manager.choose_ability_sequence.emit(ability_sequence)

func _on_mouse_entered():
	text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	z_index = 1

func _on_mouse_exited():
	text_overrun_behavior = TextServer.OVERRUN_TRIM_CHAR
	z_index = 0

# function for when player wants to cycle an ability 
# should just set a boolean
func on_enter_cycle():
	is_cycling = true
	theme = cycle_theme

func on_exit_cycle():
	is_cycling = false
	theme = select_theme

func set_ability(p_ability_sequence: AbilitySequence):
	text = p_ability_sequence._get_description()
	ability_sequence = p_ability_sequence
