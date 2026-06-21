class_name Health extends TextureProgressBar

@export var maxHealth = 40
var health = maxHealth

var damage = .1
var damageMult = 1

var warmthBuff = Manager.warmth[1] if Manager.warmth[0] else 1
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
		print("pls die")
		death.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	self.max_value = maxHealth
	
	if Manager.hot_potato[0]:
		maxHealth *= 0.8
	health = maxHealth
	
	$Timer.start()
	
	for child in get_parent().get_children():
		if child is Player:
			if child.playerLeft:
				playerLeft = child
				pass
	
	if not Manager.unity[0]:
		distBuff = 1
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(.55 + playerLeft.warmth/10)
	if Manager.unity[0]:
		distBuff = min(.55 + playerLeft.warmth / 10, 1)
	pass


func _on_timer_timeout() -> void:
	loseHealth()
	if (health > 0):
		$Timer.start()
	pass # Replace with function body.
