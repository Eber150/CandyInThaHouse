class_name Candy
extends Node3D

@export var points:int;
@onready var candySprites := [load("res://sprites/Candy/caramelo_azul.png"),
								load("res://sprites/Candy/caramelo_rojo_.png"),
								load("res://sprites/Candy/caramelo_verde.png"),
								load("res://sprites/Candy/caramelo_violeta.png")]

func  _ready() -> void:
	if($Sprite3D.texture):
		$Sprite3D.texture = candySprites[randi_range(0,candySprites.size()-1)]

func _process(delta: float) -> void:
	look_at(get_parent().get_node("player").position);

func GetPoints() -> int:
	return points;
