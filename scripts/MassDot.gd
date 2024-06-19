extends Node2D
class_name MassDot

@export var mass: int = 5
var id: int

func _ready():
	id = get_instance_id()
