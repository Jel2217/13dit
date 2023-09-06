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
	$VBoxContainer/WindowType/Fullscreen.theme_type_variation = "Activated"
	$VBoxContainer/WindowType/Windowed.theme_type_variation = "Deactivated"


func _on_Windowed_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	OS.window_fullscreen = false
	$VBoxContainer/WindowType/Windowed.theme_type_variation = "Activated"
	$VBoxContainer/WindowType/Fullscreen.theme_type_variation = "Deactivated"
	

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

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if self.visible:
			_on_SBack_pressed()
			get_node("../TitleUI")._on_PBack_pressed()
