extends Node
#ADD UP ALL THE LEVEL CALCS AND THEN SUBTRACT (Deaths * 15)
#Score = Max(0, ((45 - Time) * 27 * Level) - (Deaths * 15 * Level) - (Easiness * 5 * Level))
#finding score
var level_one_calc = 0 
var level_two_calc = 0 
var level_three_calc = 0 
var final_time = 0 
var speed_multiplier = [false,0.0]
var warmth = [false,0.0]
var jackpot = [false,1.0]
var jump_multiplier = [false,1.0]
var hot_potato = [false,1.0]
var double_jump = [false,false]
var unity = [false,false]
var death_count = 0 
var player_name = "heyhey"
var player_list = []
var score = 0 
var entered_once = false
var dialog = 0
var text_array = ["It’s been a long time since Jelly and Bean have been home.",
"As the youngest two there, life had been a bit too boring for their liking, and going off to explore the world had been exhilarating.",
"Even then, their hearts hold something special for the place where they grew up, and coming home will always be something they look forward to."]
var exit_ladder_1_entered = false
var exit_ladder_2_entered = false
var level_1_easiness = 1
var jackpot_settings = []
var level_path = "res://scenes/level_1.tscn"
var jackpot_speed = 0.9
var current_level = 1
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
