extends CharacterBody2D

@export var speed: float = 100
@export var direction: Vector2 = Vector2.DOWN

@export var max_hp: float = 2
var current_hp:float

@export var collision_damage = 5

func _ready():
	current_hp = max_hp
	
func _process(_delta):
	pass
	
func _physics_process(delta):
	velocity = direction.normalized() * speed
	look_at(position + velocity)
	rotation += PI / 2
	
	var collision = move_and_collide(velocity * delta)

	if collision:
		var body = collision.get_collider()
		
		if body.has_method("take_damage"):
			body.take_damage(collision_damage)
	
	

func take_damage(damage):
	current_hp -= damage
	
	current_hp = clamp(current_hp,0,max_hp)
	
	if current_hp <= 0:
		die()

func die():
	queue_free()

	
	
	
