extends "res://Player/Player.gd"

var MAX_SPEED = 800
var ACCELERATION = 15

func _ready():
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("peng_action"):
		$AnimatedSprite2D.rotation_degrees = 90
		_slide_movement(delta)
	else:
		$AnimatedSprite2D.rotation = 0
		_standart_movement(delta)

func _slide_movement(delta):
	#todo: rotate sprite
	
	direction = Input.get_axis("peng_moveLeft", "peng_moveRight")
	
	if is_on_floor() && direction:
		if direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		elif direction == 1:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, ACCELERATION)
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, 5)
	
	# adds gravity 
	if !is_on_floor():
		velocity.y += gravity * delta
	
	collision = move_and_slide()
