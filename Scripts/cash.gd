extends Node2D

signal picked_up(amount: int)

@export var amount: int = 1
@onready var interactable: Area2D = $Interactable

func _ready() -> void:
	interactable.interact = _on_interact
	interactable.interact_name = "F to steal £" + str(amount)
	
func _on_interact() -> void:
	picked_up.emit(amount)
	queue_free()
