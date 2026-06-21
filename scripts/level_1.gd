extends Level
@onready var specific: Label = $tutorial/specific
@onready var health: Label = $tutorial/health
@onready var tutorial: Control = $tutorial



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	tutorial.visible = true
	specific.hide()
	health.visible = false
	health.hide()
	specific.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tut_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		specific.visible = true
func _on_tut_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		health.visible = true
