extends Node2D

var player
var mob_node
var rng = RandomNumberGenerator.new()

var ghost_scene = load("res://ghost.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	mob_node = find_child("Mobs")
	_spawn()
	player = $Player/player_fight
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("peng_pause"):
		$Player/Player/Pause_Menu.show()
		get_tree().paused = true
	
	

func _load_character(sprite, script):
	_add_node_to_player(sprite)
	player.set_script(script)
	
func _add_node_to_player(scene):
	player.add_child(scene)
	scene.set_owner(scene.get_parent())


func _on_mobspawn_timer_timeout():
	pass#_spawn()
	
func _spawn():
	var new_ghost = ghost_scene.instantiate()
	new_ghost.add_to_group("Mobs")
	mob_node.add_child(new_ghost)
	new_ghost.set_owner(new_ghost.get_parent())
	new_ghost.position.x += rng.randf_range(500, 1000)
	new_ghost.position.y += 600
