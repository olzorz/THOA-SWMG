extends Area2D

@export var damage : int = 1
@export var SPEED : int = 200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	var health_component := body.get_node_or_null("HealthComponent") as HealthComponent
	if health_component:
		health_component.take_damage(damage)
