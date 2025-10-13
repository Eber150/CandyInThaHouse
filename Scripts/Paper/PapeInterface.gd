extends Control

@onready var displayedText = $RichTextLabel

func _ready() -> void:
	visible = false

func ShowText(text: String = "") -> void:
	get_tree().paused = true;
	TextToDisplay(text)
	visible = true;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);

func _on_button_pressed() -> void:
	get_tree().paused = false;
	visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);


func TextToDisplay(text):
	displayedText.text = text;
