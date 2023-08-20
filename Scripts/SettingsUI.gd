extends Control


func _ready():
	hide()


func _on_SBack_pressed():
	hide()


func _on_Fullscreen_pressed():
	OS.window_fullscreen = true
	$VBoxContainer/WindowType/Fullscreen.theme_type_variation = "Deactivated"
	$VBoxContainer/WindowType/Windowed.theme_type_variation = "Activated"


func _on_Windowed_pressed():
	OS.window_fullscreen = false
	$VBoxContainer/WindowType/Windowed.theme_type_variation = "Deactivated"
	$VBoxContainer/WindowType/Fullscreen.theme_type_variation = "Activated"
	

# TODO slider and audio functionality


func _on_Settings_pressed():
	show() # Replace with function body.
