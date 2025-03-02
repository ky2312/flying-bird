extends CanvasLayer

signal game_start
signal game_end

var score = 0

func show_menu():
	$Menu.visible = true
	$Playing.visible = false
	$GameEnd.visible = false

func show_playing():
	init_score()
	$Menu.visible = false
	$Playing.visible = true
	$GameEnd.visible = false

func show_game_end():
	$Menu.visible = false
	$Playing.visible = false
	$GameEnd.visible = true

func init_score():
	score = 0
	$Playing/Label.text = str(score)
	
func update_score(v: int):
	score += v
	$Playing/Label.text = str(score)

func _on_start_button_pressed() -> void:
	show_playing()
	game_start.emit()


func _on_end_button_pressed() -> void:
	game_end.emit()
