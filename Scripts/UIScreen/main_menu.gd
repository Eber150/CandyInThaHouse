extends Control


func _on_play_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	get_tree().change_scene_to_file("res://TrenchBroom/Mansion.tscn")
	

func _on_instructions_pressed() -> void:
	$MainButton.hide()
	$IntructionMenu.show()

func _on_exit_pressed() -> void:
	get_tree().quit();


func _on_instruction_button_pressed() -> void:
	$MainButton.show()
	$IntructionMenu.hide()
