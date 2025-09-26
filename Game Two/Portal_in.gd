extends Area2D


func _ready():
	connect("body_entered", _on_Player_body_entered)

func _process(delta):
	pass


#area2d needed for body_entered
#children nodes not inherited
func _on_Player_body_entered(body):
	print(body)
	print(body.get_groups())
	if body.is_in_group("Player"):
		print("test2")
