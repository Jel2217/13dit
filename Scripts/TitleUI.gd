extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	show()

func _on_Play_pressed():
#	get_tree().change_scene("res://Scenes/play.tscn")
	hide()
	AudioStreamManager.play("res://Music/buttonclick.wav")


func _on_Settings_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	hide()


func _on_Quit_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	get_tree().quit()


func _on_SettingsUI_hide():
	show()


func _on_PBack_pressed():
	show() # Replace with function body.
