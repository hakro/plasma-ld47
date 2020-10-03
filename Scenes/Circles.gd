extends Node2D

onready var inner_circle : Sprite = $InnerCircle
onready var outer_cicrle : Sprite = $OuterCircle

func _process(delta):
	inner_circle.rotate(delta * 2)
	outer_cicrle.rotate(- delta * 1)
