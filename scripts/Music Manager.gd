extends AudioStreamPlayer

@export var start_music : AudioStream

@export var red_music : AudioStream
@export var green_music : AudioStream
@export var blue_music : AudioStream

func _ready() -> void:
	stream = start_music
	play()
	pass

func _process(delta: float) -> void:
	_musicSelector()

func _musicSelector() -> void:
	if GameManager.CURRENT_STATE == GameManager.STATES.RED and stream != red_music:
		stream = red_music
		print("Playing Red")
	if GameManager.CURRENT_STATE == GameManager.STATES.GREEN and stream != green_music:
		stream = green_music
		print("Playing Green")
	if GameManager.CURRENT_STATE == GameManager.STATES.BLUE and stream != blue_music:
		stream = blue_music
		print("Playing Blue")
		
	if !playing:
		play()
	pass
