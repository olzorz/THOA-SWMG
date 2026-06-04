extends CharacterBody2D


var hp : int = 2
@export var movement_speed : float = 100.0
var player: Node2D
var direction : Vector2
@export var update_cooldown : float = 0.5
var update_time : float = update_cooldown
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
		update_time -= delta
		if update_time <= 0:
			target_location = player.global_position
			direction = target_location - global_position
			update_time = update_cooldown
		look_at(player.global_position)
	else:
		state = State.IDLE
	
	match state:
		State.CHASE:
			
			if direction.length() > 100:
				velocity = direction.normalized() * movement_speed
			else:
				state = State.SHOOT
		
		State.IDLE:
			if player:
				state = State.CHASE
			else:
				velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		
		State.SHOOT:
			if player and direction.length() > 150:
				state = State.CHASE
			elif not player:
				state = State.IDLE
			else:
				velocity = velocity.move_toward(Vector2.ZERO, movement_speed)


	
	move_and_slide()


func is_dead() -> void:
	queue_free()
