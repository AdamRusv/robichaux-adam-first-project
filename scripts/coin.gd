extends Area2D

@export_category("References")
@export var timer : Timer
@export var soundRef : AudioStreamPlayer
@export_category("Speed Buff")
@export var speedIncrease : int = 20
@export var duration : float = 2.0

var collected : bool = false

func _ready() -> void:
	_set_connections()
	_set_timer()
func _set_connections():
	body_entered.connect(_player_enter)
	timer.timeout.connect(_remove_collected_coin)
func _set_timer():
	timer.wait_time = duration

var player : PlayerCharacter
func _player_enter(body : Node2D):
	if collected == true:
		return
	
	if body.is_in_group("Player"):
		player = body as PlayerCharacter
		soundRef.play()
		GameData._add_one_coin()
		
		_start_speed_buff()
		visible = false
		collected = true

func _start_speed_buff():
	timer.start()
	
	if player.has_meta("CoinSpeedBuff") == false:
		player.bonusSpeed += speedIncrease
	
	player.set_meta("CoinSpeedBuff", true)
func _remove_collected_coin():
	if player.has_meta("CoinSpeedBuff"):
		player.bonusSpeed -= speedIncrease
		player.remove_meta("CoinSpeedBuff")
	queue_free()
