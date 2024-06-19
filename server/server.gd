extends Node

var peer = ENetMultiplayerPeer.new()
const PORT = 1335
	
var game: Game

func start_server(): 
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(player_connected) 
	multiplayer.peer_disconnected.connect(player_disconnected) 
	
	print("Server started")
	
func player_connected(id):
	print("Player: " + str(id) + " connected")
	game.add_player(str(id))
	
func player_disconnected(id):
	print("Player: " + str(id) + " disconnected")
	game.remove_player(str(id))
	
func player_eat_dot(player_name, dot_id, mass):
	add_mass.rpc_id(player_name.to_int(), mass)
	game.delete_dot(dot_id)

@rpc("call_remote", "reliable")
func add_mass(mass_to_add):
	pass

