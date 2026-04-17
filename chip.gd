extends Area2D
signal death
signal dealt_dmg
signal breakup(size, extents, pos, vel, hit_vel, color_name)
var skin_frame:int = 0
var textures : {}
var chip_size = {'Lg': 75, 'Med': 50,"Sm": 25}
var chip_speed = 50
var chip_bp = {'Lg': 'Med', 'Med': "Sm", "Sm": null} # break up pattern
var images = {}
var row_map = {'Lg': 0, 'Med': 1, 'Sm': 2}
var color_map = {'Green': 0, 'Blue': 1, 'Red': 2, 'Grey': 3}
var current_size:String = 'Lg'
var current_color:String = 'Green'

@onready var sprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var variation = randi() % 4
	var col_x = (color_map[current_color] * 4) + variation
	var row_y = row_map[current_size]
	sprite.frame_coords = Vector2i(col_x, row_y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
