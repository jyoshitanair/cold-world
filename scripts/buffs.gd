extends Node2D
@onready var border_1: Panel = $"cards-constant/border1"
@onready var border_2: Panel = $"cards-constant/border2"
@onready var border_3: Panel = $"cards-constant/border3"
@onready var image_1: Sprite2D = $"image-1"
@onready var image_2: Sprite2D = $"image-2"
@onready var image_3: Sprite2D = $"image-3"
@export var img1:Texture2D = preload("res://assets/icon.svg")
@export var img2:Texture2D = preload("res://assets/icon.svg")
@export var img3:Texture2D = preload("res://assets/icon.svg")
@onready var label_1: Label = $label1
@onready var label_2: Label = $label2
@onready var label_3: Label = $label3
@onready var label1: Label = $label1/Label
@onready var label2: Label = $label2/Label
@onready var label3: Label = $label3/Label
@export var jackpot_speed = 0.9
@export var text1 = "fahhh"
@export var text2 = "fahhh"
@export var text3 = "fahhh"
@export var mini_text1 = "loreum leurekljskjf s
l
jfkjadfkjkjfk
;jfkjakdfjdjf ;al
klajd
kfjaskdlfj kdljfkasjd"
@export var mini_text2 = "loreum leurekljskjf s
l
jfkjadfkjkjfk
;jfkjakdfjdjf ;al
klajd
kfjaskdlfj kdljfkasjd222"
@export var mini_text3 = "loreum leurekljskjf s
l
jfkjadfkjkjfk
;jfkjakdfjdjf ;al
klajd
kfjaskdlfj kdljfkasjd333"
@export var power_percent1 = ["speed", false]
@export var power_percent2 = ["speed", false]
@export var power_percent3 = ["speed", false]
var arrary_powers 
var powerup_array = ["double_or_nothing","speed_multiplier","warmth","jackpot","jump_multiplier", "hot_potato", "double_jump","unity"]
var on1 = false
var on2 = false
var on3 = false
var clicked = false
#boost names: speed,warmth,jackpot,jump, hot_potato, double_jump, unity
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrary_powers = [power_percent1,power_percent2,power_percent3]
	image_1.texture = img1
	image_2.texture = img2
	image_3.texture = img3
	label_1.text = text1
	label_2.text = text2
	label_3.text = text1
	label1.text = mini_text1
	label2.text = mini_text2
	label3.text = mini_text3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and not clicked:
		clicked = true
		if on1:
			clicky(0)
		if on2:
			clicky(1)
		if on3:
			clicky(2)

func _on_slide_1_mouse_entered() -> void:
	on1 = true
	border_1.visible = true
func _on_slide_2_mouse_entered() -> void:
	on2 = true
	border_2.visible = true
func _on_slide_3_mouse_entered() -> void:
	on3 = true
	border_3.visible = true

func _on_slide_1_mouse_exited() -> void:
	on1 = false
	border_1.visible = false
func _on_slide_2_mouse_exited() -> void:
	on2 = false
	border_2.visible = false
func _on_slide_3_mouse_exited() -> void:
	on3 = false
	border_3.visible = false
# i be from 0-2
func clicky(i) ->void: 
	print(i)
	var chosen_power = [false,1.0]
	var percent
	var name1 = arrary_powers[i]
	var powerup = name1[0]
	if powerup == "jackpot":
		var k = i + 1
		if k >=3:
			k = 0
		var name2 = arrary_powers[k]
		var m = i - 1
		if m <=-1:
			m = 2
		var name3 = arrary_powers[m]
		Manager.jackpot_settings = [name2,name3]
		print(Manager.jackpot_settings)
		Manager.jackpot_speed = jackpot_speed
		get_tree().change_scene_to_file("res://scenes/jackpot.tscn")
		return
	if powerup == "double_or_nothing":
		get_tree().change_scene_to_file("res://scenes/slots.tscn")
		return
	percent = [true,name1[1]]
	for k in powerup_array:
		print(k)
		if k == powerup:
			chosen_power = powerup
			Manager.set(chosen_power,percent)
			powerup_array.find(powerup)
		else:
			chosen_power = k
			if k == "unity" or k == "double_jump":
				Manager.set(chosen_power,[false,false])
			else:
				Manager.set(chosen_power,[false,1.0])
	print(chosen_power)
	print(Manager.get(chosen_power))
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
