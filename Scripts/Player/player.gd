extends CharacterBody3D


const SPEED = 6.0;

var candyPoints = 0;
@onready var candyText := $Control/Label

@onready var neck := $Neck;
@onready var camera := $Neck/Camera3D;
@onready var visionDirection := $Neck/Camera3D/RayCast3D;
@onready var collision := $CollisionShape3D


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.001)
			camera.rotate_x(-event.relative.y * 0.001)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("leftward","rightward","forward","backward");
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized();
	
	if(direction):
		velocity.x = direction.x * SPEED;
		velocity.z = direction.z * SPEED;
	else:
		velocity.x = move_toward(velocity.x,0,SPEED);
		velocity.z = move_toward(velocity.z,0, SPEED);
		
		
	if(!is_on_floor()):
		velocity.y = -9.8;
	
	move_and_slide();


func _on_collision_sensor_body_entered(body: Node3D) -> void:
	if body.is_in_group("Candy"):
		candyPoints += body.GetPoints();
		candyText.text = "Candy: " + str(candyPoints);
		body.queue_free();
