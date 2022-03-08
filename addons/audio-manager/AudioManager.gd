extends Node

export var num_sfx_players := 5 #more players means more sounds can play at once
export (Array, Resource) var music #an array of music to load
export (Array, Resource) var effects #an array of fx to load

onready var music_player = $Music/AudioStreamPlayer
onready var effects_node = $Effects

var used_players := [] #an array of players currently being utilized
var paused_position : float = 0.0 #the position music has been paused at

#create players for each number set
func _ready() -> void:
	for i in num_sfx_players:
		var stream = AudioStreamPlayer.new()
		effects_node.add_child(stream)

func play_fx(fx_index : int = 0) -> void:
	var player = get_unused_player()
	player.stream = effects[fx_index]
	player.play()
	used_players.append(player)

func get_unused_player() -> AudioStream:
	for c in effects_node.get_children():
		if used_players.find(c) == -1:
			return c
	return used_players.pop_front()

func play_music(song_index : int = 0) -> void:
	if music_player.stream != music[song_index] or paused_position > 0.0 or !music_player.playing:
		music_player.stream = music[song_index]
		music_player.play(paused_position)
		paused_position = 0.0

func stop_music() -> void:
	paused_position = 0.0
	music_player.stop()
	
func pause_music() -> void:
	paused_position = music_player.get_playback_position()
	music_player.stop()
