extends CharacterBody2D


var hp : int = 2
const SPEED = 25.0
var player: Node2D
var direction : Vector2


func _ready():
	player = $"../player"

func _physics_process(delta: float) -> void:
	direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	
	move_and_slide()

func take_damage():
	hp -= 1
	if hp == 0:
		queue_free()
