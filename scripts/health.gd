class_name Health extends TextureProgressBar

@export var maxHealth = 100
var health = maxHealth

var damage = .1
var damageMult = 1

var warmthBuff = 1 if Manager.warmth else .9
var distBuff:float = 1

var playerLeft:Player

signal death

func loseHealth() -> void:
	health -= damage * damageMult * distBuff * warmthBuff
	health = max(health, 0)
	
	create_tween().tween_property(
		self,
		"value",
		health,
		.1
	)
	
	if (health == 0):
		death.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Manager.hot_potato:
		maxHealth *= 2 
		damageMult = 2
	else:
		damageMult = 1
	health = maxHealth
	
	$Timer.start()
	
	for child in get_parent().get_children():
		if child is Player:
			if child.playerLeft:
				playerLeft = child
				pass
	
	if not Manager.unity:
		distBuff = 1
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(.55 + playerLeft.warmth/10)
	if Manager.unity:
		distBuff = min(.55 + playerLeft.warmth / 10, 1)
	pass


func _on_timer_timeout() -> void:
	loseHealth()
	$Timer.start()
	pass # Replace with function body.
