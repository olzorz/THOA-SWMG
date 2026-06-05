extends PointLight2D

@onready var player := $"../player"

func _physics_process(_delta: float) -> void:
	if player:
		global_position = player.global_position
