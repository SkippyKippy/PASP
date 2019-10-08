extends KinematicBody2D

var SPEED = 200
var motion = Vector2()

func _physics_process(delta):
	motion.x = 0
	motion.y = 0
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	
	if Input.is_action_pressed("ui_up"):
		motion.y = -SPEED
	
	if Input.is_action_pressed("ui_down"):
		motion.y = SPEED
		
	move_and_slide(motion)
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
