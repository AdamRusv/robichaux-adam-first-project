extends CharacterBody2D

class_name PlayerCharacter

@export_category("Data")
@export var baseHealth : int = 100
@export var baseSpeed : int = 130
@export var jumpVelocity : int = -300
@export_category("References")
@export var sprite : AnimatedSprite2D

var currentHealth : int
var bonusHealth : int = 0
var bonusSpeed : int = 0

func _ready() -> void:
	add_to_group("Player")
	
	currentHealth = baseHealth

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor() == false:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = jumpVelocity

	# Get the input direction and handle the movement/deceleration.
	var direction : float = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * (baseSpeed + bonusSpeed)
		
		if direction < 0:
			sprite.flip_h = true
		elif direction > 0:
			sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, (baseSpeed + bonusSpeed))

	move_and_slide()

#- - - - - -

func _heal(healedHealth : int):
	var newHealth : int = currentHealth + healedHealth
	
	if newHealth > currentHealth:
		currentHealth = baseHealth + bonusHealth
	else:
		currentHealth = newHealth + bonusHealth
