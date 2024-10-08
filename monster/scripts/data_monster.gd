extends Resource

class_name Monster

signal monster_health_change(monster: Monster, new_health: int)

@export var name: String

# monster stats
@export var health: int
@export var max_health: int
@export var attack: int
@export var speed: int

# set of available abilities that a ability sequence can get 
# from this monster
@export var attack_set: Array[Attack]
@export var status_set: Array[Status]
@export var effect_set: Array[Effect]

@export var monster_frames: SpriteFrames

@export var max_abilities: int = 4

# List of potential ability sequences
@export var ability_sequence_set: Array[AbilitySequence]

# List of available ability sequences to use 
var usable_ability_sequences: Array[AbilitySequence]

# list of statuses that are currently applied to the monster 
var _applied_periodic_effects: Array[PeriodicEffect]

func _init():
	resource_local_to_scene = true
	pass
# Use this function to apply damage don't directly change the health attribute
func apply_damage(damage: int):
	health -= damage
	if(health < 0):
		health = 0
	monster_health_change.emit(self, health)

func apply_heal(heal_ammount: int):
	health += heal_ammount
	if(health > max_health):
		health = max_health
	monster_health_change.emit(self, health)

		
# Creates a list of usable ability sequences and other initializations
# NOTE: since this is a resource this must be called manually!
func ready():
	for i in range(0,max_abilities):
		var ability_sequence = generate_ability()
		print(ability_sequence.ability_description)
		print(name)
		usable_ability_sequences.append(ability_sequence)

	for ability in usable_ability_sequences:
		print(ability.ability_description)

func generate_ability() -> AbilitySequence:
	var ability_sequence = AbilitySequence.choose_random_sequence(ability_sequence_set)
	ability_sequence._generate_sequence(attack_set, status_set, effect_set)
	return ability_sequence
