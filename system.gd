extends Node2D
@onready var game = preload('res://game.tscn')
var stop_music:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	
func _on_start_menu_start() -> void:
	var new_game = game.instantiate()
	add_child(new_game)
	remove_child($Menu)
	$AudioStreamPlayer2D.stop()





func _on_start_menu_end() -> void:
	get_tree().quit()


func _on_audio_stream_player_2d_stop():
	if stop_music == true:
		$AudioStreamPlayer2D.stop()
