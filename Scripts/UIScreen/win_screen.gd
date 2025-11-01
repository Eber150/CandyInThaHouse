extends Control


@onready var candyAmountText := $CantidadCaramelos;
@onready var musicGood1 := $Good1
@onready var musicGood2 := $Good2
@onready var musicBad1 := $Bad1
@onready var musicBad2 := $Bad2
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
	candyAmountText.text = str(player.candyPoints) + " / 34965"

func _on_menu_pressed() -> void:
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")

func final() -> void:
	if(player.candyPoints < 1):
		$Final1.show();
		musicBad1.play();
		$Final1Background.show();
	elif(player.candyPoints >= 1 and player.candyPoints < 1000):
		$Final2.show();
		musicBad1.play();
		$Final2Background.show();
	elif (player.candyPoints >= 1000 and player.candyPoints < 15000):
		$Final3.show();
		musicGood1.play()
		$Final3Background.show()
	else:
		$Final4.show();
		musicGood1.play()
		$Final4Background.show();


func _on_good_1_finished() -> void:
	musicGood2.play()


func _on_bad_1_finished() -> void:
	musicBad2.play()
