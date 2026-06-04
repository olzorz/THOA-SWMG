class_name HealthComponent extends Node

signal dead
signal damaged
@export var max_health : int = 1
@onready var current_health : int = max_health


func take_damage(damage : int):
	current_health -= damage
	if current_health <= 0:
		dead.emit()
	damaged.emit()
