extends Node2D
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var player_2: CharacterBody2D = $player2
@onready var marker1: Marker2D = $CharacterBody2D/Marker2D
@onready var marker2: Marker2D = $player2/Marker2D
var snowball_path = preload("res://scenes/snowball.tscn")
func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("e"):
		var snowball = snowball_path.instantiate()
		add_child(snowball)
		snowball.global_position = marker1.global_position
	#if Input.is_action_just_pressed("p"):
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.get_groups())
	if area.is_in_group("snowball"):
		area.queue_free()
