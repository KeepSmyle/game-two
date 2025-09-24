extends "res://Player/Player.gd"

var hopWait = false
var hopTimerStart = false

func _ready():
	JUMP_VELOCITY = -600

func _physics_process(delta):
	
	if is_on_floor():
		velocity.x = 0
	
	if Input.is_action_pressed("peng_action"):
		SPEED = 400.0
		JUMP_VELOCITY = -600
		_hop_movement(delta)
	else:
		SPEED = 200.0
		JUMP_VELOCITY = 0
		_standart_movement(delta)
	
	if hopWait && velocity.y == 0 && !hopTimerStart:
		hopTimerStart = true
		$HopCooldown.start()
		print("now?")

func _hop_movement(delta):
	direction = Input.get_axis("peng_moveLeft", "peng_moveRight")
	
	if is_on_floor() && direction && !hopWait:
		hopWait = true
		hopTimerStart = false
		if direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		elif direction == 1:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction * SPEED
		velocity.y = JUMP_VELOCITY
	if collision:
		print(hopWait)
		print(velocity.y)
	
	# adds gravity 
	if !is_on_floor():
		velocity.y += gravity * delta
	
	collision = move_and_slide()

#different jump?
func _jump(): 
	# Handle jump.
	if Input.is_action_just_pressed("peng_jump") && is_on_floor():
		velocity.y = JUMP_VELOCITY

#sprint disabled
func _sprint():
	pass
	
func _on_hop_cooldown_timeout():
	print("now")
	hopWait = false
