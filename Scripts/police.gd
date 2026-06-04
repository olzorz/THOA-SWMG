extends CharacterBody2D


var hp : int = 2
@export var movement_speed : float = 100.0
var player: Node2D
var direction : Vector2
var movement_timer : bool = false


func _ready():
	player = $"../player"

func _physics_process(delta: float) -> void:
	if movement_timer:
		direction = player.global_position - global_position
		if direction.length() > 100:
			velocity = direction.normalized() * movement_speed
		else:
			velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		movement_timer = false
	look_at(player.global_position)
	move_and_slide()

func is_dead() -> void:
	queue_free()


func movement_calculation() -> void:
	movement_timer = true # Replace with function body.
