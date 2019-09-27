extends Control

func _ready():
	var prompts = ["Someone", "trains", "best", "hobby"]
	var story = "Once upon a time %s watched %s and thought it was the %s %s of the past two decades"
	print(story % prompts)
	
	# get_node("DisplayText").text = "This is some text"
	$DisplayText.text = story % prompts
	
