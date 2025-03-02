extends CharacterBody2D
class_name Bird

signal exited

# 重力
const GRAVITY = 980
# 升力速度
const LIFT = 250

func init(pos: Vector2):
	position = pos

func _physics_process(delta: float) -> void:
	velocity += Vector2.DOWN * GRAVITY * delta
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("fly"):
		velocity = Vector2.UP * LIFT


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	exited.emit()
