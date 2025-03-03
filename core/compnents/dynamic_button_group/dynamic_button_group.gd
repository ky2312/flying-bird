# 该组件需要使用1个Marker2D作为坐标

extends Control
class_name DynamicButtonGroup

@export_range(0, 1000) var subbutton_width: float = 100.0
@export_range(0, 1000) var subbutton_height: float = 50.0
@export_range(0, 100) var subbutton_margin: float = 0

var marker: Marker2D
var total = 0

func add_button(name: StringName, handler: Callable):	
	total += 1
	var o = marker.position
	var w = subbutton_width
	var h = subbutton_height
	var b = Button.new()
	b.text = name
	b.position = o
	b.position.y += (total - 1) * (h + subbutton_margin)
	b.size = Vector2(w, h)
	b.connect("pressed", handler)
	b.connect("tree_exiting", func(): total = max(0, total - 1))
	add_child(b)

func clear_button():
	for n in get_children():
		if n.get_class() == "Button":
			n.queue_free()
			
	total = 0
			
func _ready() -> void:
	for n in get_children():
		if n.get_class() == "Marker2D":
			marker = n
			break
	if not marker:
		printerr("缺少1个Marker节点")
