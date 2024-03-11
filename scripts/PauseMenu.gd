extends CanvasLayer

var isPaused : bool = false

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_cancel"):
		isPaused = !isPaused
		pass
	
	$Control.visible = isPaused
	get_tree().paused = isPaused
	
	if isPaused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _resume() -> void:
	isPaused = false
	pass
	
func _quit() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	_resume()
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	_quit()
	pass # Replace with function body.
