extends CharacterBody2D


const SPEED = 25.0
var player: Node2D
var direction : Vector2


func _ready():
	player = $"../player"

func _physics_process(delta: float) -> void:
	direction = (player.global_position - global_position).normalized()
	velocity = direction * SPEED

	move_and_slide()
