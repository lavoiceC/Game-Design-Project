## May have received some inspiriation via https://github.com/kidscancode/space_rocks/
## This file has been set to Autoload at the top of every scene,
## therefore, by appending "game" to a variable listed, it may be called
## in another file. (e.g. game.chip_size = = cs, enemy1 = cs['Lg'], etc )
extends Node2D
# Settings
var game_over = false
var score = 0
var level = 1
var screensize = Vector2()
# chip & virus settings
var break_pattern = {'Lg': 'Med', 'Med': "Sm", "Sm": null}
# Will place Virus and Boss variables inside seperate files 
var virus_size = {'Lg': 150, 'Med': 75, 'Sm': 25}
var virus_speed = 70
# Melissa (Boss) settings
var boss_size = {'s1': 100, 's2': 80, 's3': 60, 's4': 40, 's5': 20} 
var boss_pattern = {'s1': 's2', 's2': 's3', 's3': 's4', 's4': 's5', 's5': null}
var boss_damage = {'s1': 3, 's2': 3, 's3': 2, 's4': 1, 's5': 1}
var boss_speed = {'s1': 0, 's2': 20, 's3': 50, 's4': 75, 's5': 100}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.position = Vector2(576,600)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
