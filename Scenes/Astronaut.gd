extends Area2D

onready var anim : AnimationPlayer = $AnimationPlayer

var direction := Vector2()
var speed := 20.0

func _ready():
	anim.play("wiggle")

func _process(delta):
	position += direction * speed * delta
	rotate(2 * delta)

func _on_Astronaut_area_entered(area):
	print(area)
