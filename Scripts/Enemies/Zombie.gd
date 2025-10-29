class_name Zombie
extends BasicEnemy

func _ready() -> void:
	navAgent=$NavigationAgent3D
	Detector = $Area3D
	super._ready()
	$AnimatedSprite3D.play("default")
