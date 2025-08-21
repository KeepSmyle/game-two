extends Node2D

var Player = load("res://Player/Player_hook.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var playerScene = Player.instantiate()
	find_child("Player").add_child(playerScene)
	playerScene.set_owner(playerScene.get_parent())
	playerScene.transform[2].x += 500
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
