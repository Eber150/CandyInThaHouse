extends Interactable

@onready var paperInterface = $"../PaperInterface"
@export_multiline var textToDisplay : String

func Interact():
	paperInterface.ShowText(textToDisplay);
