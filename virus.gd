extends Area2D

var break_pattern = {'Lg': 'Med', 'Med': "Sm", "Sm": null}
# Will place Virus and Boss variables inside seperate files 
var virus_size = {'Lg': 150, 'Med': 75, 'Sm': 25}
var virus_speed = 70
var direction = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
