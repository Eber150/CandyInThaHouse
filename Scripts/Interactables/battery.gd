class_name Battery
extends Interactable

func _process(delta: float) -> void:
	look_at(get_parent().get_node("player").position);

func Interact():
	var player = get_tree().get_nodes_in_group("Player")
	player[0].flashlight.GetBatteries();
	queue_free();
