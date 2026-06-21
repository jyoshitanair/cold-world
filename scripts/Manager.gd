extends Node
#ADD UP ALL THE LEVEL CALCS AND THEN SUBTRACT (Deaths * 15)
#Score = Max(0, ((45 - Time) * 27 * Level) - (Deaths * 15 * Level) - (Easiness * 5 * Level))
#finding score
var level_one_calc = 0 
var level_two_calc = 0 
var level_three_calc = 0 
var speed_multiplier = [false,0.0]
var warmth = [false,0.0]
var jackpot = [false,0.0]
var jump_multiplier = [false,0.0]
var hot_potato = [false,0.0]
var double_jump = [false,0.0]
var unity = [false,0.0]
var death_count = 0 
var player_name = "heyhey"
var player_list = []
var score = 0 
var entered_once = false
var dialog = 0
var text_array = ["no","sjkfjladjhkjhjkkhjhjkhjkhhjhjhkhjhkjf","ksjdlkfjslf"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SilentWolf.configure({
		"api_key": Secrets.API_KEY,
		"game_id": "coldworld",
		"log_level": 1
	})
	
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	leaderboard()
func leaderboard() ->void: 
	for score in Manager.score:
		Manager.player_list.append(Manager.player_name)
