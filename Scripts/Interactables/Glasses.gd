class_name  Glasses
extends Interactable

var ghosts :Array

func _ready() -> void:
	ghosts = get_tree().get_nodes_in_group("Ghosts")

func _process(delta: float) -> void:
	look_at(get_parent().get_node("player").position);

func Interact() -> void:
	for ghost in ghosts:
		ghost.MakeVisible()
	queue_free();
