extends Node2D
@export var enemy_to_spawn: PackedScene 
@onready var shapeSize = $EnemySpawner/CollisionShape2D.shape.extents
@onready var origin = $EnemySpawner/CollisionShape2D.global_position
@onready var startSpawn = origin - shapeSize
@onready var endSpawn = origin + shapeSize
@onready var parallex_background: ParallaxBackground = $ParallaxBackground

const SCROLL_SPEED : float = -150.0

func _process(delta: float):
	parallex_background.scroll_offset.y -= delta * SCROLL_SPEED



func _on_spawn_timer_timeout():
	var x = randf_range(startSpawn.x, endSpawn.x)
	var y = randf_range(startSpawn.y,endSpawn.y)
	var e = enemy_to_spawn.instantiate()
	e.position = Vector2(x,y)
	call_deferred("add_child", e)
	

func _on_enemy_despawner_body_entered(body):
	body.queue_free()
