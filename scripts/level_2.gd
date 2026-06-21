extends Level
@onready var block: Label = $tutorial/block
@onready var pressure: Label = $tutorial/pressure
@onready var tutorial: Control = $tutorial

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	tutorial.visible = true
	pressure.hide()
	pressure.visible = false
	block.visible = false
	block.hide()
func _on_tut_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		pressure.visible = true
func _on_tut_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		block.visible = true
