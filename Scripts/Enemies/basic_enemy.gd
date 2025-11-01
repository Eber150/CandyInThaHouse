class_name  BasicEnemy
extends CharacterBody3D

@export var chaseSpeed : float;
@export var patrolSpeed : float;
var currentSpeed : float;

# esto es de cada enemigo con sus elementos correspondientes
@export var target : CharacterBody3D
@export var navRegion : NavigationRegion3D

var navAgent : NavigationAgent3D
var Detector : Area3D

@onready var isChasing: bool = false;

var hasSeen := false;
var lastPos;

@onready var randomPos = Vector3(randf_range(-20,20),position.y,randf_range(-20,20));
@onready var wanderTimer := 60.0;

# Para dibujar la línea
var line_mesh_instance: MeshInstance3D
var line_material: StandardMaterial3D

func _ready():
	currentSpeed = patrolSpeed
	# Crear la línea
	#_create_debug_line()
	randomPos = NavigationServer3D.map_get_closest_point(navRegion.get_navigation_map(),randomPos)

func _create_debug_line():
	# Crear el material para la línea
	line_material = StandardMaterial3D.new()
	line_material.flags_unshaded = true
	line_material.vertex_color_use_as_albedo = true
	line_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	
	# Crear la malla de la línea
	var immediate_mesh = ImmediateMesh.new()
	line_mesh_instance = MeshInstance3D.new()
	line_mesh_instance.mesh = immediate_mesh
	add_child(line_mesh_instance)

func _draw_debug_line():
	if !line_mesh_instance:
		return
	
	var immediate_mesh = line_mesh_instance.mesh as ImmediateMesh
	immediate_mesh.clear_surfaces()
	
	# Solo dibujar si tenemos un objetivo
	if target and navAgent:
		immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, line_material)
		
		# Punto de inicio (posición actual del enemigo)
		var start_point = Vector3.ZERO
		
		# Punto final (posición del objetivo o siguiente punto de navegación)
		var end_point = Vector3.ZERO
		
		if isChasing:
			# Cuando está persiguiendo, línea hasta el jugador
			end_point = to_local(target.global_position)
			immediate_mesh.surface_set_color(Color.RED)  # Rojo para persecución
		else:
			# Cuando está patrullando, línea hasta el punto de patrulla
			end_point = to_local(navAgent.target_position)
			immediate_mesh.surface_set_color(Color.BLUE)  # Azul para patrulla
		
		# Dibujar la línea
		immediate_mesh.surface_add_vertex(start_point)
		immediate_mesh.surface_add_vertex(end_point)
		
		immediate_mesh.surface_end()


func _physics_process(delta: float) -> void:
	look_at(target.global_transform.origin)
	if(!is_on_floor()):
		velocity.y = velocity.y + -9.8 * delta;
	else:
		velocity.y = 0;
		
	if isChasing:
		Chase();
		currentSpeed = chaseSpeed;
	else:
		currentSpeed = patrolSpeed;
		wandering(delta)
	
	var direction = navAgent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * currentSpeed, delta*10)
	move_and_slide()
	
	# Actualizar la línea debug en cada frame
	#_draw_debug_line()



func Chase():
	_target_position(target)

func wandering(delta):
	hasSeen = false;
	navAgent.target_position = randomPos;
	if abs(randomPos.x - global_position.x ) <= 5 and abs(randomPos.z - global_position.z) <=5 or wanderTimer <= 0:
		randomPos = Vector3(randf_range(target.global_position.x-40,target.global_position.x+40), position.y, randf_range(target.global_position.z-40,target.global_position.z+40))
		clamp(randomPos.x, -20, 20)
		clamp(randomPos.z, -20, 20)
		randomPos = NavigationServer3D.map_get_closest_point(navRegion.get_navigation_map(),randomPos)
		wanderTimer = 60.0
	wanderTimer -= delta;

func _target_position(target):
	navAgent.target_position = target.global_position;


func _on_detector_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		isChasing = true;


func _on_detector_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		lastPos = body.global_position;
		randomPos = NavigationServer3D.map_get_closest_point(navRegion.get_navigation_map(),lastPos)
		randomPos = lastPos;
		isChasing = false;
