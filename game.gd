## May have received some inspiriation via https://github.com/kidscancode/space_rocks/
extends Node2D

# Settings
var game_over = false
var score = 0
var level = 0
var player_life = 3
var screensize = Vector2()
@onready var CHIP_SCENE = preload("res://chip.tscn")
@onready var heart := [$"Health/Heart/L1",$"Health/Heart/L2",$"Health/Heart/L3"]



# Called when the node enters the scene tree fosr the first time.
func _ready() -> void:
	$Player.position = Vector2(576, 324)
	screensize = get_viewport_rect().size
	update_hearts()
	# Start the first wave
	call_deferred("start_new_level")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# --- WAVE & GAMEPLAY LOGIC ---

func start_new_level():
	level += 1
	screensize = get_viewport_rect().size
	
	# Spawn chips based on the level number
	for i in range(level * 2): 
		spawn_chip()

func spawn_chip():
	var chip = CHIP_SCENE.instantiate()
	
	# Ensure chips don't spawn directly on top of the player
	var pos = Vector2.ZERO
	while pos.distance_to($Player.position) < 200:
		pos = Vector2(randf_range(0, screensize.x), randf_range(0, screensize.y))
		
	var sizes = ["Lg", "Med"]
	var colors = ["Black", "Blue", "Green", "Red"]
	var random_dir = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	
	chip.start(pos, sizes.pick_random(), colors.pick_random(), random_dir)
	
	# Add chip as a child of the Game node so we can count them later
	call_deferred("add_child", chip) 

	# Connect the signal so we know when it breaks
	chip.dealt_dmg.connect(_on_chip_destroyed)

func _on_chip_destroyed():
	score += 10
	update_score()
	# Check if we need to progress to the next level next frame
	call_deferred("check_level_completion")
	if score >= 100:
		get_tree().change_scene_to_file("res://level_2.tscn")
		return

func check_level_completion():
	var chips_remaining = 0
	# Count how many chips are currently alive
	for child in get_children():
		# Make sure we don't count chips that are currently exploding
		if child is Chip and not child.is_queued_for_deletion():
			chips_remaining += 1
			
	# If no chips are left, start the next wave!
	if chips_remaining == 0:
		start_new_level()

func _on_player_died():
	game_over = true
	# Clean up and return to menu
	get_tree().change_scene_to_file("res://system.tscn")
	await get_tree().create_timer(1.5).timeout
	if is_instance_valid($Player):
		$Player.respawn(Vector2(576, 324))

func update_score():
	$Score/Score_Board.text = "Score:" + str(score)
	
func update_hearts():
	print(heart)
	for i in range(heart.size()):
		heart[i].visible = i < player_life
func dmg_tak():
	player_life -= 1
	update_hearts() 
	if  player_life <= 0:
		_on_player_died()
