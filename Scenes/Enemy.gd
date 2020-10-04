extends Area2D

var direction := Vector2()
const SPEED := 25

func _ready():
	var screen_center := get_viewport_rect().size / 2
	direction = (screen_center - position).normalized()
	rotation = direction.angle() + PI / 2

func _process(delta):
	position += direction * SPEED * delta
