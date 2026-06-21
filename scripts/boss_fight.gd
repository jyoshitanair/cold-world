extends Node2D

@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var player_2: CharacterBody2D = $player2
@onready var marker1: Marker2D = $CharacterBody2D/Marker2D
@onready var marker2: Marker2D = $player2/Marker2D
@onready var label_2: Label = $Label2
@onready var label: Label = $Label

var snowball_path = preload("res://scenes/snowball.tscn")
var total_time = 0.0
var yeti_health = 100

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if yeti_health <= 0:
		Manager.final_time = total_time
		get_tree().change_scene_to_file("res://scenes/buffs.tscn")
		
	total_time += delta
	var formatted_string: String = "%.2f" % total_time
	label_2.text = "Time Elapsed: %s" % formatted_string
	label.text = "Yeti Health: %d" % yeti_health

	if Input.is_action_just_pressed("e"):
		var snowball = snowball_path.instantiate()
		add_child(snowball)
		snowball.global_position = marker1.global_position
		snowball.dir = 1
		
	if Input.is_action_just_pressed("p"):
		var snowball = snowball_path.instantiate()
		add_child(snowball)
		snowball.global_position = marker2.global_position
		snowball.dir = -1

func _on_area_2d_area_entered(area: Area2D) -> void:
	var snowball_root = area.get_parent()
	if snowball_root and snowball_root.is_in_group("snowball"):
		snowball_root.queue_free()
		yeti_health -= 0.5
