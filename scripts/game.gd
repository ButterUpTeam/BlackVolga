extends Node2D


func _ready() -> void:
	for police: Police in get_tree().get_nodes_in_group("police"):
		$Player.player_moved.connect(police.on_player_player_moved)
