extends Control


func _ready():
#	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(50/100))
#	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), linear2db(50/100))
#	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(50/100))
	hide()


func _on_SBack_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	hide()


func _on_Fullscreen_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	OS.window_fullscreen = true
	$VBoxContainer/WindowType/Fullscreen.theme_type_variation = "Deactivated"
	$VBoxContainer/WindowType/Windowed.theme_type_variation = "Activated"


func _on_Windowed_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	OS.window_fullscreen = false
	$VBoxContainer/WindowType/Windowed.theme_type_variation = "Deactivated"
	$VBoxContainer/WindowType/Fullscreen.theme_type_variation = "Activated"
	

# TODO slider and audio functionality


func _on_Settings_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	show() # Replace with function body.


func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(value/100))
	pass # Replace with function body.
#	


func _on_SoundSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), linear2db(value/100))


func _on_MasterSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(value/100))
