extends Node

@export var num_sfx_players := 5 #more players means more sounds can play at once


@export var music : Array[Resource]
@export var effects : Array[Resource]

@onready var effects_container = $Effects
@onready var audio_stream_player = $Music/AudioStreamPlayer
@onready var audio_stream_player_2 = $Music/AudioStreamPlayer2


var paused_position : float = 0.0 #the position music has been paused at

func _ready() -> void:
	for i in num_sfx_players:
		var stream = AudioStreamPlayer.new()
		effects_container.add_child(stream)

func play_fx(play_sfx_name : String) -> void:
	for i in effects.size():
		var sound = effects[i]
		var name = sound.resource_path.get_file().get_basename()
		if name == play_sfx_name:
			var player = effects_container.get_child(0)
			player.stream = sound
			player.play()
			effects_container.move_child(player, num_sfx_players - 1)
			break

func play_music(play_song_name : String) -> void:
	for i in music.size():
		var song = music[i]
		var name = song.resource_path.get_file().get_basename()
		if name == play_song_name and audio_stream_player.stream != song or paused_position > 0.0 or !audio_stream_player.playing:
			audio_stream_player.stream = song
			audio_stream_player.play(paused_position)
			paused_position = 0.0

func stop_music() -> void:
	paused_position = 0.0
	audio_stream_player.stop()

func pause_music() -> void:
	paused_position = audio_stream_player.get_playback_position()
	audio_stream_player.stop()
