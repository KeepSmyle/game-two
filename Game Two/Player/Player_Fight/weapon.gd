extends Node2D

var shockwave_scene = load("res://Player/Player_Fight/shockwave.tscn")
var shockwave
var shockwave_animation
var direction = 1
var is_attacking = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _swing(hammer_swing):
	is_attacking = true
	$AnimationPlayer.play(hammer_swing)
	match hammer_swing:
		"hammer_swing_right":
			direction = 1
		"hammer_swing_left":
			direction = -1
	
	#alternative to reset with player_animation_finished	
	#if !$AnimationPlayer.is_playing() && is_attacking:
		#$AnimationPlayer.play("RESET")
		#is_attacking = false

func _on_hitbox_body_entered(body):
	if body.is_in_group("Mobs") && is_attacking:
		body.queue_free()
	
	if body.is_in_group("Terrain") && is_attacking:
		_aftershock()
	
	if body.is_in_group("Destructable") && is_attacking:
		body._destruct()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "hammer_swing_right" || anim_name == "hammer_swing_left":
		$AnimationPlayer.play("RESET")
		is_attacking = false

func _aftershock():
	shockwave = shockwave_scene.instantiate()
	owner.get_owner().add_child(shockwave)
	shockwave._quake($Hitbox.global_transform.origin, direction)
