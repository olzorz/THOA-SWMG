extends CharacterBody2D


const SPEED = 25.0
var player: Node2D
var direction : Vector2


func _ready():
	player = $"../player"

func _physics_process(delta: float) -> void:
	direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	
	move_and_slide()
