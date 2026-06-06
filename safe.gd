extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var cash_scene := preload("uid://bbcgq07ql850u")
@onready var cash_marker: Marker2D = $Marker2D


func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact() -> void:
	sprite_2d.set_frame(1)
	interactable.is_interactable = false
	var cash := cash_scene.instantiate()
	cash.picked_up.connect(Callable(get_parent(), "money_gain"))
	cash.global_position = cash_marker.global_position
	get_parent().add_child(cash)
