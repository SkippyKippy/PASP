extends KinematicBody2D

func get_angle_to_player():
	return get_angle_to(PlayerVar.player.get_global_position()) + self.get_rotation()

func _on_FindArea_body_entered(body):
	if body.get_name() == "Player":
		SignalManager.emit_signal("player_found")