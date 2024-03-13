extends Node

@export var audio_bus : AudioBusLayout

func _ready() -> void:
	AudioServer.set_bus_layout(audio_bus)
	

func _on_master_slider_value_changed(value: float) -> void:
	#audio_bus.set_bus_volume_db(0, value)
	AudioServer.set_bus_volume_db(0, value)

func _on_sfx_slider_value_changed(value: float) -> void:
	#audio_bus.set_bus_volume_db(1, value)
	AudioServer.set_bus_volume_db(1, value)

func _on_music_slider_value_changed(value: float) -> void:
	#audio_bus.set_bus_volume_db(2, value)
	AudioServer.set_bus_volume_db(2, value)
