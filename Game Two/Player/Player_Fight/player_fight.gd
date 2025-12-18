extends "res://Player/Player.gd"

var weapon_animation
var sprite
var weapon_hand_position
var hammer_swing = "hammer_swing_right"
var reachable
var throwable

func _ready():
	$ProgressBar.get("theme_override_styles/fill").set_bg_color(Color.RED)
	$ProgressBar.set_value(Global.player_hp)
	
	weapon_animation = $Weapon.find_child("AnimationPlayer")
	sprite = $Weapon.find_child("Sprite")
	weapon_hand_position = $Weapon.transform[2].x

func _physics_process(delta):
	_standart_movement(delta)
		
	if direction:
		if direction == -1:
			$Weapon.transform[2].x = -weapon_hand_position
			sprite.flip_h = true
			hammer_swing = "hammer_swing_left"
		elif direction == 1:
			$Weapon.transform[2].x = weapon_hand_position
			sprite.flip_h = false
			hammer_swing = "hammer_swing_right"
	
	if Input.is_action_pressed("peng_action"):
		$Weapon._swing(hammer_swing)
	
	if throwable:
		throwable.global_position = self.global_position
		
		
func _input(event):
	if Input.is_action_pressed("peng_throw"):
		if throwable:
			throwable.thrown = true
			throwable = null
		elif reachable:
			throwable = reachable
			reachable = null
			#placing the throwable in hand while sprite is flipped
			#if get_node("AnimatedSprite2D").flip_h:
			#	throwable.transform[2].x -= 2* $Hand.transform[2].x
