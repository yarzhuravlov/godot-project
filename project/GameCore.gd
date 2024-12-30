extends Node

var state: GameState

func update_is_valid() -> void:
	state.is_valid = not state.is_valid


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = GameState.new()
	
	print(state.is_valid)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
