extends Node2D

var player
var mob_node
var rng = RandomNumberGenerator.new()

var ghost_scene = load("res://ghost.tscn")

var sprite_number
var sprites = [load("res://images/Characters/Frog.jpg"),
				load("res://images/Characters/Ghost.jpg"),
				load("res://images/Characters/Peng.jpg"),
				load("res://images/Characters/Spider.jpg")]
				


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_number = rng.randf_range(1, 5)
	$Plattforms/Plattform2/Plattform_Sprite_End.set_texture(sprites[sprite_number])
	
	mob_node = find_child("Mobs")
	_spawn()
	player = $Player/player
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("peng_pause"):
		$Player/player/Pause_Menu.show()
		get_tree().paused = true
	
	if player.global_position.x > 1500:
		_reset()
	

func _load_character(sprite, script):
	_add_node_to_player(sprite)
	player.set_script(script)
	
func _add_node_to_player(scene):
	player.add_child(scene)
	scene.set_owner(scene.get_parent())

func _reset():
	_reset_player()
	_reset_objects()
	
func _reset_player():
	$Plattforms/Plattform1/Plattform_Sprite_Start.set_texture(sprites[sprite_number])
	rng.randf_range(1, 5)
	player.global_position.x -= 1100
	sprite_number = rng.randf_range(0, 3)
	$Plattforms/Plattform2/Plattform_Sprite_End.set_texture(sprites[sprite_number])
	
func _reset_objects():
	for node: Node in $Generated.get_children():
		node.queue_free()
	_spawn_new_objects()
	
#TODO: put generated objects in seperate scenes to spawn them
func _spawn_new_objects():
	pass 

func _on_mobspawn_timer_timeout():
	pass#_spawn()
	
func _spawn():
	var new_ghost = ghost_scene.instantiate()
	new_ghost.add_to_group("Mobs")
	mob_node.add_child(new_ghost)
	new_ghost.set_owner(new_ghost.get_parent())
	new_ghost.position.x += rng.randf_range(500, 1000)
	new_ghost.position.y += 600
