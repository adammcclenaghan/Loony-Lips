extends Control

var player_words = []
var prompts = ["a name", "a noun", "an adverb", "an adjective"]
var story = "Once upon a time %s watched %s and thought it was the %s %s of the past two decades"

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var ButtonText = $VBoxContainer/HBoxContainer/ButtonText

func _ready():
	DisplayText.text = "Welcome to Loony Lips! :) We're going to tell a story and have a great time! "
	check_player_words_length()
	PlayerText.grab_focus()
	
	# get_node("DisplayText").text = "This is some text"
	# $VBoxContainer/DisplayText.text = story % prompts

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()
	
func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

func is_story_done():
	return player_words.size() == prompts.size()

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()

func tell_story():
	DisplayText.text = story % player_words
	
func end_game():
	PlayerText.queue_free()
	tell_story()
	ButtonText.text = "Again!"
	
func prompt_player():
	DisplayText.text += "May I have " + prompts[player_words.size()] + " please?"
	PlayerText.grab_focus()
	
func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()