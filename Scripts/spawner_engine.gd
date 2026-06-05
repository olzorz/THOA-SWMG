class_name SpawnerEngine extends Node2D

const WORLD_MASK := 1

@export var enemy_scene := preload("res://Scenes/police.tscn")
@export var spawn_attempts := 20
@export var player: Node2D
@export var spawn_path: PathFollow2D

func spawn_mob() -> void:
	for i in spawn_attempts:
		spawn_path.progress_ratio = randf()
		var spawn_position : Vector2 = spawn_path.global_position

		if _can_spawn_at(spawn_position):
			var enemy := enemy_scene.instantiate()
			enemy.global_position = spawn_position
			$"../..".add_child(enemy)
			return

func _can_spawn_at(spawn_position: Vector2) -> bool:
	var space_state := get_world_2d().direct_space_state

	var query := PhysicsRayQueryParameters2D.create(
		player.global_position,
		spawn_position,
		WORLD_MASK
	)

	query.exclude = [player.get_rid()]
	query.collide_with_areas = false
	query.collide_with_bodies = true

	var hit := space_state.intersect_ray(query)

	return hit.is_empty()
