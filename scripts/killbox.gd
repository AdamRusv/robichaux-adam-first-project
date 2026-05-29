extends Area2D

func _ready() -> void:
	_set_connections()
func _set_connections():
	body_entered.connect(_player_enter)

var player : PlayerCharacter
func _player_enter(body : Node2D):
	if body.is_in_group("Player"):
		player = body as PlayerCharacter
		get_tree().reload_current_scene()
