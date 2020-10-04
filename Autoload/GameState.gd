extends Node

var planet_health : int
var ammunitions : int
var available_astronauts : int

signal planet_health_changed
signal ammunitions_changed
signal available_astronauts_changed

func _ready():
	reset_game()

func reset_game():
	planet_health = 100
	ammunitions = 10
	available_astronauts = 7

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
