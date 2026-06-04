extends PointLight2D

@onready var player := $"../player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if player:
		global_position = player.global_position
