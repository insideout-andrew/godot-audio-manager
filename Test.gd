extends Control

onready var audio_manager = $AudioManager

onready var play_music = $CenterContainer/HBoxContainer/VBoxContainer/PlayMusic
onready var play_music2 = $CenterContainer/HBoxContainer/VBoxContainer/PlayMusic2
onready var pause_music = $CenterContainer/HBoxContainer/VBoxContainer/PauseMusic
onready var stop_music = $CenterContainer/HBoxContainer/VBoxContainer/StopMusic
onready var play_effect = $CenterContainer/HBoxContainer/VBoxContainer2/PlayEffect
onready var play_effect2 = $CenterContainer/HBoxContainer/VBoxContainer2/PlayEffect2
onready var play_effect3 = $CenterContainer/HBoxContainer/VBoxContainer2/PlayEffect3

func _ready():
	play_music.connect("pressed", self, "_play_music")
	play_music2.connect("pressed", self, "_play_music2")
	pause_music.connect("pressed", self, "_pause_music")
	stop_music.connect("pressed", self, "_stop_music")
	play_effect.connect("pressed", self, "_play_effect_1")
	play_effect2.connect("pressed", self, "_play_effect_2")
	play_effect3.connect("pressed", self, "_play_effect_3")
	
func _play_music():
	audio_manager.play_music(0)

func _play_music2():
	audio_manager.play_music(1)

func _pause_music():
	audio_manager.pause_music()
	
func _stop_music():
	audio_manager.stop_music()

func _play_effect_1():
	audio_manager.play_fx(0)
	
func _play_effect_2():
	audio_manager.play_fx(1)

func _play_effect_3():
	audio_manager.play_fx(2)
