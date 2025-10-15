extends BasicEnemy

func _ready() -> void:
	#target= $"../player2"
	#navRegion = $"../NavigationRegion3D"
	navAgent=$NavigationAgent3D
	Detector = $Area3D
	super._ready()
