extends Node2D

func _ready():
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_arena_pressed():
	_untoggle_all()
	Global.level = "Arena"
	find_child("Arena").button_pressed = true


func _on_mobspawn_pressed():
	_untoggle_all()
	Global.level = "Mobspawn"
	find_child("Mobspawn").button_pressed = true
	
	
func _untoggle_all():
	find_child("Arena").button_pressed = false
	find_child("Mobspawn").button_pressed = false
	find_child("Loop").button_pressed = false


func _on_mobspawn_2_pressed():
	_untoggle_all()
	Global.level = "Loop"
	find_child("Loop").button_pressed = true
