import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart' show ChangeNotifier;

class AudioProvider extends ChangeNotifier {
  AssetsAudioPlayer _player = AssetsAudioPlayer();
  AssetsAudioPlayer get player => _player;

  Future<void> setAudio(String filename) async {
    if (_player.isPlaying.value) {
      await _player.stop();
    }
    await _player.open(
      Audio('audios/$filename'),
      autoStart: false,
    );
  }

  Future<void> play() async => await _player.play();
  Future<void> pause() async => await _player.pause();

  Future<void> toggle() async {
    if (_player.isPlaying.value) {
      await pause();
    } else {
      await play();
    }
  }

  @override
  Future<void> dispose() async {
    await _player.dispose();
    super.dispose();
  }
}
