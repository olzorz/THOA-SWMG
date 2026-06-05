extends Node2D

const BULLET := preload("res://Scenes/bullet.tscn")
@export var player : bool = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and player:
		shoot()

func shoot() -> void:
	var bullet_instance = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = global_position
	bullet_instance.global_rotation = global_rotation
