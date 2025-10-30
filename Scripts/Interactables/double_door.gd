class_name DoubleDoor
extends Interactable

@onready var open1Anim := $Node3D/AnimationPlayer
@onready var open2Anim := $Node3D2/AnimationPlayer
@onready var openSound := $AudioStreamPlayer2D
var isOpen := false

func Interact():
	if !isOpen:
		isOpen = true;
		open1Anim.play("open");
		open2Anim.play("open");
		openSound.play();
