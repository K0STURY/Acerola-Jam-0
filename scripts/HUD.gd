extends CanvasLayer

@onready var _state_visual := $"Rat"
@onready var _progress_bar := $TextureProgressBar
@onready var _stopwatch_visual := $Stopwatch

const base_vignette : float = 0.69
const tired_vignette : float = 8

var time : float
var milliseconds : float
var seconds : float
var minutes: float

func _process(delta: float) -> void:
	_state_manager()
	_stopwatch(delta)
	_progress_bar.value = $"..".current_stamina
	
	if GameManager.FINISHED:
		$"Win Screen".visible = true
	
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

func _stopwatch(delta) -> void:
	if !get_tree().paused and !GameManager.FINISHED:
		time += delta
		milliseconds = fmod(time, 1) * 100
		seconds = fmod(time, 60)
		minutes = time / 60
	var time_string := "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
	_stopwatch_visual.text = time_string
	pass
