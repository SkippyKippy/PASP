extends Node

onready var player = preload("res://Player/Player.tscn")

func _ready():
	SignalManager.emit_signal("scene_loaded")
	player = player.instance()
	player.set_global_position(Vector2(0, -500))
	Game.world.add_child(player)
	