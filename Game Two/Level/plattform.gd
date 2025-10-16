extends StaticBody2D

var sprite
var destruct_lvl = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = find_child("Sprite2D")


func _process(delta):
	pass
	

func _destruct():
	destruct_lvl += 1
	match destruct_lvl:
		1:
			sprite.texture = load('res://images/Terrain/Dirt/Dirt1_littlebroken.png')
		2:
			sprite.texture = load('res://images/Terrain/Dirt/Dirt1_allmostbroken.png')
		3:
			queue_free()
