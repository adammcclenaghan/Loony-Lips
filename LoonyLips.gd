extends Control

		
var current_story = {}

var player_words = []

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var ButtonText = $VBoxContainer/HBoxContainer/ButtonText

func _ready():
	pick_current_story()
	DisplayText.text = "Welcome to Loony Lips! :) We're going to tell a story and have a great time! "
	check_player_words_length()
	PlayerText.grab_focus()
	# get_node("DisplayText").text = "This is some text"
	# $VBoxContainer/DisplayText.text = story % prompts


func pick_current_story():
	var stories = get_from_json("StoryBook.json")
	randomize()
	current_story = stories[randi() % stories.size()]
#	var stories = $StoryBook.get_child_count()
#	var selected_story = randi() % stories
#	current_story.prompts = $StoryBook.get_child(selected_story).prompts
#	current_story.story = $StoryBook.get_child(selected_story).story
#	current_story = template[randi() % template.size()]

func get_from_json(filename):
	var json_file = File.new()
	json_file.open(filename, File.READ)
	var text = json_file.get_as_text()
	var data = parse_json(text)
	json_file.close()
	return data

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()
	
func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

func is_story_done():
	return player_words.size() == current_story.prompts.size()

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()

func tell_story():
	DisplayText.text = current_story.story % player_words
	
func end_game():
	PlayerText.queue_free()
	tell_story()
	ButtonText.text = "Again!"
	
func prompt_player():
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"
	PlayerText.grab_focus()
	
func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()