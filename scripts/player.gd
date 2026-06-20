class_name Player extends CharacterBody2D

@export var playerLeft:bool

#manager vars: speed, jump, bool: double jump, unity

var doubleJump = true
var jumped = false

var warmth:int

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumped = false

	# Handle jump.
	if Input.is_action_just_pressed("player_1_jump" if playerLeft else "player_2_jump") and (is_on_floor() or (doubleJump and !jumped)):
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			jumped = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis ("player_1_left" if playerLeft else "player_2_left", "player_1_right" if playerLeft else "player_2_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
