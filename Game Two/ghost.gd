extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _ready():
	pass


func _process(delta):
	#Gravity for frog
	velocity.y += gravity * delta
	if chase:
		player = get_node("../../Player/player_fight")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else: 
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
	move_and_slide()


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_damage_detection_body_entered(body):
	if body.is_in_group("Falling") && (body.linear_velocity.y != 0 || body.linear_velocity.x != 0):
		queue_free()
