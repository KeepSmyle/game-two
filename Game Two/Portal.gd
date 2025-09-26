extends Area2D

var portals
var start_portal
var end_portal

func _ready():
	connect("body_entered", _on_Player_body_entered)
	portals = get_parent().find_children("Portal_?")

func _process(delta):
	pass


func _on_Player_body_entered(body):
	if body.is_in_group("Player"):
		var portal_route = _get_portal_route()
		body.global_transform[2].x += portal_route[0]
		body.global_transform[2].y += portal_route[1]


func _get_portal_route():
	match name:
		"Portal_1":
			start_portal = portals[0]
			end_portal = portals[1]
		"Portal_2":
			start_portal = portals[1]
			end_portal = portals[0]
	
	return Vector2(end_portal.global_transform[2].x - start_portal.global_transform[2].x, end_portal.global_transform[2].y - start_portal.global_transform[2].y)
