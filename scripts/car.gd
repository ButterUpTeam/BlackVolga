extends CharacterBody2D

@export var MAX_SPEED = 200.0
@export var ACCELEARTION = 1000
@export var ROTATION_SPEED = 240

class InputValues:
	var right: bool
	var left: bool
	var direction: int
	var up: bool

func _physics_process(delta: float) -> void:
	var input = get_input()
	calculate_rotation(delta, input)
	calculate_velocity(delta, input)

	move_and_slide()

func calculate_velocity(delta: float, input: InputValues) -> void:
	if input.up:
		velocity += (Vector2.UP * ACCELEARTION * delta).rotated(rotation)
		velocity = velocity if velocity.length() < MAX_SPEED else velocity.normalized() * MAX_SPEED
	else:
		velocity -= (Vector2.UP * ACCELEARTION * delta).rotated(rotation)
		velocity = velocity if velocity.length() < 0 else velocity.normalized() * 0


func calculate_rotation(delta: float, input: InputValues) -> void:
	rotation_degrees += delta * ROTATION_SPEED * input.direction


func get_input() -> InputValues:
	var input = InputValues.new()
	input.right = Input.is_action_pressed("right")
	input.left = Input.is_action_pressed("left")
	input.up = Input.is_action_pressed("up")
	input.direction = int(input.right) - int(input.left)
	return input
	
