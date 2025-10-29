extends Control

func _ready() -> void:
	visible = false

func GameOver() -> void:
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
