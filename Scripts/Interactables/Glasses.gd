class_name  Glasses
extends Interactable

var ghosts :Array

func _ready() -> void:
	ghosts = get_tree().get_nodes_in_group("Ghosts")

func Interact() -> void:
	for ghost in ghosts:
		ghost.MakeVisible()
	queue_free();
