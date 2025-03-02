extends Node2D

@export var woodManager: PackedScene
@export var Bird: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD.show_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_hud_game_start() -> void:
	var b: Bird = Bird.instantiate()
	var w: WoodManager = woodManager.instantiate()
	var game_over = func():
		b.queue_free()
		w.queue_free()
		$GamePlayingTimer.stop()
		$HUD.show_game_end()
		
	b.init($StartMarker.position)
	b.connect("exited", game_over)
	w.connect("touch", game_over)
	$GamePlayingTimer.start()
	
	add_child(b)
	add_child(w)


func _on_hud_game_end() -> void:
	get_tree().quit()


func _on_game_playing_timer_timeout() -> void:
	$HUD.update_score(1)
