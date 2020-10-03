extends KinematicBody2D

onready var anim : AnimationPlayer = $AnimationPlayer

var direction := Vector2()
var speed := 20.0
var collision_info

func _ready():
	anim.play("wiggle")

func _process(delta):
	collision_info = move_and_collide(direction * speed * delta)
	if collision_info:
		direction = direction.bounce(collision_info.normal)
	rotate(2 * delta)

