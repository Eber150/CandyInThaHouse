class_name BasicDoor
extends Interactable

@onready var openAnim := $Node3D/AnimationPlayer
@onready var openSound := $AudioStreamPlayer2D
var isOpen := false;
func Interact():
	if !isOpen:
		isOpen = true;
		openAnim.play("open");
		openSound.play();
