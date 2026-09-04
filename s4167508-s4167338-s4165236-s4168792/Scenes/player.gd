extends CharacterBody2D

@export var speed = 400

@onready var current_weapon = $Weapon

func _process(_delta):
	if Input.is_action_pressed("shoot"): 
		current_weapon.shoot()
	
func _physics_process(delta):
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed
	move_and_slide()
