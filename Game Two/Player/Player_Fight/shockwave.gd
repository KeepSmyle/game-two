extends Node2D

var animation

# Called when the node enters the scene tree for the first time.
func _ready():
	animation = $Spike/AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	queue_free()

func _quake(position, direction):
	if direction == 1:
		global_transform.origin.x = position.x + 15
	else:
		global_transform.origin.x = position.x - 15
	global_transform.origin.y = position.y + 7
	animation.play("wave")
