extends Node2D


func _ready():
	var char_label = find_child("Selected Character")
	_print_current_char(char_label)
	var level_label = find_child("Selected Level")
	_print_current_level(level_label)

func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	match Global.level:
		"Arena":
			get_tree().change_scene_to_file("res://Level/arena.tscn")
		"Mobspawn":
			get_tree().change_scene_to_file("res://Level/mobspawn.tscn")
		"Loop":
			get_tree().change_scene_to_file("res://Level/loop.tscn")
		"Beach":
			get_tree().change_scene_to_file("res://Level/beach.tscn")
	
	
func _on_character_selection_move_pressed():
	get_tree().change_scene_to_file("res://Menu/character_selection_move.tscn")
	
func _on_character_selection_fight_pressed():
	get_tree().change_scene_to_file("res://Menu/character_selection_fight.tscn")
	
func _on_level_selection_pressed():
	get_tree().change_scene_to_file("res://Menu/level_selection.tscn")
	

func _print_current_char(label):
	label.set_text(Global.character.erase(Global.character.length() - 4, 4))
	
func _print_current_level(label):
	label.set_text(Global.level)


