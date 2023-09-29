extends Control

@onready var audio_manager = $AudioManager

@onready var play_music = $CenterContainer/HBoxContainer/VBoxContainer/PlayMusic
@onready var play_music2 = $CenterContainer/HBoxContainer/VBoxContainer/PlayMusic2
@onready var stop_music = $CenterContainer/HBoxContainer/VBoxContainer/StopMusic

@onready var play_effect = $CenterContainer/HBoxContainer/VBoxContainer2/PlayEffect
@onready var play_effect2 = $CenterContainer/HBoxContainer/VBoxContainer2/PlayEffect2
@onready var play_effect3 = $CenterContainer/HBoxContainer/VBoxContainer2/PlayEffect3

func _ready():
	# you can also pause music:
	# audio_manager.pause_music()
	
	play_music.connect("pressed", func(): 
		audio_manager.play_music("cool"))
		
	play_music2.connect("pressed", func(): 
		audio_manager.play_music("sad"))
		
	stop_music.connect("pressed", func(): 
		audio_manager.stop_music())
	
	for event in [ "mouse_entered", "pressed"]:
		play_effect.connect(event, func(): 
			audio_manager.play_fx("crash"))
		
	for event in [ "mouse_entered", "pressed"]:
		play_effect2.connect(event, func(): 
			audio_manager.play_fx("ding"))
		
	for event in [ "mouse_entered", "pressed"]:
		play_effect3.connect(event, func(): 
			audio_manager.play_fx("laser"))
