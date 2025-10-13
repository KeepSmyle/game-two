extends "res://Player/Player.gd"

var animation
var sprite
var weapon_hand_position
var hammer_swing = "hammer_swing_right"
var attack_ready = true

func _ready():
	animation = $Weapon.find_child("AnimationPlayer")
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
			
	if !animation.is_playing() && !attack_ready:
		animation.play("RESET")
		attack_ready = true
	
	if Input.is_action_pressed("peng_action"):
		animation.play(hammer_swing)
		attack_ready = false
