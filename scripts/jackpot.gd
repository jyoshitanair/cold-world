extends Node2D
@onready var circle: Node2D = $circle
@onready var body: Area2D = $circle/Area2D
@onready var start: Marker2D = $Marker2D
@onready var end: Marker2D = $Marker2D2
var loaded = false
var target
var tween
func _ready() -> void:
	circle.global_position
	target = start.global_position
	await get_tree().create_timer(0.7).timeout
	loaded = true
	tweeny()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		var colliders = body.get_overlapping_areas()
		var collider = colliders[0]
		if collider.is_in_group("green"):
			pass
			#green.show()
		if collider.is_in_group("green"):
			pass
			#yellow.show()
		if collider.is_in_group("green"):
			pass
			#red.show()
func tweeny() -> void: 
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(circle, "global_position", target, 1.5)
	await tween.finished
	tween.kill()
	after()
func after() -> void: 
	if not(tween and tween.is_valid()): 
		if circle.position == start.global_position:
			target = end.global_position
		else:
			target = start.global_position
		tweeny()
