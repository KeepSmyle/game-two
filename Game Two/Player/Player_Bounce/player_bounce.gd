extends "res://Player/Player.gd"

const bounce_multi = 1.5

#is not used, since script is loaded in later
func _ready():
	pass

#TODO: fix
func _physics_process(delta):
	_standart_movement(delta)
	
	if collision && Input.is_action_pressed("peng_action"):
		#this way leads to sliding while on the ground
		if direction > 0:
			velocity.x = -1 * SPEED * bounce_multi
		elif direction != 0:
			velocity.x = SPEED * bounce_multi
		
		#landing on the ground leads to velocity.y being 0 instead of bouncing
		velocity.y = -1 * velocity.y * bounce_multi
