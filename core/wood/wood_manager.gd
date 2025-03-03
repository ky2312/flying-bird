extends Node2D
class_name WoodManager

signal touch

@export var wood: PackedScene

func create():
	var w = wood.instantiate()
	var w_pos = $WoodMarker.position
	var max_h_offset = get_viewport_rect().size.y * 0.2
	w_pos.y += randf_range(max_h_offset * -1, max_h_offset)
	w.init(w_pos)
	w.connect("touch", func():
		touch.emit()
	)
	
	add_child(w)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create()

func _on_timer_timeout() -> void:
	create()
