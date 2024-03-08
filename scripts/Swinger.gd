extends Node

@export_category(" SWAY")
@export var _holder : Node3D
@export var _sway : float = 5
@export var _rotation_amount : float = 0.05
@export var sway_lerp_speed = 15
@export var _clamp_amount : float = 0.25

@export var swing_frequency : float = 3

@onready var animation_player : AnimationPlayer = $"../AnimationPlayer"

var mouse_input : Vector2
var initial_pos : Vector3

var max_push : Vector3
var max_pull : Vector3

func _ready() -> void:
	initial_pos = _holder.position
	max_push += initial_pos / 2
	max_pull -= initial_pos / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if _holder:
		_do_sway(delta)
	pass

func _do_sway(delta) -> void:
	mouse_input = lerp(mouse_input, Vector2.ZERO, 10*delta)
	
	_holder.rotation.x = lerp(_holder.rotation.x, mouse_input.y * ( _rotation_amount / 2), sway_lerp_speed * delta)
	_holder.rotation.z = lerp(_holder.rotation.z, mouse_input.x * _rotation_amount, sway_lerp_speed * delta)
	
	_holder.rotation.x = clamp(_holder.rotation.x, -_clamp_amount, _clamp_amount)
	_holder.rotation.y = clamp(_holder.rotation.y, -_clamp_amount, _clamp_amount)
	#_holder.rotation = clamp(_holder.rotation, -_clamp_amount, _clamp_amount)

func _do_swing(delta, swings_peed)  -> void:
	if $"..".direction:
		var bob_z =  sin((Time.get_ticks_msec() * 0.005) * swing_frequency * swings_peed) * 0.1
		var bob = Vector3(0, 0, bob_z)
		_holder.position = lerp(_holder.position,initial_pos + bob, 1)
	else:
		_holder.position = lerp(_holder.position, initial_pos, 1)

func _input(event : InputEvent) -> void:
	if event is InputEventMouseMotion and Input.MOUSE_MODE_CAPTURED:
		mouse_input = event.relative
