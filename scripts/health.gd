extends TextureProgressBar

var maxHealth = 100
var health = maxHealth

var damage = 1
#var damageMult = Manager.warmth
var damageMult = 1

signal death

func loseHealth() -> void:
	health -= damage * damageMult
	health = max(health, 0)
	
	create_tween().tween_property(
		self,
		"value",
		health,
		0.1
	)
	
	if (health == 0):
		death.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	loseHealth()
	$Timer.start()
	pass # Replace with function body.
