extends Node

# SIGNALS
signal memory_changed(current: int, max: int)
signal cell_corrupted(index: int)
signal memory_depleted

# MEMORY GRID CONFIGURATION
const GRID_SIZE := 64
const LEAK_RATE := 1.5
const LEAK_INTERVAL := 60.0 / LEAK_RATE
const INITIAL_MEMORY := int(GRID_SIZE * 0.80) # Starts the memory at 80% to add suspense

# MEMORY MANAGEMENT
var cells: Array[int] = []
var current_memory := 0
var max_memory := GRID_SIZE
var leak_timer := 0.0

enum CellState { EMPTY, OCCUPIED, CORRUPTED }

func _ready() -> void:
	_initialize_cells()

func _initialize_cells() -> void:
	# Adjust the size of the array based on the configured size
	cells.resize(GRID_SIZE)
	
	# Populate n% of the grid size with OCCUPIED, the rest is EMPTY
	for i in GRID_SIZE:
		cells[i] = CellState.OCCUPIED if i < INITIAL_MEMORY else CellState.EMPTY
	
	_recalculate_memory()

func _process(delta: float) -> void:
	leak_timer += delta
	if leak_timer >= LEAK_INTERVAL:
		leak_timer = 0.0
		_leak_one_cell()

func _leak_one_cell() -> void:
	var occupied := cells.filter(
		func(cell): return cell == CellState.OCCUPIED
	)
	
	# EMPTY MEMORY GRID
	if occupied.is_empty():
		memory_depleted.emit()
		return
	
	# Corrupt one cell each leak to simulate corruption state
	var target: int = randi_range(0, occupied.size())
	cells[target] = CellState.CORRUPTED
	cell_corrupted.emit(target)
	
	_recalculate_memory()

func consume_cell(index: int) -> bool:
	if cells[index] != CellState.OCCUPIED:
		return false
	
	cells[index] = CellState.EMPTY
	_recalculate_memory()
	return true

func recover_cells(amount: int) -> void:
	var recovered := 0
	
	for i in GRID_SIZE:
		if recovered >= amount:
			break
		
		if cells[i] == CellState.CORRUPTED:
			cells[i] = CellState.OCCUPIED
			recovered += 1
	
	_recalculate_memory()

func get_memory_percent() -> float:
	return float(current_memory) / float(max_memory)

func _recalculate_memory() -> void:
	current_memory = cells.count(CellState.OCCUPIED)
	memory_changed.emit(current_memory, max_memory)
