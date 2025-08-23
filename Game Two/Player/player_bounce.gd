extends "res://Player/Player.gd"


func _ready():
	pass


func _physics_process(delta):
	_standart_movement(delta)
	
	if Input.is_action_pressed("peng_action"):
		if collision:
			velocity.x = -1 * velocity.x
			velocity.y = -1 * velocity.y
