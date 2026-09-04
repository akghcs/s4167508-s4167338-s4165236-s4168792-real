extends CharacterBody2D

@export var speed = 400

@onready var current_weapon = $Weapon

@export var max_hp : float = 10
var current_hp : float

func _ready():
	current_hp = max_hp

func _process(_delta):
	if Input.is_action_pressed("shoot"): 
		current_weapon.shoot()
	
func _physics_process(delta):
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed
	move_and_slide()

func take_damage(damage):
	current_hp -= damage
	
	current_hp = clamp(current_hp,0,max_hp)
	
	if current_hp <= 0:
		die()

func die():
	queue_free()
