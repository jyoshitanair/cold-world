extends Node2D
@onready var circle: Node2D = $circle
@onready var body: Area2D = $circle/Area2D
@onready var start: Marker2D = $Marker2D
@onready var end: Marker2D = $Marker2D2
@onready var green: Panel = $green
@onready var yellow: Panel = $yellow
@onready var red: Panel = $red
var powerup_array = ["double_or_nothing","speed_multiplier","warmth","jackpot","jump_multiplier", "hot_potato", "double_jump","unity"]
var loaded = false
var target
var can_move= true
var tween
var yellow_on = false
var entered_once = false
var can_click= false
@onready var clicker: Label = $clicker
func _ready() -> void:
	target = start.global_position
	await get_tree().create_timer(0.7).timeout
	loaded = true
	tweeny()
	await get_tree().create_timer(2.0).timeout
	can_click = true
	clicker.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if yellow_on:
		can_click = false
		if !Manager.entered_once:
			Manager.entered_once = true
			yellow_on = false
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/jackpot.tscn")
		else:
			red.show()
			yellow.show()
			green.hide()
			yellow.text = "fail 2x"
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/tileset-tb-copied!.tscn")
				
	if Input.is_action_just_pressed("click") and can_click:
		can_move = false
		tween.kill()
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
			change_to_file("win")
		if collider.is_in_group("yellow"):
			yellow.show()
			green.hide()
			red.hide()
			yellow_on = true
			return
		if collider.is_in_group("red"):
			red.show()
			yellow.hide()
			green.hide()
			await get_tree().create_timer(1).timeout
			change_to_file("lose")
func change_to_file(wol) -> void:
	if wol == "win":
		var buffs = [Manager.jackpot_settings[1],Manager.jackpot_settings[0]]
		for i in range(0,2):
			var name1 = buffs[i]
			var percent = name1[1]
			var powerup = name1[0]
			var chosen_power = ""
			for k in powerup_array:
				if k == powerup:
					chosen_power = powerup
					var percent2 = [true,percent]
					Manager.set(chosen_power,percent2)
					print(chosen_power)
					print(Manager.get(chosen_power))
				else:
					chosen_power = k
					if k == "unity" or k == "double_jump":
						Manager.set(chosen_power,[false,false])
					else:
						Manager.set(chosen_power,[false,1.0])
	get_tree().change_scene_to_file(Manager.level_path)
	
func tweeny() -> void: 
	if can_move:
		tween = create_tween()
		tween.set_trans(Tween.TRANS_QUAD)
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(circle, "global_position", target, Manager.jackpot_speed)
		await tween.finished
		tween.kill()
		after()
func after() -> void: 
	if can_move:
		if target == start.global_position:
			target = end.global_position
		else:
			target = start.global_position
		tweeny()
