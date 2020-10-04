extends Node2D

onready var health_label : Label = $HUD/HealthLabel
onready var astronauts_label : Label = $HUD/AstronautsLabel
onready var ammunitions_label : Label = $HUD/AmmunitionsLabel
onready var game_over_panel : Panel = $GameOver

func _ready():
	health_label.text = str(GameState.planet_health)
	astronauts_label.text = str(GameState.available_astronauts)
	ammunitions_label.text = str(GameState.ammunitions)
	
	GameState.connect("planet_health_changed", self, "on_planet_health_changed")
	GameState.connect("available_astronauts_changed", self, "on_available_astronauts_changed")
	GameState.connect("ammunitions_changed", self, "on_ammunitions_changed")
	GameState.connect("game_over", self, "on_game_over")

func on_planet_health_changed():
	health_label.text = str(GameState.planet_health)

func on_available_astronauts_changed():
	astronauts_label.text = str(GameState.available_astronauts)

func on_ammunitions_changed():
	ammunitions_label.text = str(GameState.ammunitions)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_BackToMenu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

func on_game_over():
	game_over_panel.show()
	set_pause_mode(PAUSE_MODE_STOP)
