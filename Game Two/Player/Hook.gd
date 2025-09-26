extends Area2D

var speed
var rope = find_child("Line2D")
var hand_position
var isStuck = false
var swingdirection

func _ready():
	connect("body_entered", _on_Terrain_body_entered)
	speed = 600
	rope = owner.find_child("Line2D")
	rope.clear_points()
	#starting point (player), gets overwriten in player
	rope.add_point(Vector2(0, 0))
	#end point (projectile), stays at the projectile
	rope.add_point(position)
	
func _physics_process(delta):
	position += transform.x * speed * delta
	rope.set_point_position(1, position)

func _on_Terrain_body_entered(body):
	if body.is_in_group("Terrain"):
		speed = 0
		isStuck = true
		if position.x >= 0:
			#right
			swingdirection = true
		else:
			#left
			swingdirection = false
