class_name SpawnerEngine extends Node2D


@export var ENEMY_SCENE := preload("res://Scenes/police.tscn")
@export var SPAWN_ATTEMPTS := 20
@export var player: Node2D
@export var spawn_path: PathFollow2D
const WORLD_MASK := 1


func spawn_mob() -> void:
	for i in SPAWN_ATTEMPTS:
		spawn_path.progress_ratio = randf()
		var spawn_position : Vector2 = spawn_path.global_position

		if _can_spawn_at(spawn_position):
			var enemy := ENEMY_SCENE.instantiate()
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
