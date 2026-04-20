extends Node2D
signal Start
signal End

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	$Start.text = 'Start Game'
	$End.text = 'Quit'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_start_button_down() -> void:
	emit_signal('Start')


func _on_end_button_down() -> void:
	emit_signal('End')
