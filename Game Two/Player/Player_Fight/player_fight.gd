extends "res://Player/Player.gd"

var weapon_animation
var sprite
var weapon_hand_position
var hammer_swing = "hammer_swing_right"

func _ready():
	weapon_animation = $Weapon.find_child("AnimationPlayer")
	sprite = $Weapon.find_child("Sprite")
	weapon_hand_position = $Weapon.transform[2].x

func _physics_process(delta):
	_standart_movement(delta)
	
	if global_position.x > 1500:
		global_position.x -= 1000
		
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
	
