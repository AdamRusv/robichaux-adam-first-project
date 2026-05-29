extends Area2D

@export_category("References")
@export var timer : Timer
@export_category("Speed Buff")
@export var healthIncrease : int = 20
@export var duration : float = 2.0

var collected : bool = false

func _ready() -> void:
	_set_connections()
	_set_timer()
func _set_connections():
	body_entered.connect(_player_enter)
	timer.timeout.connect(_remove_bonus_health)
func _set_timer():
	timer.wait_time = duration

var player : PlayerCharacter
func _player_enter(body : Node2D):
	if collected == true:
		return
	
	if body.is_in_group("Player"):
		player = body as PlayerCharacter
		
		_start_health_buff()
		visible = false
		collected = true

func _start_health_buff():
	timer.start()
	
	if player.has_meta("FruitHealthBuff") == false:
		player.bonusHealth += healthIncrease
		player._heal(healthIncrease)
	
	player.set_meta("FruitHealthBuff", true)
func _remove_bonus_health():
	if player.has_meta("FruitHealthBuff"):
		player.bonusHealth -= healthIncrease
		player.remove_meta("FruitHealthBuff")
	queue_free()
