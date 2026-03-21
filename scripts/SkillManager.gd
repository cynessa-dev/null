extends Node

signal skill_lost(skill_name: String)
signal skill_gained(skill_name: String)

# Each skill maps to a cell index in MemoryManager for reference
const SKILL_CELLS := {
	"dash": 30
}

# Track which skills are currently available
var active_skills: Dictionary = {}

func _ready() -> void:
	_initialize_skills()
	MemoryManager.cell_corrupted.connect(_on_cell_corrupted)

func _initialize_skills() -> void:
	for skill in SKILL_CELLS:
		active_skills[skill] = true

func has_skill(skill_name: String) -> bool:
	return active_skills.get(skill_name, false)

func _on_cell_corrupted(index: int) -> void:
	for skill in SKILL_CELLS:
		if SKILL_CELLS[skill] == index:
			active_skills[skill] = false
			skill_lost.emit(skill)
			
			print("Skill lost: %s" % skill)
