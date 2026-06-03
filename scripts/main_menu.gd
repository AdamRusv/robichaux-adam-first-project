extends Control

@export var playButton : Button
@export var quitButton : Button

func _ready() -> void:
	_set_connections()
func _set_connections():
	playButton.pressed.connect(_play)
	quitButton.pressed.connect(_quit)

#- - -
func _play():
	get_tree().change_scene_to_file("res://scenes/level_01.tscn")

func _quit():
	GameManager._quit()
