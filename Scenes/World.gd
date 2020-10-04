extends Node2D

onready var health_label : Label = $HUD/HealthLabel
onready var astronauts_label : Label = $HUD/AstronautsLabel
onready var ammunitions_label : Label = $HUD/AmmunitionsLabel

func _ready():
	health_label.text = str(GameState.planet_health)
	astronauts_label.text = str(GameState.available_astronauts)
	ammunitions_label.text = str(GameState.ammunitions)
	
	GameState.connect("planet_health_changed", self, "on_planet_health_changed")
	GameState.connect("available_astronauts_changed", self, "on_available_astronauts_changed")
	GameState.connect("ammunitions_changed", self, "on_ammunitions_changed")

func on_planet_health_changed():
	health_label.text = str(GameState.planet_health)

func on_available_astronauts_changed():
	astronauts_label.text = str(GameState.available_astronauts)

func on_ammunitions_changed():
	ammunitions_label.text = str(GameState.ammunitions)
