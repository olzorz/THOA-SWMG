extends CharacterBody2D


var hp : int = 2
const SPEED = 50.0
var player: Node2D
var direction : Vector2


func _ready():
	player = $"../player"

func _physics_process(delta: float) -> void:
	direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	look_at(player.global_position)
	move_and_slide()

func is_dead() -> void:
	queue_free()
