extends CharacterBody2D

@export var movement_speed : float = 500
var character_direction : Vector2

func _physics_process(_delta: float) -> void:
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	character_direction = character_direction.normalized()
	
	if character_direction:
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		
	look_at(get_global_mouse_position())
	#if rotation_degrees > 90 or rotation_degrees < -90:
	#	scale.y = -1
	#else:
	#	scale.y = 1
	move_and_slide()


func is_dead() -> void:
	queue_free() # Replace with function body.
