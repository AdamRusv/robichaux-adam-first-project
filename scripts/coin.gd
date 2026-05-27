extends Area2D

func _ready() -> void:
	_set_connections()
func _set_connections():
	body_entered.connect(_player_enter)

func _player_enter(body : Node2D):
	if body.is_in_group("Player"):
		GameData._add_one_coin()
		queue_free()
