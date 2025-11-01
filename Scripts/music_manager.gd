class_name  MusicManager;
extends Node3D

var ghosts : Array;
var player;

@export var bus : AudioBusLayout;

@onready var mansionBase := $MusicGame/Base
@onready var mansionMelodi := $MusicGame/Melody
@onready var basementeSong := $Basement/SongBasement

var maxDistance = 20;
var minDistance = 1; 
var isInBasement = false;

func _ready() -> void:
	AudioServer.get_bus_channels(1)
	player = get_tree().get_nodes_in_group("Player")[0]
	ghosts = get_tree().get_nodes_in_group("Ghosts")

func _process(delta: float) -> void:
	if isInBasement:
		return
	if ghosts.any(IsNear):
		var min_distance = 999999999;
		var closest_ghost
		
		for ghost in ghosts:
			var distance = player.global_position.distance_to(ghost.global_position)
			if distance < min_distance:
				min_distance = distance
				closest_ghost = ghost
		
		var distance = player.position.distance_to(closest_ghost.position)
		distance = clamp(distance, minDistance, maxDistance)
		var normalized_distance = (distance - minDistance) / (maxDistance - minDistance)
		
		var music_volume = -80.0 + (normalized_distance * 80.0)
		music_volume = clamp(music_volume, -80, -2.3)
		var music1Index = AudioServer.get_bus_index("Melody")
		AudioServer.set_bus_volume_db(music1Index,music_volume)

func IsNear(ghost):
	return player.position.distance_to(ghost.position) <= 25

func distances(ghost):
	return player.position.distance_to(ghost.position)

func compare_distance(a, b):
	var distance_a = player.global_position.distance_to(a.global_position)
	var distance_b = player.global_position.distance_to(b.global_position)
	return distance_a < distance_b  # Si la distancia de 'a' es menor, devuelve verdadero

func changeSound():
	if(isInBasement):
		basementeSong.stop()
		mansionBase.play()
		mansionMelodi.play()
		isInBasement = false
	else:
		isInBasement = true
		mansionBase.stop()
		mansionMelodi.stop()
		basementeSong.play()
