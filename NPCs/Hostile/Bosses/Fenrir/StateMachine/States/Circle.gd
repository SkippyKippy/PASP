extends "../Motion.gd"

var count = 30
var radius = 400
var circle

var angle_direction = [-1,1]

var angle_step = 2.0 * PI / count

var rng = RandomNumberGenerator.new()
var angle

export(int) var SPEED = 550

var circle_path = []

onready var path = preload("res://NPCs/Hostile/Bosses/Fenrir/CirclePath.tscn")
onready var barrier = preload("res://NPCs/Hostile/Bosses/Fenrir/Barrier.tscn")

func enter():
	fenrir.get_node("FenrirBody").disabled = true
	rng.randomize()
	angle_step *= angle_direction[randi() % angle_direction.size()]
	angle = rng.randf_range(0 , -PI)
	circle = Game.level.get_node("circle")
	circle.position = fenrir.position
	for i in range(0, count):
		var direction = Vector2(cos(angle), sin(angle))
		var pos = circle.position + direction * radius
		var node = path.instance()
		node.set_position(pos)
		circle.add_child(node)
		circle_path.push_front(node)
		angle += angle_step

func update(_delta):
	if circle_path.size() == 0:
			fenrir.get_node("FenrirBody").disabled = false
			emit_signal("finished", "charge")
	else:
		.move(SPEED, .get_direction(circle_path[0]))
		if fenrir.position.distance_to(circle_path[0].position) <= 5:
				var node = barrier.instance()
				node.set_position(circle_path[0].position)
				Game.level.get_node("barriers").add_child(node)
				circle_path.pop_front()
	






