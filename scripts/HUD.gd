extends CanvasLayer

@onready var _state_visual := $"State Visual"

func _process(delta: float) -> void:
	_state_manager()
	pass

func _state_manager() -> void:
	if GameManager.CURRENT_STATE == GameManager.STATES.RED:
		_state_visual.modulate = Color.RED
	elif GameManager.CURRENT_STATE == GameManager.STATES.GREEN:
		_state_visual.modulate = Color.GREEN
	elif GameManager.CURRENT_STATE == GameManager.STATES.BLUE:
		_state_visual.modulate = Color.BLUE
	else:
		_state_visual.modulate = Color.WHITE
	pass

func _update_state(state : GameManager.STATES):
	GameManager.CURRENT_STATE = state
