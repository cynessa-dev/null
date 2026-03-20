extends Node2D

@export var npc_name: String = "Unknown"
@export var cell_index: int = -1
@export var dialogue_lines: Array[String] = []

var dialogue_index := 0

func interact() -> void:
	if dialogue_lines.is_empty():
		print("%s has nothing to say." % npc_name)
		return
	print("%s: %s" % [npc_name, dialogue_lines[dialogue_index]])
	dialogue_index = (dialogue_index + 1) % dialogue_lines.size()
