class_name BasicDoor
extends Interactable

@onready var openAnim := $Node3D/AnimationPlayer
@onready var openSound := $AudioStreamPlayer2D

func Interact():
	openAnim.play("open");
	openSound.play();
