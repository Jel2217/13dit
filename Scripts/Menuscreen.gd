extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Menu_pressed():
	get_tree().paused = true
	Global.window_open = true
	AudioStreamManager.play("res://Music/buttonclick.wav")
	show()


func _on_Resume_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	hide()
	get_tree().paused = false
	Global.window_open = false


func _on_Restart_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/play.tscn")


func _on_MainMenu_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/titlescreen.tscn")


func _on_Tutoral_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	
	hide()

func _input(event):
   # Mouse in viewport coordinates.
	if event.is_action_pressed("ui_cancel"):
		if Global.window_open == false:
			_on_Menu_pressed() 
		elif get_node("../Tutorialscreen").visible == false:
			_on_Resume_pressed()
			get_tree().paused = false
			
