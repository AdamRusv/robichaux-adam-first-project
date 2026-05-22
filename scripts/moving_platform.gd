extends Node2D

@export var animationPlayer : AnimationPlayer
@export var endPos : float ##relative

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationPlayer.get_animation(animationPlayer.current_animation)\
	.track_set_key_value(0, 3, endPos)
	
	animationPlayer.get_animation(animationPlayer.current_animation)\
	.track_set_key_value(0, 2, endPos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(get_child(0).position.x)
