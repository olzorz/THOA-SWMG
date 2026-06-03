class_name HealthComponent extends Node

signal dead
@export var max_health : int
var current_health : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health


func take_damage(damage : int):
	current_health -= damage
	if current_health <= 0:
		dead.emit()
