extends CharacterBody2D

@export var speed = 200
@export var dead_zone = 10.0
var mouse_position = null

@export var starting_mass: int = 10
var mass = starting_mass
const MASS_TO_SCALE_RATE: float = 0.10

func _enter_tree():
	set_multiplayer_authority(name.to_int())
	scale = Vector2(starting_mass * MASS_TO_SCALE_RATE, starting_mass * MASS_TO_SCALE_RATE)

func eat_mass_dot(mass_dot):
	var mass_of_dot = mass_dot.mass
	add_mass(mass_of_dot)
	
func add_mass(mass_to_add):
	mass += mass_to_add
	scale = Vector2(mass * MASS_TO_SCALE_RATE, mass * MASS_TO_SCALE_RATE)
	global_position.x -= (mass_to_add * 5)
	global_position.y -= (mass_to_add * 5)


func _on_area_2d_area_entered(area):
	var node = area.get_parent()
	if node.is_in_group("MassDots"):
		eat_mass_dot(node)
		Server.player_eat_dot(name, node.id, node.mass)
