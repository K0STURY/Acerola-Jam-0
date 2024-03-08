@tool
extends Area3D

@export var color : GameManager.STATES
@onready var mesh := %MeshInstance3D

func _process(delta: float) -> void:
	_mat_color_update()

func _mat_color_update() -> void:
	if color == GameManager.STATES.RED:
		#_state_visual.modulate = Color.RED
		mesh.material_override.albedo_color = Color.RED
	elif color == GameManager.STATES.GREEN:
		#_state_visual.modulate = Color.GREEN
		mesh.material_override.albedo_color = Color.GREEN
	elif color == GameManager.STATES.BLUE:
		#_state_visual.modulate = Color.BLUE
		mesh.material_override.albedo_color = Color.BLUE
	else:
		#_state_visual.modulate = Color.WHITE
		mesh.material_override.albedo_color = Color.WHITE
	pass



func _on_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		GameManager.CURRENT_STATE = color
		pass
