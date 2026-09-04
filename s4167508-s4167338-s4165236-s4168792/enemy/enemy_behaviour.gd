extends CharacterBody2D

@export var max_health: int = 3
@export var speed: float = 150.0
@export var zigzag_speed: float = 3.0
@export var zigzag_distance: float = 100.0

var start_x: float
var time: float = 0.0
var health: int

func _ready() -> void:
	start_x = position.x
	health = max_health

func _physics_process(delta: float) -> void:
	time += delta

	position.y += speed * delta
	position.x = start_x + sin(time * zigzag_speed) * zigzag_distance
	if position.y > 800:
		queue_free()

func take_damage(amount: int):
	health -= amount

	if health <= 0:
		queue_free()
