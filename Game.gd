extends Node2D

var state = {"screen": "start"}

var Match = load('res://Match.tscn')

func _physics_process(delta):
	if state.screen == "start":
		if Input.is_action_just_pressed("ui_accept"):
			remove_child($StartScreen)
			state.current_match = Match.instance()
			add_child(state.current_match)
			state.screen = "match"
