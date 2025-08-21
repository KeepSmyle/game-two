extends Node2D

func _ready():
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_hook_guy_pressed():
	Main.character = "Hook_Guy"


func _on_bounce_guy_pressed():
	Main.character = "Bounce_Guy"
