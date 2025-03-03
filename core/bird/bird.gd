extends CharacterBody2D
class_name Bird

signal exited

# 重力
const GRAVITY = 980
# 升力速度
const LIFT = 250
# 是否持续飞行
var is_keep_fly = false

func init(pos: Vector2):
	position = pos

func _physics_process(delta: float) -> void:
	if is_keep_fly:
		velocity = Vector2.UP * LIFT
		
	velocity += Vector2.DOWN * GRAVITY * delta
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("fly"):
		if not is_keep_fly:
			$Image.play("up")
		else:
			$Image.play("flap")
			
		is_keep_fly = true
	else:
		is_keep_fly = false
		if $Image.animation != "down":
			$Image.play("down")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	exited.emit()
