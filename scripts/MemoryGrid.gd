extends GridContainer

@export var cell_scene: PackedScene

var cell_nodes: Array = []

func _ready() -> void:
	columns = 8 # Default Value
	
	_build_grid()
	
	MemoryManager.cell_corrupted.connect(_on_cell_corrupted)
	MemoryManager.memory_changed.connect(_on_memory_changed)

func _build_grid() -> void:
	for i in MemoryManager.GRID_SIZE:
		var cell = cell_scene.instantiate()
		
		cell.custom_minimum_size = Vector2(20, 20) # Default Min Size
		cell.setup(i, MemoryManager.cells[i])
		
		add_child(cell)
		
		cell_nodes.append(cell)

func _on_cell_corrupted(index: int) -> void:
	cell_nodes[index].update_state(MemoryManager.CellState.CORRUPTED)

func _on_memory_changed(current: int, max_mem: int) -> void:
	print("Memory: %d / %d (%.0f%%)" % [current, max_mem, MemoryManager.get_memory_percent() * 100])
