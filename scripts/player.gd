extends CharacterBody2D

class_name PlayerCharacter

const SPEED : int = 130
const JUMP_VELOCITY : int = -300

func _ready() -> void:
	add_to_group("Player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor() == false:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction : float = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
