extends StaticBody3D

var _delta
var openDoor : bool = false

func _process(delta: float) -> void:
	if openDoor:
		var new_pos = Vector3(position.x, -1, position.z)
		position = lerp(position, new_pos, 1 * delta)
		await get_tree().create_timer(3).timeout
		print("Open")
		queue_free()


func _open_door() -> void:
	openDoor = true
	pass
