class_name Candy
extends Node3D

@export var points:int;

func _process(delta: float) -> void:
	look_at(get_parent().get_node("player").position);

func GetPoints() -> int:
	return points;
