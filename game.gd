## May have received some inspiriation via https://github.com/kidscancode/space_rocks/
extends Node2D
# Settings
@export var game_over = false
@export var score = 0

# Player settings
@export var lives:int = 3
@export var laser_dmg:int = 25
@export var dmg_against_boss:int = 10 

# Asteroid settings
@export var break_pattern = {'Lg': 'Med', 'Med': "Sm", "Sm": null}
@export var chip_size = {'Lg': 75, 'Med': 50, "Sm": 25}
@export var boss_size = {'stage1': 100, 'stage2': 50, 'stage3': 25, 'stage4': 10, 'stage5': null}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
