extends Node2D
@onready var circle: Node2D = $circle
@onready var body: Area2D = $circle/Area2D
@onready var start: Marker2D = $Marker2D
@onready var end: Marker2D = $Marker2D2
@onready var green: Panel = $green
@onready var yellow: Panel = $yellow
@onready var red: Panel = $red
var loaded = false
var target
var can_move= true
var tween
var yellow_on = false
var entered_once = false
var can_click= false
@onready var clicker: Label = $clicker
func _ready() -> void:
	circle.global_position
	target = start.global_position
	await get_tree().create_timer(0.7).timeout
	loaded = true
	tweeny()
	await get_tree().create_timer(2.0).timeout
	can_click = true
	clicker.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and can_click:
		can_move = false
		var colliders = body.get_overlapping_areas()
		var collider
		if colliders.size() >= 2:
			collider = colliders[1]
		else:
			collider = colliders[0]
		if collider.is_in_group("green"):
			green.show()
			yellow.hide()
			red.hide()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/slots.tscn")
		if collider.is_in_group("yellow"):
			yellow.show()
			green.hide()
			red.hide()
			yellow_on = true
		if collider.is_in_group("red"):
			red.show()
			yellow.hide()
			green.hide()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/tileset-tb-copied!.tscn")
		if yellow_on:
			if !Manager.entered_once:
				Manager.entered_once = true
				print("first")
				yellow_on = false
				await get_tree().create_timer(2.0).timeout
				get_tree().change_scene_to_file("res://scenes/jackpot.tscn")
			else:
				red.show()
				yellow.hide()
				green.hide()
				get_tree().change_scene_to_file("res://scenes/tileset-tb-copied!.tscn")
				
func tweeny() -> void: 
	if can_move:
		tween = create_tween()
		tween.set_trans(Tween.TRANS_QUAD)
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(circle, "global_position", target, 0.5)
		await tween.finished
		tween.kill()
		after()
func after() -> void: 
	if can_move:
		if not(tween and tween.is_valid()): 
			if circle.position == start.global_position:
				target = end.global_position
			else:
				target = start.global_position
			tweeny()
