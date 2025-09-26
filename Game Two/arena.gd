extends Node2D

var playerScene
var Bounce_Player = load("res://Player/Player_bounce.tscn")
var Hook_Player = load("res://Player/Player_hook.tscn")
var Hop_Player = load("res://Player/Player_hop.tscn")
var Slide_Player = load("res://Player/Player_slide.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	match Main.character:
		"Hook_Guy":
			playerScene = Hook_Player.instantiate()
		"Bounce_Guy":
			playerScene = Bounce_Player.instantiate()
		"Hop_Guy":
			playerScene = Hop_Player.instantiate()
		"Slide_Guy":
			playerScene = Slide_Player.instantiate()
			
	find_child("Player").add_child(playerScene)
	playerScene.set_owner(playerScene.get_parent())
	playerScene.transform[2].x += 500
	playerScene.add_to_group("Player")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
