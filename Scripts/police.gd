extends CharacterBody2D


var hp : int = 2
@export var movement_speed : float = 100.0
var player: Node2D
var direction : Vector2
var movement_timer : bool = false
var target_location : Vector2 = Vector2.ZERO

enum State {
	CHASE,
	SHOOT,
	IDLE
}
var state := State.CHASE

func _ready():
	player = $"../player"
	

func _physics_process(delta: float) -> void:
	if player:
		target_location = player.global_position
	else:
		state = State.IDLE
	match state:
		State.CHASE:
			if movement_timer:
				direction = target_location - global_position
			if direction.length() > 100:
				velocity = direction.normalized() * movement_speed
			else:
				state = State.SHOOT
			movement_timer = false
			
			
		State.IDLE:
			if player:
				state = State.CHASE
			else:
				velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		
		State.SHOOT:
			if player and (target_location - global_position).length() > 150:
				state = State.CHASE
			elif not player:
				state = State.IDLE
			else:
				velocity = velocity.move_toward(Vector2.ZERO, movement_speed)


	look_at(target_location)
	move_and_slide()


func is_dead() -> void:
	queue_free()


func movement_calculation() -> void:
	movement_timer = true
