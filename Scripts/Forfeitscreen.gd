extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Forfeit_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	$Player.text = Global.player_names[get_node("../Game").turn-1]
	show()
	get_tree().paused = true
	pass # Replace with function body.


func _on_No_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	hide()
	get_tree().paused = false
	


func _on_Yes_pressed():
	AudioStreamManager.play("res://Music/buttonclick.wav")
	hide()
