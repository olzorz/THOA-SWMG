extends Area2D


const SPEED : int = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free() # Replace with function body.



func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	queue_free() # Replace with function body.
