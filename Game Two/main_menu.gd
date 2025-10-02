extends Node2D

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
	label.set_text(Global.character.erase(Global.character.length() - 4, 4))
