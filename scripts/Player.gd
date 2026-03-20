# Player.gd
extends CharacterBody2D

const SPEED := 120.0

# This will get populated when player gets near NPCs
var nearby_npc: Node = null

func _physics_process(delta: float) -> void:
	_handle_movement()
	_handle_interaction()
	move_and_slide()

func _handle_movement() -> void:
	var direction := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	velocity = direction * SPEED

func _handle_interaction() -> void:
	if Input.is_action_just_pressed("interact") and nearby_npc != null:
		nearby_npc.interact()

func set_nearby_npc(npc: Node) -> void:
	nearby_npc = npc

func clear_nearby_npc() -> void:
	nearby_npc = null
