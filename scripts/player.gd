extends Car
class_name Player

signal player_moved(position: Vector2)

func _physics_process(delta: float) -> void:
	var input = get_input()
	calculate_rotation(delta, input.direction)
	calculate_velocity(delta, true)
	player_moved.emit(position)
	move_and_slide()
