extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	show()

func _on_Play_pressed():
#	get_tree().change_scene("res://Scenes/play.tscn")
	hide()
	
	pass # Replace with function body.


func _on_Settings_pressed():
	hide()


func _on_Quit_pressed():
	get_tree().quit()


func _on_SettingsUI_hide():
	show()


func _on_PBack_pressed():
	show() # Replace with function body.
