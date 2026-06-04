extends CharacterBody2D


var hp : int = 2
const SPEED = 50.0
var player: Node2D
var direction : Vector2


func _ready():
	player = $"../player"

func _physics_process(delta: float) -> void:
	direction = player.global_position - global_position
	if direction.length() > 100:
		velocity = direction.normalized() * SPEED
	else:
		velocity = Vector2.ZERO
	look_at(player.global_position)
	move_and_slide()

func is_dead() -> void:
	queue_free()
