# Godot Audio Manager

## Usage

1. Copy `./addons/audio-manager/*` to your project
2. Instance a child scene of the AudioManager node
3. Add your music and sound effects
4. Play the music and sounds with code

## Options

| Name | Description |
| --- | --- |
| Num Sfx Players | How many sound effect players should be used. This allows multiple sounds to play at once, but you don't want more than you need |
| Music | An array of music files |
| Effects | An array of sound effects |

## Methods

| Method | Description |
| --- | --- |
| play_music(index : int = 0) -> void | Play music at {index}. If this music is already playing, nothing will happen |
| pause_music() -> void | Pause the music player |
| play_fx(index : int = 0) -> void | Play the effect at {index} |
