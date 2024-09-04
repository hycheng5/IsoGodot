extends Node

class_name BattleManager

signal change_phase(new_phase : Phases)
signal new_player_monster(new_monster: Monster)
signal new_opponent_monster(new_monster: Monster)
signal choose_ability_sequence(ability: AbilitySequence)

@export var player_monster_inventory: CharacterMonsterInventory
@export var opponent_monster_inventory: CharacterMonsterInventory

@export var player_monster: Monster
@export var opponent_monster: Monster

enum Phases{STANDBYE, ATTACK_CHOOSE, ATTACK_ANIMATION, STATUS, END}

var phase_index = 0
const phase_order: Array[Phases] = [
		Phases.STANDBYE,
		Phases.ATTACK_CHOOSE, 
		Phases.ATTACK_ANIMATION, 
		Phases.STATUS, 
		Phases.END
		]

const phase_names = {
	Phases.STANDBYE: "Standby",
	Phases.ATTACK_CHOOSE: "Attack Choose",
	Phases.ATTACK_ANIMATION: "Attack Animation",
	Phases.STATUS: "Status",
	Phases.END: "End"
}
var current_phase: Phases

func _init():
	pass
# Called when the node enters the scene tree for the first time.

func _ready():
	change_phase.emit(phase_order[phase_index])
	
	# initialize monsters to ready state if needed
	# TODO: we do this because the monsters haven't been instantiated hopefully
	# later on we can just pass the monsters in the init function
	player_monster.ready()
	opponent_monster.ready()
	
	new_player_monster.emit(player_monster)
	new_opponent_monster.emit(opponent_monster)

# Function to convert enum to string
func phase_to_string(phase: Phases) -> String:
	return phase_names.get(phase, "Unknown Phase")

func next_phase():
	phase_index+=1
	change_phase.emit(phase_order[phase_index])

func select_ability_sequence(ability: AbilitySequence):
	choose_ability_sequence.emit(ability)
	
