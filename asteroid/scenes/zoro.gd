extends Area2D

class_name Zoros

signal on_zoro_destroyed(size: Zorosize, position: Vector2)

var image_array = ["res://assets/elementos_grafios/zoro.png", "res://assets/elementos_grafios/zoro_1.png", "res://assets/elementos_grafios/zoro_3.png",  "res://assets/elementos_grafios/zoro_4.png"]

const Utils = preload("res://scenes/Utils/Utils.gd")
@export var speed = 100
@export var speed_increment_factor = .3

var size = Utils.ZoroSize.BIG
var direction: Vector2
@onready var sprite = $Sprite2D
@onready var explosion_particles = $ExplosionParticles

func _ready():
	var scaleValue = 1 / (size + 1.0)
	
	scale = Vector2(scaleValue,scaleValue)
	var random_index = randi() % image_array.size()
	var random_image = load(image_array[random_index])
	
	sprite.texture = random_image
	speed = speed + speed * size * speed_increment_factor
	var x = randf_range(-1,1)
	var y = randf_range(-1, 1)
	direction = Vector2(x,y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.queue_free()
		on_destroy()

func emit_explosion():
	explosion_particles.emitting = true
	explosion_particles.reparent(get_tree().root)
	
func on_destroy():
	emit_explosion()
	queue_free()
	var new_zoro_size = size + 1
	on_zoro_destroyed.emit(new_zoro_size, global_position)
	

func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		area.queue_free()
		on_destroy()
