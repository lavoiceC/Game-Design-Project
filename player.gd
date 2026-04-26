extends CharacterBody2D
@export var thrust_power: float = 175.0
@export var rotation_speed: float = 4.0
@export var friction: float = 0.5 
@export var max_speed: float = 200.0
@export var laser_scene: PackedScene
var screen_size: Vector2
var LASER_SCENE = preload("res://laser.tscn")
@onready var shoot_sound = $ShootSound
func _ready():
	screen_size = get_viewport_rect().size
	
func shoot():
	
	var laser = LASER_SCENE.instantiate()
	var nose_offset = Vector2(0, -35).rotated(rotation)
	laser.global_position = global_position + nose_offset
	laser.rotation = rotation + 0.25 #  additional offset because the laser would not fire from the front of ship.
	get_parent().call_deferred("add_child",laser)
	shoot_sound.play()
	
func _physics_process(delta: float):
	# Handle Rotation
	var rotation_dir = Input.get_axis("ui_left", "ui_right")
	rotation += rotation_dir * rotation_speed * delta
	
	# Handle Shooting
	if Input.is_action_just_pressed("shoot"):
		shoot()
	# Handle Thrust
	if Input.is_action_pressed("ui_up"):
		var forward_direction = Vector2.UP.rotated(rotation)
		velocity += forward_direction * thrust_power * delta
	
	# Apply Friction (Drag) and Speed Limits
	velocity = velocity.move_toward(Vector2.ZERO, friction)
	velocity = velocity.limit_length(max_speed)
	if Input.is_action_pressed("ui_down"):
		var forward_direction = Vector2.DOWN.rotated(rotation)
		velocity += forward_direction * thrust_power * delta
		velocity = velocity.move_toward(Vector2.ZERO, friction)
		velocity = velocity.limit_length(max_speed)
	# Move the ship
	move_and_slide()

	# Screen Wrapping
	wrap_around_screen()

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
