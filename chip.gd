extends Area2D
class_name Chip
signal dealt_dmg
var screen_size = Vector2()
var active = false # solves "ghost collision" issue 
var health: int = 0 
var chip_scene = load("res://chip.tscn")
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
var chip_speed = {'Lg': 100, 'Med': 125, 'Sm': 150}
var speed:int 
var chip_bp = {'Lg': 'Med', 'Med': "Sm", "Sm": null} # break up pattern
var current_size:String = 'Lg'
var base_color: String = 'Black'
var direction = Vector2.RIGHT + Vector2.DOWN

@onready var sprite = $Sprite
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	var texture_key = current_size + base_color # combines the color and size strings to create the key for the dict. (i.e. "Lg" and "Black" = "LgBlack"
	if textures.has(texture_key):
		sprite.texture = load(textures[texture_key])
	await get_tree().create_timer(0.2).timeout
	active = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	wrap_around_screen()


func start(pos: Vector2, size: String, color: String, dir: Vector2) -> void:
	position = pos
	current_size = size
	base_color = color # Saving the color so it can be added to children
	direction = dir.normalized()
	health = chip_size[current_size]
	speed = chip_speed[current_size]

func take_damage():
	health -= 25
	if health <= 0:
		explode()
		
func explode() -> void:
	var next_size = chip_bp[current_size]
	if next_size != null:
		for i in range(2):
			var baby_chip = chip_scene.instantiate()
			var split_angle = randf_range(-PI/4, PI/4)
			var new_dir = direction.rotated((split_angle))
			baby_chip.start(position, next_size, base_color, new_dir)
			get_parent().call_deferred("add_child", baby_chip)
	dealt_dmg.emit()
	queue_free()
func wrap_around_screen():
	# If the ship goes off one side of the screen, teleport it to the other
	if position.x > screen_size.x:
		position.x = 0
	elif position.x < 0:
		position.x = screen_size.x

	if position.y > screen_size.y:
		position.y = 0
	elif position.y < 0:
		position.y = screen_size.y	
			
			
func _on_body_entered(body) -> void:
	if not active:
		return
	if body.name == "Player":
		if global_position.distance_to(body.global_position) < 80:
			if body.has_method("take_dmg"):
				body.take_dmg()
		
		
