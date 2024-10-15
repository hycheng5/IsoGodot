extends Node2D

var ListOfMaterials: Array = []

var character: Character
# TODO: maybe add a area2d to detect any objects that are within the radius of the 
# charcter 
func _ready() -> void:
	# acquire all nodes within the "Transparent" group
	var transparent_nodes : Array = get_tree().get_nodes_in_group( "Transparent" )
	for n in transparent_nodes :
		var mat : ShaderMaterial = n.material
		if not mat == null :
			# put their materials into the list
			ListOfMaterials.append( mat )
	character = owner as Character


func _process(_delta):
	var new_position = get_viewport_rect().size * Vector2(.5,.5) 
	print(new_position)
	update_materials_with_position(new_position)

func update_materials_with_position( pos : Vector2 ) -> void:
	for m: ShaderMaterial in ListOfMaterials :
		m.set_shader_parameter( "CircleCentre", pos )
		m.set_shader_parameter("object_z_position", character.global_position.y)
