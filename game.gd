## May have received some inspiriation via https://github.com/kidscancode/space_rocks/
extends Node2D
# Settings
@export var game_over = false
@export var score = 0
@export var level = 1

# chip & virus settings
@export var break_pattern = {'Lg': 'Med', 'Med': "Sm", "Sm": null}
@export var chip_size = {'Lg': 75, 'Med': 50,"Sm": 25}
@export var virus_size = {'Lg': 150, 'Med': 75, 'Sm': 25}
@export var enemy_dmg = 1
@export var chip_speed = 50
@export var virus_speed = chip_speed
# Melissa (Boss) settings
@export var boss_size = {'s1': 100, 's2': 80, 's3': 60, 's4': 40, 's5': 20} 
@export var boss_pattern = {'s1': 's2', 's2': 's3', 's3': 's4', 's4': 's5', 's5': null}
@export var boss_damage = {'s1': 3, 's2': 3, 's3': 2, 's4': 1, 's5': 1}
@export var boss_speed = {'s1': 0, 's2': 20, 's3': 50, 's4': 75, 's5': 100}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
