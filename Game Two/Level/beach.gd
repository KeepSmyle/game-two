extends Node2D

var player
var rng = RandomNumberGenerator.new()

var sprite_number
var sprites = [load("res://images/Terrain/Beach/Palmtree_1.png"),
				load("res://images/Terrain/Beach/Palmtree_2.png"),
				load("res://images/Terrain/Beach/Palmtree_3.png"),
				load("res://images/Terrain/Beach/Palmtree_4.png"),
				load("res://images/Terrain/Beach/Palmtree_5.png")]

var ghost_scene = load("res://ghost.tscn")

func _ready():
	sprite_number = rng.randi_range(0, 4)
	$Palms/Sprite_End.set_texture(sprites[sprite_number])
	_spawn_palm()
	_spawn_ghost(2300, 4400)
	
	player = $Player/player
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if player.global_position.x > 4700:
		_reset()

func _reset():
	_reset_player()
	_reset_objects()
	
func _reset_player():
	$Palms/Sprite_Start.set_texture(sprites[sprite_number])
	player.global_position.x -= 2883
	sprite_number = rng.randi_range(0, 4)
	$Palms/Sprite_End.set_texture(sprites[sprite_number])
	
func _reset_objects():
	for node: Node in $Palms/Generated_Palms.get_children():
		node.queue_free()
	_spawn_palm()
	_spawn_ghost(2300, 4400)

func _spawn_palm():
	var new_palm = Sprite2D.new()
	$Palms/Generated_Palms.add_child(new_palm)
	new_palm.set_owner(new_palm.get_parent())
	
	new_palm.set_texture(sprites[rng.randi_range(0, 4)])
	new_palm.set_scale(Vector2(3,3))
	new_palm.position.x = rng.randi_range(2800, 4000)
	new_palm.position.y = rng.randi_range(380, 480)
	
func _spawn_ghost(lrange, urange):
	var new_ghost = ghost_scene.instantiate()
	new_ghost.add_to_group("Mobs")
	$Mobs.add_child(new_ghost)
	new_ghost.set_owner(new_ghost.get_parent())
	new_ghost.position.x = rng.randi_range(lrange, urange)
	new_ghost.position.y = 555
