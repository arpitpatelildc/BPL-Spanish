import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DialogueLogic {
  late final String path;
  late final int lessonIndex;

  // Constructor, calls the init method below.
  DialogueLogic(this.path, this.lessonIndex) {
    _init();
  }

  void dispose(){
    _audioBar.dispose();
  }

  // ValueNotifiers are used to update the progress bar as the audio plays
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      total: Duration.zero,
    ),
  );

  // Similarly, another one is used to update the state of the play/pause button
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  late AudioPlayer _audioBar;

  // Incredibly beefy initialization method for the conversation, as many different attributes need to be listened to in order to provide a solid UX.
  void _init() async {
    // Init Audio Player
    _audioBar = AudioPlayer();
    // Set the path of the audio asset
    await _audioBar.setAsset(path);
    // Update button state depending on state of the player
    _audioBar.playerStateStream.listen((playerState) {
      final playingState = playerState.playing;
      final processingState = playerState.processingState;
      // If the player is paused, make the button reflect that
      if (!playingState) {
        buttonNotifier.value = ButtonState.paused;
      }
      // Same idea with the playing icon, but we check if the player completed.
      else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      }
      // If the player is completed, increment lessonComplete and pause the player.
      else {
        //lessonsComplete += 1;
        _audioBar.pause();
      }
    });
    // Update the time played, this is purely updating the duration, 0:00 -> 0:xx etc.
    _audioBar.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        total: oldState.total,
      );
    });
    // Update the total length of the loaded audio, to guide the pointer.
    _audioBar.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  // THESE METHODS ARE USEFUL BECAUSE THEY PROVIDE A FUNCTION FOR THE UI ELEMENTS TO CALL / INTERACT WITH THE AUDIO PLAYER
  void play() {
    _audioBar.play();
  }

  void pause() {
    _audioBar.pause();
  }
  void seek(Duration position) {
    _audioBar.seek(position);
  }
}

// The States here are super simple, there is no buffering as the songs are stored locally, thus we only have current/total time
class ProgressBarState {

  ProgressBarState({required this.current, required this.total});
  final Duration current;
  final Duration total;
}

// Same story here, we have only 2 states, paused & playing.
enum ButtonState {
  paused,
  playing
}