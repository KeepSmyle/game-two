extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("peng_pause") &&false:
		get_tree().paused = false
		hide()
		print("test2")


func _on_continue_pressed():
	get_tree().paused = false
	hide()


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
