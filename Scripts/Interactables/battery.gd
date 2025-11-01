class_name Battery
extends Interactable
var playerPostion;

func _ready() -> void:
	playerPostion = get_parent().get_node("player")

func _process(delta: float) -> void:
	look_at(playerPostion.position);

func Interact():
	var player = get_tree().get_nodes_in_group("Player")
	player[0].flashlight.GetBatteries();
	queue_free();
