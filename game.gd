extends Node2D
class_name Game

var players = {}

@export var DOTS_ON_START = 2

var dots = {}
@export var player_scene: PackedScene
@export var dot_scene: PackedScene

func _ready():
	
	Server.game = self
	
	Server.start_server()
	# on start create 100 dots for the game
	generate_mass_dots(DOTS_ON_START)

	

func generate_mass_dots(amount):
	for i in range(amount):
		var dot = dot_scene.instantiate()
		dot.position.x = randf_range(0, 550)
		dot.position.y = randf_range(0, 550)
		print(dot.id)
		dot.name = str(dot.get_instance_id())
		
		add_child(dot)
		
		dots[dot.id] = dot

	
	

	
func add_player(name):
	var player = player_scene.instantiate()
	player.name = name
	add_child(player)
	players[name] = player
	
func remove_player(name):
	players[name].queue_free()
	players.erase(name)
	
func delete_dot(dot_id):
	dots[dot_id].queue_free()
	dots.erase(dot_id)
	
func _on_button_pressed():
	generate_mass_dots(1)
