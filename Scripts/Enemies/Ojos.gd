class_name  Eyes
extends BasicEnemy

@onready var isOnCamera := false;
var player_raycast : RayCast3D

var isBeingSee := false;
var timeToKill := 1.0;

func _ready() -> void:
	navAgent= $NavigationAgent3D
	Detector = $Detector
	super._ready()
	
	await get_tree().process_frame
	if target:
		player_raycast = target.visionDirection

func _process(delta: float) -> void:
	var is_actually_visible = isOnCamera and is_directly_visible_to_player()
	
	if is_actually_visible:
		timeToKill = timeToKill - 1 * delta
	else:
		timeToKill = 1.0
	
	if timeToKill <= 0:
		target.LoseGame();

func _physics_process(delta: float) -> void:
	look_at(target.position)
	

func is_directly_visible_to_player() -> bool:
	
	if not player_raycast or not target:
		return false
	
	var camera = get_viewport().get_camera_3d()
	if not camera:
		return false
	
	
	var from = camera.global_position
	var to = global_position
	
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from, to)
	query.exclude = [self, target]
	
	var result = space_state.intersect_ray(query)
	
	return not result


func _on_visible_on_screen_notifier_3d_screen_entered() -> void:
	isOnCamera = true

func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	isOnCamera = false
