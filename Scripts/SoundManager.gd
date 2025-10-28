class_name  SoundManager;
extends Node3D

@export var ghost :BasicEnemy;
@export var player : CharacterBody3D;

@export var bus : AudioBusLayout;

var maxDistance = 30;
var minDistance = 5; 

func _ready() -> void:
	AudioServer.get_bus_channels(1)

func _process(delta: float) -> void:
	var distance = player.position.distance_to(ghost.position)
	distance = clamp(distance, minDistance, maxDistance)
	var normalized_distance = (distance - minDistance) / (maxDistance - minDistance)
	
	var music_volume = -80 + (normalized_distance * 80)
	var music1Index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(music1Index,music_volume)
	
	var music2_volume = -80 + ((1 - normalized_distance) * 80)
	var music2Index = AudioServer.get_bus_index("Music2")
	AudioServer.set_bus_volume_db(music2Index,music2_volume)
	
