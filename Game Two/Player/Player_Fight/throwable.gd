extends Node2D

var speed = 350
var hand_position
var thrown = false
	
func _physics_process(delta):
	if thrown:
		position += transform.x * speed * delta
			
			
func _on_reach_body_entered(body):
	if body.name == "player":
		body.reachable = self

func _on_reach_body_exited(body):
	if body.name == "player":
		body.reachable = null

func _on_hitbox_body_entered(body):
	if body.is_in_group("Mobs") && thrown:
		body.queue_free()
		queue_free()
