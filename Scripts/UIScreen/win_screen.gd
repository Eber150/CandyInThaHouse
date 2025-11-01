extends Control


@onready var candyAmountText := $CantidadCaramelos;
var player

func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")[0]
	hide()

func showWinScreen() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	player.get_node("CanvasLayer").hide()
	UpdateCandyAmount();
	final()
	show()
	get_tree().paused = true;

func UpdateCandyAmount() -> void:
	candyAmountText.text = str(player.candyPoints) + " / 11270"

func _on_menu_pressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")

func final() -> void:
	if(player.candyPoints < 1):
		$Final1.show();
		$Final1Background.show();
	elif(player.candyPoints >= 1 and player.candyPoints < 100):
		$Final2.show();
		$Final2Background.show();
	elif (player.candyPoints >= 100 and player.candyPoints < 8000):
		$Final3.show();
		$Final3Background.show()
	else:
		$Final4.show();
		$Final4Background.show();
