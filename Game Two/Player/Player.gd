extends CharacterBody2D

var direction
var aim
var collision

var SPEED = 400.0
var JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta):	
	_standart_movement(delta)

func _standart_movement(delta):
	
	_jump()
	_sprint()

	# one axis that can go both ways (a and d)
	direction = Input.get_axis("peng_moveLeft", "peng_moveRight")
	#two axes (such as joystick or WASD movement)
	aim = Input.get_vector("peng_moveLeft", "peng_moveRight", "peng_lookUp", "peng_lookDown")
	
	if direction:
		if direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		elif direction == 1:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction * SPEED
	elif is_on_floor():
		velocity.x = 0#move_toward(velocity.x, 0, SPEED/4)
		
	# adds gravity 
	if !is_on_floor():
		velocity.y += gravity * delta
	
		
	#move_and_slide returns true while colliding
	collision = move_and_slide()
	

func _jump():
	# Handle jump.
	if Input.is_action_just_pressed("peng_jump") && is_on_floor():
		velocity.y = JUMP_VELOCITY

func _sprint():
	# Handle sprint
	if Input.is_action_pressed("peng_sprint") && is_on_floor():
		SPEED = 500
	if Input.is_action_just_released("peng_sprint"):
		SPEED = 300
