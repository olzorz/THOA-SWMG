extends Node2D

const BULLET := preload("res://Scenes/bullet.tscn")
@export var player : bool = false
var shoot_timer : bool = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and player:
		shoot()
	elif shoot_timer and not player:
		shoot()
		shoot_timer = false

func shoot() -> void:
	var bullet_instance = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = global_position
	bullet_instance.global_rotation = global_rotation

func shoot_time() -> void:
	shoot_timer = true # Replace with function body.
