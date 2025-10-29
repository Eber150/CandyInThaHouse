class_name ExitDoor
extends Interactable


var player
@onready var candyAmountText := $Control/CantidadCaramelos;

func _ready() -> void:
	player = get_parent().get_node("player");

func Interact() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	$Control.show()
	candyAmountText.text = "Caramelos:" + str(player.candyPoints) + " / 11270"
	get_tree().paused = true;
	


func _on_menu_pressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")

func final() -> void:
	if(player.candyPoints < 100):
		$Control/Final1.show();
	elif (player.candyPoints >= 100 and player.candyPoints < 8000):
		$Control/Final2.show();
	else:
		$Control/Final3.show();
