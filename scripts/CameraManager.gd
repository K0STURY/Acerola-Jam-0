extends Node

@export_category("Camera")
@export var MAX_LOOK = 60
@export var MIN_LOOK = -30
@export var MOUSE_SENSITIVITY = 0.005

@export_category("Head Bob")
@export var do_bob : bool = false
@export var bob_amount : float = 1
#Child nodes / Camera related
@onready var neck := $"../Neck"
@onready var camera := $"../Neck/Camera3D"

var head_init_pos

func _ready() -> void:
	head_init_pos = camera.position
	pass

func _process(delta: float) -> void:
	if do_bob:
		_HandleBob(delta)
	

func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * MOUSE_SENSITIVITY * get_process_delta_time())
			camera.rotate_x(-event.relative.y * MOUSE_SENSITIVITY * get_process_delta_time())
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(MIN_LOOK), deg_to_rad(MAX_LOOK))

func _fov_manager(desired_fov : float) -> void:
	camera.fov = lerp(camera.fov, desired_fov, .1)
	pass

func _HandleBob(delta : float):
	
	var walking_bob : float = 0.3
	var running_bob : float = 3
	
	var bob_muplt : float = running_bob if (!$"..".isRunning) else walking_bob
	
	if $"..".direction:
		var head_bob_y = abs(sin(Time.get_ticks_msec() * 0.005 * bob_amount) * bob_muplt) * 0.2 
		var head_bob = Vector3(0, head_bob_y, 0.0)
		camera.position = lerp(camera.position, head_init_pos + head_bob, delta * 5)
	else:
		camera.position = lerp(camera.position, head_init_pos, delta * 5)
	
