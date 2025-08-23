extends Node2D

var character = "Bounce_Guy"

func _ready():
	pass 


func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://arena.tscn")
	
	
func _on_character_selection_pressed():
	get_tree().change_scene_to_file("res://character_selection.tscn")
