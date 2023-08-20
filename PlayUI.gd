extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide() # Replace with function body.


func _on_PBack_pressed():
#	get_tree().change_scene("res://Scenes/titlescreen.tscn")
	hide()
	pass # Replace with function body.


func _on_PStart_pressed():
	get_tree().change_scene("res://Scenes/play.tscn")
	pass # Replace with function body.


func _on_Play_pressed():
	show()
