class_name ExitDoor
extends Interactable

@export var winScreen :Control

func Interact() -> void:
	winScreen.showWinScreen()
	
