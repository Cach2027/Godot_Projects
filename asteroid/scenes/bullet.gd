extends Area2D
class_name Bullet

var direction: Vector2
@export var bullet_spedd = 700



func _process(delta):
	position += direction * bullet_spedd * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
