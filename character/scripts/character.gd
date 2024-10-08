extends Node2D

class_name Character

#signal to set the rotation of the character
signal set_rotation(rotation: Vector2)

## Walking speed of character
@export var walk_speed: int = 300

# Enumeration for easy direction for character
enum FacingDirection {
	NORTH,
 	SOUTH, 
	EAST, 
	WEST, 
	SOUTH_WEST, 
	SOUTH_EAST, 
	NORTH_WEST, 
	NORTH_EAST
}

const FacingDirectionMap = {
	FacingDirection.NORTH: Vector2(0,-1),
	FacingDirection.SOUTH: Vector2(0,1),
	FacingDirection.SOUTH_WEST: Vector2(-.1,.5),
	FacingDirection.SOUTH_EAST: Vector2(.1,.5),
	FacingDirection.NORTH_WEST: Vector2(-.1,-.5),
	FacingDirection.NORTH_EAST: Vector2(.1,-.5),
	FacingDirection.EAST: Vector2(.1,0),
	FacingDirection.WEST: Vector2(-.1,0)

}
## Value to set where the character is facing
@export var initial_rotation: FacingDirection

func _ready():
	set_rotation.emit(FacingDirectionMap.get(initial_rotation))
