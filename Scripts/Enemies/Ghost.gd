class_name Ghost
extends BasicEnemy

func _ready() -> void:
	visible = false;
	navAgent= $NavigationAgent3D
	Detector = $Detector
	#target= $"../player2"
	#navRegion = $"../NavigationRegion3D"
	super._ready()

func MakeVisible() -> void:
	visible = true;
