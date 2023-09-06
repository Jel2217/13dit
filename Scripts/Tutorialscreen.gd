extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.has_tutorial_displayed == false:
		get_tree().paused = true
		Global.has_tutorial_displayed = true
		show()
	Global.window_open = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Continue_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	get_tree().paused = false
	hide()
	Global.window_open = false


func _on_Tutoral_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	get_tree().paused = true
	show()
