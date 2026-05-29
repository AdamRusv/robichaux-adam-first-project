extends Node2D

@export_category("Data")
@export var moveSpeed : int = 20
@export_category("References")
@export var sprite : AnimatedSprite2D
@export var leftRaycast : RayCast2D
@export var rightRaycast : RayCast2D
@export var crushCollider : Area2D

var facingLeft : bool = true

func _ready() -> void:
	_set_connections()
func _set_connections():
	crushCollider.body_entered.connect(_player_enter)

func _physics_process(delta: float) -> void:
	_update_flip()
	
	if facingLeft == true:
		position.x += -moveSpeed * delta
	else:
		position.x += moveSpeed * delta

func _update_flip():
	if leftRaycast.is_colliding():
		var collider : Node2D = leftRaycast.get_collider() as Node2D
		if collider.is_in_group("Player"):
			return
		facingLeft = false
		sprite.flip_h = true
	elif rightRaycast.is_colliding():
		var collider : Node2D = rightRaycast.get_collider() as Node2D
		if collider.is_in_group("Player"):
			return
		facingLeft = true
		sprite.flip_h = false

#- - - - -
var player : PlayerCharacter
func _player_enter(body : Node2D):
	if body.is_in_group("Player"):
		player = body as PlayerCharacter
		queue_free()
