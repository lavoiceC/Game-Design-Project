extends Area2D
signal dealt_dmg
# Use pong game collision mechanic to set off breakup signal
var skin_frame:int = 0
var textures = { 
	'LgBlack': "res://Assets/separated_sprites/LgBlack.png", 
	'MedBlack': "res://Assets/separated_sprites/MedBlack.png",
	'SmBlack' : "res://Assets/separated_sprites/SmBlack.png",
	'LgBlue' : "res://Assets/separated_sprites/LgBlue.png",
	'MedBlue' : "res://Assets/separated_sprites/MedBlue.png" ,
	'SmBlue' : "res://Assets/separated_sprites/SmBlue.png" ,
	'LgGreen' : "res://Assets/separated_sprites/LgGreen.png" ,
	'MedGreen' : "res://Assets/separated_sprites/MedGreen.png" ,
	'SmGreen' : "res://Assets/separated_sprites/SmGreen.png" , 
 	'LgRed' : "res://Assets/separated_sprites/LgRed.png" ,
	'MedRed' : "res://Assets/separated_sprites/MedRed.png" ,
	'SmRed' : "res://Assets/separated_sprites/SmRed.png" }

var chip_size = {'Lg': 75, 'Med': 50,"Sm": 25}
var chip_speed = 50
var chip_bp = {'Lg': 'Med', 'Med': "Sm", "Sm": null} # break up pattern
var current_size:String = 'Lg'
var current_color = textures['LgBlack']
var direction = Vector2()  
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
