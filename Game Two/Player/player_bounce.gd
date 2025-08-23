extends "res://Player/Player.gd"


func _ready():
	pass


func _physics_process(delta):
	_standart_movement(delta)
	move_and_slide()
