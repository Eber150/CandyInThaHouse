class_name Battery
extends Interactable

func Interact():
	var player = get_tree().get_nodes_in_group("Player")
	player[0].flashlight.GetBatteries();
	queue_free();
