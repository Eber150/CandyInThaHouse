extends Control

var player
@onready var candyAmountText := $CantidadCaramelos;

func _ready() -> void:
	player = get_parent().get_node("player");

func showWinScreen() -> void:
	UpdateCandyAmount();
	final()
	show()
	get_tree().paused = true;

func UpdateCandyAmount() -> void:
	candyAmountText.text = "Caramelos:" + player.candyPoints + " / 11270"

func _on_menu_pressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")

func final() -> void:
	if(player.candyPoints < 100):
		$Final1.show();
	elif (player.candyPoints >= 100 and player.candyPoints < 8000):
		$Final2.show();
	else:
		$Final3.show();
