extends Node2D
@onready var border_1: Panel = $"cards-constant/border1"
@onready var border_2: Panel = $"cards-constant/border2"
@onready var border_3: Panel = $"cards-constant/border3"
@onready var image_1: Sprite2D = $"image-1"
@onready var image_2: Sprite2D = $"image-2"
@onready var image_3: Sprite2D = $"image-3"
@export var img1:Texture2D = preload("res://icon.svg")
@export var img2:Texture2D = preload("res://icon.svg")
@export var img3:Texture2D = preload("res://icon.svg")
@onready var label_1: Label = $label1
@onready var label_2: Label = $label2
@onready var label_3: Label = $label3
@export var text1 = "fahhh"
@export var text2 = "fahhh"
@export var text3 = "fahhh"
@export var power_percent1 = ["speed", 0.1]
@export var power_percent2 = ["speed", 0.1]
@export var power_percent3 = ["speed", 0.1]
#boost names: speed,warmth,jackpot,jump, hot_potato, double_jump, unity
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	image_1.texture = img1
	image_2.texture = img2
	image_3.texture = img3
	label_1.text = text1
	label_2.text = text2
	label_3.text = text1
	for i in range(1,3):
		var name = "power_percent%d"%i
		var powerup = name[0]
		var percent = name[1]
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_slide_1_mouse_entered() -> void:
	if Input.is_action_just_pressed("click"):
		pass
	border_1.visible = true
func _on_slide_2_mouse_entered() -> void:
	if Input.is_action_just_pressed("click"):
		pass
	border_2.visible = true
func _on_slide_3_mouse_entered() -> void:
	if Input.is_action_just_pressed("click"):
		pass
	border_3.visible = true

func _on_slide_1_mouse_exited() -> void:
	border_1.visible = false
func _on_slide_2_mouse_exited() -> void:
	border_2.visible = false
func _on_slide_3_mouse_exited() -> void:
	border_3.visible = false
