## May have received some inspiriation via https://github.com/kidscancode/space_rocks/
extends Area2D
## how fast the ship rotates
var rot_speed:float = 2.6
## determines how much thrust the ship has
var thrust: Vector2 = Vector2(500, 0)
# Player Life(s)
var lives:int = 3
# Damage against normal enemies & Boss
var laser_dmg:int = 25
var dmg_against_boss:int = 10 
# Signals to determine actions
signal player_death
signal shoot
signal life_lost
signal movement



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
