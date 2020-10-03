extends Area2D

onready var pivot : Position2D = $Pivot
onready var shuttle : Sprite =  $Pivot/Sprite
const astronaut_scene : PackedScene = preload("res://Scenes/Astronaut.tscn")
var rotation_speed : float = 3

func _process(delta):
	if Input.is_action_pressed("move_right"):
		pivot.rotate(delta * rotation_speed)
	if Input.is_action_pressed("move_left"):
		pivot.rotate(delta * rotation_speed * -1)

func _input(event):
	if event.is_action_pressed("launch_astronaut"):
		launch_astronaut()

func launch_astronaut():
	var astro = astronaut_scene.instance()
	astro.position = shuttle.global_position
	astro.direction = (pivot.global_position - shuttle.global_position).normalized()
	get_tree().current_scene.add_child(astro)
