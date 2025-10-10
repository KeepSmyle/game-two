extends Node2D

var player
var mob_node
var rng = RandomNumberGenerator.new()

var ghost = load("res://ghost.tscn")

var hook_sprite = load("res://Player/Player_Hook/sprite_hook.tscn").instantiate()
var hop_sprite = load("res://Player/Player_Hop/sprite_hop.tscn").instantiate()
var slide_sprite = load("res://Player/Player_Slide/sprite_slide.tscn").instantiate()

var hook_script = load("res://Player/Player_Hook/player_hook.gd")
var bounce_script = load("res://Player/Player_Bounce/player_bounce.gd")
var hop_script = load("res://Player/Player_Hop/player_hop.gd")
var slide_script = load("res://Player/Player_Slide/player_slide.gd")

var hop_cooldown = load("res://Player/Player_Hop/hop_cooldown.tscn").instantiate()
var hook_hand = load("res://Player/Player_Hook/hook_hand.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	mob_node = find_child("Mobs")
	_spawn()
	player = $Player
	
	match Global.character:
		"Hook_Guy":
			_load_character(hook_sprite, hook_script)
			_add_node_to_player(hook_hand)
		"Bounce_Guy":
			_load_character(hop_sprite, bounce_script)
		"Hop_Guy":
			_load_character(hop_sprite, hop_script)
			_add_node_to_player(hop_cooldown)
			hop_cooldown.connect("timeout", player._on_hop_cooldown_timeout)
		"Slide_Guy":
			_load_character(slide_sprite, slide_script)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("peng_pause"):
		$Player/Pause_Menu.show()
		get_tree().paused = true
	
	

func _load_character(sprite, script):
	_add_node_to_player(sprite)
	player.set_script(script)
	
func _add_node_to_player(scene):
	player.add_child(scene)
	scene.set_owner(scene.get_parent())


func _on_mobspawn_timer_timeout():
	_spawn()
	
func _spawn():
	var new_ghost = ghost.instantiate()
	mob_node.add_child(new_ghost)
	new_ghost.set_owner(new_ghost.get_parent())
	new_ghost.position.x += rng.randf_range(500, 1000)
	new_ghost.position.y += 600
