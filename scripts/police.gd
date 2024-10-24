extends Car
class_name Police

@onready var navigation = $NavigationAgent

var cnt: int = 0

func _physics_process(delta: float) -> void:
	var destination = navigation.get_next_path_position()
	var move_vector: Vector2 = destination - global_position
	var obj_vector = Vector2.UP.rotated(rotation)
	var angle_to = obj_vector.angle_to(move_vector)
	if not abs(angle_to) < 0.1:
		calculate_rotation(delta, -1 if angle_to < 0 else 1)
	calculate_velocity(delta, true)
	move_and_slide()

func observe_player_movement(movement_signal: Signal):
	movement_signal.connect(self.on_player_player_moved)

func on_player_player_moved(player_position: Vector2) -> void:
	navigation.target_position = player_position
