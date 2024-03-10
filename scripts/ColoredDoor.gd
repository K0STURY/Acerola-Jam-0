@tool
extends StaticBody3D

@export var color : GameManager.STATES
@onready var mesh := %"Door Mesh"

var scale_amount : float
var original_scale : Vector3

func _ready() -> void:
	mesh.material_override.set_shader_parameter("WaterOpacity", 0.9)
	original_scale = mesh.scale
	_mat_color_update()

func _process(delta: float) -> void:
	if !Engine.is_editor_hint():
		_fade_door()
	else:
		_mat_color_update()
		pass

func _mat_color_update() -> void:
	if color == GameManager.STATES.RED:
		#_state_visual.modulate = Color.RED
		mesh.material_override.set_shader_parameter("WaterColor", Color.RED)
	elif color == GameManager.STATES.GREEN:
		#_state_visual.modulate = Color.GREEN
		mesh.material_override.set_shader_parameter("WaterColor", Color.GREEN)
	elif color == GameManager.STATES.BLUE:
		#_state_visual.modulate = Color.BLUE
		mesh.material_override.set_shader_parameter("WaterColor", Color.BLUE)
	else:
		#_state_visual.modulate = Color.WHITE
		mesh.material_override.set_shader_parameter("WaterColor", Color.WHITE)
	pass

func _fade_door() -> void:
	if color == GameManager.CURRENT_STATE:
		$CollisionShape3D.disabled = true
		mesh.material_override.set_shader_parameter("WaterOpacity", 0.2)
	else:
		$CollisionShape3D.disabled = false
		mesh.material_override.set_shader_parameter("WaterOpacity", 0.9)
	pass

