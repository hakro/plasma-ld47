extends Node

var planet_health := 100
var ammunitions := 10
var available_astronauts := 7

signal planet_health_changed
signal ammunitions_changed
signal available_astronauts_changed

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
