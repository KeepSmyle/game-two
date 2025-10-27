extends Node2D

var player
var rng = RandomNumberGenerator.new()

var ghost_scene = load("res://ghost.tscn")

var sprite_number
var sprites = [load("res://images/Characters/Frog.jpg"),
				load("res://images/Characters/Ghost.jpg"),
				load("res://images/Characters/Peng.jpg"),
				load("res://images/Characters/Spider.jpg")]

var block_scene = load("res://Level/Objects/plattform_block.tscn")
var rock_scene = load("res://Level/Objects/rock.tscn")


func _ready():
	$Dimension_Timer.set_wait_time(rng.randf_range(10, 15))
	$Dimension_Timer.start()
	
	sprite_number = rng.randi_range(0, 3)
	$Plattforms/Plattform2/Plattform_Sprite_End.set_texture(sprites[sprite_number])
	
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
	

func _spawn_new_objects():
	_spawn_plattform()
	
	var rock = rock_scene.instantiate()
	$Generated.add_child(rock)
	rock.position.x += 80
	rock.position.y -= 50
	
func _spawn_plattform():
	var block1 = block_scene.instantiate()
	$Generated.add_child(block1)
	var block2 = block_scene.instantiate()
	$Generated.add_child(block2)
	block2.position.x += 24
	var block3 = block_scene.instantiate()
	$Generated.add_child(block3)
	block3.position.x += 48
	var block4 = block_scene.instantiate()
	$Generated.add_child(block4)
	block4.position.x += 72

func _on_mobspawn_timer_timeout():
	pass#_spawn()
	
func _spawn():
	var new_ghost = ghost_scene.instantiate()
	new_ghost.add_to_group("Mobs")
	$Mobs.add_child(new_ghost)
	new_ghost.set_owner(new_ghost.get_parent())
	new_ghost.position.x += rng.randf_range(500, 1000)
	new_ghost.position.y += 600
	
func _on_dimension_timer_timeout():
	get_tree().change_scene_to_file("res://Level/mobspawn.tscn")
