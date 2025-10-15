extends Interactable

@onready var ghost = $"../Ghost"

func Interact() -> void:
	ghost.MakeVisible();
	queue_free();
