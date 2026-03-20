extends CharacterBody2D

const SPEED := 120.0

func _physics_process(delta: float) -> void:
	_handle_movement()
	move_and_slide()

func _handle_movement() -> void:
	var direction := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	velocity = direction * SPEED
