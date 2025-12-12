extends Node2D

var player
var rng = RandomNumberGenerator.new()

var sprite_number
var sprites = [load("res://images/Terrain/Beach/Palmtree_1.png"),
				load("res://images/Terrain/Beach/Palmtree_2.png"),
				load("res://images/Terrain/Beach/Palmtree_3.png"),
				load("res://images/Terrain/Beach/Palmtree_4.png"),
				load("res://images/Terrain/Beach/Palmtree_5.png")]


func _ready():
	sprite_number = rng.randi_range(0, 4)
	$Palms/Sprite_End.set_texture(sprites[sprite_number])
	
	player = $Player/player
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if player.global_position.x > 4700:
		_reset()

func _reset():
	_reset_player()
	#_reset_objects()
	
func _reset_player():
	$Palms/Sprite_Start.set_texture(sprites[sprite_number])
	player.global_position.x -= 2883
	sprite_number = rng.randf_range(0, 4)
	$Palms/Sprite_End.set_texture(sprites[sprite_number])
	
func _reset_objects():
	for node: Node in $Generated.get_children():
		node.queue_free()
	#_spawn_new_objects()
