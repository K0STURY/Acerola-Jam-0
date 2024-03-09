extends Area3D

@export var door : StaticBody3D

func _on_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D" and door != null:
		door._open_door()
		await get_tree().create_timer(1).timeout
		queue_free()
