extends Node2D
class_name WoodManager

signal touch

@export var wood: PackedScene

var woods: Dictionary[Wood, int]
var GENERATE_SPEED = 1.5

func create():
	var w: Wood = wood.instantiate()
	var w_pos = $WoodMarker.position
	var max_h_offset = get_viewport_rect().size.y * 0.2
	w_pos.y += randf_range(max_h_offset * -1, max_h_offset)
	w.init(w_pos)
	
	w.connect("touch", func(): touch.emit())
	w.connect("screen_exited", func(): 
		woods.erase(w)
		w.queue_free()
	)
	
	woods[w] = 1
	add_child(w)

func start():
	create()
	$Timer.wait_time = GENERATE_SPEED
	$Timer.start()
	
func clear():
	for w in woods:
		w.queue_free()
	woods.clear()
	$Timer.stop()

func _on_timer_timeout() -> void:
	create()
