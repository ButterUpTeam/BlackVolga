extends Node2D

@onready var police_car = preload("res://scene/police.tscn")

func _ready() -> void:
	for police: Police in get_tree().get_nodes_in_group("police"):
		police.observe_player_movement($Player.player_moved)


func _on_police_spawn_timeout() -> void:
	var spawn_point = get_tree().get_nodes_in_group("spawn_point").pick_random()
	var police_character: Police = police_car.instantiate()
	police_character.global_position = spawn_point.global_position
	add_child(police_character)
	police_character.observe_player_movement($Player.player_moved)

	print("Spawned")


