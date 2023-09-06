extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide() # Replace with function body.
var counter_amount_min = 3
var counter_amount_max = 6
var counter_amount = 4

var board_sizes = ["5x6", "7x6", "8x7"]
var board_index = 1

func _on_PBack_pressed():
#	get_tree().change_scene("res://Scenes/titlescreen.tscn")
	hide()
	AudioStreamManager.play("res://Music/buttonclick.wav")


func _on_PStart_pressed():
	get_tree().change_scene("res://Scenes/play.tscn")
	AudioStreamManager.play("res://Music/buttonclick.wav")


func _on_Play_pressed():
	Global.counter_amount = counter_amount
	show()


func _on_Player1LineEdit_text_changed(new_text):
	Global.player_names[0] = new_text
	if $VBoxContainer/NameEdits/Player1LineEdit.text.empty():
		Global.player_names[0] = "Player 1"


func _on_Player2LineEdit_text_changed(new_text):
	Global.player_names[1] = new_text
	if $VBoxContainer/NameEdits/Player2LineEdit.text.empty():
		Global.player_names[1] = "Player 2"


func _on_LeftCounterTri_pressed():
	counter_amount -= 1
	Global.counter_amount = counter_amount
	$VBoxContainer/CounterNum/RightCounterTri.disabled = false
	$VBoxContainer/CounterNum/Label.text = String(counter_amount)
	if counter_amount <= counter_amount_min:
		$VBoxContainer/CounterNum/LeftCounterTri.disabled = true

func _on_RightCounterTri_pressed():
	counter_amount += 1
	Global.counter_amount = counter_amount
	$VBoxContainer/CounterNum/LeftCounterTri.disabled = false
	$VBoxContainer/CounterNum/Label.text = String(counter_amount)
	if counter_amount >= counter_amount_max:
		$VBoxContainer/CounterNum/RightCounterTri.disabled = true


func _on_LeftBoardTri_pressed():
	board_index -= 1
	$VBoxContainer/BoardNum/Label.text = board_sizes[board_index]
	if board_index <= 0:
		$VBoxContainer/BoardNum/LeftBoardTri.disabled = true
	$VBoxContainer/BoardNum/RightBoardTri.disabled = false

func _on_RightBoardTri_pressed():
	board_index += 1
	$VBoxContainer/BoardNum/Label.text = board_sizes[board_index]
	if board_index >= board_sizes.size()-1:
		$VBoxContainer/BoardNum/RightBoardTri.disabled = true
	$VBoxContainer/BoardNum/LeftBoardTri.disabled = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if self.visible:
			_on_PBack_pressed()
			get_node("../TitleUI")._on_PBack_pressed()
