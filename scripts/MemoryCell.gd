extends ColorRect

const COLOR_OCCUPIED  := Color("4fc3f7")
const COLOR_EMPTY     := Color("1a1a2e")
const COLOR_CORRUPTED := Color("e94560")

var cell_index := -1

func setup(index: int, state: int) -> void:
	cell_index = index
	_apply_state(state)

func update_state(state: int) -> void:
	_apply_state(state)

func _apply_state(state: int) -> void:
	match state:
		MemoryManager.CellState.OCCUPIED:
			color = COLOR_OCCUPIED
		
		MemoryManager.CellState.EMPTY:
			color = COLOR_EMPTY
		
		MemoryManager.CellState.CORRUPTED:
			color = COLOR_CORRUPTED
			
			# Adds animation for visual feel~
			var tween := create_tween().set_loops(3)
			tween.tween_property(self, "color", COLOR_EMPTY, 0.08)
			tween.tween_property(self, "color", COLOR_CORRUPTED, 0.08)
