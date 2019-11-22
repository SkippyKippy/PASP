extends Node

var id = 0
var time = 0.5

func _on_Area2D_area_entered(area):
	if area.is_in_group("hurtbox"):
		area.take_damage()

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("idle")
	PlayerVar.player.anim_finished = true