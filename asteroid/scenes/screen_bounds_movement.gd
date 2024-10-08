extends Node
@export var node: Node2D
var bounds ={}

# Called when the node enters the scene tree for the first time.
func _ready():
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	print(get_parent().name)
	var zoom = camera.zoom
	var camera_position = camera.position
	var size = rect.size / zoom
	bounds.top = (camera_position.y - size.y) /2
	bounds.bottom = (camera_position.y + size.y) /2
	bounds.right = (camera_position.x + size.x) /2
	bounds.left = (camera_position.x - size.x) /2
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if node.global_position.y > bounds.bottom:
		node.global_position.y = bounds.top
	elif node.global_position.y <= bounds.top:
		node.global_position.y = bounds.bottom
	
	if node.global_position.x < bounds.left:
		node.global_position.x = bounds.right
	elif node.global_position.x >= bounds.right:
		node.global_position.x = bounds.left
	
	
