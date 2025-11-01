class_name  changer_music
extends Node3D

var musicManager : MusicManager

func _ready() -> void:
	musicManager = get_tree().get_nodes_in_group("musicManager")[0]

func changerMusic() -> void:
	musicManager.changeSound()
