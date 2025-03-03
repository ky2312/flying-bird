extends Node2D

func game_start():
	$Bird.init($StartMarker.position)
	$Bird.show()
	$WoodManager.start()
	$GamePlayingTimer.start()

func game_over():
	$Bird.hide()
	$WoodManager.clear()
	$HUD.show_game_end()
	$GamePlayingTimer.stop()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_hud_game_start() -> void:
	game_start()

func _on_hud_game_end() -> void:
	get_tree().quit()


func _on_game_playing_timer_timeout() -> void:
	$HUD.update_score(1)


func _on_wood_manager_touch() -> void:
	game_over()


func _on_bird_exited() -> void:
	game_over()
