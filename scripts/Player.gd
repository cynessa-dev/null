extends CharacterBody2D

# CONSTANTS
const SPEED := 120.0
const DASH_SPEED := 400.0
const DASH_DURATION := 0.15
const DASH_COOLDOWN := 1.0

# CONFIGURATIONS
var nearby_npc: Node = null
var is_dashing := false
var dash_timer := 0.0
var dash_cooldown_timer := 0.0
var dash_direction := Vector2.ZERO

# For visual feedback
@onready var body: ColorRect = $Body

func _physics_process(delta: float) -> void:
	_handle_dash_timers(delta)
	_handle_movement()
	_handle_interaction()
	move_and_slide()

func _handle_dash_timers(delta: float) -> void:
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false
			body.color = Color("ffffff")
			
	if dash_cooldown_timer > 0.0:
		dash_cooldown_timer -= delta

func _handle_movement() -> void:
	if is_dashing:
		velocity = dash_direction * DASH_SPEED
		return

	var direction := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()

	velocity = direction * SPEED

	# Attempt dash
	if Input.is_action_just_pressed("dash"):
		if not SkillManager.has_skill("dash"):
			print("You've forgotten how to dash.")
			return
			
		if dash_cooldown_timer > 0.0:
			return
			
		if direction == Vector2.ZERO: # Player is standing still
			return
			
		_start_dash(direction)

func _start_dash(direction: Vector2) -> void:
	is_dashing = true
	dash_timer = DASH_DURATION
	dash_cooldown_timer = DASH_COOLDOWN
	dash_direction = direction
	
	# Flash cyan during dash
	body.color = Color("4fc3f7")

func _handle_interaction() -> void:
	if Input.is_action_just_pressed("interact") and nearby_npc != null:
		nearby_npc.interact()

func set_nearby_npc(npc: Node) -> void:
	nearby_npc = npc

func clear_nearby_npc() -> void:
	nearby_npc = null
