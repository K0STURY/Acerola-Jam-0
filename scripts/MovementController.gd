extends CharacterBody3D


@export_category("Movement")
var movement_speed : float
@export var walking_speed : float
@export var running_speed : float
@export var acceleration  : float
@export var deceleration  : float

@export_category("STAMINA")
@export var MAX_STAMINA = 100
@onready var current_stamina = 100
@export var stamina_drain = 1
@export var stamina_gain = 1

@export var GRAVITY = 10
var direction : Vector3
var movement_dir : Vector2
var isRequestingSprint : bool = false
var canRun : bool = false
var current_movement_penalty : float = 0.0
@export var max_movement_penalty : float = 0.5
@export var movement_lerp_speed : float = 5.0

func _process(delta: float) -> void:
	_HandleInput()
	_run_manager(delta)

func _physics_process(delta: float) -> void:
	_move(delta)
	move_and_slide()


func _move(delta : float) -> void:

	# increase max speed if there's input and decrease if not
	current_movement_penalty += acceleration * delta if direction else deceleration * delta
	current_movement_penalty = clamp(current_movement_penalty, max_movement_penalty, 1.0)
	
	var target_vel : Vector3  = Vector3(direction.x, velocity.y, direction.z) * current_movement_penalty * movement_speed
	var ideal_vel : Vector3  = Vector3(target_vel.x, velocity.y, target_vel.z)
	
	velocity = lerp(velocity, ideal_vel, movement_lerp_speed * delta)
	pass

func _HandleInput() -> void:
	#Walking Input
	movement_dir = Input.get_vector("Move_Left", "Move_Right", "Move_Forward", "Move_Backwards")
	direction = ($Neck.transform.basis * Vector3(movement_dir.x, 0, movement_dir.y)).normalized()
	
	isRequestingSprint = Input.is_action_pressed("Sprint")

func _run_manager(delta) -> void:
	if isRequestingSprint and current_stamina > 0:
		movement_speed = running_speed
		$"Left Arm"._do_swing(delta, 1.4)
		$"Right Arm"._do_swing(delta, 1.4)
		$"Camera manager"._fov_manager(90)
		current_stamina -= stamina_drain * delta
	else:
		movement_speed = walking_speed
		$"Left Arm"._do_swing(delta, .7)
		$"Right Arm"._do_swing(delta, .7)
		$"Camera manager"._fov_manager(75)
		if current_stamina < MAX_STAMINA and !isRequestingSprint:
			current_stamina += stamina_gain * delta
	#print(current_stamina)
	pass
