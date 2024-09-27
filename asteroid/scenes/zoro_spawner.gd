extends Node

class_name ZoroSpawner

@export var zoro_scene: PackedScene

const Utils = preload("res://scenes/Utils/Utils.gd")

@export var count=4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(count):
		var random_spawn_position = get_random_position_from_screen_rect()
		spawn_zoro(Utils.ZoroSize.BIG, random_spawn_position)

func get_random_position_from_screen_rect() ->Vector2:
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	var zoom = camera.zoom
	var camera_position = camera.position
	var size = rect.size / zoom
	var bounds = {}
	bounds.top = (camera_position.y - size.y) /2
	bounds.bottom = (camera_position.y + size.y) /2
	bounds.right = (camera_position.x + size.x) /2
	bounds.left = (camera_position.x - size.x) /2
	
	var x = randf_range(bounds.left, bounds.right)
	var y = randf_range(bounds.top, bounds.bottom)
	
	return Vector2(x , y)
	
func spawn_zoro(size:Utils.ZoroSize, position: Vector2):
	var zoro = zoro_scene.instantiate() as Zoros
	get_tree().root.add_child.call_deferred(zoro)
	zoro.global_position = position
	zoro.size = size
	zoro.on_zoro_destroyed.connect(zoro_destroyed)
	
func zoro_destroyed(size: int, position: Vector2):
	
	if(size < 2):
		for i in range(3):
			spawn_zoro(size,position)
	
