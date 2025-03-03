extends Node2D
class_name Wood

signal touch
signal screen_exited

func init(origin_pos: Vector2):
	position = origin_pos
	
func _physics_process(delta: float) -> void:
	position += Vector2.LEFT * 2.5


func _on_area_2d_body_entered(body: Node2D) -> void:
	touch.emit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	screen_exited.emit()
