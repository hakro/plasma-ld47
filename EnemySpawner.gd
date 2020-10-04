extends Node2D

onready var enemy_scene : PackedScene = preload("res://Scenes/Enemy.tscn")
onready var spawn_timer : Timer = $SpawnTimer
const spawn_chance := 0.1

func _on_SpawnTimer_timeout():
	if randf() <= spawn_chance:
		var enemy = enemy_scene.instance()
		enemy.position = position
		get_tree().current_scene.add_child(enemy)
