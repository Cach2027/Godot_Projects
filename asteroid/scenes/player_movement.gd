extends CharacterBody2D

class_name Player

@export var max_speed =10
@export var rotation_speed = 3.5
@export var velocity_damping_factor =.5
@export var linear_velocity = 200
@export var speed = 400
var input_vector: Vector2

var rotation_direction: int
"""func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("down", "up") * speed
"""

func _physics_process(delta):
	"""Este metodo obtiene el input y mueve el jugador"""
	get_input()
	move_and_slide()
"""func _process(delta):
	input_vector.x = Input.get_action_strength("rotate_left") - Input.get_action_strength("rotate_right")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	if Input.is_action_pressed("rotate_left"):
		rotation_direction=-1
	elif Input.is_action_pressed("rotate_right"):
		rotation_direction =1
	else:
		rotation_direction = 0"""
func get_input():
	var input_direction = Input.get_vector("rotate_left", "rotate_right", "move_up", "move_down")
	velocity = input_direction * speed
	rotation = get_global_mouse_position().angle_to_point(position)
	
"""func _physics_process(delta):
	rotation += rotation_direction * rotation_speed * delta
	if(input_vector.y > 0):
		acelerate_forward(delta)
	elif input_vector.y == 0 && velocity != Vector2.ZERO:
		slow_down_and_stop(delta)
	move_and_collide(velocity*delta)
	#rotation = get_global_mouse_position().angle_to_point(position)

func acelerate_forward(delta: float):
	velocity += (input_vector * linear_velocity * delta).rotated(rotation)
	velocity.limit_length(max_speed)
func slow_down_and_stop(delta: float):
	velocity = lerp(velocity, Vector2.ZERO, velocity_damping_factor * delta)
	
	if velocity.y >= -0.1 && velocity.y <= 0.1:
		velocity.y =0"""
	
	
	
	
	
	
	
			
