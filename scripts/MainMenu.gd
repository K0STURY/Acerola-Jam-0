extends CanvasLayer

func _quit() -> void:
	get_tree().quit()
	
func _load_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/maze.tscn")
	pass


func _on_play_button_pressed() -> void:
	_load_scene()
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	_quit()
	pass # Replace with function body.
