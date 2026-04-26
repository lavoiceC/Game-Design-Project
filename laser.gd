extends Area2D
var screen_size: Vector2
@export var speed:float = 800.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	var forward = Vector2.UP.rotated(rotation)
	global_position += forward * speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	wrap_around_screen()
	await get_tree().create_timer(0.14256).timeout
	queue_free()
func wrap_around_screen():
	# to bring objects to the opposite side of the map 
	if position.x > screen_size.x:
		position.x = 0
	elif position.x < 0:
		position.x = screen_size.x

	if position.y > screen_size.y:
		position.y = 0
	elif position.y < 0:
		position.y = screen_size.y

func _on_area_entered(area: Area2D) -> void:
	if area is Chip:
		area.explode()
		queue_free()
