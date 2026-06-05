extends CharacterBody2D

const LOSE_SCREEN = preload("res://Scenes/lose_screen.tscn")

@export var movement_speed : float = 500

@onready var health_component := $HealthComponent
@onready var health_bar := $"../CanvasLayer/HealthBar"

var character_direction : Vector2

func _ready() -> void:
	health_bar.max_value = health_component.max_health
	health_bar.value = health_component.current_health

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
	health_bar.value = 0
	var lose_position := global_position
	var lose := LOSE_SCREEN.instantiate()
	lose.global_position = lose_position
	get_parent().add_child(lose)
	queue_free() # Replace with function body.

func damaged() -> void:
	health_bar.value = health_component.current_health
