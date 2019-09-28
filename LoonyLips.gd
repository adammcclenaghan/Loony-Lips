extends Control

func _ready():
	var prompts = ["Someone", "trains", "best", "hobby"]
	var story = "Once upon a time %s watched %s and thought it was the %s %s of the past two decades"
	print(story % prompts)
	
	# get_node("DisplayText").text = "This is some text"
	# $VBoxContainer/DisplayText.text = story % prompts
	


func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)
	
func _on_TextureButton_pressed():
	update_DisplayText($VBoxContainer/HBoxContainer/PlayerText.text)

func update_DisplayText(text):
	$VBoxContainer/DisplayText.text = text
	$VBoxContainer/HBoxContainer/PlayerText.clear()
