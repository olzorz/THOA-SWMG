extends Node2D

const BULLET := preload("res://Scenes/bullet.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = $Marker2D.global_position
		bullet_instance.global_rotation = global_rotation
