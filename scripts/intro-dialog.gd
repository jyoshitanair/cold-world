extends Node2D
var type_finished = false
@onready var main_text: RichTextLabel = $main_text
@onready var fade: ColorRect = $fade
var text_array_index = 0 
var tween_type
var can_move = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_text.visible_characters = 0 
	main_text.text = Manager.text_array[text_array_index]
	if can_move == false:
		fade.modulate = Color(0.0, 0.0, 0.0, 1.0)
		fade.visible = true
		var tween = create_tween()
		tween.tween_property(fade,"modulate",Color(0.0, 0.0, 0.0, 0.0),3.0)
		await tween.finished
		can_move = true
	fade.queue_free()
	typeity_type()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_move:
		if Input.is_action_just_pressed("enter"):
			if not type_finished:
				if tween_type:
					tween_type.kill()
				main_text.visible_characters = main_text.text.length()
				type_finished =true
			else:
				text_array_index += 1
				print(text_array_index)
				if text_array_index >= Manager.text_array.size():
					print("done")
					text_array_index = 0
					Manager.dialog +=1
					if Manager.dialog ==1:
						Manager.text_array = ["l","o","p"]
					if Manager.dialog ==2:
						Manager.text_array = ["lasd","oasdf","padsf"]
					if Manager.dialog ==3:
						Manager.text_array = ["lwerwer","owerwerwer","pwerwerwerwer"]
					if Manager.dialog ==4:
						get_tree().change_scene_to_file("res://scenes/buffs.tscn")
						return
					get_tree().change_scene_to_file("res://scenes/intro.tscn")
					return
				main_text.text = Manager.text_array[text_array_index]
				typeity_type()
func typeity_type() -> void: 
	type_finished = false
	main_text.visible_characters = 0
	tween_type = create_tween()
	var total_type_time = main_text.text.length() *0.08
	main_text.visible = true
	tween_type.tween_property(main_text, "visible_characters",main_text.text.length(),total_type_time)
	await tween_type.finished
	type_finished = true
