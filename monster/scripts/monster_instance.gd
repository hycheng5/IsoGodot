extends Node

# Instance of monsters
class_name MonsterInstance

const MAX_ABILITIES: int = 4
var cur_health: int
var cur_attack: int
var cur_speed: int

@export var monster_data: Monster

# duplicated ability resources that the monster can use
var usable_ability_sequences: Array[AbilitySequence]
func _init(p_monster_data: Monster):
	monster_data = p_monster_data
	cur_health = monster_data.health
	cur_attack = monster_data.attack
	cur_speed = monster_data.speed
# Called when the node enters the scene tree for the first time.
func _ready():
	generate_ability_sequences()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_ability_sequences():
	for i in range(0,MAX_ABILITIES):
		var ability_sequence = AbilitySequence.choose_random_sequence(monster_data.ability_sequence_set)
		monster_data.ability_sequence._generate_sequence(
			monster_data.attack_set, 
			monster_data.status_set, 
			monster_data.effect_set)
		usable_ability_sequences.append(ability_sequence)
