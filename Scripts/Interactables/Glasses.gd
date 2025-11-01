class_name  Glasses
extends Interactable

var ghosts :Array
var playerPostion;

func _ready() -> void:
	playerPostion = get_parent().get_node("player")

func _process(delta: float) -> void:
	look_at(playerPostion.position);

func Interact() -> void:
	for ghost in ghosts:
		ghost.MakeVisible()
	queue_free();
