extends Node

var player

var previous_weapon_id
var current_weapon_id
var temp_id

var charge_ranged

var scent_visible = false

var damage

var facing_forward

var is_vulnerable = true

func _ready():
	_scene_changed()
	SignalManager.connect("scene_changed", self, "_scene_changed")

func _scene_changed():
	player = get_tree().get_current_scene().get_node("World").get_node("Player")