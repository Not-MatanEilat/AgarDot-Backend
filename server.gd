extends Node

var players = []

var peer = ENetMultiplayerPeer.new()
const PORT = 1335
	
func start_server(): 
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(player_connected) 
	multiplayer.peer_disconnected.connect(player_disconnected) 
	
	print("Server started")
	
func player_connected(id):
	print("Player: " + str(id) + " connected")
	players.append(id)
	
func player_disconnected(id):
	print("Player: " + str(id) + " disconnected")
	players.erase(id)
	
@rpc("call_remote")
func add_dot(dot_data):
	pass

