extends Control

@onready var music1 := $Music1
@onready var music2 := $Music2

func _ready() -> void:
	visible = false

func GameOver() -> void:
	music1.play()
	visible = true;
	get_tree().paused = true;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);

func _on_button_pressed() -> void:
	get_tree().paused = false;
	visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	get_tree().reload_current_scene();


func _on_menu_pressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")


func _on_music_1_finished() -> void:
	music2.play()
