extends Node

#references
var coinCounterText : RichTextLabel

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Quit Game"):
		_quit()

func _quit():
	get_tree().quit()
