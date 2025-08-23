extends Node2D

func _ready():
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_hook_guy_pressed():
	_untoggle_all()
	Main.character = "Hook_Guy"
	find_child("Hook_Guy").button_pressed = true


func _on_bounce_guy_pressed():
	_untoggle_all()
	Main.character = "Bounce_Guy"
	find_child("Bounce_Guy").button_pressed = true

func _untoggle_all():
	find_child("Hook_Guy").button_pressed = false
	find_child("Bounce_Guy").button_pressed = false
	
