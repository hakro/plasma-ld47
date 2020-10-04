extends Node2D

onready var health_label : Label = $HUD/HealthLabel
onready var astronauts_label : Label = $HUD/AstronautsLabel
onready var bullets_label : Label = $HUD/BulletsLabel

func _ready():
	health_label.text = str(GameState.planet_health)
	astronauts_label.text = str(GameState.available_astronauts)
	bullets_label.text = str(GameState.ammunition)
