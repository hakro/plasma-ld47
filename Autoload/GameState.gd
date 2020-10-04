extends Node

var planet_health : int
var ammunitions : int
var available_astronauts : int
var score : int

signal planet_health_changed
signal ammunitions_changed
signal available_astronauts_changed
signal score_changed
signal game_over

func _ready():
	reset_game()

func reset_game():
	planet_health = 10
	ammunitions = 10
	available_astronauts = 7
	score = 0

func add_ammunition():
	ammunitions += 1
	emit_signal("ammunitions_changed")

func remove_ammunition():
	ammunitions -= 1
	emit_signal("ammunitions_changed")

func remove_astronaut():
	available_astronauts -= 1
	emit_signal("available_astronauts_changed")

func remove_health(health):
	planet_health -= health
	emit_signal("planet_health_changed")
	if planet_health <= 0:
		game_over()

func add_score(added_score : int = 100):
	score += added_score
	emit_signal("score_changed")

func game_over():
	emit_signal("game_over")
