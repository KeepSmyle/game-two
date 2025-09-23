extends "res://Player/Player.gd"

func _ready():
	JUMP_VELOCITY = -600


func _physics_process(delta):
	_standart_movement(delta)
	
	if is_on_floor():
		velocity.x = 0
	
	if Input.is_action_pressed("peng_action"):
		SPEED = 400.0
		_hop_movement(delta)
	else:
		SPEED = 200.0

#todo: jump cooldown?
func _hop_movement(delta):
	if is_on_floor() && direction:
		if direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		elif direction == 1:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction * SPEED
		velocity.y = JUMP_VELOCITY

#different jump?
func _jump():
	# Handle jump.
	if Input.is_action_just_pressed("peng_jump") && is_on_floor():
		velocity.y = JUMP_VELOCITY
		print("hi")

#sprint disabled
func _sprint():
	pass
