class_name Ghost
extends BasicEnemy

func _ready() -> void:
	visible = false;
	navAgent= $NavigationAgent3D
	Detector = $Detector
	super._ready()
	$AnimatedSprite3D.play("default")

func _physics_process(delta: float) -> void:
	look_at(target.global_transform.origin)

func MakeVisible() -> void:
	visible = true;
