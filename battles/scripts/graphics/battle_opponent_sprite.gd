extends AnimatedSprite2D

var battle_manager: BattleManager
# Called when the node enters the scene tree for the first time.
func _ready():
	battle_manager = find_parent("BattleRoot")
	battle_manager.new_opponent_monster.connect(on_new_opponent_monster)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_new_opponent_monster(new_monster: Monster):
	sprite_frames = new_monster.monster_frames
	play("default")
