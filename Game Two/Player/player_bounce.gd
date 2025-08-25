extends "res://Player/Player.gd"

const bounce_multi = 1.5


func _ready():
	pass


func _physics_process(delta):
	_standart_movement(delta)
	
	if collision && Input.is_action_pressed("peng_action"):
		if direction > 0:
			velocity.x = -1 * SPEED * bounce_multi
		else:
			velocity.x = SPEED * bounce_multi
		velocity.y = -1 * velocity.y * bounce_multi
