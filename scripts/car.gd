extends CharacterBody2D

class_name Car

@export var MAX_SPEED = 200.0
@export var ACCELEARTION = 1000
@export var ROTATION_SPEED = 240


class InputValues:
	var right: bool
	var left: bool
	var direction: int
	var up: bool


func calculate_velocity(delta: float, accelerate: bool) -> void:
	if accelerate:
		velocity += (Vector2.UP * ACCELEARTION * delta).rotated(rotation)
		velocity = velocity if velocity.length() < MAX_SPEED else velocity.normalized() * MAX_SPEED
	else:
		velocity -= (Vector2.UP * ACCELEARTION * delta).rotated(rotation)
		velocity = velocity if velocity.length() < 0 else Vector2.ZERO


func calculate_rotation(delta: float, direction: int) -> void:
	rotation_degrees += delta * ROTATION_SPEED * direction


func get_input() -> InputValues:
	var input = InputValues.new()
	input.right = Input.is_action_pressed("right")
	input.left = Input.is_action_pressed("left")
	input.up = Input.is_action_pressed("up")
	input.direction = int(input.right) - int(input.left)
	return input
	
