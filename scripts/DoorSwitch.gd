extends Area3D

@export var door : StaticBody3D
@onready var button_mesh := $MeshInstance3D/Button

@export var closed_color : Color
@export var open_color : Color
var opened : bool = false

func _ready() -> void:
	button_mesh.material_override.albedo_color = closed_color
	pass

func _on_body_entered(body: Node3D) -> void:
	if opened:
		return
	if body.name == "CharacterBody3D" and door != null:
		door._open_door()
		_press()
		await get_tree().create_timer(1).timeout
		#queue_free()

func _press() -> void:
	button_mesh.material_override.albedo_color = open_color
	opened = true
	pass
