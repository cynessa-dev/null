# NPC.gd
extends Node2D

@export var npc_name: String = "Unknown"
@export var cell_index: int = -1
@export var dialogue_lines: Array[String] = []

var is_forgotten := false
var dialogue_index := 0

func _ready() -> void:
	MemoryManager.cell_corrupted.connect(_on_cell_corrupted)

func interact() -> void:
	if is_forgotten:
		return
	if dialogue_lines.is_empty():
		print("%s has nothing to say." % npc_name)
		return
	print("%s: %s" % [npc_name, dialogue_lines[dialogue_index]])
	dialogue_index = (dialogue_index + 1) % dialogue_lines.size()

func _on_cell_corrupted(index: int) -> void:
	if index != cell_index:
		return
	is_forgotten = true
	_fade_out()

func _fade_out() -> void:
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.5)
	tween.tween_callback(queue_free)

# ===============
# SIGNALS
# ===============

func _on_interaction_zone_body_entered(body: Node2D) -> void:
	if body.has_method("set_nearby_npc"):
		body.set_nearby_npc(self)

func _on_interaction_zone_body_exited(body: Node2D) -> void:
	if body.has_method("set_nearby_npc"):
		body.clear_nearby_npc();
