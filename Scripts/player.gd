extends KinematicBody2D

var direction = 0
var velocity = Vector2()
onready var Zombie = get_node("Zombie")
const SPEED = 500
const GRAVITY  = 100
const JUMP = 1500

func _ready():
	pass 
 
func _process(_delta):
	direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	if Input.is_action_pressed("ui_select"):
		if is_on_floor():
			velocity.y += - JUMP
			
	velocity.y += GRAVITY
	velocity.x = direction * SPEED
	velocity = move_and_slide(velocity, Vector2.UP)
	update_animation()
	
func update_animation():
	if is_on_floor():
		if direction == 1:
			Zombie.flip_h = false
			Zombie.play("Walk")
		elif direction == -1:
			Zombie.flip_h = true
			Zombie.play("Walk")
		else:
			Zombie.play("Idle")
	else:
		if direction == 1:
			Zombie.flip_h = false
		elif direction == -1:
			Zombie.flip_h = true
		if Input.is_action_pressed("ui_select"):
			Zombie.play("Jump")
		else: 
			Zombie.play("Fall")
	
	var possitive_direction = Zombie.flip_h == true and Zombie.offset.x > 0
	var negative_direction = Zombie.flip_h == false and Zombie.offset.x < 0
	if possitive_direction or negative_direction:
		Zombie.offset *= -1 
	
	
