class_name Player extends CharacterBody2D
@onready var detect: Area2D = $detect

@export var playerLeft:bool
var playerRight:Player

#manager vars: speedMult, jumpMult, bool: double jump, unity

var speedMult:float = 1.2 if Manager.speed_multiplier else 1
var jumpMult:float = 1.2 if Manager.jump_multiplier else 1

var doubleJump = Manager.double_jump
var jumped = false

var warmth:float

var speed = 300.0 * speedMult
var jumpVelocity = -500.0 * jumpMult

func _ready() -> void:
	for child in get_parent().get_children():
		if child is Player:
			if child.playerLeft != true:
				playerRight = child

func _physics_process(delta: float) -> void:
	# determine warmth through distance
	if (Manager.unity):
		for child in get_parent().get_children():
			if child is Player:
				child.get_node("warmthInd").visible = true
		if (playerLeft and playerRight != null):
			var dist = global_position.distance_to(playerRight.global_position)
			warmth = dist/200
			var col = $warmthInd.modulate
			col.r = warmth
			$warmthInd.modulate = col
	else:
		for child in get_parent().get_children():
			if child is Player:
				child.get_node("warmthInd").visible = false
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumped = false

	# Handle jump.
	if Input.is_action_just_pressed("player_1_jump" if playerLeft else "player_2_jump") and (is_on_floor() or (doubleJump and !jumped)):
		velocity.y = jumpVelocity
		if not is_on_floor():
			jumped = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis ("player_1_left" if playerLeft else "player_2_left", "player_1_right" if playerLeft else "player_2_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
#collisions
	var collided = move_and_slide()
	if collided:
		for i in range(get_slide_collision_count()):
			var collision = get_slide_collision(i)
			var collider = collision.get_collider()
			if collider.is_in_group("exit_ladder"):
				print("hi")
			if collider.is_in_group("tileset"):
				var collision_point = collision.get_position()
				var collision_normal = collision.get_normal()
				var final = collider.local_to_map(collider.to_local(collision_point - collision_normal*4))
				collider.check_tile(final)
