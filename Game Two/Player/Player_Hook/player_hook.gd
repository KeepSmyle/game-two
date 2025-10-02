extends "res://Player/Player.gd"

var Hook  = load("res://Player/Player_Hook/Hook.tscn")
var hookScene
var hook
var rope
var hookIsFired = false
var hook_starting_position
var swing_speed = 500.0

#is not used, since script is loaded in later
func _ready():
	pass

func _physics_process(delta):
	_standart_movement(delta)
	
	# Handle jump.
	if Input.is_action_just_pressed("peng_jump") && is_on_floor():
		velocity.y = JUMP_VELOCITY

	# one axis that can go both ways (a and d)
	var direction = Input.get_axis("peng_moveLeft", "peng_moveRight")
	#two axes (such as joystick or WASD movement)
	var aim = Input.get_vector("peng_moveLeft", "peng_moveRight", "peng_lookUp", "peng_lookDown")
	
	if is_on_floor() && direction:
		if direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		elif direction == 1:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction * SPEED
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED/4)
		
	if Input.is_action_just_pressed("peng_action"):
		shoot(aim)
		
	if hookIsFired:
		rope.set_point_position(0, get_player_position())
	else:
		swing_speed = 400.0
		
	#swinging movement
	if !is_on_floor():
		if hookIsFired && hook.isStuck:
			var hook_direction_x = hook.global_position.x - $Hand.global_position.x
			var hook_direction_y = $Hand.global_position.y - hook.global_position.y
			var hook_distance = $Hand.global_position.distance_to(hook.global_position)
			#calculation leads to a smooth circular movement
			if hook_direction_x > 0:
				#true = swing to the right
				if hook.swingdirection:
					velocity.x = swing_speed * hook_direction_y / hook_distance
					velocity.y = swing_speed * hook_direction_x / hook_distance
				#false = swing to the left
				else:
					velocity.x = swing_speed * -hook_direction_y / hook_distance
					velocity.y = swing_speed * -hook_direction_x / hook_distance
			else:
				#true = swing to the right
				if hook.swingdirection:
					velocity.x = swing_speed * hook_direction_y / hook_distance
					velocity.y = swing_speed * hook_direction_x / hook_distance
				#false = swing to the left
				else:
					velocity.x = swing_speed * -hook_direction_y / hook_distance
					velocity.y = swing_speed * -hook_direction_x / hook_distance

	if collision:
		if hookIsFired && hook.isStuck:	
			hookScene.queue_free()
			hookIsFired = false
		
func shoot(aim: Vector2):
	if hookIsFired:	
		hookScene.queue_free()
		hookIsFired = false
	else:
		hookScene = Hook.instantiate()
		owner.add_child(hookScene)
		hookScene.transform = $Hand.global_transform
		if get_node("AnimatedSprite2D").flip_h:
			hookScene.transform[2].x -= 2* $Hand.transform[2].x
		hook = hookScene.find_child("Hook")
		hook.rotation = aim.angle()
		hook_starting_position = hook.global_position
		rope = hookScene.find_child("Line2D")
		hookIsFired = true
	
func get_player_position():
	var hand_current_position = $Hand.global_position
	
	return Vector2(hand_current_position.x - hook_starting_position.x,hand_current_position.y - hook_starting_position.y)
