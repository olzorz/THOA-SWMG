extends Area2D

@export var damage : int = 1
@export var speed : int = 200
@onready var bullet_hit: GPUParticles2D = $BulletHit
@onready var sprite: Sprite2D = $Sprite2D

var bullet_existence : bool = true

func _process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if bullet_existence == false:
		return
	bullet_existence = false
	var health_component := body.get_node_or_null("HealthComponent") as HealthComponent
	if health_component:
		health_component.take_damage(damage)
		bullet_hit.process_material.color = Color.RED
	else:
		bullet_hit.process_material.color = Color.YELLOW
	sprite.visible = false
	bullet_hit.restart()
