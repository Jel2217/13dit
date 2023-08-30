extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func player_won(player, turn_count):
	print("PLAYER " + String(player) + " ON TURN " + String(turn_count))
	if player == 0:
		$Winner.text = "Tie!"
	else:
		$Winner.text = Global.player_names[player-1] + " won!"
	$Turn.text = "Turn: " + String(turn_count)
	show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/titlescreen.tscn")



func _on_Replay_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/play.tscn")
