extends "res://Player/Player.gd"


func _ready():
	pass


func _physics_process(delta):
	_standart_movement(delta)
	
	if collision && Input.is_action_pressed("peng_action"):
		if direction > 0:
			pass#velocity.x = -1 * SPEED * bounce_multi
