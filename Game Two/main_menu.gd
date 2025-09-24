extends Node2D

var character = "Slide_Guy"
var label

func _ready():
	label = find_child("Selected Character")
	_print_current_char()


func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://arena.tscn")
	
	
func _on_character_selection_pressed():
	get_tree().change_scene_to_file("res://character_selection.tscn")

#not working
func _print_current_char():
	if label:
		label.set_text(character.erase(character.length() - 4, 4))
