class_name Candy
extends Node3D

@export var points:int;
var playerPostion;

func _ready() -> void:
	playerPostion = get_parent().get_node("player")

func _process(delta: float) -> void:
	look_at(playerPostion.position);

func GetPoints() -> int:
	return points;
